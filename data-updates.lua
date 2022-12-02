ei_loaders_lib = require("lib/lib-data")

--====================================================================================================
--CONTENT UPDATES
--====================================================================================================

-- add to recipes to techs
table.insert(data.raw["technology"]["logistics"].effects, {
    type = "unlock-recipe",
    recipe = "ei_loader"
})

table.insert(data.raw["technology"]["logistics-2"].effects, {
    type = "unlock-recipe",
    recipe = "ei_fast-loader"
})

table.insert(data.raw["technology"]["logistics-3"].effects, {
    type = "unlock-recipe",
    recipe = "ei_express-loader"
})