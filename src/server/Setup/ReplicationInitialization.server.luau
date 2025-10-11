local ServerScriptService = game:GetService("ServerScriptService")
local DeckHandler = require(ServerScriptService.Server.Data.DeckHandler)
local Fruit = require(ServerScriptService.Server.Data._Ref.Fruit)
local alreadyRequested = {} -- player

local RequestEvent = game.ReplicatedStorage.Events.RequestDataInitiation
local SendEvent = game.ReplicatedStorage.Events.GiveData

RequestEvent.OnServerEvent:Connect(function(a0: Player)  
    for _, player in pairs(alreadyRequested) do
        if a0 == player then 
            warn("hey! you have already requested your data.")
            return
        end
    end
    task.wait(0.1)
    SendEvent:FireClient(a0, Fruit.Fruits, DeckHandler.deck[a0])
    table.insert(alreadyRequested, a0)
end)