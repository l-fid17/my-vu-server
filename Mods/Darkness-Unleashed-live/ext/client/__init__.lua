require '__shared/presets'

--Configure Smoke, Muzzle & Emmiters
Events:Subscribe('Partition:Loaded', function(partition)
	for _, instance in pairs(partition.instances) do
		if instance:Is("EmitterTemplateData") then
			local emitterTemplate = EmitterTemplateData(instance)

			-- Tweak smoke and dust to last longer
			if string.find(emitterTemplate.name:lower(), "smoke" or string.find(emitterTemplate.name:lower(), "dust")) then
				emitterTemplate:MakeWritable()

				if not (emitterTemplate.emissive or emitterTemplate.actAsPointLight or emitterTemplate.repeatParticleSpawning or emitterTemplate.opaque) then
					if emitterTemplate.rootProcessor:Is("UpdateAgeData") then
						local rootProcessor = UpdateAgeData(emitterTemplate.rootProcessor)

						rootProcessor:MakeWritable()
						rootProcessor.lifetime = rootProcessor.lifetime * 0.75
						emitterTemplate.lifetime = emitterTemplate.lifetime * 1.25
						emitterTemplate.maxCount = emitterTemplate.maxCount * 0.75
						emitterTemplate.timeScale = emitterTemplate.timeScale * 1
					end
				end

			-- Make muzzleflashes light up
			elseif string.find(emitterTemplate.name:lower(), "muzz") then
				emitterTemplate:MakeWritable()
				emitterTemplate.actAsPointLight = true

				if emitterTemplate.pointLightColor == Vec3(1,1,1) then
					emitterTemplate.pointLightColor = Vec3(1,0.25,0)
					emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 0.78
					emitterTemplate.maxSpawnDistance = 2000
				end

			-- Make bullets light up
			elseif string.find(emitterTemplate.name:lower(), "tracer") then
				emitterTemplate:MakeWritable()
				emitterTemplate.actAsPointLight = true

				if emitterTemplate.pointLightColor == Vec3(1,1,1) then
					emitterTemplate.pointLightColor = Vec3(1,0.25,0)
					emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 1.25
					emitterTemplate.maxSpawnDistance = 2000
				end

			-- Make sparks light up
			elseif string.find(emitterTemplate.name:lower(), "spark") then
				emitterTemplate:MakeWritable()
				emitterTemplate.actAsPointLight = true

				if emitterTemplate.pointLightColor == Vec3(1,1,1) then
					emitterTemplate.pointLightColor = Vec3(1,0.25,0)
					emitterTemplate.pointLightRadius = emitterTemplate.pointLightRadius * 1.80
					emitterTemplate.maxSpawnDistance = 2000
				end

			end
		end
	end
end)

-- Unload stuff
Events:Subscribe('Extension:Unloading', function()
		-- User Settings
		print("User: " .. UserSettings_userBrightnessMin)
		print("User: " .. UserSettings_userBrightnessMax)
    if UserSettingsSaved == true then
	    	print('Unloading PP Settings')
				PostProcessingUnload = ResourceManager:GetSettings("GlobalPostProcessSettings")
				PostProcessingUnload = GlobalPostProcessSettings(PostProcessing)
	    	PostProcessingUnload.userBrightnessMin = UserSettings_userBrightnessMin
	    	PostProcessingUnload.userBrightnessMax = UserSettings_userBrightnessMax
	    	PostProcessingUnload.brightness = UserSettings_brightness
	    	print('Unloaded PP Settings')
				UserSettingsSaved = false
    end
		-- Reset Water
		local visual = ResourceManager:GetSettings("VisualTerrainSettings")
		if visual ~= nil then
				visual = VisualTerrainSettings(visual)
				visual.drawWaterEnable = true
				print('Water reset')
		end
		-- Reset edgeModels
		local badstuff = ResourceManager:GetSettings("GameRenderSettings")
		if badstuff ~= nil then
				badstuff = GameRenderSettings(badstuff)
				badstuff.edgeModelsEnable = true
				print('Edge Models reset')
		end
end)
