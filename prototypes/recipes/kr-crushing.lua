local crushing_lib = require("__Krastorio2__/prototypes/libraries/crushing")

crushing_lib.make_recipe(data.raw.item["concrete"], {
    category = "kr-crushing",
    hidden = true,
    hide_from_player_crafting = true,
    results = {
        { type = "item", name = "stone-brick", amount_min = 0, amount_max = 2 },
        { type = "item", name = "sand", amount_min = 3, amount_max = 8 }
    }
})