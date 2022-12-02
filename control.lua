--====================================================================================================
--REQUIREMENTS
--====================================================================================================

local ei_loaders_lib = require("lib/lib-control")

--====================================================================================================
--EVENTS
--====================================================================================================

--INIT
------------------------------------------------------------------------------------------------------
script.on_init(function()
end)

--ENTITY RELATED
------------------------------------------------------------------------------------------------------

script.on_event({
    defines.events.on_built_entity,
    -- defines.events.on_robot_built_entity,
    -- defines.events.script_raised_built,
    -- defines.events.script_raised_revive,
    -- defines.events.on_entity_cloned
    }, function(e)
    on_built_entity(e)
end)

--====================================================================================================
--HANDLERS
--====================================================================================================


function on_built_entity(e)
    if not e["created_entity"] and e["entity"] then
        e["created_entity"] = e["entity"]
    end

    if not e["created_entity"] then 
        return
    end

    ei_loaders_lib.on_built_entity(e)
end