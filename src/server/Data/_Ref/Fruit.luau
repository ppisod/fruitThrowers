local ServerScriptService = game:GetService("ServerScriptService")
local melon = require(ServerScriptService.Server.Fruits.Fruit.melon)
local m = {}

m.Fruits = {}
m.Fruits.melon = "Melon"

m.FruitModule = {
    [m.Fruits.melon] = melon
}

return m;