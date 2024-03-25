local S = minetest.get_translator(minetest.get_current_modname())

-- leather (from mobs_redo)
minetest.register_craftitem("mesecraft_mobs:leather", {
	description = S"Leather",
	inventory_image = "mesecraft_mobs_items_leather.png",
	groups = {flammable = 2, leather = 1}
})

minetest.register_craft({
	type = "fuel",
	recipe = "mesecraft_mobs:leather",
	burntime = 4
})
