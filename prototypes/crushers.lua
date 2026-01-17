local ftech = require("__fdsl__.lib.technology")
local frecipe = require("__fdsl__.lib.recipe")

local data_util = require("data-utils")

-- Reduce the efficacy of the Big Crusher.
data.raw["assembling-machine"]["big-crusher"].crafting_speed = 1.5
-- For reference, this is how the CI modder set the base productivity effect.
--  effect_receiver = {base_effect={productivity=0.5}},
data.raw["assembling-machine"]["big-crusher"].effect_receiver = {base_effect={}}
data.raw["assembling-machine"]["big-crusher"].energy_usage = "350kW"