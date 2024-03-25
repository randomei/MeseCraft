local S = minetest.get_translator(minetest.get_current_modname())

local pillar = {
	{"stonebrick", S"Stonebrick", "default_stone_brick", "default:stonebrick"},
	{"stone", S"Stone", "default_stone", "default:stone"},
	{"sandstone", S"Sandstone", "default_sandstone", "default:sandstone"},
	{"desertstone", S"Desert Stone", "default_desert_stone", "default:desert_stone"},
	{"obsidian", S"Obsidian", "default_obsidian", "default:obsidian"},
	{"dungeonstone", S"Dungeon Stone", "castle_dungeon_stone", "castle:dungeon_stone"},
}

if minetest.get_modpath("ethereal") then
	pillar[7] = {"mushroomtrunk", S"Mushroom Trunk", "mushroom_trunk", "ethereal:mushroom_trunk"}
	pillar[8] = {"icebrick", S"Ice Brick", "brick_ice", "ethereal:icebrick"}
end

local grp = {cracky = 3}

for n = 1, #pillar do

	minetest.register_node("castle:pillars_"..pillar[n][1].."_bottom", {
		drawtype = "nodebox",
		description = pillar[n][2]..S" Pillar Base",
		tiles = {pillar[n][3]..".png"},
		groups = grp,
		sounds = default.node_sound_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.500000,-0.500000,-0.500000,0.500000,-0.375000,0.500000},
				{-0.375000,-0.375000,-0.375000,0.375000,-0.125000,0.375000},
				{-0.250000,-0.125000,-0.250000,0.250000,0.500000,0.250000}, 
			},
		},
	})

	minetest.register_craft({
		output = "castle:pillars_"..pillar[n][1].."_bottom 4",
		recipe = {
		{"",pillar[n][4],""},
		{"",pillar[n][4],""},
		{pillar[n][4],pillar[n][4],pillar[n][4]} },
	})

	minetest.register_node("castle:pillars_"..pillar[n][1].."_top", {
		drawtype = "nodebox",
		description = pillar[n][2]..S" Pillar Top",
		tiles = {pillar[n][3]..".png"},
		groups = grp,
		sounds = default.node_sound_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.500000,0.312500,-0.500000,0.500000,0.500000,0.500000}, 
				{-0.375000,0.062500,-0.375000,0.375000,0.312500,0.375000}, 
				{-0.250000,-0.500000,-0.250000,0.250000,0.062500,0.250000},
			},
		},
	})

	minetest.register_craft({
		output = "castle:pillars_"..pillar[n][1].."_top 4",
		recipe = {
		{pillar[n][4],pillar[n][4],pillar[n][4]},
		{"",pillar[n][4],""},
		{"",pillar[n][4],""} },
	})

	minetest.register_node("castle:pillars_"..pillar[n][1].."_middle", {
		drawtype = "nodebox",
		description = pillar[n][2]..S" Pillar Middle",
		tiles = {pillar[n][3]..".png"},
		groups = grp,
		sounds = default.node_sound_defaults(),
		paramtype = "light",
		paramtype2 = "facedir",
		node_box = {
			type = "fixed",
			fixed = {
				{-0.250000,-0.500000,-0.250000,0.250000,0.500000,0.250000},
			},
		},
	})

	minetest.register_craft({
		output = "castle:pillars_"..pillar[n][1].."_middle 4",
		recipe = {
		{pillar[n][4],pillar[n][4]},
		{pillar[n][4],pillar[n][4]},
		{pillar[n][4],pillar[n][4]} },
	})

	grp = {cracky = 3, not_in_craft_guide = 0}
end
