require('__shared/version')

votingActive = false;
playerVotes = {}
votingMaps = {}
orderedMaps = {}

config = {
    ["randomize"] = true,
    ["excludeCurrentMap"] = true,
    ["limit"] = 15
}

function getCurrentVersion()
    options = HttpOptions({}, 10);
    options.verifyCertificate = false; --ignore cert for wine users
    res = Net:GetHTTP("https://gitlab.com/n4gi0s/vu-mapvote/-/raw/master/mod.json", options);
    if res.status ~= 200 then
        return null;
    end
    json = json.decode(res.body);
    return json.Version;
end

function checkVersion()
    if getCurrentVersion() ~= localModVersion then
        print("This mod seems to be out of date! Please visit https://gitlab.com/n4gi0s/vu-mapvote");
    end
end

checkVersion();

function getMapAmount(res, currentMapId)
    local mapAmount = 0;
    local currentId = 1;
    for index,name in pairs(res) do
        if index > 3 and index % 3 == 1 then
            if (currentId ~= currentMapId or config.excludeCurrentMap == false) then
                mapAmount = mapAmount + 1;
            end
            currentId = currentId + 1;
        end
    end

    return mapAmount;
end

function getRandomMapIds(limitMapsEnabled, mapAmount, currentMapId)
    local randomMapIds = {};
    if limitMapsEnabled then
        print('Picking ' .. config.limit .. ' random maps out of ' .. mapAmount .. ', mapvote.excludeCurrentMap: ' .. tostring(config.excludeCurrentMap));

        local generatedMapCount = 0;
        while (generatedMapCount < config.limit)
        do
            local notUnique = true;

            while (notUnique)
            do
                notUnique = false;
                randomMapId = (math.floor(math.random() * mapAmount)) + 1;

                local alreadyAdded = randomMapIds[randomMapId] == true;
                if alreadyAdded then
                    notUnique = true;
                end
    
                local needsToBeExcluded = randomMapId == currentMapId and config.excludeCurrentMap == true;
                if needsToBeExcluded then
                    notUnique = true;
                end
            end

            -- successfully generated unique random map id
            randomMapIds[randomMapId] = true;
            generatedMapCount = generatedMapCount + 1;
        end
    elseif config.limit > 0 then
        print('Skip picking random maps: maplist is too short (' .. mapAmount .. ') compared to mapvote.limit (' .. config.limit .. '), mapvote.excludeCurrentMap: ' .. tostring(config.excludeCurrentMap));
    end

    return randomMapIds;
end

-- Taken from Github Gist, https://gist.github.com/Uradamus/10323382#gistcomment-3149506
-- Thanks XeduR!
function shuffle(t)
  local tbl = {}
  for i = 1, #t do
    tbl[i] = t[i]
  end
  for i = #tbl, 2, -1 do
    local j = math.random(i)
    tbl[i], tbl[j] = tbl[j], tbl[i]
  end
  return tbl
end

function getMaps()
    local mapIndices = RCON:SendCommand("mapList.getMapIndices") -- returns current map and next map index
    local currentMapId = tonumber(mapIndices[2] + 1)
    local res = RCON:SendCommand("mapList.List")
	
    local mapAmount = getMapAmount(res, currentMapId)
    local limitMapsEnabled = config.limit > 0 and mapAmount > config.limit -- maplist needs to be big enough
    local randomMapIds = getRandomMapIds(limitMapsEnabled, mapAmount, currentMapId)

    local mapList = {}
    local id = 1

    for index,name in pairs(res) do
        if index > 3 and index % 3 == 1 then
            local map = {
                id = id,
                name = name,
                gameMode = res[index + 1],
                rounds = res[index + 2],
                votes = 0,
                enabled = (id ~= currentMapId or config.excludeCurrentMap == false) and (limitMapsEnabled == false or randomMapIds[id] == true)
            };

            -- store the MapList.txt order with object references so we can do a lookup later with the map id
            orderedMaps[id] = map
            mapList[id] = map

            id = id + 1
        end
    end

    if config.randomize then
		print("mapvote.randomize true, shuffling maps")
		mapList = shuffle(mapList)
    end
    
    return mapList, orderedMaps
end

Events:Subscribe('Player:Authenticated', function(player)
    if votingActive then
        NetEvents:SendTo('VotemapStart', player, votingMaps)
    end
end)

NetEvents:Subscribe('MapVote', function(player, mapId)
    mapId = tonumber(mapId)
    -- remove current vote if exists
    if playerVotes[player.name] ~= nil then
        previousMapId = playerVotes[player.name];
        orderedMaps[previousMapId].votes = orderedMaps[previousMapId].votes - 1;
    end

    -- set new vote
    playerVotes[player.name] = mapId;
    orderedMaps[mapId].votes = orderedMaps[mapId].votes + 1;
    print(player.name .. " voted for " .. orderedMaps[mapId].name);
    NetEvents:Broadcast('VotemapStatus', votingMaps);
end)

function startVote()
    playerVotes = {}
    votingMaps, orderedMaps = getMaps() --reset map votes
    print("Starting mapvote")
    votingActive = true
    NetEvents:Broadcast('VotemapStart', votingMaps)
end

function endVote()
    if votingActive == true then
        votingActive = false;
        currentVoteTime = 0;

        -- find map with most votes
        mostVotes = 0;
        nextMapId = nil;
        for _, map in pairs(votingMaps) do
            if map.enabled and map.votes >= mostVotes then
                mostVotes = map.votes;
                nextMapId = map.id;
            end
        end

        nextMap = orderedMaps[nextMapId];
        print("Voting result: " .. nextMap.name .. " " .. nextMap.gameMode);

        setNextMap(nextMapId);
        NetEvents:Broadcast('VotemapEnd', nextMapId);
    end
end

function setNextMap(mapId)
    RCON:SendCommand("mapList.setNextMapIndex", {['index'] = tostring(mapId - 1)}); -- setNextMapIndex index starts from 0 and in lua it starts from 1 so we need to -1
end

currentVoteTime = 0
voteTime = 52 -- it takes about 10 seconds before we arrive at the end of round counter which starts from 47 -> wait magical 52 seconds
Events:Subscribe('Engine:Update', function(delta, simulationDelta)
	if votingActive == false then
		return
	end
    
	if currentVoteTime >= voteTime then
		endVote();
		return
	end

	currentVoteTime = currentVoteTime + delta;
end)

function getRoundInfo()
    local getRounds = RCON:SendCommand("mapList.getRounds"); -- returns current round (-1) and number of rounds 
    local currentRound = tonumber(getRounds[2]) + 1;
    local roundCount = tonumber(getRounds[3]);

    return currentRound, roundCount
end

Events:Subscribe('Server:RoundOver', function(roundTime, winningTeam)
    local currentRound, roundCount = getRoundInfo()

    if currentRound == roundCount then
        startVote();
    end
end)

RCON:RegisterCommand('mapvote.start', RemoteCommandFlag.RequiresLogin, function(command, args, loggedIn)
    startVote();
	return {'OK'}
end)

RCON:RegisterCommand('mapvote.end', RemoteCommandFlag.RequiresLogin, function(command, args, loggedIn)
    endVote();
	return {'OK'}
end)

RCON:RegisterCommand('mapvote.limit', RemoteCommandFlag.RequiresLogin, function(command, args, loggedIn)
    local value = args[1];
    if value ~= nil then
        config.limit = tonumber(value);
    end

    print(config.limit)
	return {'OK'}
end)

RCON:RegisterCommand('mapvote.excludecurrentmap', RemoteCommandFlag.RequiresLogin, function(command, args, loggedIn)
    local value = args[1];
    if value ~= nil then
        if value == "true" then
            config.excludeCurrentMap = true;
        else
            config.excludeCurrentMap = false;
        end
    end

    print(config.excludeCurrentMap)
	return {'OK'}
end)

RCON:RegisterCommand('mapvote.randomize', RemoteCommandFlag.RequiresLogin, function(command, args, loggedIn)
    local value = args[1];
    if value ~= nil then
        if value == "true" then
            config.randomize = true;
        else
            config.randomize = false;
        end
    end

    print(config.randomize)
	return {'OK'}
end)