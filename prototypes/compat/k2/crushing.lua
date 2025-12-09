local ftech = require("__fdsl__.lib.technology")
local frecipe = require("__fdsl__.lib.recipe")


local ecrush_unlocks = ftech.find_by_unlock("kr-crusher")

for _, u in pairs(ecrush_unlocks) do
    ftech.remove_unlock(u, "kr-crusher")
end

frecipe.find("kr-crusher").enabled = false