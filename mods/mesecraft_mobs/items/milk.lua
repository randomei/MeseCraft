local S = minetest.get_translator(minetest.get_current_modname())

-- Bucket of Milk
minetest.register_craftitem("mesecraft_mobs:milk_bucket", {
        description = S"Bucket of Milk",
        inventory_image = "mesecraft_mobs_items_milk_bucket.png",
        stack_max = 1,
        on_use = minetest.item_eat(8, 'bucket:bucket_empty'),
        groups = {food_milk = 1, flammable = 3},
})

-- Glass of Milk
minetest.register_craftitem("mesecraft_mobs:milk_glass", {
        description = S"Glass of Milk",
        inventory_image = "mesecraft_mobs_items_milk_glass.png",
        on_use = minetest.item_eat(2, 'vessels:drinking_glass'),
        groups = {food_milk_glass = 1, flammable = 3, vessel = 1},
})

-- 4 glasses + milk bucket --> 4 milk glasses.
minetest.register_craft({
        type = "shapeless",
        output = "mesecraft_mobs:milk_glass 4",
        recipe = {
                'vessels:drinking_glass', 'vessels:drinking_glass',
                'vessels:drinking_glass', 'vessels:drinking_glass',
                'mesecraft_mobs:milk_bucket'
        },
        replacements = { {"mesecraft_mobs:milk_bucket", "bucket:bucket_empty"} }
})

-- Glasses of Milk --> Milk Bucket.
minetest.register_craft({
        type = "shapeless",
        output = "mesecraft_mobs:milk_bucket",
        recipe = {
                'mesecraft_mobs:milk_glass', 'mesecraft_mobs:milk_glass',
                'mesecraft_mobs:milk_glass', 'mesecraft_mobs:milk_glass',
                'bucket:bucket_empty'
        },
        replacements = { {"mesecraft_mobs:milk_glass", "vessels:drinking_glass 4"} }
})

