Config                            = {}
Config.DrawDistance               = 02.0

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement      = true
Config.EnableHelicopters          = false
Config.EnableMoneyWash            = false
Config.MaxInService               = -1
Config.Locale                     = 'id'

Config.MissCraft                  = 10 -- %


Config.AuthorizedVehicles = {
    { name = 'faggio',  label = 'vespa' },
}

Config.Blips = {
    
    Blip = {
      -- Pos     = { x = -570.00, y = -400.00, z = 35.00 },
      Sprite  = 52,
      Display = 4,
      Scale   = 1.2,
      Colour  = 5,
    },

}

Config.Zones = {

    Cloakrooms = {
        Pos   = { x = -18.25, y = -1438.65, z = 31.1 },
        Size  = { x = 0.5, y = 0.5, z = 0.5 },
        Color = { r = 255, g = 187, b = 255 },
        Type  = 2,
    },
--[[
    Vaults = {
        Pos   = { x = -17.82, y = -1432.15, z = 31.1 },
        Size  = { x = 0.5, y = 0.5, z = 0.5 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 2,
    },]]

    Fridge = {
        Pos   = { x = -10.15, y = -1430.27, z = 31.1 },
        Size  = { x = 0.5, y = 0.5, z = 0.5 },
        Color = { r = 255, g = 0, b = 0 },
        Type  = 2,
    },
	
	Cook = {
        Pos   = { x = -10.14, y = -1428.41, z = 31.1 },
        Size  = { x = 0.5, y = 0.5, z = 0.5 },
        Color = { r = 0, g = 200, b = 220 },
        Type  = 2,
    },
	
	Vehicles = {
        Pos          = { x = -23.34, y = -1427.51, z = 30.66 },
        SpawnPoint   = { x = -25.46, y = -1428.08, z = 30.66, h = 179.72 },
        Size         = { x = 0.5, y = 0.5, z = 0.5 },
        Color        = { r = 255, g = 0, b = 0 },
        Type         = 2,
        Heading      = 207.43,
    },

    VehicleDeleters = {
        Pos   = { x = -25.46, y = -1428.08, z = 29.66 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 0, b = 0 },
        Type  = 1,
    },

--[[
    Helicopters = {
        Pos          = { x = 137.177, y = -1278.757, z = 28.371 },
        SpawnPoint   = { x = 138.436, y = -1263.095, z = 28.626 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 207.43,
    },

    HelicopterDeleters = {
        Pos   = { x = 133.203, y = -1265.573, z = 28.396 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },
]]--

    BossActions = {
        Pos   = { x = 94.951, y = -1294.021, z = 28.268 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 1,
    },

-----------------------
-------- SHOPS --------

    Flacons = {
        Pos   = { x = -2955.242, y = 385.897, z = 14.041 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 0, b = 0 },
        Type  = 23,
        Items = {
            { name = 'jager',      label = _U('jager'),   price = 3 },
            { name = 'vodka',      label = _U('vodka'),   price = 4 },
            { name = 'rhum',       label = _U('rhum'),    price = 2 },
            { name = 'whisky',     label = _U('whisky'),  price = 7 },
            { name = 'tequila',    label = _U('tequila'), price = 2 },
            { name = 'martini',    label = _U('martini'), price = 5 }
        },
    },

    NoAlcool = {
        Pos   = { x = 178.028, y = 307.467, z = 104.392 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 110, b = 0 },
        Type  = 23,
        Items = {
            { name = 'soda',        label = _U('soda'),     price = 4 },
            { name = 'jusfruit',    label = _U('jusfruit'), price = 3 },
            { name = 'icetea',      label = _U('icetea'),   price = 4 },
            { name = 'energy',      label = _U('energy'),   price = 7 },
            { name = 'drpepper',    label = _U('drpepper'), price = 2 },
            { name = 'limonade',    label = _U('limonade'), price = 1 }
        },
    },

    Apero = {
        Pos   = { x = 98.675, y = -1809.498, z = 26.095 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 142, g = 125, b = 76 },
        Type  = 23,
        Items = {
            { name = 'bolcacahuetes',   label = _U('bolcacahuetes'),    price = 7 },
            { name = 'bolnoixcajou',    label = _U('bolnoixcajou'),     price = 10 },
            { name = 'bolpistache',     label = _U('bolpistache'),      price = 15 },
            { name = 'bolchips',        label = _U('bolchips'),         price = 5 },
            { name = 'saucisson',       label = _U('saucisson'),        price = 25 },
            { name = 'grapperaisin',    label = _U('grapperaisin'),     price = 15 }
        },
    },

    Ice = {
        Pos   = { x = 26.979, y = -1343.457, z = 28.517 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 255, g = 255, b = 255 },
        Type  = 23,
        Items = {
            { name = 'ice',     label = _U('ice'),      price = 1 },
            { name = 'menthe',  label = _U('menthe'),   price = 2 }
        },
    },

}


-----------------------
----- TELEPORTERS -----

Config.TeleportZones = {
  EnterBuilding = {
    Pos       = { x = 132.608, y = -1293.978, z = 28.269 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
    Marker    = 1,
    Hint      = _U('e_to_enter_1'),
    Teleport  = { x = 126.742, y = -1278.386, z = 28.569 }
  },

  ExitBuilding = {
    Pos       = { x = 132.517, y = -1290.901, z = 28.269 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
    Marker    = 1,
    Hint      = _U('e_to_exit_1'),
    Teleport  = { x = 131.175, y = -1295.598, z = 28.569 },
  },

--[[
  EnterHeliport = {
    Pos       = { x = 126.843, y = -729.012, z = 241.201 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_enter_2),
    Teleport  = { x = -65.944, y = -818.589, z =  320.801 }
  },

  ExitHeliport = {
    Pos       = { x = -67.236, y = -821.702, z = 320.401 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_exit_2'),
    Teleport  = { x = 124.164, y = -728.231, z = 241.801 },
  },
]]--
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
  barman_outfit = {
    male = {
        ['tshirt_1'] = 57,  ['tshirt_2'] = 0,
        ['torso_1'] = 83,   ['torso_2'] = 4,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 11,
        ['pants_1'] = 7,   ['pants_2'] = 2,
        ['shoes_1'] = 1,   ['shoes_2'] = 1,
        ['chain_1'] = 0,  ['chain_2'] = 0
    },
    female = {
        ['tshirt_1'] = 34,   ['tshirt_2'] = 0,
        ['torso_1'] = 76,    ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 2,
        ['pants_1'] = 3,   ['pants_2'] = 0,
        ['shoes_1'] = 1,    ['shoes_2'] = 1,
        ['chain_1'] = 0,    ['chain_2'] = 2
    }
  }
}
