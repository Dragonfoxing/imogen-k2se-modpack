local crushing_lib = require("__Krastorio2__/prototypes/libraries/crushing")

local ftech = require("__fdsl__.lib.technology")
local frecipe = require("__fdsl__.lib.recipe")

local data_util = require("data-utils")

-- this is required to stop krastorio2 from bitching about concrete mix.

crushing_lib.make_recipe(data.raw.item["concrete"], {
    category = "kr-crushing",
    hidden = true,
    hide_from_player_crafting = true,
    results = {
        { type = "item", name = "stone-brick", amount_min = 0, amount_max = 2 },
        { type = "item", name = "sand", amount_min = 3, amount_max = 8 }
    }
})

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

local crushed_iron_smelt = frecipe.find("crushed-iron-smelting")
crushed_iron_smelt.energy_required = 48

frecipe.scale_result("crushed-iron-smelting", "iron-plate", {amount=15})
frecipe.scale_ingredient("crushed-iron-smelting", "crushed-iron-ore", {amount=20})

local crushed_copper_smelt = frecipe.find("crushed-copper-smelting")
crushed_copper_smelt.energy_required = 48

frecipe.scale_result("crushed-copper-smelting", "copper-plate", {amount=15})
frecipe.scale_ingredient("crushed-copper-smelting", "crushed-copper-ore", {amount=20})

-- Fix recipes that were automatically changed to use concrete mix by CI.

local recipes_with_concrete_mix = frecipe.find_by_ingredient("concrete-mix")

if recipes_with_concrete_mix ~= nil then

    local fluid_scalar = 10

    local category_fixes = {
        {name="heating-tower"},
        {name="se-pulveriser"},
        {name="se-recycling-facility"},
        {name="recycler"}
    }

    local to_ignore = {
        {name="mixed-concrete"},
        {name="refined-mixed-concrete"}
    }

    for _,rname in pairs(recipes_with_concrete_mix) do
        local fluid_value = 0
        
        local do_ignore = false

        for _,ignore in pairs(to_ignore) do
            if rname == ignore.name then
                do_ignore = true
            end
        end

        if do_ignore ~= true then

            local recipe = data.raw["recipe"][rname]

            for _,ingredient in ipairs(recipe.ingredients) do
                if ingredient.type == "fluid" and ingredient.name == "concrete-mix" then
                    fluid_value = ingredient.amount / fluid_scalar
                end
            end

            frecipe.remove_ingredient(recipe.name, "concrete-mix")
            frecipe.add_ingredient(recipe.name, 
                {
                    type = "item",
                    name = "concrete",
                    amount = fluid_value
                }
            )

            for _,item in pairs(category_fixes) do
                if recipe.name == item.name then
                    recipe.category = "crafting"
                end
            end
        end
    end
end

-- Remove prod mods from big-crushers

frecipe.remove_ingredient("big-crusher", "productivity-module")