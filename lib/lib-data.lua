local ei_loaders_lib = {}

--====================================================================================================
--BASE PROTOTYPES
--====================================================================================================

local loader = {
    name = "ei_loader",
    type = "loader-1x1",
    icon = ei_loaders_item_path.."loader.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation", "fast-replaceable-no-build-while-moving"},
    minable = {
        mining_time = 0.2,
        result = "ei_loader"
    },
    max_health = 300,
    corpse = "small-remnants",
    collision_box = {{-0.4, -0.45}, {0.4, 0.45}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.4, -0.4}, {0.4, 0.4}},
    animation_speed_coefficient = 32,
    belt_animation_set = data.raw["transport-belt"]["transport-belt"].belt_animation_set,
    container_distance = 0.75,
    belt_length = 0.5,
    fast_replaceable_group = "transport-belt",
    filter_count = 1,
    -- next_upgrade = "ei_fast-loader",
    speed = data.raw["transport-belt"]["transport-belt"].speed,
    structure = {
        direction_in = {
            sheet = {
                filename = ei_loaders_entity_path.."loader.png",
                priority = "extra-high",
                shift = {0.15625, 0.0703125},
                width = 106*2,
                height = 85*2,
                y = 85*2,
                scale = 0.25
            }
        },
        direction_out = {
            sheet = {
                filename = ei_loaders_entity_path.."loader.png",
                priority = "extra-high",
                shift = {0.15625, 0.0703125},
                width = 106*2,
                height = 85*2,
                scale = 0.25
            }
        }
    },
}

--====================================================================================================
--UTIL FUNCTIONS
--====================================================================================================

function ei_loaders_lib.make_loader(tier, next_upgrade, belt_animation_set, speed)
    local loader = table.deepcopy(loader)

    if tier then
        tier = tier .. "-"
    else
        tier = ""
    end

    if next_upgrade then
        loader.next_upgrade = next_upgrade
    end
    
    loader.name = "ei_"..tier.."loader"
    loader.icon = ei_loaders_item_path..tier.."loader.png"
    loader.minable.result = "ei_"..tier.."loader"
    loader.speed = speed
    loader.belt_animation_set = belt_animation_set

    loader.structure.direction_in.sheet.filename = ei_loaders_entity_path..tier.."loader.png"
    loader.structure.direction_out.sheet.filename = ei_loaders_entity_path..tier.."loader.png"

    data:extend({loader})
end

return ei_loaders_lib


