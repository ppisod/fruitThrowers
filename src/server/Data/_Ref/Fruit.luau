local None = require(script.Parent.Fruits.None)
local m = {}

m.Fruits = {
    None = "unequipped"
}

m.FruitModule = {
    [m.Fruits.None] = None
}

m.FruitFills = {
    [m.Fruits.None] = 0
}

m.iterableFruits = {m.Fruits.melon}

return m;