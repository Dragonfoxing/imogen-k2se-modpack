local recipes = require("__fdsl__.lib.recipe")

-- Change iron, copper, and rare metal recipe values to match K2SO
-- both for consistent throughput, and to incentivize crushing recipe use

local ipla = recipes.find("iron-plate")

ipla.energy_required = 3.2

ipla.ingredients =  {
    { type = "item", name = "iron-ore", amount = 2 }
}

ipla.results = {
    { type = "item", name = "iron-plate", amount = 1 }
}

local cpla = recipes.find("copper-plate")

cpla.energy_required = 3.2

cpla.ingredients = {
    { type = "item", name = "copper-ore", amount = 2 }
}

cpla.results = {
    { type = "item", name = "copper-plate", amount = 1 }
}

local rmetal = recipes.find("kr-rare-metals")

rmetal.energy_required = 3.2

rmetal.ingredients = {
    { type = "item", name = "kr-rare-metal-ore", amount = 2 }
}

rmetal.results = {
    { type = "item", name = "kr-rare-metals", amount = 1 }
}

-- Steel plates in K2+SE are too punishing so we'll reset those to K2SE values.

local spla = recipes.find("steel-plate")

spla.energy_required = 16

spla.ingredients = {
    { type = "item", name = "iron-plate", amount = 10 },
    { type = "item", name = "kr-coke", amount = 2 }
}

spla.results = {
    { type = "item", name = "steel-plate", amount = 5 }
}

-- Match crushed ore values to K2 style 2:1 smelting

local crushed_iron_smelt = recipes.find("crushed-iron-smelting")
crushed_iron_smelt.energy_required = 3.2

crushed_iron_smelt.ingredients = {
    { type = "item", name = "crushed-iron-ore", amount = 2 }
}

crushed_iron_smelt.results = {
    { type = "item", name = "iron-plate", amount = 1 }
}
local crushed_copper_smelt = recipes.find("crushed-copper-smelting")
crushed_copper_smelt.energy_required = 3.2

crushed_copper_smelt.ingredients = {
    { type = "item", name = "crushed-copper-ore", amount = 2 }
}

crushed_copper_smelt.results = {
    { type = "item", name = "copper-plate", amount = 1 }
}