
local S = farming.translate

-- ginger
minetest.register_craftitem("farming:ginger", {
	description = S("Ginger"),
	inventory_image = "farming_ginger.png",
	groups = {compostability = 48, seed = 2, food_ginger = 1, flammable = 2},
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:ginger_1")
	end,
	on_use = minetest.item_eat(1)
})

-- ginger definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_ginger_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop = "",
	waving = 1,
	selection_box = farming.select,
	groups = {
		handy = 1, snappy = 3, flammable = 2, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = farming.sounds.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("farming:ginger_1", table.copy(def))

-- stage 2
def.tiles = {"farming_ginger_2.png"}
minetest.register_node("farming:ginger_2", table.copy(def))

-- stage 3
def.tiles = {"farming_ginger_3.png"}
def.drop = {
	items = {
		{items = {"farming:ginger"}, rarity = 1},
		{items = {"farming:ginger"}, rarity = 3}
	}
}
minetest.register_node("farming:ginger_3", table.copy(def))

-- stage 4 (final)
def.tiles = {"farming_ginger_4.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"farming:ginger 2"}, rarity = 1},
		{items = {"farming:ginger 2"}, rarity = 2}
	}
}
minetest.register_node("farming:ginger_4", table.copy(def))

-- add to registered_plants
farming.registered_plants["farming:ginger"] = {
	crop = "farming:ginger",
	seed = "farming:ginger",
	minlight = 5,
	maxlight = minetest.LIGHT_MAX,
	steps = 4
}

-- mapgen
minetest.register_decoration({
	name = "farming:ginger_4",
	deco_type = "simple",
	place_on = {"default:dirt_with_rainforest_litter", "mcl_core:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.ginger,
		spread = {x = 100, y = 100, z = 100},
		seed = 999,
		octaves = 3,
		persist = 0.6
	},
	y_max = 80,
	y_min = 1,
	decoration = "farming:ginger_3",
	param2 = 3
})
