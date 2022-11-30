ei_loaders_lib = require("lib/lib")

--====================================================================================================
--1x1 LOADERS
--====================================================================================================

data:extend({
    {
        name = "ei_loader",
        type = "item",
        icon = ei_loaders_item_path.."loader.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "inserter",
        order = "z-b",
        place_result = "ei_loader",
        stack_size = 50
    },
    {
        name = "ei_fast-loader",
        type = "item",
        icon = ei_loaders_item_path.."fast-loader.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "inserter",
        order = "z-b",
        place_result = "ei_fast-loader",
        stack_size = 50
    },
    {
        name = "ei_express-loader",
        type = "item",
        icon = ei_loaders_item_path.."express-loader.png",
        icon_size = 64,
        icon_mipmaps = 4,
        subgroup = "inserter",
        order = "z-b",
        place_result = "ei_express-loader",
        stack_size = 50
    },
    {
        name = "ei_loader",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {"stack-inserter", 4},
            {"low-density-structure", 6},
        },
        result = "ei_loader",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_loader",
    },
    {
        name = "ei_fast-loader",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {"stack-inserter", 4},
            {"low-density-structure", 6},
        },
        result = "ei_fast-loader",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_fast-loader",
    },
    {
        name = "ei_express-loader",
        type = "recipe",
        category = "crafting",
        energy_required = 4,
        ingredients =
        {
            {"stack-inserter", 4},
            {"low-density-structure", 6},
        },
        result = "ei_express-loader",
        result_count = 1,
        enabled = false,
        always_show_made_in = true,
        main_product = "ei_express-loader",
    },
})

-- add entities

local belt = data.raw["transport-belt"]["transport-belt"]
local fast_belt = data.raw["transport-belt"]["fast-transport-belt"]
local express_belt = data.raw["transport-belt"]["express-transport-belt"]

ei_loaders_lib.make_loader(nil, "ei_fast-loader", belt.belt_animation_set, belt.speed)
ei_loaders_lib.make_loader("fast", "ei_express-loader", fast_belt.belt_animation_set, fast_belt.speed)
ei_loaders_lib.make_loader("express", nil, express_belt.belt_animation_set, express_belt.speed)