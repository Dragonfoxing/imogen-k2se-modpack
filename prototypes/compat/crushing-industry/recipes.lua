local ftech = require("__fdsl__.lib.technology")
local frecipe = require("__fdsl__.lib.recipe")

local data_util = require("data-utils")

-- Bullshit our way through re-migrating kr-sand because weird shit happened in this integration.

local sand_migrations = frecipe.find_by_ingredient("kr-sand")

if sand_migrations == nil then
    error("Found no recipes to migrate sand for.")
end

for _, r in pairs(sand_migrations) do
    frecipe.replace_ingredient(r, "kr-sand", "sand")
end

local glass_migrations = frecipe.find_by_ingredient("kr-glass")

if glass_migrations == nil then
    error("Found no k2se glass recipes to modify.")
end

for _, r in pairs(glass_migrations) do
    frecipe.replace_ingredient(r, "kr-glass", "glass")
end

data:extend({
    {
        type = "recipe",
        name = "mixed-concrete",
        localised_name = "Concrete",
        category = "crafting-with-fluid",
        icon = data.raw.item["concrete"].icon,
        enabled = false,
        allow_productivity = false,
        allow_decomposition = false,
        hide_from_signal_gui = false,
        energy_required = 10,
        ingredients = {
            {type="fluid", name="concrete-mix", amount=100}
        },
        results = {{type="item", name="concrete", amount=10}}
    },
    {
        type = "recipe",
        name = "refined-mixed-concrete",
        localised_name = "Refined concrete",
        category = "crafting-with-fluid",
        icon = data.raw.item["refined-concrete"].icon,
        enabled = false,
        allow_productivity = false,
        allow_decomposition = false,
        hide_from_signal_gui = false,
        energy_required = 10,
        ingredients = {
            {type="item", name="kr-iron-beam", amount=5},
            {type="fluid", name="concrete-mix", amount=200}
        },
        results = {{type="item", name="refined-concrete", amount=10}}
    }
})

ftech.add_unlock("concrete", "mixed-concrete")
ftech.add_unlock("concrete", "refined-mixed-concrete")

-- Restore AAI Industry concrete recipe.

frecipe.remove_ingredient("concrete", "concrete-mix")

frecipe.add_ingredient("concrete", {type="item", name="stone-brick", amount=5})
frecipe.add_ingredient("concrete", {type="item", name="sand", amount=10})
frecipe.add_ingredient("concrete", {type="item", name="iron-stick", amount=2})
frecipe.add_ingredient("concrete", {type="fluid", name="water", amount=100})

-- Restore Krastorio 2 refined concrete recipe.

frecipe.remove_ingredient("refined-concrete", "concrete-mix")

frecipe.add_ingredient("refined-concrete", {type="item", name="concrete", amount=20})
frecipe.add_ingredient("refined-concrete", {type="fluid", name="water", amount=100})

-- Change crushed ore recipes to match their K2 counterparts.

frecipe.scale_result("crushed-iron-smelting", "iron-plate", {amount=15})
frecipe.scale_ingredient("crushed-iron-smelting", "crushed-iron-ore", {amount=20})

frecipe.scale_result("crushed-copper-smelting", "copper-plate", {amount=15})
frecipe.scale_ingredient("crushed-copper-smelting", "crushed-copper-ore", {amount=20})