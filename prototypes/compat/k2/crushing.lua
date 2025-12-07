-- Fix K2 crushers so they can use the Crushing Industry recipes.
local kr_krush = data.raw["furnace"]["kr-crusher"]

table.insert(kr_krush.crafting_categories, "basic-crushing")