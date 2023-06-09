----------------------------------------------------------------------------------
Config = {}
----------------------------------------------------------------------------------
Config.Locale = "de"
----------------------------------------------------------------------------------
Config.MarkerType = 1
Config.MarkerColor = { r = 0, g = 255, b = 0, a = 100 }
Config.MarkerSize = { x = 1.5, y = 1.5, z = 1.0 }
----------------------------------------------------------------------------------
Config.Animation = {
    Time = 2500
}
----------------------------------------------------------------------------------
Config.BlipSprite = 59
Config.BlipColor = 2
Config.BlipScale = 0.8
----------------------------------------------------------------------------------
Config.Locations = {
    vector3(26.01, -1347.24, 29.5),
    vector3(373.875, 325.896, 102.56),
    vector3(2557.45, 382.28, 107.62),
    vector3(-3038.93, 585.95, 6.09),
    vector3(-3241.92, 1001.46, 11.83),
    vector3(547.43, 2671.71, 41.15),
    vector3(1961.46, 3740.672, 31.34),
    vector3(2678.91, 3280.67, 54.24),
    vector3(1729.21, 6414.13, 34.03),
    vector3(1135.80, -982.28, 45.41),
    vector3(-1222.91, -906.98, 11.32),
    vector3(-1487.55, -379.10, 39.16),
    vector3(-2968.24, 390.91, 14.04),
    vector3(1166.02, 2708.93, 37.15),
    vector3(1392.56, 3604.68, 33.98),
    vector3(-48.51, -1757.51, 28.42),
    vector3(1163.37, -323.80, 68.20),
    vector3(-707.50, -914.26, 18.21),
    vector3(-1820.52, 792.51, 137.11),
    vector3(1698.38, 4924.40, 41.06),
}
----------------------------------------------------------------------------------
Config.Items = {
    { ItemValue = "apfel", ItemLabel = "Apfel", Price = "5" },
    { ItemValue = "bproof", ItemLabel = "Schutzweste", Price = "75"},
    { ItemValue = "medikit", ItemLabel = "Verbandskasten", Price = "100"},
    { ItemValue = "bandage", ItemLabel = "Verband", Price = "25"},
    { ItemValue = "clip", ItemLabel = "Munition", Price = "250"},
    { ItemValue = "bread", ItemLabel = "Brot", Price = "3"},
    { ItemValue = "water", ItemLabel = "Wasser", Price = "2"}
}
----------------------------------------------------------------------------------
Translation = {
    ["de"] = {
        ["blip_label"] = "Supermarkt",
        ["press_menu"] = "Drücke ~INPUT_CONTEXT~ um den ~g~Supermarkt~s~ zu öffnen",
        ["bought"] = "~g~Erfolgreich bezahlt!",
        ["no_money"] = "~r~Du hast nicht genug Geld!",
        ["thanks"] = "~o~Vielen Dank für deinen Einkauf! :)",

        ["menu_title"] = "Supermarkt",
        ["menu_subtitle"] = "~y~Du suchst es, wir finden es!"
    },

    ["en"] = {
        ["blip_label"] = "Shop",
        ["press_menu"] = "Press ~INPUT_CONTEXT~ to open the ~g~shop~s~",
        ["bought"] = "~g~Successfully paid!",
        ["no_money"] = "~r~You don´t have enough money!",
        ["thanks"] = "~o~Thank you for your purchase! :)",

        ["menu_title"] = "Shop",
        ["menu_subtitle"] = "~y~You look for it, we find it!"
    }
}
----------------------------------------------------------------------------------