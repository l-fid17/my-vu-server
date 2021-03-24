-- Check map being loaded
Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)
    if SharedUtils:GetLevelName() ~= 'Levels/XP2_Skybar/XP2_Skybar' then
        return
    end
end)

-- Remove minimap
--[[Hooks:Install('UI:RenderMinimap', 100, function(hook)
    if SharedUtils:GetLevelName() ~= 'Levels/XP2_Skybar/XP2_Skybar' then
        return
    end
    --print('Blocking minimap render...')
    hook:Return()
end)]]

-- Restart round send cmd

Console:Register('reload', 'Reloads current map.', function(args)
if SharedUtils:GetLevelName() ~= 'Levels/XP2_Skybar/XP2_Skybar' then
        return
    end

    NetEvents:Send('ReloadMap', thisPlayer)

    print('Informed server to reload map!')

end)

----------------------------
-- Change objective names --
----------------------------

ResourceManager:RegisterInstanceLoadHandler(Guid('55BC5B5B-6039-4DDF-B273-2AEA13622E4B'), Guid('3E5BD45A-5413-69F6-105D-EBBAE3D2CECF'), function(instance)

    local thisInstance = InterfaceDescriptorData(instance)
    thisInstance:MakeWritable()

    thisInstance.fields[1].value = 'CString "A"' -- A
    thisInstance.fields[2].value = 'CString "B"' -- B
    thisInstance.fields[4].value = 'CString "C"' -- C

end)