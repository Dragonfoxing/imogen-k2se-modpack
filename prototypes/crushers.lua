local ftech = require("__fdsl__.lib.technology")
local frecipe = require("__fdsl__.lib.recipe")

local data_util = require("data-utils")

-- Remove the krastorio crusher as it is basically useless for our needs.

local krush_unlocks = ftech.find_by_unlock("kr-crusher")

for _, u in pairs(krush_unlocks) do
    ftech.remove_unlock(u, "kr-crusher")
end

frecipe.find("kr-crusher").enabled = false

-- Put the burner crusher into the Krastorio Crushing tech instead.

ftech.remove_unlock("burner-mechanics", "burner-crusher")
ftech.add_unlock("kr-crusher", "burner-crusher")

-- Convert the burner and electric crushers to assemblers to match Big Crusher.

data_util.furnace_to_assembler("burner-crusher")
data_util.furnace_to_assembler("electric-crusher")

-- Reduce the efficacy of the Big Crusher.

data.raw["assembling-machine"]["big-crusher"].crafting_speed = 1.5
-- For reference, this is how the CI modder set the base productivity effect.
--  effect_receiver = {base_effect={productivity=0.5}},
data.raw["assembling-machine"]["big-crusher"].effect_receiver = {base_effect={}}
data.raw["assembling-machine"]["big-crusher"].energy_usage = "350kW"