local S = minetest.get_translator(minetest.get_current_modname())

bweapons.register_ammo({
    name = "bweapons_bows_pack:arrow",
    description = S"Arrow",
    texture = "bweapons_bows_pack_arrow.png",
    recipe = {
        {
            {'', 'default:steel_ingot', ''},
            {'', 'default:stick', ''},
            {'', 'default:paper', ''},
        },
    },
    amount = 8,
})

bweapons.register_ammo({
    name = "bweapons_bows_pack:bolt",
    description = S"Bolt",
    texture = "bweapons_bows_pack_bolt.png",
    recipe = {
        {
            {'', 'default:steel_ingot', ''},
            {'', 'default:steel_ingot', ''},
            {'', 'default:paper', ''},
        },
    },
    amount = 8,
})
