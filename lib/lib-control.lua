local ei_loaders_lib = {}

--====================================================================================================
--DATA VALUES
--====================================================================================================

local loaders = {
    ["ei_loader"] = true,
    ["ei_fast-loader"] = true,
    ["ei_express-loader"] = true,
}

local belt_like = {
    "transport-belt",
    "splitter",
    "underground-belt",
    "loader-1x1", 
    "loader-1x2",
}

local container_like = {
    "container",
    "logistic-container",
    "assembling-machine",
    "furnace",
    "lab",
    "rocket-silo",
}

--====================================================================================================
--UTIL FUNCTIONS
--====================================================================================================

function ei_loaders_lib.flip_direction(direction)
    if direction == defines.direction.north then
        return defines.direction.south
    elseif direction == defines.direction.south then
        return defines.direction.north
    elseif direction == defines.direction.east then
        return defines.direction.west
    elseif direction == defines.direction.west then
        return defines.direction.east
    end
end


function ei_loaders_lib.get_positions(entity)
    -- get the position of the entity and the direction it is facing
    -- return top and down position

    -- down [->] top

    -- or

    -- down
    -- [V]
    -- top

    local top = entity.position
    local down = entity.position
    local direction = entity.direction

    if direction == defines.direction.north then
        top.y = top.y - 1
        down.y = down.y + 1
    elseif direction == defines.direction.east then
        top.x = top.x + 1
        down.x = down.x - 1
    elseif direction == defines.direction.south then
        top.y = top.y + 1
        down.y = down.y - 1
    elseif direction == defines.direction.west then
        top.x = top.x - 1
        down.x = down.x + 1
    end

    return top, down
end


function ei_loaders_lib.get_loader_output_input(top, down, entity)
    -- fix position of the output and input type of the loader
    -- output: output_pos = top, input_pos = down
    -- input: output_pos = down, input_pos = top
   
    local type = entity.loader_type

    if type == "output" then
        return down, top
    elseif type == "input" then
        return top, down
    end
end


function ei_loaders_lib.flip_loader_type(loader)
    if loader.loader_type == "input" then
        loader.loader_type = "output"
    elseif loader.loader_type == "output" then
        loader.loader_type = "input"
    end
end


--====================================================================================================
--SNAPPING LOGIC
--====================================================================================================


function ei_loaders_lib.snap_input(loader, mode)
    -- check for belt like and container like
    local top, down = ei_loaders_lib.get_positions(loader)
    local _, input_pos = ei_loaders_lib.get_loader_output_input(top, down, loader)

    if mode == "container_like" then
        -- for container like
        local container_like = loader.surface.find_entities_filtered{
            position = input_pos,
            type = container_like,
            force = loader.force,
        }

        if #container_like > 0 then
            -- here the belt part of the loader is always facing to the container
            -- like, therfore we need to flip the entire loader
            loader.direction = ei_loaders_lib.flip_direction(loader.direction)
        end
    end
    
    if mode == "belt_like" then
        -- for belt like
        local belt_like = loader.surface.find_entities_filtered{
            position = input_pos,
            type = belt_like,
            force = loader.force,
        }

        if #belt_like > 0 then
            if not belt_like[1].valid then
                return
            end

            -- get  direction of loader and belt_like
            local belt_direction = belt_like[1].direction
            local loader_direction = loader.direction

            -- only need to flip loader if loader type is wrong way
            if belt_direction == ei_loaders_lib.flip_direction(loader_direction) then
                ei_loaders_lib.flip_loader_type(loader)
            end
        end
    end
end






--====================================================================================================
--SNAPPERS AND HANDLER
--====================================================================================================

function ei_loaders_lib.on_built_entity(e)

    if e["created_entity"].name == "ei_loader" then
        ei_loaders_lib.snap_loader(e["created_entity"])
    end

end


function ei_loaders_lib.snap_loader(loader)
    if not loader.valid then
        return
    end

    -- snap loader to belt or conatiner like entities

    -- first treat input position
    ei_loaders_lib.snap_input(loader, "container_like")
    ei_loaders_lib.snap_input(loader, "belt_like")
end





return ei_loaders_lib


