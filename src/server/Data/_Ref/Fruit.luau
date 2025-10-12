local None = require(script.Parent.Fruits.None)
local m = {}

m.Fruits = {
    None = "unequipped"
}

m.FruitModule = {
    [m.Fruits.None] = None
}

m.iterableFruits = {m.Fruits.melon}

return m;