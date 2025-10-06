local ServerScriptService = game:GetService("ServerScriptService")
local EquippedHandler = require(ServerScriptService.Server.Data.EquippedHandler)
local Slots = require(ServerScriptService.Server.Data._Ref.Slots)
local p = game.Players

p.PlayerAdded:Connect(function(a: Player) 
    EquippedHandler.set(a, Slots.slots.unequipped)
end)

p.PlayerRemoving:Connect(function(a: Player) 
    EquippedHandler.playerEquips[a] = nil
end)