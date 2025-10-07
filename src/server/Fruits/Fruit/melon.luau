local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local m = {}

m.EquipCooldown = 0.7

function m.Instantiate (Position: Vector3, Direction: Vector3)
    local model = ReplicatedStorage.Models.Watermelon
    local clone = model:Clone()

    clone.Parent = Workspace.fruit

    clone.Position = Position

    -- make it fly
    clone:ApplyImpulse(Direction * 5)
end

return m;