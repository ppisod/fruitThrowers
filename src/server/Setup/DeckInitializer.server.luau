local ServerScriptService = game:GetService("ServerScriptService")
local DeckHandler = require(ServerScriptService.Server.Data.DeckHandler)
local Fruit = require(ServerScriptService.Server.Data._Ref.Fruit)
local Knife = require(ServerScriptService.Server.Data._Ref.Knife)
local Slots = require(ServerScriptService.Server.Data._Ref.Slots)

local p = game.Players

local DefaultDeck = {
    [Slots.slots.fruit1] = Fruit.Fruits.melon,
    [Slots.slots.fruit2] = Fruit.Fruits.melon,
    [Slots.slots.fruit3] = Fruit.Fruits.melon,
    [Slots.slots.fruit4] = Fruit.Fruits.melon,
    [Slots.slots.hidden5] = Fruit.Fruits.melon,
    [Slots.slots.hidden6] = Fruit.Fruits.melon,
    [Slots.slots.knife] = Knife.Knives.default,
}

-- ROADMAP
-- when a player joins: initialze their deck via DeckHandler and Slots. this can be split into
--      InitializeDeck (Player, PresetData (can be nil))

p.PlayerAdded:Connect(function(player: Player) 

    DeckHandler.deck[player] = DefaultDeck
    

end)
