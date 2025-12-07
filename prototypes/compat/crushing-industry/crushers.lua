local ftech = require("__fdsl__.lib.technology")
local frecipe = require("__fdsl__.lib.recipe")

local ecrush_unlocks = ftech.find_by_unlock("electric-crusher")

for _, u in pairs(ecrush_unlocks) do
    ftech.remove_unlock(u, "electric-crusher")
end

local bcrush_unlocks = ftech.find_by_unlock("big-crusher")

for _, u in pairs(bcrush_unlocks) do
    ftech.remove_unlock(u, "big-crusher")
end

frecipe.find("big-crusher").enabled = false
frecipe.find("electric-crusher").enabled = false

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