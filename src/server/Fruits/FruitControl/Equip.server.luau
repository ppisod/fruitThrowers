local ServerScriptService = game:GetService("ServerScriptService")
local DeckHandler = require(ServerScriptService.Server.Data.DeckHandler)
local EquippedHandler = require(ServerScriptService.Server.Data.EquippedHandler)
local Fruit = require(ServerScriptService.Server.Data._Ref.Fruit)
-- set EquippedHandler[player] to slot according to EquipKeyCodes

-- get remoteEvent
local equip = game.ReplicatedStorage.Events.Equip

equip.OnServerEvent:Connect(function(p: Player, encodedC: number) -- ! encodedC as Slots.Slot
    -- get slot
    local deck = DeckHandler.deck[p] -- {slot: fruit}
    local referencingFruit = deck[encodedC]
    local fruitModule = Fruit.FruitModule[referencingFruit]

    EquippedHandler.set(p, encodedC, fruitModule.EquipCooldown)
    print("slot change to ".. encodedC)
end)