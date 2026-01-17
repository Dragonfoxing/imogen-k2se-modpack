local ftech = require("__fdsl__.lib.technology")
local frecipe = require("__fdsl__.lib.recipe")

-- Reinstate resource drain bonuses.
data.raw["mining-drill"]["kr-electric-mining-drill-mk2"].resource_drain_rate_percent = 75
data.raw["mining-drill"]["area-mining-drill"].resource_drain_rate_percent = 75
data.raw["mining-drill"]["kr-electric-mining-drill-mk3"].resource_drain_rate_percent = 50

-- Rebalance KR mining drill mk3 to make it worth using over the big mining drill.
data.raw["mining-drill"]["kr-electric-mining-drill-mk3"].mining_speed = 1.5

-- Add quality bonuses to resource mining range for mk2 mk3.
data.raw["mining-drill"]["kr-electric-mining-drill-mk2"].quality_affects_mining_radius = true
data.raw["mining-drill"]["kr-electric-mining-drill-mk3"].quality_affects_mining_radius = true