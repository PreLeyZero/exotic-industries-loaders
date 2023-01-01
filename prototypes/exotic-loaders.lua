-- retrun if exotic industries is not present
if not mods["exotic-industries"] then return end

ei_loaders_lib = require("lib/lib-data")

--====================================================================================================
--1x1 LOADERS
--====================================================================================================

data:extend({
    {
        name = "ei_neo-loader",
        type = "item",
        icon = ei_loaders_item_path.."neo-loader.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "belt",
        order = "h[ei_loader]_d",
        place_result = "ei_neo-loader",
        stack_size = 50
    },
    {
        name = "ei_neo-loader",
        type = "recipe",
        category = "crafting",
        energy_required = 2,
        ingredients =
        {
            {"ei_express-loader", 2},
            {"processing-unit", 12},
            {"ei_high-energy-crystal", 4},
        },
        result = "ei_neo-loader",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_neo-loader",
    },
})

-- add entities

local neo_belt = data.raw["transport-belt"]["ei_neo-belt"]
ei_loaders_lib.make_loader("neo", nil, neo_belt.belt_animation_set, neo_belt.speed)

-- set next replacable for express loader
data.raw["loader-1x1"]["ei_express-loader"].next_upgrade = "ei_neo-loader"

table.insert(data.raw["technology"]["ei_neo-logistics"].effects, {
    type = "unlock-recipe",
    recipe = "ei_neo-loader"
})