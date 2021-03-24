-- Janssent is to thank for the idea behind this - loading an MP map and adding the SP terrain, instead of loading an SP map and adding the MP logic (because, seriously, fuck that second approach)

spMap = 'SP_Villa' -- The SP or COOP map to load - there are also some GUIDs for directories and terrain data to change when converting this to other maps. Where this has to be done, there is a comment at the end of the line.

-- Check map being loaded
Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)
    if SharedUtils:GetLevelName() ~= 'Levels/XP2_Skybar/XP2_Skybar' then
	return
        print('Server is not loading Ziba Tower XP2_Skybar - closing...')
        --os.exit() -- Not possible in VEXT - wait to do this whole thing after reorganising
    else
        print('Ziba Tower XP2_Skybar being loaded - loading '..spMap)
    end
end)
--------------------------
-- Remove XP2_Skybar stuff --  //  Get the GUIDs from WorldPartReferenceObjectData 
--------------------------

-- Remove Surrounding
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('32188954-5EAE-4D9B-B444-8FA3DBE68F92'), function(instance)
    --print('Excluding MP Surrounding...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Props
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('E28173E6-6B3D-4ADC-AAAD-638E5F2F667B'), function(instance)
    --print('Excluding MP Props...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Ambience
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('7B107E39-EB40-41A6-857A-ABCD0990CC40'), function(instance)
    --print('Excluding MP Ambience...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Ambience_Schematic
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('7A027A4A-E715-49E7-A68F-2219EBE88C58'), function(instance)
    --print('Excluding MP Ambience_Schematic...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Floor_1_Left
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('7036CDA2-ADC4-4AF8-AA17-EC49F02D115F'), function(instance)
    --print('Excluding MP Floor_1_Left...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Floor_1_Outside
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('E11BEA4A-A6F7-4389-9E57-061562B0ACF9'), function(instance)
    --print('Excluding MP Floor_1_Outside...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Floor_1_Right
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('0D9025E1-3851-47C1-A587-8ACB4044D579'), function(instance)
    --print('Excluding MP Floor_1_Right...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Floor_2_Left
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('193F1EE1-12FE-4514-ACA6-46A8315B80EF'), function(instance)
    --print('Excluding MP Floor_2_Left...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Floor_2_Right
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('D15D1152-3FB1-468A-B979-69FAEDE0396E'), function(instance)
    --print('Excluding MP Floor_2_Right...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Floor_3_Left
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('CA7F97A4-BFD5-4BBF-A9E2-670B55594917'), function(instance)
    --print('Excluding MP Floor_3_Left...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Floor_3_Right
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('9428F80C-581B-4309-8DFE-E8C208259CB7'), function(instance)
    --print('Excluding MP Floor_3_Right...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Floor_2_Outside
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('5041937A-E81A-4E6D-B590-EF95F4345D87'), function(instance)
    --print('Excluding MP Floor_2_Outside...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Invisible_Walls
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('1D25A98F-26AB-4C86-9E5E-1EAF698A31FF'), function(instance)
    --print('Excluding MP Invisible_Walls...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Lightprobes
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('7554EDF7-4462-4E21-8893-06924DE7A05F'), function(instance)
    --print('Excluding MP Lightprobes...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Lights
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('7FDAC51D-DF6B-4748-8CB9-CB8D3C8BCE36'), function(instance)
    --print('Excluding MP Lights...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Occluder
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('EE6DCBCB-5EF3-40C6-B83D-83E8D5562893'), function(instance)
    --print('Excluding MP Occluder...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Minimap
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('B89C52F6-CA35-4B5D-B863-476D33467A85'), function(instance)
    --print('Excluding MP Minimap...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Minimap_Schematic
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('5A5E15EA-5CF6-4B2D-9807-31BA4290C0FB'), function(instance)
    --print('Excluding MP Minimap_Schematic...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Pre-destruction
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('5A13D7E0-CF5A-4D2E-A898-EE0F24D9FAF3'), function(instance)
    --print('Excluding MP Pre-destruction...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Decals
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('6CBF814A-A513-4381-896A-40177545E9A3'), function(instance)
    --print('Excluding MP Decals...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Backdrop_City
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('A2EA9133-F485-477F-8E8A-E6E978F0B400'), function(instance)
    --print('Excluding MP Backdrop_City...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Prefab_WallSkybarDoorFrame_Dest1
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('20F82E7B-C757-4638-8EC5-6AFB4F662CBE'), function(instance)
    --print('Excluding MP Prefab_WallSkybarDoorFrame_Dest1...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Prefab_WallSkybarDoorFrame_Dest20
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('3880EEFF-92D4-4AFA-B0D4-B5F175A804C0'), function(instance)
    --print('Excluding MP Prefab_WallSkybarDoorFrame_Dest20...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Prefab_WallSkybarDoorFrame_Dest21
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('0B662128-DBFF-4885-A3E9-D106B5E34165'), function(instance)
    --print('Excluding MP Prefab_WallSkybarDoorFrame_Dest21...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Prefab_WallSkybarDoorFrame_Dest22
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('98399030-88FC-40E8-B799-4E402CBB6A11'), function(instance)
    --print('Excluding MP Prefab_WallSkybarDoorFrame_Dest22...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Prefab_WallSkybarDoorFrame_Dest
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('53EF74A7-89E9-4733-982B-C207C7CDFFE7'), function(instance)
    --print('Excluding MP Prefab_WallSkybarDoorFrame_Dest...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)



-- Remove Sound
--[[ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('E2515E02-AE3A-46C6-9C6A-CD4968E8903E'), function(instance)
    --print('Excluding MP Sound...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)

-- Remove Sound_Schematic
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('37BA2F74-EC60-46D1-B9A7-74EC8B68CBF4'), function(instance)
    --print('Excluding Sound_Schematic...')
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.excluded = true
end)]]


-- Disable static model group
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('CDD0476C-9EF2-B2B0-60ED-A35AEBE27C23'), function(instance)
    --print('Removing StaticModelGroupEntityData...')
    local thisInstance = StaticModelGroupEntityData(instance)
    thisInstance:MakeWritable()
    thisInstance.enabled = false
end)
-- Clear static model group member data array
ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('CDD0476C-9EF2-B2B0-60ED-A35AEBE27C23'), function(instance)
    --print('Clearing StaticModelGroupEntityData member data array...')
    local thisInstance = StaticModelGroupEntityData(instance)
    thisInstance:MakeWritable()
    thisInstance.memberDatas:clear()
end)


--------------------------
-- Prepare SP_Villa data --
--------------------------



local mounted = false

Events:Subscribe('Level:LoadResources', function()
    if SharedUtils:GetLevelName() ~= 'Levels/XP2_Skybar/XP2_Skybar' then
	return
	end
    if mounted ~= true then
    
        print('Mounting SP Chunks...')
        ResourceManager:MountSuperBundle('spchunks')
        print('Mounting SP level...')
        ResourceManager:MountSuperBundle('levels/'..spMap..'/'..spMap)


        
        mounted = true
    elseif mounted == true then
        print("Is Mounted: " .. tostring(mounted))
    end
end)


Hooks:Install('ResourceManager:LoadBundles', 500, function(hook, bundles, compartment)
    if SharedUtils:GetLevelName() ~= 'Levels/XP2_Skybar/XP2_Skybar' then
	return
	end
    

        if #bundles == 1 and bundles[1] == SharedUtils:GetLevelName() then
            print('Only loading \''..bundles[1]..'\', injecting bundles...')

            bundles = {
                'levels/'..spMap..'/'..spMap,
                'levels/sp_villa/background', -- Following are specific to sp_villa (see Powback's list of bundles on his VU-Wiki github repo)
                'levels/sp_villa/basement', -- To change
                'levels/sp_villa/chopper', -- To change
                'levels/sp_villa/garden', -- To change
                'levels/sp_villa/gatehouse', -- To change
                'levels/sp_villa/drive', -- To change
                'levels/sp_villa/Drive_2', -- To change
                'levels/sp_villa/landing', -- To change
                'levels/sp_villa/poolhouse', -- To change
                'levels/sp_villa/poolhouse_extra', -- To change
                'levels/sp_villa/rail', -- To change
                'levels/sp_villa/railsuv', -- To change
                'levels/sp_villa/villa_extra', -- To change
                'levels/sp_villa/villa', -- To change
                'levels/sp_villa/lightmap_01', -- To change
                'levels/sp_villa/lightmap_02', -- To change
                'levels/sp_villa/lightmap_03', -- To change
                


                bundles[1],
            }

            hook:Pass(bundles, compartment)

        else

            i = #bundles
            print('Loading additional bundle \''..bundles[i]..'\'...')

        end

    
end)



Events:Subscribe('Level:RegisterEntityResources', function(levelData) -- You want to get the RegistryContainer for each level along with its partition.
    if SharedUtils:GetLevelName() ~= 'Levels/XP2_Skybar/XP2_Skybar' then
	return
	end
    
    -- Main
    --print('Adding SP level registry...')
    local spLevelMainRegistry = ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('383F2AC9-94BF-286D-587A-27594550D561')) -- Get the RegistryContainer from the main level partition
    ResourceManager:AddRegistry(spLevelMainRegistry, ResourceCompartment.ResourceCompartment_Game)
	
    -- Background
    --print('Adding Background registry...')
    local spLevelBackgroundRegistry = ResourceManager:FindInstanceByGuid(Guid('F749441A-8971-4946-B147-397CB6F1A85B'), Guid('AA481C32-952C-BE32-6F60-6D4E213250D0')) 
    ResourceManager:AddRegistry(spLevelBackgroundRegistry, ResourceCompartment.ResourceCompartment_Game)
	
	-- basement
    local spLevelbasementRegistry = ResourceManager:FindInstanceByGuid(Guid('8988D551-8CAA-459D-8D63-6C1976FC1138'), Guid('44A043A8-9A9A-A65F-C1CD-9C6E189C2729')) 
    ResourceManager:AddRegistry(spLevelbasementRegistry, ResourceCompartment.ResourceCompartment_Game)
	--print('Adding Basement registry...')
	
	
	-- drive
    local spLeveldriveRegistry = ResourceManager:FindInstanceByGuid(Guid('F01F2D5B-3C51-43A9-A6C1-74FD2EC2FBF4'), Guid('E0067531-456F-9159-0035-50070FA051BA')) 
    ResourceManager:AddRegistry(spLeveldriveRegistry, ResourceCompartment.ResourceCompartment_Game)
	--print('Adding Drive registry...')

    -- chopper
    local spLevelchopperRegistry = ResourceManager:FindInstanceByGuid(Guid('547B4CC4-E654-44FC-9198-E64686EBD430'), Guid('45936AC0-B0E6-9E10-D074-F1F07AD7B251')) 
    ResourceManager:AddRegistry(spLevelchopperRegistry, ResourceCompartment.ResourceCompartment_Game)
	--print('Adding Chopper registry...')
	
	-- garden
    local spLevelgardenRegistry = ResourceManager:FindInstanceByGuid(Guid('B82A6F46-14AD-446E-8A1E-46FB03D19610'), Guid('0CA867A4-1F8D-E99D-0D4E-763B239A74F5')) 
    ResourceManager:AddRegistry(spLevelgardenRegistry, ResourceCompartment.ResourceCompartment_Game)
	--print('Adding Garden registry...')

    -- gatehouse
    local spLevelgatehouseRegistry = ResourceManager:FindInstanceByGuid(Guid('1934EC11-D3CF-41B3-939D-1E99364C1920'), Guid('9C99DF8B-B297-27AD-C644-1FA844924DF7')) 
    ResourceManager:AddRegistry(spLevelgatehouseRegistry, ResourceCompartment.ResourceCompartment_Game)
	--print('Adding Gatehouse registry...')
	
	-- Drive_2
    local spLevelDrive_2Registry = ResourceManager:FindInstanceByGuid(Guid('E8D4462E-AB80-49CD-BCE3-B27DBF8278D5'), Guid('BB0547A9-23C8-F39A-3D9D-393B7227A9C9')) 
    ResourceManager:AddRegistry(spLevelDrive_2Registry, ResourceCompartment.ResourceCompartment_Game)
	--print('Adding Drive_2 registry...')

    -- landing
    local spLevellandingRegistry = ResourceManager:FindInstanceByGuid(Guid('1CE226F4-17AC-4DC2-810A-E0899E22ED0B'), Guid('49C7DB9D-C2A4-DB0B-4E84-D0FE5701BA7F')) 
    ResourceManager:AddRegistry(spLevellandingRegistry, ResourceCompartment.ResourceCompartment_Game)
	--print('Adding Landing registry...')
	
	-- poolhouse
    local spLevelpoolhouseRegistry = ResourceManager:FindInstanceByGuid(Guid('0F934885-455D-43D4-8188-A5C387263A69'), Guid('161A4648-8B2F-F840-947A-CDE4FF2BDB5D')) 
    ResourceManager:AddRegistry(spLevelpoolhouseRegistry, ResourceCompartment.ResourceCompartment_Game)
	--print('Adding Poolhouse registry...')
	
	-- poolhouse Extra
    local spLevelpoolhouse_extraRegistry = ResourceManager:FindInstanceByGuid(Guid('5B213131-EE0E-437A-9C9E-ED719169DDC8'), Guid('E668C95B-02FE-5142-1CA2-19B6D587638B')) 
    ResourceManager:AddRegistry(spLevelpoolhouse_extraRegistry, ResourceCompartment.ResourceCompartment_Game)
	--print('Adding Poolhouse_Extra registry...')
	
	-- rail
    local spLevelrailRegistry = ResourceManager:FindInstanceByGuid(Guid('C6753483-91D3-4718-AEAD-3E60D6074210'), Guid('7839231F-7A1F-D622-8C73-EE951B129ED0')) 
    ResourceManager:AddRegistry(spLevelrailRegistry, ResourceCompartment.ResourceCompartment_Game)
	--print('Adding Rail registry...')

    -- railsuv
    local spLevelrailsuvRegistry = ResourceManager:FindInstanceByGuid(Guid('07132115-00D5-4D91-886F-9B275021D55F'), Guid('05C82B30-EFED-EFBC-8954-338F7F62E120')) 
    ResourceManager:AddRegistry(spLevelrailsuvRegistry, ResourceCompartment.ResourceCompartment_Game)
	--print('Adding Railsuv registry...')
	
	-- villa_extra
    local spLevelvilla_extraRegistry = ResourceManager:FindInstanceByGuid(Guid('387A11A6-2017-4C74-9509-A9EE0140B290'), Guid('C436D6F4-8874-C951-AEE3-66AC5838BAAF'))
    ResourceManager:AddRegistry(spLevelvilla_extraRegistry, ResourceCompartment.ResourceCompartment_Game)
	--print('Adding Villa_Extra registry...')
		
	-- Lightmap_01
   -- print('Adding Lightmap_01 registry...')
    local spLevelLightmap_01Registry = ResourceManager:FindInstanceByGuid(Guid('623975E7-E434-447F-8FBB-A6262DD1E9C7'), Guid('5C66586D-5345-562F-5920-9E05E054BD5F'))  
    ResourceManager:AddRegistry(spLevelLightmap_01Registry, ResourceCompartment.ResourceCompartment_Game)

	
	-- Lightmap_02
    --print('Adding Lightmap_02 registry...')
    local spLevelLightmap_02Registry = ResourceManager:FindInstanceByGuid(Guid('2FFEA4C0-B08F-4226-87C5-D741C0D7A472'), Guid('E9896092-501A-722A-E668-32A04CC5800C')) 
    ResourceManager:AddRegistry(spLevelLightmap_02Registry, ResourceCompartment.ResourceCompartment_Game)

	
	-- Lightmap_03
   -- print('Adding Lightmap_03 registry...')
    local spLevelLightmap_03Registry = ResourceManager:FindInstanceByGuid(Guid('4B11EEBB-74A9-4E3E-B289-5B8B37C693F6'), Guid('9C7E0D15-2E1D-2A4D-2038-CA517EEC6D28')) 
    ResourceManager:AddRegistry(spLevelLightmap_03Registry, ResourceCompartment.ResourceCompartment_Game)

		

end)

---------------------
-- Replace Sound --
---------------------

---- Sound --------

--[[ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('E2515E02-AE3A-46C6-9C6A-CD4968E8903E'), function(instance)

    local spLevelSound = Blueprint(ResourceManager:FindInstanceByGuid(Guid('56C01975-9D53-44D4-BF5D-5EFC09880732'), Guid('A8A9554A-95D4-45E4-B1E5-809AB5B3B31A'))) -- WorldPartData from the 'xp2_Skybar' partition of the Sound
    
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.blueprint = spLevelSound

    print('SP Sound loaded.')

end)

---- Sound_Schematic --------

ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('37BA2F74-EC60-46D1-B9A7-74EC8B68CBF4'), function(instance)

    local spLevelSound_Schematic = Blueprint(ResourceManager:FindInstanceByGuid(Guid('F849C7A3-CDC4-4AD1-BF64-E30F5543A8EC'), Guid('8502FD21-EABF-4723-917D-80C1C33BE417'))) -- WorldPartData from the 'xp2_Skybar' partition of the Sound_Schematic
    
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.blueprint = spLevelSound_Schematic

    print('SP Sound_Schematic loaded.')

end)]]



---------------------
-- Replace terrain --
---------------------

ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('2B25C585-8B2B-BBFF-92B2-AAEA3B4EC8D2'), function(instance)

    local spLevelTerrainBp = Blueprint(ResourceManager:FindInstanceByGuid(Guid('6B420081-18CB-11E0-B456-BF5782883243'), Guid('C7EC9647-2ECF-B35B-FA88-514A82EE0DF4'))) -- WorldPartData from the 'default' partition of the SP level
    
    local thisInstance = WorldPartReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.blueprint = spLevelTerrainBp

    --print('SP level terrain loaded.')

end)

-----------------------------------------------------------
-- Replace Pointlights and such / VisualEnvironment --
-----------------------------------------------------------

--[[ResourceManager:RegisterInstanceLoadHandler(Guid('8F5E0383-52A4-11DF-AC80-BC6EA2597601'), Guid('BE3C3EDD-C2C0-4A75-AD1A-58FDC8169350'), function(instance)

    local spVisualEnvironment = WorldPartReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('8DC3AABD-A6C4-4546-A648-40FF1DE014A8'))) -- Replace WorldPartData
    
    local thisInstance = VisualEnvironmentReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.blueprint = spVisualEnvironment.blueprint

    print('SP Visual Environment loaded.')

end)]]

------------------------
-- Change wind speed --
------------------------


Events:Subscribe('Partition:Loaded', function(partition)
    if SharedUtils:GetLevelName() ~= 'Levels/XP2_Skybar/XP2_Skybar' then
	return
	end
            for _, instance in pairs(partition.instances) do
                if instance:Is('WindComponentData') then
                    local wind = WindComponentData(instance)
                    wind:MakeWritable()

                    wind.windStrength = wind.windStrength*0.05
                    print('wind changed')
                end
            end
end)




--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Block Bandar Desert terrain (many thanks to Ry and FoolHen - seriously, I'd probably spent 20 hours trying to fix an issue related to not having this before I asked them) --
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--[[Hooks:Install('Terrain:Load', 100, function(hook, terrainName)

    print('Loading terrain \''..terrainName..'\'')

    if terrainName == 'levels/xp3_desert/terrain/terrain_8k.streamingtree' then
        print('Blocking terrain \''..terrainName..'\'.')
        hook:Return()
    end

end)

Hooks:Install('VisualTerrain:Load', 100, function(hook, terrainName) 

    print('Loading vis terrain \''..terrainName..'\'.')
    
    if terrainName == 'levels/xp3_desert/terrain/terrain_8k.visual' then
        print('Blocking visual terrain \''..terrainName..'\'.')
        hook:Return()
    end

end)]]

--------------------
-- Replace skybox --
--------------------

ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('3955BD68-9048-4F52-90FA-1E409568F185'), function(instance)

    local spLevelSkyBp = Blueprint(ResourceManager:FindInstanceByGuid(Guid('2259EFB0-DBF5-11E0-8D74-C56D7052CE5F'), Guid('A980E6CF-0F80-4058-8B4B-3F81B3AD8CF1'))) -- VisualEnvironmentBlueprint from the SP_Villa/Lighting/SP_010_Poolhouse_Cutscene_01 partition for the skybox

    local thisInstance = VisualEnvironmentReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.blueprint = spLevelSkyBp

    --print('SP level sky loaded.')

end)


-----------------------------------------------------
--Replace Static and Dynamic Lighting--         ------------       Remember that you MUST to import the lightmap levels/bundles aswell
-----------------------------------------------------



----Enable Static Lighting

ResourceManager:RegisterInstanceLoadHandler(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('59B72028-B735-4DD5-BA3A-3586F91BD4DB'), function(instance)
    print('Enabling static Enlighten data...')
    local thisInstance = StaticEnlightenEntityData(instance)
    thisInstance:MakeWritable()
    thisInstance.enable = true
end)


ResourceManager:RegisterInstanceLoadHandler(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('2D46B901-8280-4280-9F7B-2B5CAD88400C'), function(instance)

    local villaEnlightenData = StaticEnlightenData(ResourceManager:FindInstanceByGuid(Guid('0A4DEC5B-91E1-11E0-823E-B27985E708F2'), Guid('B181B41C-E02A-3A4D-E1FC-4B8F67AD65E6')))
    local villaDynamicEnlightenData = EnlightenDataAsset(ResourceManager:FindInstanceByGuid(Guid('FB63DF90-77BA-11E0-B777-ABBB22EDAF1F'), Guid('9C8333BD-DD6F-574F-311C-3560C7B2E76C')))

    local xp2_skybarEnlightenEntityData = StaticEnlightenEntityData(instance)
    xp2_skybarEnlightenEntityData:MakeWritable()
    xp2_skybarEnlightenEntityData.enlightenData = villaEnlightenData
    xp2_skybarEnlightenEntityData.dynamicEnlightenData = villaDynamicEnlightenData
    print('Static Lighting Replaced')
end)






----------------------------------------------------------------
-- Load relevant SP_Villa WorldPart- and SubWorldReferenceData --
----------------------------------------------------------------

-- NOTE: SP levels are often split into different parts for optimisation - you will have to find the names of each of these parts. 
-- They are located in the main path of the level (such as levels/sp_tank), and are usually pretty self-evident. 
-- They are called by the main level partition using SubWorldReferenceObjectData, and need to be set to autoLoad = true

Events:Subscribe('Partition:Loaded', function(partition)

    if partition == nil or partition.name ~= 'levels/xp2_skybar/xp2_skybar' then
        return
    end

    -- The following GUIDs referenced by FindInstanceByGuid are all specific to SP_Villa, and need to be changed as well. 
    -- Under the main partition of the level you want to load, find the SubWorldReferenceObjectData instances which reference the parts of the mission you want to load (visible under the 'Blueprint' parameter).

    -- Background ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    --print('Injecting Background reference data...')
	print('Background spawned')
    local spLevelBackgroundReferenceData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('EDB554E5-3808-49E1-8AF7-28B05962D223'))) -- To change
    mpLevelBackgroundReferenceData = SubWorldReferenceObjectData(spLevelBackgroundReferenceData:Clone(Guid('A0000000-0000-0000-0000-000000000000')))
    mpLevelBackgroundReferenceData:MakeWritable()
    mpLevelBackgroundReferenceData.autoLoad = true
    partition:AddInstance(mpLevelBackgroundReferenceData)

    -- Add to LevelData objects array
    local mpLevelData = LevelData(ResourceManager:FindInstanceByGuid(Guid('2DF41167-0BAB-11E1-AA4E-EFBA5D767A10'), Guid('3AE309B1-DD67-6A60-77C6-9F9EE67F3B41')))
    mpLevelData:MakeWritable()
    mpLevelData.objects:add(mpLevelBackgroundReferenceData)

    -- basement -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting basement reference data...')
    local spLevelbasementReferenceData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('7985DF11-12F9-4598-A922-6CE20F0F243E'))) -- To change
    mpLevelbasementReferenceData = SubWorldReferenceObjectData(spLevelbasementReferenceData:Clone(Guid('B0000000-0000-0000-0000-000000000000')))
    mpLevelbasementReferenceData:MakeWritable()
    mpLevelbasementReferenceData.autoLoad = true
    partition:AddInstance(mpLevelbasementReferenceData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevelbasementReferenceData)
	

    -- drive ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting drive reference data...')
    local spLeveldriveReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('3AC50C14-A310-4E1C-AA1C-0215DD9C49A3'))) -- To change
    mpLeveldriveReferenceObjectData = SubWorldReferenceObjectData(spLeveldriveReferenceObjectData:Clone(Guid('C0000000-0000-0000-0000-000000000000')))
    mpLeveldriveReferenceObjectData:MakeWritable()
    mpLeveldriveReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLeveldriveReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLeveldriveReferenceObjectData)

    -- chopper ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    
    --print('Injecting chopper reference data...')
    local spLevelchopperReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('4F3EC569-825A-49FE-9810-EBBEA786BCDC'))) -- To change
    mpLevelchopperReferenceObjectData = SubWorldReferenceObjectData(spLevelchopperReferenceObjectData:Clone(Guid('D000000-0000-0000-0000-000000000000')))
    mpLevelchopperReferenceObjectData:MakeWritable()
    mpLevelchopperReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLevelchopperReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevelchopperReferenceObjectData)

    -- garden -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting garden reference data...')
    local spLevelgardenReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('1D033178-FACD-4621-B74D-BFE913A7BA48'))) -- To change
    mpLevelgardenReferenceObjectData = SubWorldReferenceObjectData(spLevelgardenReferenceObjectData:Clone(Guid('E0000000-0000-0000-0000-000000000000')))
    mpLevelgardenReferenceObjectData:MakeWritable()
    mpLevelgardenReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLevelgardenReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevelgardenReferenceObjectData)

    -- gatehouse -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting gatehouse reference data...')
    local spLevelgatehouseReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('433C8C47-7BD4-4B56-A593-89F74758AA45'))) -- To change
    mpLevelgatehouseReferenceObjectData = SubWorldReferenceObjectData(spLevelgatehouseReferenceObjectData:Clone(Guid('F0000000-0000-0000-0000-000000000000')))
    mpLevelgatehouseReferenceObjectData:MakeWritable()
    mpLevelgatehouseReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLevelgatehouseReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevelgatehouseReferenceObjectData)

    -- Drive_2 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting Drive_2 reference data...') -- Some partitions, like this one referring to the Drive_2 mine clearing technology used in the scene, are a little less obviously one of the parts of the mission.
    local spLevelDrive_2ReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('5C62830E-29ED-44F8-8A51-21F76D9E22A2'))) -- To change
    mpLevelDrive_2ReferenceObjectData = SubWorldReferenceObjectData(spLevelDrive_2ReferenceObjectData:Clone(Guid('G0000000-0000-0000-0000-000000000000')))
    mpLevelDrive_2ReferenceObjectData:MakeWritable()
    mpLevelDrive_2ReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLevelDrive_2ReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevelDrive_2ReferenceObjectData)


    -- landing --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting landing reference data...')
    local spLevellandingReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('759B1AE0-EC27-46EB-AAEC-52D330D0EF34'))) -- To change
    mpLevellandingReferenceObjectData = SubWorldReferenceObjectData(spLevellandingReferenceObjectData:Clone(Guid('I0000000-0000-0000-0000-000000000000')))
    mpLevellandingReferenceObjectData:MakeWritable()
    mpLevellandingReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLevellandingReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevellandingReferenceObjectData)

    -- poolhouse ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting poolhouse reference data...')
    local spLevelpoolhouseReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('8FC58928-5E9A-47F3-BCAD-EBF1398AC37E'))) -- To change
    mpLevelpoolhouseReferenceObjectData = SubWorldReferenceObjectData(spLevelpoolhouseReferenceObjectData:Clone(Guid('J0000000-0000-0000-0000-000000000000')))
    mpLevelpoolhouseReferenceObjectData:MakeWritable()
    mpLevelpoolhouseReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLevelpoolhouseReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevelpoolhouseReferenceObjectData)

    -- poolhouse_extra ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting poolhouse_extra reference data...')
    local spLevelpoolhouse_extraReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('0178AD42-00B9-4710-80BC-BCAE0F539FDF'))) -- To change
    mpLevelpoolhouse_extraReferenceObjectData = SubWorldReferenceObjectData(spLevelpoolhouse_extraReferenceObjectData:Clone(Guid('K0000000-0000-0000-0000-000000000000')))
    mpLevelpoolhouse_extraReferenceObjectData:MakeWritable()
    mpLevelpoolhouse_extraReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLevelpoolhouse_extraReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevelpoolhouse_extraReferenceObjectData)

    -- rail -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting rail reference data...')
    local spLevelrailReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('A08F3147-8137-4802-B9AD-28A48B5A9DCD'))) -- To change
    mpLevelrailReferenceObjectData = SubWorldReferenceObjectData(spLevelrailReferenceObjectData:Clone(Guid('L0000000-0000-0000-0000-000000000000')))
    mpLevelrailReferenceObjectData:MakeWritable()
    mpLevelrailReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLevelrailReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevelrailReferenceObjectData)

    -- railsuv --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting railsuv reference data...')
    local spLevelrailsuvReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('4A58BFF9-0B1C-4DDA-A96B-118B27069553')))
    mpLevelrailsuvReferenceObjectData = SubWorldReferenceObjectData(spLevelrailsuvReferenceObjectData:Clone(Guid('M0000000-0000-0000-0000-000000000000')))
    mpLevelrailsuvReferenceObjectData:MakeWritable()
    mpLevelrailsuvReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLevelrailsuvReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevelrailsuvReferenceObjectData)

    -- villa_extra --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting villa_extra reference data...')
    local spLevelvilla_extraReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('05E0A99C-E276-40EA-AA3F-A6AADFC869D8')))
    mpLevelvilla_extraReferenceObjectData = SubWorldReferenceObjectData(spLevelvilla_extraReferenceObjectData:Clone(Guid('N0000000-0000-0000-0000-000000000000')))
    mpLevelvilla_extraReferenceObjectData:MakeWritable()
    mpLevelvilla_extraReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLevelvilla_extraReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevelvilla_extraReferenceObjectData)
	
	-- Lightmap_01 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting Lightmap_01 reference data...')
    local spLevelLightmap_01ReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('A5F8D104-76AA-434B-8489-DC194B3C273B')))
    mpLevelLightmap_01ReferenceObjectData = SubWorldReferenceObjectData(spLevelLightmap_01ReferenceObjectData:Clone(Guid('P0000000-0000-0000-0000-000000000000')))
    mpLevelLightmap_01ReferenceObjectData:MakeWritable()
    mpLevelLightmap_01ReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLevelLightmap_01ReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevelLightmap_01ReferenceObjectData)
	
	-- Lightmap_02 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting Lightmap_02 reference data...')
    local spLevelLightmap_02ReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('F277F47D-A4A1-4957-9290-DD087D5B7853')))
    mpLevelLightmap_02ReferenceObjectData = SubWorldReferenceObjectData(spLevelLightmap_02ReferenceObjectData:Clone(Guid('Q0000000-0000-0000-0000-000000000000')))
    mpLevelLightmap_02ReferenceObjectData:MakeWritable()
    mpLevelLightmap_02ReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLevelLightmap_02ReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevelLightmap_02ReferenceObjectData)
	
	-- Lightmap_03 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    --print('Injecting Lightmap_03 reference data...')
    local spLevelLightmap_03ReferenceObjectData = SubWorldReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('6B420080-18CB-11E0-B456-BF5782883243'), Guid('9366E540-4967-4F80-99BB-15090429BF33')))
    mpLevelLightmap_03ReferenceObjectData = SubWorldReferenceObjectData(spLevelLightmap_03ReferenceObjectData:Clone(Guid('R0000000-0000-0000-0000-000000000000')))
    mpLevelLightmap_03ReferenceObjectData:MakeWritable()
    mpLevelLightmap_03ReferenceObjectData.autoLoad = true
    partition:AddInstance(mpLevelLightmap_03ReferenceObjectData)

    -- Add to LevelData objects array
    mpLevelData.objects:add(mpLevelLightmap_03ReferenceObjectData)
	
	

end)


Events:Subscribe('Level:RegisterEntityResources', function(levelData)
    if SharedUtils:GetLevelName() ~= 'Levels/XP2_Skybar/XP2_Skybar' then
	return
	end

    print('Adding new registry containing relevant SubWorldReferenceData...')
    local newRegistry = RegistryContainer()
    newRegistry.referenceObjectRegistry:add(mpLevelBackgroundReferenceData) -- Background
    newRegistry.referenceObjectRegistry:add(mpLevelbasementReferenceData) -- basement
    newRegistry.referenceObjectRegistry:add(mpLeveldriveReferenceObjectData) -- drive
    newRegistry.referenceObjectRegistry:add(mpLevelchopperReferenceObjectData) -- chopper
    newRegistry.referenceObjectRegistry:add(mpLevelgardenReferenceObjectData) -- garden
    newRegistry.referenceObjectRegistry:add(mpLevelgatehouseReferenceObjectData) -- gatehouse
    newRegistry.referenceObjectRegistry:add(mpLeveldrive_2ReferenceObjectData) -- drive_2
    newRegistry.referenceObjectRegistry:add(mpLevellandingReferenceObjectData) -- landing
    newRegistry.referenceObjectRegistry:add(mpLevelpoolhouseReferenceObjectData) -- poolhouse
    newRegistry.referenceObjectRegistry:add(mpLevelpoolhouse_extraReferenceObjectData) -- poolhouse_extra
    newRegistry.referenceObjectRegistry:add(mpLevelrailReferenceObjectData) -- rail
    newRegistry.referenceObjectRegistry:add(mpLevelrailsuvReferenceObjectData) -- railsuv
    newRegistry.referenceObjectRegistry:add(mpLevelvilla_extraReferenceObjectData) -- villa_extra
    newRegistry.referenceObjectRegistry:add(mpLevelLightmap_01ReferenceObjectData) -- Lightmap_01
    newRegistry.referenceObjectRegistry:add(mpLevelLightmap_02ReferenceObjectData) -- Lightmap_02
    newRegistry.referenceObjectRegistry:add(mpLevelLightmap_03ReferenceObjectData) -- Lightmap_03

    ResourceManager:AddRegistry(newRegistry, ResourceCompartment.ResourceCompartment_Game)

end)

----------------------
-- Exclude SP logic --
----------------------

Events:Subscribe('Partition:Loaded', function(partition)

    if partition == nil 
    or (partition.name ~= 'levels/sp_villa/basement' -- To change
    and partition.name ~= 'levels/sp_villa/drive' -- To change
    and partition.name ~= 'levels/sp_villa/chopper' -- To change
    and partition.name ~= 'levels/sp_villa/garden' -- To change
    and partition.name ~= 'levels/sp_villa/gatehouse' -- To change
    and partition.name ~= 'levels/sp_villa/landing' -- To change
    and partition.name ~= 'levels/sp_villa/poolhouse' -- To change
    and partition.name ~= 'levels/sp_villa/railsuv' -- To change
    and partition.name ~= 'levels/sp_villa/villa_extra' -- To change
	and partition.name ~= 'levels/sp_villa/villa' -- To change
	and partition.name ~= 'levels/sp_villa/drive_2') -- To change
    then
        return
    end

    --print('Found SP partition to modify.')

    local loadedInstances = partition.instances

    for _, instance in ipairs(loadedInstances) do

        if instance:Is('WorldPartReferenceObjectData') then

            local thisInstance = WorldPartReferenceObjectData(instance)
            thisInstance:MakeWritable()

            --print('Found WorldPartReferenceObjectData.')

            if thisInstance.instanceGuid ~= Guid('') -- Sound Villa
            and thisInstance.instanceGuid ~= Guid('') -- Sound Villa Schematic
            then
                if thisInstance.blueprint.name == '' then
                    --print('Excluding instance calling unknown blueprint.')
                else
                    --print('Excluding instance calling '..thisInstance.blueprint.name)
                end
                thisInstance.excluded = true
            end

        end

    end

end)

------------------------------------------------------
-- Delete Assets --  Currently broken
------------------------------------------------------

-- From Villa -- COOP_Ammobox / DoorLuxury_01_door224 / DoorLuxury_01_door224_des / Window_01_High_256 / Window_01_High_128 / Door_01

--[[ResourceManager:RegisterInstanceLoadHandler(Guid('DD693670-3EDD-448C-8CD3-1463B234E44C'), Guid('040EA39D-A7BF-7A38-5EBF-16F473E6B0A6'), function(instance) -- To change
    print('Erasing COOP_Ammobox from Villa...')
local thisInstance = GameEntityData(instance)
thisInstance:MakeWritable()
thisInstance.enabled = false
end)]]

--[[ResourceManager:RegisterInstanceLoadHandler(Guid('DD693670-3EDD-448C-8CD3-1463B234E44C'), Guid('38EF96C2-043E-5E9A-E97D-D55E18D6E94F'), function(instance)
    print('Making Window_01_High_256 object nil...')
    local thisInstance = CompositeMeshEntityData(instance)
    thisInstance:MakeWritable()
    thisInstance.mesh = nil
end)

ResourceManager:RegisterInstanceLoadHandler(Guid('DD693670-3EDD-448C-8CD3-1463B234E44C'), Guid('040EA39D-A7BF-7A38-5EBF-16F473E6B0A6'), function(instance)
    print('Erasing Window_01_High_256...')
    local thisInstance = StaticModelGroupEntityData(instance)
    thisInstance:MakeWritable()
    thisInstance.memberDatas:erase(63)

end)]]




----------------------------
-- Delete invisible walls --
----------------------------

-- Search for 'InvisibleCollision' in the partitions for the different parts of the level. Find any entries under the StaticModelGroupEntityData MemberDatas array and erase them.
-- For SP_Villa, there are few enough to do it manually with InstanceLoadHandlers, but for some missions you may want to use an iterator instead.



require('__shared/MapModifications')