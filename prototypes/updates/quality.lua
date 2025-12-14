local frecipe = require("__fdsl__.lib.recipe")

if not mods["quality"] then
  return
end

-- Restore the Krastorio version of the qual1 recipe.
data.raw.recipe["quality-module"].ingredients = {
  { type = "item", name = "electronic-circuit", amount = 5 },
  { type = "item", name = "kr-electronic-components", amount = 10 },
}