-- Check map being loaded
Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)
    if SharedUtils:GetLevelName() ~= 'Levels/XP2_Skybar/XP2_Skybar' then
        return
    end
end)

local presetJSON = require "Villa_map"
local function DecodeParams(p_Table)
    if(p_Table == nil) then
        print("No table received")
        return false
	end
	for s_Key, s_Value in pairs(p_Table) do
		if s_Key == 'transform' or s_Key == 'localTransform'then
			local s_LinearTransform = LinearTransform(
					Vec3(s_Value.left.x, s_Value.left.y, s_Value.left.z),
					Vec3(s_Value.up.x, s_Value.up.y, s_Value.up.z),
					Vec3(s_Value.forward.x, s_Value.forward.y, s_Value.forward.z),
					Vec3(s_Value.trans.x, s_Value.trans.y, s_Value.trans.z))

			p_Table[s_Key] = s_LinearTransform

		elseif type(s_Value) == "table" then
			p_Table[s_Key] = DecodeParams(s_Value)
		end

	end

	return p_Table
end

Events:Subscribe('Level:LoadResources', function()
	print(presetJSON)
	local preset = DecodeParams(json.decode(presetJSON))
	Events:Dispatch('MapLoader-Villa:LoadLevel', preset)
end)