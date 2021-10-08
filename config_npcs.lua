Config.NPCsDefaultType = 4
Config.DrawRange = 6
Config.NPCS = {
    -- [[ SHOP NPCs ]]
	ExampleShop = {
        model = "a_m_y_bevhills_02",
        titel = "",--"Verkäufer",
        subtitel = "",--"Welcome by ExampleShop",
		pos = {
			{x = 1134.20,  y = -983.00,  z = 45.415, h = 280.70,}, --{x,y,z,h,name(optional),type(optional),model(optional),titel(optional),subtitel(optional)},
		}
	},

    -- [[ OTHER NPCs ]]
	DMVSchool = {
        model = "a_m_y_bevhills_02",
        DrawRange = 10,
        titel = "DMVSchool",--"Verkäufer",
        subtitel = "Everyone can drive!",--"Welcome by ExampleShop",
		pos = {
			{x = -809.2852,  y = -1345.6404,  z = 4.1500, h = 232.55,}, --{x,y,z,h,name(optional),type(optional),model(optional),titel(optional),subtitel(optional)},
		}
	},

}
