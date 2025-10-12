local ServerScriptService = game:GetService("ServerScriptService")
local Slots = require(ServerScriptService.Server.Data._Ref.Slots)
local m = {}

m.fieldSlot = "slot"
m.fieldReady = "ready"

m.playerEquips = {} -- player: {slot: slot, ready: readied}

m.set = function (player, slot: number, cooldown)

    -- [!]
    if (slot == Slots.slots.hidden5 or slot == Slots.slots.hidden6) then
        warn("EquippedHandler attempted to set slot to hidden slots 5 or 6")
        return
    end

    m.playerEquips[player] = {[m.fieldSlot] = slot, [m.fieldReady] = false}
    if (slot == Slots.slots.unequipped) then 
        m.playerEquips[player][m.fieldReady] = true
        return
    end
    local originalS = slot
    task.spawn(function () 
        wait(cooldown)
        if (m.playerEquips[player][m.fieldSlot]) ~= originalS then 
            return
        end
        -- checks doen to see if equip was equipped another yah
        m.playerEquips[player][m.fieldReady] = true
    end)

end

return m