data.raw["bool-setting"]["crushing-industry-concrete-mix"].default_value = true

-- If this isn't set by the player or automatically on first startup, heating towers will just outright crush through fuel.  Effectivity was what made them worth using in the first place.

-- We try really hard to manipulate this value.

data.raw["double-setting"]["sei-heating-tower-effectivity"].value = 2.5
settings.startup["sei-heating-tower-effectivity"].value = 2.5