local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local DeckHandler = require(ServerScriptService.Server.Data.DeckHandler)
local EquippedHandler = require(ServerScriptService.Server.Data.EquippedHandler)
local Fruit = require(ServerScriptService.Server.Data._Ref.Fruit)
local Slots = require(ServerScriptService.Server.Data._Ref.Slots)
-- trigger dummy code for now

local throw = ReplicatedStorage.Events.Throw
throw.OnServerEvent:Connect(function(player: Player) 
    local playerEquip = EquippedHandler.playerEquips[player]

    if not playerEquip[EquippedHandler.fieldReady] then
        warn("player threw without being ready")
        return
    end

    local Slot = playerEquip[EquippedHandler.fieldSlot]
    if (Slot == Slots.slots.unequipped or Slot == Slots.slots.hidden5 or Slot == Slots.slots.hidden6) then 
        warn("player threw with slot being unequipped or hidden5 or 6")
        return
    end

    if (Slot == Slots.slots.knife) then
        print("player m1 knife")
        return
    end

    local fruit = DeckHandler.deck[player][Slot]

    local fruitModule = Fruit.FruitModule[fruit]

    local char = player.Character

    local hrp = char:WaitForChild("HumanoidRootPart")

    if hrp == nil then 
        warn("hrp is nil when trying to throw")
        return
    end

    fruitModule.Instantiate(player, hrp.Position, hrp.CFrame.LookVector)

end)