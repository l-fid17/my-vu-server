-- Check map being loaded
Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)
    if SharedUtils:GetLevelName() ~= 'Levels/XP2_Skybar/XP2_Skybar' then
        return
    end
end)

-- Set custom map name
ServerUtils:SetCustomMapName('Villa') -- May want to change this for different maps

-- Set server banner
Events:Subscribe('Level:LoadResources', function(levelName, gameMode, round, roundsPerMap)
    local banner = RCON:SendCommand('vu.ServerBanner', {'https://cdn.discordapp.com/attachments/738538813890232320/814115282532171816/Sin_titulo-1.jpg'}) -- May want to change this for different maps
    --print('Custom server banner set: '..tostring(banner))
end)

--[[ Temp disable vehicles
Events:Subscribe('Level:LoadResources', function(levelName, gameMode, round, roundsPerMap)
    vicSpawn = RCON:SendCommand('vars.vehicleSpawnAllowed', {'false'})
    print('Disabled vehicle spawn:')
    print(vicSpawn)
end)]]

--restart round
--[[Events:Subscribe('Server:RoundOver', function(roundTime, winningTeam)
    RCON:SendCommand("mapList.restartRound")
    print("Restarting Round")
end)]]

-- Reload cmd

NetEvents:Subscribe('ReloadMap', function(connectedPlayer)
if SharedUtils:GetLevelName() ~= 'Levels/XP2_Skybar/XP2_Skybar' then
        return
    end

    print('Force reloading map...')

    RCON:SendCommand('mapList.runNextRound')

end)