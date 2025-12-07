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