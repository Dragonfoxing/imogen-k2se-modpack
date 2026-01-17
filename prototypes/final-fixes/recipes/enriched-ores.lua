local util = require("util")

util.recipe.clone("kr-enriched-iron", "kr-enriched-crushed-iron")
data.raw["recipe"]["kr-enriched-crushed-iron"].localised_name = "Enriched Iron"
util.recipe.replace_ingredient_in_place("kr-enriched-crushed-iron", "iron-ore", "crushed-iron-ore", "item")
util.recipe.set_standardized_dual_icon("kr-enriched-crushed-iron", "kr-enriched-iron", "crushed-iron-ore")
util.technology.add_recipe_unlock("kr-enriched-ores", "kr-enriched-crushed-iron")

util.recipe.clone("kr-enriched-copper", "kr-enriched-crushed-copper")
data.raw["recipe"]["kr-enriched-crushed-copper"].localised_name = "Enriched Copper"
util.recipe.replace_ingredient_in_place("kr-enriched-crushed-copper", "copper-ore", "crushed-copper-ore", "item")
util.recipe.set_standardized_dual_icon("kr-enriched-crushed-copper", "kr-enriched-copper", "crushed-copper-ore")
util.technology.add_recipe_unlock("kr-enriched-ores", "kr-enriched-crushed-copper")