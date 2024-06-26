local S = minetest.get_translator(minetest.get_current_modname())

-- Wooden tapestry top
minetest.register_node("curtains:tapestry_top", {
        drawtype = "nodebox",
        description = S"Wooden Curtain Rod",
        tiles = {"default_wood.png"},
        sunlight_propagates = true,
        groups = {flammable=3,choppy=2,oddly_breakable_by_hand=1},
--        sounds = default.node_sound_defaults(),
        paramtype = "light",
        paramtype2 = "facedir",
        node_box = {
                type = "fixed",
                fixed = {-0.6,-0.5,0.375,0.6,-0.375,0.5},
        },
        selection_box = {
                type = "fixed",
                fixed = {-0.6,-0.5,0.375,0.6,-0.375,0.5},
        },
})

minetest.register_craft({
        type = "shapeless",
        output = "curtains:tapestry_top",
        recipe = {"default:stick"},
})

minetest.register_craft({
        type = "shapeless",
        recipe = {"curtains:tapestry_top"},
        output = "default:stick",
})

-- Curtains
local curtain_colors = { --name, color, colorize(hex or color name:intensity(1-255))
{S'Black', 'black', '#26231f:200'},
{S'Blue', 'blue', '#284965:200'},
{S'Brown', 'brown', '#65493f:200'},
{S'Cyan', 'cyan', '#3a8d94:200'},
{S'Dark Green', 'dark_green', '#485831:200'},
{S'Dark Grey', 'dark_grey', '#464342:200'},
{S'Green', 'green', '#739251:200'},
{S'Grey', 'grey', '#85817e:200'},
{S'Magenta', 'magenta', '#b74679:200'},
{S'Orange', 'orange', '#bb6c3e:200'},
{S'Pink', 'pink', '#a2655f:200'},
{S'Red', 'red', '#893734:200'},
{S'Violet', 'violet', '#5e3170:200'},
{S'White', 'white', '#bcb2a6:200'},
{S'Yellow', 'yellow', '#c0a342:200'},
}

for i in pairs(curtain_colors) do
		local name = curtain_colors[i][1]
		local color = curtain_colors[i][2]
		local hex = curtain_colors[i][3]
		
		minetest.register_node("curtains:curtain_"..color, {
		description = name..S" Curtain",
		walkable = false,
		tiles = {"homedecor_curtain.png^[colorize:"..hex},
		inventory_image = "homedecor_curtain.png^[colorize:"..hex,
		wield_image = "homedecor_curtain.png^[colorize:"..hex,
		drawtype = "signlike",
		paramtype2 = "colorwallmounted",
		groups = {dig_immediate=3, flammable=3},
		selection_box = {type="wallmounted"},
		on_rightclick = function(pos, node, _, itemstack)
			minetest.set_node(pos, {name="curtains:curtain_open_"..color, param2=node.param2})
			return itemstack
		end
	})

	minetest.register_node("curtains:curtain_open_"..color, {
		tiles = {"homedecor_curtain_open.png^[colorize:"..hex,},
		drawtype = "signlike",
		paramtype2 = "colorwallmounted",
		walkable = false,
		groups = {dig_immediate=3, flammable=3, not_in_creative_inventory=1},
		selection_box = {type="wallmounted"},
		drop = "curtains:curtain_"..color,
		on_rightclick = function(pos, node, _, itemstack)
			minetest.set_node(pos, {name="curtains:curtain_"..color, param2=node.param2})
			return itemstack
		end
	})

	minetest.register_craft({
		output = "curtains:curtain_"..color.." 1",
		recipe = {
			{"", "wool:"..color, ""}
		}
	})
end
