local None = require(script.Parent.Fruits.None)
local Watermelon = require(script.Parent.Fruits.Watermelon)
local m = {}

m.Fruits = {
    None = "unequipped",
    Watermelon = "watermelon"
}

m.FruitModule = {
    [m.Fruits.None] = None,
    [m.Fruits.Watermelon] = Watermelon
}

m.FruitFills = {
    [m.Fruits.None] = 0,
    [m.Fruits.Watermelon] = 3
}

m.iterableFruits = {m.Fruits.melon}

return m;