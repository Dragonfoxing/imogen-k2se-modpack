local flib_position = require("__flib__.position")
local flib_table = require("__flib__.table")

local data_util = {}

--- Converts a furnace prototype into an assembling machine prototype.
--- @param furnace_name data.EntityID
--- @return data.AssemblingMachinePrototype?
function data_util.furnace_to_assembler(furnace_name)
  local furnace = data.raw.furnace[furnace_name]
  if not furnace then
    data_util.error("Furnace " .. furnace_name .. " does not exist.")
    return
  end

  local assembler = table.deepcopy(furnace) --[[@as data.AssemblingMachinePrototype]]
  assembler.type = "assembling-machine"
  assembler.source_inventory_size = nil --- @diagnostic disable-line
  assembler.energy_source.emissions_per_minute = { pollution = 2 }
  assembler.energy_usage = "0.2MW"
  data.raw.furnace[furnace_name] = nil
  data:extend({ assembler })
  return assembler
end


function data_util.assembler_to_furnace(assembler_name)
  local assembler = data.raw["assembling-machine"][assembler_name]
  if not assembler then
    data_util.error("Furnace " .. assembler_name .. " does not exist.")
    return
  end

  local furnace = table.deepcopy(assembler) --[[@as data.AssemblingMachinePrototype]]
  furnace.type = "furnace"
  furnace.crafting_categories = {"recycling"}
  furnace.source_inventory_size = 1 --- @diagnostic disable-line
  furnace.result_inventory_size = 20
  data.raw["assembling-machine"][assembler_name] = nil
  data:extend({ furnace })
  return furnace
end

return data_util