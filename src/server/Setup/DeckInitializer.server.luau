local ServerScriptService = game:GetService("ServerScriptService")
local DeckHandler = require(ServerScriptService.Server.Data.DeckHandler)
local Fruit = require(ServerScriptService.Server.Data._Ref.Fruit)
local Knife = require(ServerScriptService.Server.Data._Ref.Knife)
local Slots = require(ServerScriptService.Server.Data._Ref.Slots)

local p = game.Players

-- ROADMAP
-- when a player joins: initialze their deck via DeckHandler and Slots. this can be split into
--      InitializeDeck (Player, PresetData (can be nil))

p.PlayerAdded:Connect(function(player: Player) 

    DeckHandler.deck[player] = DeckHandler.defaultDeck

end)

p.PlayerRemoving:Connect(function(player: Player) 

    DeckHandler.deck[player] = nil

end)