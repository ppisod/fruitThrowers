local ServerScriptService = game:GetService("ServerScriptService")
local Fruit = require(ServerScriptService.Server.Data._Ref.Fruit)
local Knife = require(ServerScriptService.Server.Data._Ref.Knife)
local Slots = require(ServerScriptService.Server.Data._Ref.Slots)
local m = {}

m.deck = {} -- player = {cardSlot: ..., cardSlot: ..., cardSlot: ..., cardSlot......}

m.defaultDeck = {
    [Slots.slots.fruit1] = {Fruit.Fruits.None, 0},
    [Slots.slots.fruit2] = {Fruit.Fruits.None, 0},
    [Slots.slots.fruit3] = {Fruit.Fruits.None, 0},
    [Slots.slots.fruit4] = {Fruit.Fruits.None, 0},
    [Slots.slots.hidden5] = {Fruit.Fruits.None, 0},
    [Slots.slots.hidden6] = {Fruit.Fruits.None, 0},
    [Slots.slots.knife] = Knife.Knives.default,
}

return m