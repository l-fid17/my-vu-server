

--Camera Base Spawn  for Domination ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ResourceManager:RegisterInstanceLoadHandler(Guid('BAEC17AC-E3A5-4222-8A42-FD875EAAA5B0'), Guid('F96EC322-0164-4327-A58F-090A87E12D21'), function(instance) --Camera base Spawn

    local thisInstance = ReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.blueprintTransform.trans = Vec3(-220.826172, 295.041840, -170.221680)

end)

--Camera Base Spawn for Gunmaster -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ResourceManager:RegisterInstanceLoadHandler(Guid('E2B8541C-5A6C-41FC-81B8-3B03E9885B50'), Guid('5CC778D8-F292-4673-BFE3-DC516FC98308'), function(instance) --Camera base Spawn

    local thisInstance = ReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.blueprintTransform.trans = Vec3(-220.826172, 330.041840, -170.221680)

end)

--Camera Base Spawn for Squad DeathMatch -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ResourceManager:RegisterInstanceLoadHandler(Guid('E5F0DAFA-9F9B-4EFE-AD0D-6E394DCDE4AC'), Guid('2AAE3F67-3D11-43A1-B411-2891B31D783E'), function(instance) --Camera base Spawn

    local thisInstance = ReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.blueprintTransform.trans = Vec3(-220.826172, 320.041840, -170.221680)

end)

--Camera Base Spawn for DeathMatch -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ResourceManager:RegisterInstanceLoadHandler(Guid('4CE7C67D-087F-49CA-8C7D-27960A3F17FD'), Guid('F9C1E903-3362-4985-AB8E-330C65195DC1'), function(instance) --Camera base Spawn

    local thisInstance = ReferenceObjectData(instance)
    thisInstance:MakeWritable()
    thisInstance.blueprintTransform.trans = Vec3(-220.826172, 315.041840, -170.221680)

end)



---------------------------
-----------SPAWNS----------
---------------------------



-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('F82320E2-7AEB-4601-8D9E-E2DBE47FA242'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn1 = LinearTransform(
        Vec3(0.716660, 0.000000, -0.697423),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.697423, 0.000000, 0.716660),
Vec3(-317.773438, 281.779114, -266.313477)
    )

    thisInstance.transform = infSpawn1

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('CB5B1580-A123-472B-A32D-7FE9727D6C75'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn2 = LinearTransform(
        Vec3(0.704245, 0.000000, -0.709957),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.709957, 0.000000, 0.704245),
Vec3(-322.373047, 281.782043, -264.041992)
    )

    thisInstance.transform = infSpawn2

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('F138050A-19CD-4D4E-BA6D-F193A41BEE12'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn3 = LinearTransform(
        Vec3(-0.712795, 0.000000, -0.701372),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.701372, 0.000000, -0.712795),
Vec3(-313.868164, 281.782043, -260.739258)
    )

    thisInstance.transform = infSpawn3

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('A436F327-6DAA-4620-8CED-F2C874FA508A'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn4 = LinearTransform(
        Vec3(-0.711255, 0.000000, 0.702934),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.702934, 0.000000, -0.711255),
Vec3(-308.034180, 281.782043, -249.860352)
    )

    thisInstance.transform = infSpawn4

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('514DABC4-07B0-47F3-AB6E-90A1D25CF9A8'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn5 = LinearTransform(
        Vec3(-0.715809, 0.000000, 0.698296),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.698296, 0.000000, -0.715809),
Vec3(-305.281250, 281.780090, -253.407227)
    )

    thisInstance.transform = infSpawn5

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('F68CB5EA-2171-42D9-B870-8D57A8F92E53'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn6 = LinearTransform(
        Vec3(0.714053, 0.000000, 0.700092),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.700092, 0.000000, 0.714053),
Vec3(-297.574219, 281.780090, -257.417969)
    )

    thisInstance.transform = infSpawn6

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('2D170C53-19C8-43D7-A2DF-1070B7BEF251'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn7 = LinearTransform(
        Vec3(-0.723786, 0.000000, 0.690025),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.690025, 0.000000, -0.723786),
Vec3(-293.185547, 281.780090, -252.417969)
    )

    thisInstance.transform = infSpawn7

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('39247D83-D1C1-4D54-A7C0-F02DDE1FFA9D'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn8 = LinearTransform(
        Vec3(0.999991, 0.000000, 0.004248),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.004248, 0.000000, 0.999991),
Vec3(-304.142578, 277.614075, -242.940430)
    )

    thisInstance.transform = infSpawn8

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('3469EC64-8B24-4301-BBA0-4D8225412CC3'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn9 = LinearTransform(
        Vec3(-0.999956, 0.000000, 0.009394),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.009394, 0.000000, -0.999956),
Vec3(-299.964844, 277.614075, -227.802734)
    )

    thisInstance.transform = infSpawn9

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('24E9A34E-9D23-4716-9AEE-931A4A89A996'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn10 = LinearTransform(
        Vec3(0.694122, 0.000000, -0.719858),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.719858, 0.000000, 0.694122),
Vec3(-296.237305, 277.617004, -225.099609)
    )

    thisInstance.transform = infSpawn10

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('880CA1BE-E581-444B-8EB8-F3201E6F2690'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn11 = LinearTransform(
        Vec3(-0.694996, 0.000000, 0.719013),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.719013, 0.000000, -0.694996),
Vec3(-288.715820, 277.620911, -223.521484)
    )

    thisInstance.transform = infSpawn11

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('B5A6A1C1-1369-4350-A5A0-4286A64FBC35'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn12 = LinearTransform(
        Vec3(0.715755, 0.000000, 0.698351),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.698351, 0.000000, 0.715755),
Vec3(-290.115234, 277.620911, -242.635742)
    )

    thisInstance.transform = infSpawn12

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('1B130233-F379-4E7D-97EB-E5269586F62B'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn13 = LinearTransform(
        Vec3(0.718346, 0.000000, 0.695686),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.695686, 0.000000, 0.718346),
Vec3(-286.747070, 277.620911, -236.759766)
    )

    thisInstance.transform = infSpawn13

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('EE839F9D-C153-42C3-A818-2E57BA698D52'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn14 = LinearTransform(
        Vec3(-0.938795, 0.000000, 0.344475),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.344475, 0.000000, -0.938795),
Vec3(-232.845703, 271.245941, -166.853546)
    )

    thisInstance.transform = infSpawn14

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('4DC8902E-E01B-4AEA-9D7C-30AE6486A0A2'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn15 = LinearTransform(
        Vec3(-0.999058, 0.000000, 0.043386),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.043386, 0.000000, -0.999058),
Vec3(-224.589844, 275.565247, -141.741211)
    )

    thisInstance.transform = infSpawn15

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('4EB47674-D451-426C-BD3F-30625C202740'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn16 = LinearTransform(
        Vec3(-0.999879, 0.000000, 0.015542),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.015542, 0.000000, -0.999879),
Vec3(-227.814453, 273.005676, -148.851563)
    )

    thisInstance.transform = infSpawn16

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('794B4702-E6CC-419F-8A8D-75BE1A875F97'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn17 = LinearTransform(
        Vec3(0.999996, 0.000000, 0.002742),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.002742, 0.000000, 0.999996),
Vec3(-233.348633, 270.832855, -163.248077)
    )

    thisInstance.transform = infSpawn17

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('6B51D955-4E17-4002-8E00-5DC76584AA17'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn18 = LinearTransform(
        Vec3(0.999839, 0.000000, 0.017951),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.017951, 0.000000, 0.999839),
Vec3(-249.272461, 271.219543, -161.625000)
    )

    thisInstance.transform = infSpawn18

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('E9CD4CB4-60E5-45E2-973A-526A2560EDEC'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn19 = LinearTransform(
        Vec3(-0.048896, 0.000000, 0.998804),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.998804, 0.000000, -0.048896),
Vec3(-239.394531, 271.219543, -156.913803)
    )

    thisInstance.transform = infSpawn19

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('1A74E4D7-53FB-4763-8795-C0A8FBE4DD32'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn20 = LinearTransform(
        Vec3(-0.999979, 0.000000, -0.006522),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.006522, 0.000000, -0.999979),
Vec3(-251.707031, 271.219543, -147.007813)
    )

    thisInstance.transform = infSpawn20

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('C6E626E3-1FF3-4EE1-8CBB-D160860D7411'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn21 = LinearTransform(
        Vec3(-0.999254, 0.000000, 0.038612),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.038612, 0.000000, -0.999254),
Vec3(-239.660156, 271.218628, -136.060547)
    )

    thisInstance.transform = infSpawn21

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('A58526F0-1B3E-41F8-B763-C33737BD636E'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn22 = LinearTransform(
        Vec3(0.003836, 0.000000, -0.999993),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.999993, 0.000000, 0.003836),
Vec3(-256.954102, 271.219543, -142.014648)
    )

    thisInstance.transform = infSpawn22

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('4F1BA019-AC3B-45C0-83AE-88F1F1F47F3F'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn23 = LinearTransform(
        Vec3(-0.999495, 0.000000, 0.031765),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.031765, 0.000000, -0.999495),
Vec3(-243.716797, 270.027161, -122.185547)
    )

    thisInstance.transform = infSpawn23

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('D34765A8-C891-46F6-8783-268363C09C09'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn24 = LinearTransform(
        Vec3(0.621610, 0.000000, -0.783327), Vec3(0.000000, 1.000000, 0.000000), Vec3(0.783327, -0.000000, 0.621610), Vec3(-235.477707, 270.073761, -125.832954)
    )

    thisInstance.transform = infSpawn24

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('21F1D498-E5EB-4738-8D91-4A4445C4D3F1'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn25 = LinearTransform(
        Vec3(0.955336, 0.000000, -0.295520), Vec3(-0.000000, 1.000000, 0.000000), Vec3(0.295520, -0.000000, 0.955336), Vec3(-240.067062, 270.087341, -121.393829)
    )

    thisInstance.transform = infSpawn25

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('BA6C9A4D-5615-4D5D-A274-B2C9DE3D8A65'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn26 = LinearTransform(
        Vec3(-0.706194, 0.000000, 0.708018),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.708018, 0.000000, -0.706194),
Vec3(-267.346680, 276.340637, -256.127930)
    )

    thisInstance.transform = infSpawn26

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('38C285D6-2ACA-41B8-8A08-4F16A52B72E9'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn27 = LinearTransform(
        Vec3(0.721596, 0.000000, -0.692314),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.692314, 0.000000, 0.721596),
Vec3(-312.966797, 275.115051, -308.035156)
    )

    thisInstance.transform = infSpawn27

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('C309FB03-B863-4442-9A37-F3EAB90D2B06'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn28 = LinearTransform(
        Vec3(-0.697183, 0.000000, 0.716893),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.716893, 0.000000, -0.697183),
Vec3(-307.901367, 277.645386, -280.795898)
    )

    thisInstance.transform = infSpawn28

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('9ED17469-36F3-439A-9B37-C4C02AD89BAB'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn29 = LinearTransform(
        Vec3(0.707553, 0.000000, -0.706660),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.706660, 0.000000, 0.707553),
Vec3(-314.007813, 277.620911, -291.500977)
    )

    thisInstance.transform = infSpawn29

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('76F2DBEC-8821-4B27-B19F-DB049B3831B6'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn30 = LinearTransform(
        Vec3(-0.713829, 0.000000, -0.700320),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.700320, 0.000000, -0.713829),
Vec3(-321.146484, 277.620911, -263.764648)
    )

    thisInstance.transform = infSpawn30

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('FC906C0D-B05B-4A1D-9ADE-69B668B81BF5'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn31 = LinearTransform(
        Vec3(-0.714129, 0.000000, 0.700014),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.700014, 0.000000, -0.714129),
Vec3(-309.251953, 277.620911, -255.544922)
    )

    thisInstance.transform = infSpawn31

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('B0DCD329-6A7E-4F70-9207-A359802F1442'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn32 = LinearTransform(
        Vec3(-0.707598, 0.000000, 0.706615),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.706615, 0.000000, -0.707598),
Vec3(-314.061523, 277.620911, -256.568359)
    )

    thisInstance.transform = infSpawn32

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('FD7B4D0D-FF48-47D1-8678-660E40BA0DE3'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn33 = LinearTransform(
        Vec3(-0.727106, 0.000000, -0.686525),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.686525, 0.000000, -0.727106),
Vec3(-301.852539, 277.620911, -257.500000)
    )

    thisInstance.transform = infSpawn33

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('3E8A15F9-A84D-4EF3-9607-800831D8AA8D'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn34 = LinearTransform(
        Vec3(0.707801, 0.000000, -0.706412),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.706412, 0.000000, 0.707801),
Vec3(-318.100586, 281.780090, -278.134766)
    )

    thisInstance.transform = infSpawn34

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('3D2921E2-628E-4A6D-A0E2-F9FB82E7A28B'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn35 = LinearTransform(
        Vec3(0.005617, 0.000000, 0.999984),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.999984, 0.000000, 0.005617),
Vec3(-309.312500, 282.098572, -339.960938)
    )

    thisInstance.transform = infSpawn35

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('454A16AA-27C2-4AE1-B1B7-E9481D777D0A'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn36 = LinearTransform(
        Vec3(0.999784, 0.000000, -0.020793),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.020793, 0.000000, 0.999784),
Vec3(-318.638672, 282.098480, -340.907227)
    )

    thisInstance.transform = infSpawn36

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('A82F03CE-97CD-46AC-9321-D689E0714E25'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn37 = LinearTransform(
        Vec3(-0.080456, 0.000000, -0.996758),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.996758, 0.000000, -0.080456),
Vec3(-305.875977, 282.098480, -320.601563)
    )

    thisInstance.transform = infSpawn37

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('03B8ABF0-D6CD-443E-B672-128B8C42235E'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn38 = LinearTransform(
        Vec3(0.684725, 0.000000, -0.728802),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.728802, 0.000000, 0.684725),
Vec3(-306.185547, 282.100403, -341.929688)
    )

    thisInstance.transform = infSpawn38

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('D9024766-6EC1-43D1-8D85-EF687714A155'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn39 = LinearTransform(
        Vec3(0.697476, 0.000000, -0.716608),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.716608, 0.000000, 0.697476),
Vec3(-284.532227, 282.098541, -354.534180)
    )

    thisInstance.transform = infSpawn39

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('5CDDD095-898B-41AC-9216-9DA24EF84843'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn40 = LinearTransform(
        Vec3(0.688776, 0.000000, -0.724974),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.724974, 0.000000, 0.688776),
Vec3(-284.049805, 282.100403, -330.453125)
    )

    thisInstance.transform = infSpawn40

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('5E1601D2-D7B8-42C0-937E-78CD959AF727'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn41 = LinearTransform(
        Vec3(0.720260, 0.000000, 0.693704),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.693704, 0.000000, 0.720260),
Vec3(-269.318359, 282.100403, -335.668945)
    )

    thisInstance.transform = infSpawn41

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('B142A0B3-588D-4121-98CB-C1EF3EE2EFA5'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn42 = LinearTransform(
        Vec3(-0.711115, 0.000000, 0.703076),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(-0.703076, 0.000000, -0.711115),
Vec3(-274.563477, 282.091614, -322.842773)
    )

    thisInstance.transform = infSpawn42

end)

-- Infantry Spawn (using old)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('01C1CC45-F698-4EAA-93EF-C047BEC78C37'), function(instance)

    local thisInstance = AlternateSpawnEntityData(instance)
    thisInstance:MakeWritable()

    local infSpawn43 = LinearTransform(
        Vec3(-0.715288, 0.000000, -0.698829),
Vec3(0.000000, 1.000000, 0.000000),
Vec3(0.698829, 0.000000, -0.715288),
Vec3(-294.049805, 282.104309, -339.541016)
    )

    thisInstance.transform = infSpawn43

end)

--------FRIENDLYZONES to prevent spawn in front of enemies------------

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('761E60D8-748B-41EA-BBF7-E4A9E99623EB'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-234.779495, 270.234070, -116.273178), Vec3(-262.113373, 269.842194, -111.749878), Vec3(-261.852417, 269.046600, -139.293350), Vec3(-257.995819, 271.220184, -143.765930), Vec3(-258.606873, 271.220184, -161.968582), Vec3(-253.938202, 271.220184, -161.995041), Vec3(-237.763290, 270.800842, -162.461243), Vec3(-237.335434, 271.199280, -164.441544), Vec3(-229.209595, 270.893188, -164.580414), Vec3(-229.230072, 269.109009, -140.238113), Vec3(-224.411743, 269.904266, -127.944542)
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('61BB0CAB-FA5F-4C7C-88CC-830B79E6D9E0'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-228.938843, 275.652161, -140.501724), Vec3(-273.769806, 275.652191, -140.450241), Vec3(-273.640289, 275.652191, -165.895584), Vec3(-228.778198, 275.565186, -165.493301), Vec3(-223.133102, 275.575287, -165.750092), Vec3(-219.092804, 275.565186, -140.616562)
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('8C632607-4F3A-416B-9A9D-9E16DFDC6B10'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-275.827148, 277.619995, -216.012650), Vec3(-283.744568, 277.619995, -208.058319), Vec3(-298.189484, 277.619995, -222.503601), Vec3(-305.771240, 277.619995, -222.472656), Vec3(-305.775665, 277.619995, -245.644318), Vec3(-302.315125, 277.619995, -242.623871), Vec3(-295.858856, 277.619995, -242.615601), Vec3(-292.206238, 277.619995, -246.174438), Vec3(-299.402039, 277.619995, -253.520844), Vec3(-301.369110, 277.635345, -255.822556), Vec3(-306.972046, 277.655304, -254.637253), Vec3(-310.542969, 277.619995, -251.014938), Vec3(-323.394104, 277.619995, -263.893799), Vec3(-316.324097, 277.619995, -270.861389), Vec3(-306.955658, 277.619995, -279.441193), Vec3(-282.088837, 277.619995, -254.642670), Vec3(-271.850586, 276.340973, -265.094818), Vec3(-263.573639, 276.369141, -256.873047), Vec3(-267.350586, 276.341003, -253.083099), Vec3(-268.470123, 276.341003, -251.991318), Vec3(-258.943146, 277.620026, -242.667374), Vec3(-272.070374, 275.347961, -229.256271), Vec3(-275.752045, 277.619995, -221.433380), Vec3(-278.484009, 277.619995, -218.738876)
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('97879D03-5BC9-4059-975B-4024B53F889B'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-291.491089, 281.779999, -252.538193), Vec3(-293.154114, 281.779999, -250.884766), Vec3(-297.661163, 281.779999, -255.403610), Vec3(-299.571991, 281.780121, -253.561768), Vec3(-301.576111, 281.779999, -255.557922), Vec3(-308.983154, 281.779999, -248.199982), Vec3(-324.196442, 281.779999, -263.433411), Vec3(-321.654419, 281.740723, -266.133057), Vec3(-320.967499, 281.779999, -265.374634), Vec3(-316.217682, 281.779999, -270.180054), Vec3(-316.719574, 281.779999, -271.220886), Vec3(-322.094421, 281.803619, -276.547882), Vec3(-318.495178, 281.780457, -280.164490), Vec3(-313.063324, 281.782684, -274.735199), Vec3(-314.693970, 281.779999, -272.599274), Vec3(-299.556244, 281.779999, -257.507660), Vec3(-297.710144, 281.779999, -258.815765)
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('52726966-78B2-4BA5-839A-E813B8BD06DF'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-312.337860, 277.619995, -273.975983), Vec3(-316.035217, 277.619995, -270.505768), Vec3(-330.250366, 277.619995, -284.780029), Vec3(-321.174316, 277.619995, -294.231873), Vec3(-333.874969, 277.619995, -306.833954), Vec3(-330.249664, 277.619995, -310.489166), Vec3(-322.763062, 277.619995, -303.002991), Vec3(-318.982391, 277.771942, -306.692139), Vec3(-319.103485, 276.735291, -307.133514), Vec3(-316.521484, 275.168335, -309.936401), Vec3(-313.438354, 275.279572, -311.596924), Vec3(-311.638702, 275.113617, -309.717102), Vec3(-312.173218, 275.113617, -309.045898), Vec3(-308.063629, 275.113586, -304.896301), Vec3(-305.979156, 275.113617, -306.931854), Vec3(-301.559479, 275.113556, -310.491425), Vec3(-300.955719, 275.113586, -308.161224), Vec3(-291.541321, 275.238190, -296.953217), Vec3(-290.283051, 275.226746, -288.656403), Vec3(-295.912659, 275.113617, -277.976471), Vec3(-298.268494, 275.273041, -283.306793), Vec3(-299.381073, 277.619995, -287.399231), Vec3(-303.268829, 277.621918, -283.516113), Vec3(-308.880951, 277.647064, -278.034515)
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('137AD610-1384-4261-8A0B-C8920F7D7684'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-326.010651, 281.779999, -297.099426),
		Vec3(-335.728271, 281.779999, -306.951355),
		Vec3(-320.099854, 281.816650, -322.523468),
		Vec3(-324.657440, 282.100006, -327.465149),
		Vec3(-320.202118, 282.100006, -332.120422),
		Vec3(-320.332794, 282.100006, -342.134033),
		Vec3(-307.263702, 282.191467, -342.183380),
		Vec3(-306.433746, 282.100006, -342.529510),
		Vec3(-298.419006, 282.100006, -342.547028),
		Vec3(-290.211670, 282.100006, -334.298950),
		Vec3(-287.273926, 282.100006, -330.087280),
		Vec3(-280.121613, 282.100006, -322.905792),
		Vec3(-285.439484, 282.100006, -317.529175),
		Vec3(-289.015076, 282.100006, -314.604797),
		Vec3(-296.416656, 282.100006, -314.438354),
		Vec3(-301.952576, 282.103790, -314.377014),
		Vec3(-301.952637, 282.102386, -318.698792),
		Vec3(-306.942657, 282.232971, -318.834747),
		Vec3(-307.712158, 282.100006, -317.711273),
		Vec3(-311.465607, 282.100006, -314.018219),
		Vec3(-319.023438, 281.779999, -306.753326),
		Vec3(-322.935791, 281.807526, -302.875397),
		Vec3(-321.687958, 281.815063, -301.407898)
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('860B2B75-2A96-4CB5-A4CA-1536114FEC4C'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-286.238647, 282.276154, -330.904694),
		Vec3(-289.947479, 282.125610, -334.576904),
		Vec3(-298.292358, 282.100006, -343.132996),
		Vec3(-283.985718, 282.116943, -357.125641),
		Vec3(-283.756378, 282.099487, -357.418304),
		Vec3(-295.637543, 282.099487, -369.355011),
		Vec3(-281.778168, 282.099457, -382.715668),
		Vec3(-254.553375, 282.099457, -355.123932),
		Vec3(-270.721222, 282.105255, -338.883118),
		Vec3(-267.502350, 282.100006, -335.503326),
		Vec3(-278.780640, 282.100006, -324.390503),
		Vec3(-285.516510, 282.146210, -331.050995)
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)



-------------------------
-- Objective positions --
-------------------------

-- Entrance (A)  -----------------------------------------------------------------------------------------------------------------------------------------------------------------

ResourceManager:RegisterInstanceLoadHandler(Guid('BAEC17AC-E3A5-4222-8A42-FD875EAAA5B0'), Guid('9FF8B79B-1C11-42D2-B713-5AC6EE4E3294'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-223.553558, 275.617798, -165.504120), Vec3(-222.253220, 275.570618, -160.955032), Vec3(-221.297165, 275.583588, -156.304077), Vec3(-219.026199, 275.565186, -140.570786), Vec3(-273.610901, 275.567261, -140.560394), Vec3(-273.610352, 275.566315, -165.582855)
    }
    
    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

ResourceManager:RegisterInstanceLoadHandler(Guid('BAEC17AC-E3A5-4222-8A42-FD875EAAA5B0'), Guid('1B3AE1D0-E8F2-454A-9F0E-CAE7A5680AAA'), function(instance)

    local thisInstance = ReferenceObjectData(instance)
    thisInstance:MakeWritable()

    local flagPos = Vec3(-241.185547, 275.569153, -153.274414) -- x+4.12 y-0.11 z+38.63 to offset the offset
    thisInstance.blueprintTransform.trans = flagPos

end)



-- Balcony (B)  -------------------------------------------------------------------------------------------------------------------------------------------------------------------

ResourceManager:RegisterInstanceLoadHandler(Guid('BAEC17AC-E3A5-4222-8A42-FD875EAAA5B0'), Guid('0CE53A8A-3464-4592-AC12-5ABFCC729390'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-336.151642, 276.980988, -306.774292),
		Vec3(-325.878906, 276.980988, -296.547699),
		Vec3(-324.931976, 277.036835, -297.485962),
		Vec3(-321.438202, 277.619995, -293.971191),
		Vec3(-330.500214, 277.728058, -284.953674),
		Vec3(-331.438782, 277.619995, -285.905548),
		Vec3(-333.215485, 276.980988, -284.038361),
		Vec3(-337.224213, 276.981018, -284.079529),
		Vec3(-337.187469, 276.981018, -306.700592),
    }

    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

ResourceManager:RegisterInstanceLoadHandler(Guid('BAEC17AC-E3A5-4222-8A42-FD875EAAA5B0'), Guid('E5DCE705-B125-4A28-8863-CE8BEB0420FD'), function(instance)

    local thisInstance = ReferenceObjectData(instance)
    thisInstance:MakeWritable()

    local flagPos = Vec3(-331.840820, 276.981262, -296.022461)
    thisInstance.blueprintTransform.trans = flagPos

end)



-- Bedroom (C)  ---------------------------------------------------------------------------------------------------------------------------------------------------------

ResourceManager:RegisterInstanceLoadHandler(Guid('BAEC17AC-E3A5-4222-8A42-FD875EAAA5B0'), Guid('3EEC58FF-33D5-47B7-AD6A-1532D71A1A72'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-269.991394, 282.099487, -343.623199),
		Vec3(-276.083679, 282.099487, -349.680420),
		Vec3(-276.051758, 282.099457, -350.531738),
		Vec3(-276.977539, 282.099457, -350.645813),
		Vec3(-290.049347, 282.099487, -363.679932),
		Vec3(-290.028656, 282.099487, -364.561340),
		Vec3(-290.961853, 282.099457, -364.576996),
		Vec3(-295.825531, 282.100311, -369.343842),
		Vec3(-282.125671, 282.099457, -382.723663),
		Vec3(-281.784515, 282.099487, -382.820892),
		Vec3(-256.526215, 282.099487, -357.554108),
		Vec3(-256.719238, 282.099487, -357.332123),
		Vec3(-256.497559, 282.099487, -357.100830)
    }

    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

ResourceManager:RegisterInstanceLoadHandler(Guid('BAEC17AC-E3A5-4222-8A42-FD875EAAA5B0'), Guid('B00EB7A9-A2BB-4BA1-A454-9D1719592481'), function(instance)

    local thisInstance = ReferenceObjectData(instance)
    thisInstance:MakeWritable()
    
    local flagPos = Vec3(-278.000000, 282.099426, -373.268555) -- x+1.95 y+0 z-11.26
    thisInstance.blueprintTransform.trans = flagPos

end)

------------------
---ReverVolumes---
------------------

--Swimming Pool

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('0D9E3DE2-379B-4298-8712-6D1B07D45839'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-243.589584, 269.83902, -144.040619),
		Vec3(-247.399872, 269.83902, -144.039322),
		Vec3(-247.546356, 269.83902, -144.1397),
		Vec3(-258.403381, 269.83902, -144.103668),
		Vec3(-271.1441, 269.83902, -144.033844),
		Vec3(-271.104279, 269.83902, -161.985779),
		Vec3(-255.817825, 269.83902, -162.016663),
		Vec3(-255.745743, 269.83902, -162.230576),
		Vec3(-254.612366, 269.83902, -162.248444),
		Vec3(-254.5343, 269.83902, -162.0035),
		Vec3(-253.90741, 269.83902, -162.00737),
		Vec3(-253.896774, 269.83902, -161.00531),
		Vec3(-253.278381, 269.83902, -161.002762),
		Vec3(-253.277283, 269.83902, -154.355),
		Vec3(-251.9832, 269.83902, -154.3472),
		Vec3(-251.974121, 269.83902, -155.760269),
		Vec3(-251.9732, 269.83902, -162.34552),
		Vec3(-246.921509, 269.83902, -162.300964),
		Vec3(-237.904449, 269.83902, -162.3463),
		Vec3(-237.902359, 269.83902, -155.9513),
		Vec3(-237.902359, 269.83902, -154.555771),
		Vec3(-237.902359, 269.83902, -151.893784),
		Vec3(-241.687241, 269.83902, -151.878448),
		Vec3(-241.726059, 269.83902, -151.628448),
		Vec3(-237.913147, 269.83902, -151.628448),
		Vec3(-237.902359, 269.83902, -144.118408),
		Vec3(-243.392883, 269.83902, -144.106964),
		Vec3(-243.409973, 269.83902, -151.620819),
		Vec3(-242.952316, 269.83902, -151.6827),
		Vec3(-243.08934, 269.83902, -151.878448),
		Vec3(-243.583557, 269.83902, -151.8762)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

--Bathroom

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('43835473-73AA-414A-9896-A4A7211235F5'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-310.56662, 277.62, -250.998489),
		Vec3(-314.171661, 277.62, -254.611023),
		Vec3(-311.662445, 277.62, -257.124146),
		Vec3(-311.875763, 277.62, -257.347565),
		Vec3(-310.999542, 277.62, -258.124054),
		Vec3(-310.567932, 277.62, -258.214722),
		Vec3(-306.955627, 277.62, -254.621368)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

--Big Room 1

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('56BFA3DD-D86F-4F9E-B4CE-FC8C43C60D66'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-314.177185, 281.782349, -295.794434), Vec3(-311.478210, 281.782349, -298.493408), Vec3(-311.921906, 281.782349, -299.465271), Vec3(-323.942963, 281.782349, -311.375244), Vec3(-316.241608, 281.782349, -319.117126), Vec3(-311.447906, 281.782349, -314.362701), Vec3(-307.881836, 281.782349, -317.928711), Vec3(-312.640533, 281.782349, -322.686798), Vec3(-307.274048, 281.782349, -328.044891), Vec3(-307.268799, 281.782349, -331.624023), Vec3(-306.941467, 281.782349, -331.628235), Vec3(-306.935486, 281.782349, -318.733795), Vec3(-296.510315, 281.782349, -318.756165), Vec3(-296.491058, 281.782349, -314.823364), Vec3(-288.863068, 281.782349, -314.823364), Vec3(-288.840637, 281.782349, -318.737579), Vec3(-287.631317, 281.782349, -319.585724), Vec3(-285.660919, 281.782349, -317.649780), Vec3(-280.275513, 281.782349, -323.028381), Vec3(-287.322693, 281.782349, -330.072327), Vec3(-286.378021, 281.782349, -331.006714), Vec3(-286.255096, 281.782349, -330.887939), Vec3(-282.649811, 281.782349, -334.521362), Vec3(-293.266968, 281.782349, -345.140656), Vec3(-294.705933, 281.782349, -346.472961), Vec3(-298.235077, 281.782349, -342.921936), Vec3(-289.888550, 281.782349, -334.522980), Vec3(-290.117401, 281.782349, -334.287476), Vec3(-298.417908, 281.782349, -342.568420), Vec3(-306.944214, 281.782349, -342.553833), Vec3(-306.933746, 281.782349, -332.919830), Vec3(-307.286377, 281.782349, -332.911316), Vec3(-307.269165, 281.782349, -337.113037), Vec3(-307.282623, 281.782349, -338.394684), Vec3(-307.265869, 281.782349, -341.484009), Vec3(-307.299988, 281.782349, -342.157654), Vec3(-320.209167, 281.782349, -342.204559), Vec3(-320.215118, 281.782349, -331.989288), Vec3(-317.727722, 281.782349, -332.001465), Vec3(-317.735870, 281.782349, -330.710144), Vec3(-321.020508, 281.782349, -331.059570), Vec3(-324.573090, 281.782349, -327.451935), Vec3(-319.851074, 281.782349, -322.735535), Vec3(-331.139648, 281.782349, -311.379089), Vec3(-322.840363, 281.782349, -303.061707), Vec3(-322.148682, 281.782349, -303.666534)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

--Big Room 2

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('240F1C77-A960-4E9A-915A-2A1B3336FFC5'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-292.241638, 281.780151, -246.234848), Vec3(-285.001831, 281.780151, -253.474655), Vec3(-294.052399, 281.780151, -262.525482), Vec3(-301.294861, 281.780151, -255.284164)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

--Big Room 3

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('F98ED008-344B-4D3D-97FC-02E8F2E7704F'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-301.285828, 277.619995, -255.741180), Vec3(-296.012054, 277.619995, -261.302185), Vec3(-295.605194, 277.619995, -260.990814), Vec3(-294.775116, 277.619995, -261.820007), Vec3(-294.995911, 277.619995, -262.043823), Vec3(-294.286987, 277.619995, -262.740021), Vec3(-301.464294, 277.619995, -269.986969), Vec3(-305.582764, 277.619995, -265.694580), Vec3(-306.559479, 277.619995, -264.924744), Vec3(-306.943573, 277.619995, -264.553314), Vec3(-307.404236, 277.619995, -261.867645)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

--Big Room 4

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('052DE67C-A6AC-410E-9D88-0D36BA0A5EDD'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-301.281433, 281.633942, -255.745590), Vec3(-300.932068, 281.633911, -255.666290), Vec3(-300.092590, 281.633911, -256.496246), Vec3(-300.309326, 281.633911, -256.725037), Vec3(-294.287567, 281.633911, -262.760651), Vec3(-301.473206, 281.633911, -269.978058), Vec3(-307.523285, 281.633911, -263.957977), Vec3(-307.713898, 281.633911, -264.103424), Vec3(-308.526703, 281.633911, -263.304077), Vec3(-308.371399, 281.633911, -263.126434), Vec3(-308.518616, 281.633911, -262.971100), Vec3(-308.748871, 281.633911, -262.743134), Vec3(-313.263855, 281.633911, -258.202698), Vec3(-310.733337, 281.633911, -255.395432), Vec3(-306.042664, 281.633911, -250.984344), Vec3(-301.527283, 281.633911, -255.499725)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

--Big Room 5

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('FF3D7EEB-D3CD-466F-A091-1453A5D7AA58'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-302.390289, 277.621033, -225.963715), Vec3(-294.573853, 277.621033, -225.946396), Vec3(-289.960785, 277.621033, -221.363892), Vec3(-284.559143, 277.621033, -226.765533), Vec3(-283.611542, 277.621033, -227.643845), Vec3(-278.901947, 277.621033, -232.422745), Vec3(-279.579742, 277.621033, -233.110184), Vec3(-275.505005, 277.621033, -237.194290), Vec3(-279.120392, 277.621033, -240.804718), Vec3(-286.598999, 277.621033, -248.276184), Vec3(-283.196167, 277.621033, -251.667496), Vec3(-294.043213, 277.621033, -262.516296), Vec3(-297.567932, 277.621033, -259.014130), Vec3(-297.536224, 277.621033, -259.019562), Vec3(-301.267487, 277.621033, -255.269226), Vec3(-292.235229, 277.621033, -246.237564), Vec3(-295.794861, 277.621033, -242.673874), Vec3(-302.335541, 277.621033, -242.677612)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

--Big Room 6

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('82AD2331-3113-49D8-BDB4-32266D4E4771'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-295.827240, 282.099945, -369.356201), Vec3(-282.162445, 282.099945, -382.776062), Vec3(-281.739838, 282.099945, -382.916595), Vec3(-274.105865, 282.099945, -375.265503), Vec3(-267.723846, 282.099945, -368.845825), Vec3(-258.438782, 282.099945, -359.593872), Vec3(-256.460388, 282.099945, -357.582367), Vec3(-256.427307, 282.099945, -357.034882), Vec3(-261.792999, 282.099945, -351.679901), Vec3(-262.312653, 282.099945, -351.148529), Vec3(-267.688904, 282.099945, -345.788513), Vec3(-269.995697, 282.099945, -343.544403), Vec3(-276.096924, 282.099945, -349.619141), Vec3(-276.293427, 282.099945, -349.573486), Vec3(-277.081238, 282.099945, -350.381226), Vec3(-277.024902, 282.099945, -350.562836), Vec3(-290.130493, 282.099945, -363.669342), Vec3(-290.985413, 282.099945, -364.534088)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

--Big Room 7

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('FCE87EB0-E8B0-43B9-BA70-E3B33E17E744'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-294.400848, 282.102844, -346.739319), Vec3(-293.978455, 282.102844, -346.263336), Vec3(-294.166016, 282.102844, -345.985596), Vec3(-293.310883, 282.102844, -345.185730), Vec3(-293.032593, 282.102844, -345.373718), Vec3(-292.604797, 282.102844, -344.924133), Vec3(-290.346802, 282.102844, -347.194000), Vec3(-284.039246, 282.102844, -340.884796), Vec3(-275.864990, 282.102844, -348.996094), Vec3(-276.345459, 282.102844, -349.487976), Vec3(-277.197357, 282.102844, -350.321167), Vec3(-283.655701, 282.102844, -356.786804)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

--Big Room 8

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('01904CEE-74F9-4563-90F1-2FBFBCE935E4'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-290.142059, 285.794922, -334.767914), Vec3(-286.507263, 285.794891, -338.353149), Vec3(-275.871674, 285.794891, -348.988739), Vec3(-276.339874, 285.794891, -349.421478), Vec3(-277.178467, 285.794891, -350.333252), Vec3(-282.649567, 285.794891, -355.772675), Vec3(-283.595184, 285.794891, -356.702606), Vec3(-284.004883, 285.794891, -357.134949), Vec3(-298.254547, 285.794891, -342.958008)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

--Medium Room 1

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('9E24BCE3-5A60-4951-8FFF-797F7C837607'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-318.477661, 281.781830, -280.139862), Vec3(-322.089966, 281.781830, -276.542450), Vec3(-316.674408, 281.781830, -271.126862), Vec3(-316.272675, 281.781830, -271.085236), Vec3(-315.456665, 281.781830, -271.863037), Vec3(-315.690552, 281.781830, -272.108368), Vec3(-313.055817, 281.781830, -274.747864)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

--Medium Room 2

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('67D5D40E-9DB6-4C86-A446-9E8CEA14202C'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-320.724640, 281.821014, -265.606903), Vec3(-316.226746, 281.821014, -270.211487), Vec3(-310.921021, 281.821014, -264.754242), Vec3(-310.921021, 281.821014, -264.754242), Vec3(-310.526855, 281.821014, -264.978973), Vec3(-316.434387, 281.821014, -270.909821), Vec3(-314.623993, 281.821014, -272.720215), Vec3(-308.966461, 281.821014, -277.447845), Vec3(-301.749573, 281.821014, -270.215057), Vec3(-306.928955, 281.821014, -265.035706), Vec3(-308.745361, 281.821014, -263.219269), Vec3(-309.681549, 281.821014, -264.153992), Vec3(-309.932495, 281.821014, -263.906433), Vec3(-308.985413, 281.821014, -262.984100), Vec3(-313.555420, 281.821014, -258.469910)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

--Medium Room 3

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('55EA5C45-E4AF-4537-8DA6-6A0B90C76BB5'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-308.528442, 277.619995, -266.115784), Vec3(-306.952484, 277.619995, -264.570374), Vec3(-307.402435, 277.619995, -261.844269), Vec3(-311.057922, 277.619995, -258.204834), Vec3(-311.989105, 277.619995, -257.275146), Vec3(-314.405090, 277.619995, -254.841614), Vec3(-323.472046, 277.619995, -263.905304), Vec3(-317.346863, 277.619995, -269.987396), Vec3(-316.912628, 277.619995, -269.541992), Vec3(-315.978333, 277.619995, -270.457275), Vec3(-330.249695, 277.619995, -284.710510), Vec3(-321.210236, 277.619995, -293.749969), Vec3(-320.293030, 277.619995, -292.847534), Vec3(-320.071503, 277.619995, -293.081970), Vec3(-333.876923, 277.619995, -306.818024), Vec3(-330.248627, 277.619995, -310.490021), Vec3(-322.834320, 277.619995, -302.980286), Vec3(-319.161591, 277.619995, -306.639435), Vec3(-311.926239, 277.619995, -299.414337), Vec3(-312.154388, 277.619995, -299.180481), Vec3(-311.482727, 277.619995, -298.517365), Vec3(-311.237030, 277.619995, -298.271667), Vec3(-310.794769, 277.619995, -297.829407), Vec3(-310.564178, 277.619995, -298.043304), Vec3(-299.712097, 277.619995, -287.190125), Vec3(-303.305756, 277.619995, -283.586823), Vec3(-304.707489, 277.619995, -284.961853), Vec3(-304.952576, 277.619995, -284.724731), Vec3(-303.571045, 277.619995, -283.331177), Vec3(-308.985779, 277.619995, -277.920135), Vec3(-313.049347, 277.619995, -281.989075), Vec3(-312.819153, 277.619995, -282.211609), Vec3(-316.440155, 277.619995, -285.857330), Vec3(-320.059570, 277.619995, -282.230652), Vec3(-321.903778, 277.619995, -284.076477), Vec3(-322.130188, 277.619995, -283.812073), Vec3(-312.377716, 277.619995, -274.062653), Vec3(-308.982025, 277.619995, -277.455109), Vec3(-301.755615, 277.619995, -270.228699), Vec3(-302.306671, 277.619995, -269.878937), Vec3(-302.463623, 277.619995, -268.971619), Vec3(-304.705231, 277.619995, -266.641144), Vec3(-306.034058, 277.619995, -266.143402), Vec3(-305.742889, 277.619995, -265.781097), Vec3(-306.616608, 277.619995, -265.012543), Vec3(-306.938446, 277.619995, -265.033722), Vec3(-308.751068, 277.619995, -266.837769)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

--Medium Room 4

ResourceManager:RegisterInstanceLoadHandler(Guid('789CABB5-93AE-427F-8253-47310C0A94BD'), Guid('B66E9EAA-B198-4B82-8EFD-DCD1F197F9F7'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-287.799011, 286.259460, -361.406708), Vec3(-274.055145, 286.422668, -374.724945), Vec3(-254.636169, 286.183502, -355.305969), Vec3(-268.113556, 286.038391, -341.661560)
		
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)





---------
-- OOB --
---------

-- For US -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('FD46D2B0-CA5D-41B5-940C-DA973B8DF3F7'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-269.604095, 273.160522, -338.444702), Vec3(-266.829407, 273.160522, -335.500305), Vec3(-272.657928, 273.141754, -329.543884), Vec3(-269.514160, 273.088776, -326.351624), Vec3(-282.135651, 272.216400, -313.564026), Vec3(-285.712097, 273.160522, -317.037720), Vec3(-288.564728, 273.071075, -314.203064), Vec3(-288.555817, 271.029083, -309.613495), Vec3(-289.125732, 275.603485, -307.218872), Vec3(-293.011230, 268.962158, -308.792816), Vec3(-292.684357, 269.674530, -304.103363), Vec3(-290.256500, 268.587341, -297.713776), Vec3(-288.097198, 269.918854, -291.309509), Vec3(-285.737823, 269.329773, -288.234222), Vec3(-284.577301, 269.760986, -281.650940), Vec3(-276.452087, 270.566437, -274.827759), Vec3(-269.731171, 272.368835, -272.079041), Vec3(-258.258057, 274.940765, -259.770050), Vec3(-253.979416, 277.256683, -255.045151), Vec3(-253.075027, 277.721344, -249.519318), Vec3(-253.986176, 275.432220, -238.597443), Vec3(-246.239929, 272.937134, -226.857010), Vec3(-239.917801, 272.729675, -220.070541), Vec3(-219.019821, 263.016693, -168.343887), Vec3(-217.434525, 264.291565, -162.600555), Vec3(-216.342957, 262.502258, -142.218430), Vec3(-216.195526, 263.126862, -135.266220), Vec3(-222.093521, 263.936798, -118.596542), Vec3(-236.326294, 263.115051, -108.684479), Vec3(-262.962219, 262.770721, -107.026459), Vec3(-264.043427, 262.797302, -112.026062), Vec3(-261.390198, 262.693604, -118.560196), Vec3(-265.367157, 262.120667, -130.670044), Vec3(-273.168701, 264.052582, -137.871765), Vec3(-273.981384, 263.862579, -141.303711), Vec3(-273.993225, 264.521576, -165.667145), Vec3(-269.271912, 267.391754, -167.246582), Vec3(-269.610260, 268.468781, -177.200760), Vec3(-276.970062, 267.399231, -186.104156), Vec3(-284.591858, 267.029968, -199.828278), Vec3(-292.537445, 269.255707, -213.231720), Vec3(-298.426331, 268.356964, -221.237503), Vec3(-306.107117, 268.833069, -221.373703), Vec3(-306.491852, 267.053314, -246.206863), Vec3(-308.333221, 270.099365, -248.052246), Vec3(-308.697784, 270.194641, -247.689743), Vec3(-323.122894, 268.697876, -262.115051), Vec3(-324.442810, 268.675171, -263.406342), Vec3(-316.992554, 269.127350, -270.812927), Vec3(-329.839935, 267.485626, -283.557068), Vec3(-337.454865, 266.416412, -283.080933), Vec3(-338.302856, 266.691315, -308.937378), Vec3(-335.311462, 268.818115, -308.752960), Vec3(-322.065643, 272.661224, -323.591705), Vec3(-325.808929, 270.830811, -327.387573), Vec3(-321.332275, 271.315063, -332.097260), Vec3(-321.180573, 270.031250, -344.205017), Vec3(-298.737579, 270.925415, -372.746399), Vec3(-281.217529, 269.755371, -386.661499), Vec3(-249.700241, 268.350647, -367.421631), Vec3(-254.167938, 268.926819, -356.965210), Vec3(-252.324249, 264.074158, -354.758972), Vec3(-268.203247, 273.160522, -339.077515)
    }


    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)

-- For RU  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ResourceManager:RegisterInstanceLoadHandler(Guid('5B274606-C861-411A-B60A-F23B6277F92A'), Guid('FD46D2B0-CA5D-41B5-940C-DA973B8DF3F7'), function(instance)

    local thisInstance = VolumeVectorShapeData(instance)
    thisInstance:MakeWritable()
    thisInstance.points:clear()

    local points = {
        Vec3(-269.604095, 273.160522, -338.444702), Vec3(-266.829407, 273.160522, -335.500305), Vec3(-272.657928, 273.141754, -329.543884), Vec3(-269.514160, 273.088776, -326.351624), Vec3(-282.135651, 272.216400, -313.564026), Vec3(-285.712097, 273.160522, -317.037720), Vec3(-288.564728, 273.071075, -314.203064), Vec3(-288.555817, 271.029083, -309.613495), Vec3(-289.125732, 275.603485, -307.218872), Vec3(-293.011230, 268.962158, -308.792816), Vec3(-292.684357, 269.674530, -304.103363), Vec3(-290.256500, 268.587341, -297.713776), Vec3(-288.097198, 269.918854, -291.309509), Vec3(-285.737823, 269.329773, -288.234222), Vec3(-284.577301, 269.760986, -281.650940), Vec3(-276.452087, 270.566437, -274.827759), Vec3(-269.731171, 272.368835, -272.079041), Vec3(-258.258057, 274.940765, -259.770050), Vec3(-253.979416, 277.256683, -255.045151), Vec3(-253.075027, 277.721344, -249.519318), Vec3(-253.986176, 275.432220, -238.597443), Vec3(-246.239929, 272.937134, -226.857010), Vec3(-239.917801, 272.729675, -220.070541), Vec3(-219.019821, 263.016693, -168.343887), Vec3(-217.434525, 264.291565, -162.600555), Vec3(-216.342957, 262.502258, -142.218430), Vec3(-216.195526, 263.126862, -135.266220), Vec3(-222.093521, 263.936798, -118.596542), Vec3(-236.326294, 263.115051, -108.684479), Vec3(-262.962219, 262.770721, -107.026459), Vec3(-264.043427, 262.797302, -112.026062), Vec3(-261.390198, 262.693604, -118.560196), Vec3(-265.367157, 262.120667, -130.670044), Vec3(-273.168701, 264.052582, -137.871765), Vec3(-273.981384, 263.862579, -141.303711), Vec3(-273.993225, 264.521576, -165.667145), Vec3(-269.271912, 267.391754, -167.246582), Vec3(-269.610260, 268.468781, -177.200760), Vec3(-276.970062, 267.399231, -186.104156), Vec3(-284.591858, 267.029968, -199.828278), Vec3(-292.537445, 269.255707, -213.231720), Vec3(-298.426331, 268.356964, -221.237503), Vec3(-306.107117, 268.833069, -221.373703), Vec3(-306.491852, 267.053314, -246.206863), Vec3(-308.333221, 270.099365, -248.052246), Vec3(-308.697784, 270.194641, -247.689743), Vec3(-323.122894, 268.697876, -262.115051), Vec3(-324.442810, 268.675171, -263.406342), Vec3(-316.992554, 269.127350, -270.812927), Vec3(-329.839935, 267.485626, -283.557068), Vec3(-337.454865, 266.416412, -283.080933), Vec3(-338.302856, 266.691315, -308.937378), Vec3(-335.311462, 268.818115, -308.752960), Vec3(-322.065643, 272.661224, -323.591705), Vec3(-325.808929, 270.830811, -327.387573), Vec3(-321.332275, 271.315063, -332.097260), Vec3(-321.180573, 270.031250, -344.205017), Vec3(-298.737579, 270.925415, -372.746399), Vec3(-281.217529, 269.755371, -386.661499), Vec3(-249.700241, 268.350647, -367.421631), Vec3(-254.167938, 268.926819, -356.965210), Vec3(-252.324249, 264.074158, -354.758972), Vec3(-268.203247, 273.160522, -339.077515)
    }

    for _, point in pairs(points) do
        thisInstance.points:add(point)
    end

end)
