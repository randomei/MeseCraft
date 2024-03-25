
local S = farming.translate
local a = farming.recipe_items

-- sunflower
minetest.register_craftitem("farming:sunflower", {
	description = S("Sunflower"),
	inventory_image = "farming_sunflower.png",
	groups = {flammable = 2}
})

-- sunflower seeds
minetest.register_node("farming:seed_sunflower", {
	description = S("Sunflower Seeds"),
	tiles = {"farming_sunflower_seeds.png"},
	inventory_image = "farming_sunflower_seeds.png",
	wield_image = "farming_sunflower_seeds.png",
	drawtype = "signlike",
	groups = {
		compostability = 48, seed = 1, snappy = 3, attached_node = 1, growing = 1,
		food_sunflower_seeds = 1, flammable = 2
	},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	next_plant = "farming:sunflower_1",
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "farming:seed_sunflower")
	end,
	on_timer = function(pos, elapsed)
		minetest.set_node(pos, {name = "farming:sunflower_1", param2 = 1})
	end
})

minetest.register_alias("farming:sunflower_seeds", "farming:seed_sunflower")

minetest.register_craft({
	output = "farming:seed_sunflower 5",
	recipe = {{"farming:sunflower"}}
})

-- sunflower seeds (toasted)
minetest.register_craftitem("farming:sunflower_seeds_toasted", {
	description = S("Toasted Sunflower Seeds"),
	inventory_image = "farming_sunflower_seeds_toasted.png",
	groups = {food_sunflower_seeds_toasted = 1, flammable = 2, compostability = 65},
	on_use = minetest.item_eat(1)
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming:sunflower_seeds_toasted",
	recipe = "farming:seed_sunflower"
})

-- sunflower oil
minetest.register_node("farming:sunflower_oil", {
	description = S("Bottle of Sunflower Oil"),
	drawtype = "plantlike",
	tiles = {"farming_sunflower_oil.png"},
	inventory_image = "farming_sunflower_oil.png",
	wield_image = "farming_sunflower_oil.png",
	paramtype = "light",
	is_ground_content = false,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.25, -0.5, -0.25, 0.25, 0.3, 0.25}
	},
	groups = {
		food_oil = 1, vessel = 1, dig_immediate = 3, attached_node = 1,
		flammable = 2, compostability = 65
	},
	sounds = farming.sounds.node_sound_glass_defaults()
})

minetest.register_craft( {
	output = "farming:sunflower_oil",
	recipe = {
		{"group:food_sunflower_seeds", "group:food_sunflower_seeds", "group:food_sunflower_seeds"},
		{"group:food_sunflower_seeds", "group:food_sunflower_seeds", "group:food_sunflower_seeds"},
		{"group:food_sunflower_seeds", a.glass_bottle, "group:food_sunflower_seeds"}
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "farming:sunflower_oil",
	burntime = 30,
	replacements = {{"farming:sunflower_oil", a.glass_bottle}}
})

-- sunflower seed bread
minetest.register_craftitem("farming:sunflower_bread", {
	description = S("Sunflower Seed Bread"),
	inventory_image = "farming_sunflower_bread.png",
	on_use = minetest.item_eat(8),
	groups = {food_bread = 1, flammable = 2}
})

minetest.register_craft({
	output = "farming:sunflower_bread",
	recipe = {
		{
			"group:food_sunflower_seeds_toasted",
			"group:food_bread",
			"group:food_sunflower_seeds_toasted"
		}
	}
})

-- sunflower definition
local def = {
	drawtype = "plantlike",
	tiles = {"farming_sunflower_1.png"},
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
minetest.register_node("farming:sunflower_1", table.copy(def))

-- stage 2
def.tiles = {"farming_sunflower_2.png"}
minetest.register_node("farming:sunflower_2", table.copy(def))

-- stage 3
def.tiles = {"farming_sunflower_3.png"}
minetest.register_node("farming:sunflower_3", table.copy(def))

-- stage 4
def.tiles = {"farming_sunflower_4.png"}
minetest.register_node("farming:sunflower_4", table.copy(def))

-- stage 5
def.tiles = {"farming_sunflower_5.png"}
minetest.register_node("farming:sunflower_5", table.copy(def))

-- stage 6
def.tiles = {"farming_sunflower_6.png"}
def.visual_scale = 1.9
minetest.register_node("farming:sunflower_6", table.copy(def))

-- stage 7
def.tiles = {"farming_sunflower_7.png"}
minetest.register_node("farming:sunflower_7", table.copy(def))

-- stage 8 (final)
def.tiles = {"farming_sunflower_8.png"}
def.groups.growing = nil
def.selection_box = farming.select_final
def.drop = {
	items = {
		{items = {"farming:sunflower"}, rarity = 1},
		{items = {"farming:sunflower"}, rarity = 6}
	}
}
minetest.register_node("farming:sunflower_8", table.copy(def))

-- add to registered_plants
farming.registered_plants["farming:sunflower"] = {
	crop = "farming:sunflower",
	seed = "farming:seed_sunflower",
	minlight = 14,
	maxlight = farming.max_light,
	steps = 8
}

-- mapgen
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dirt_with_grass", "mcl_core:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = farming.sunflower,
		spread = {x = 100, y = 100, z = 100},
		seed = 254,
		octaves = 3,
		persist = 0.6
	},
	y_min = 10,
	y_max = 40,
	decoration = "farming:sunflower_8"
})
