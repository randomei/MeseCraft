local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_craftitem("mesecraft_mobs:bone", {
                description = S"Bone",
                inventory_image = "mesecraft_mobs_items_bone.png"
        })
if minetest.get_modpath("bones") then
	minetest.register_craft({
		output = "mesecraft_mobs:bone 2",
               	recipe = {{ "mesecraft_bones:bones" }},
       	})
end


