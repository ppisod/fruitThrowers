local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local m = {}

m.EquipCooldown = 0.7

function m.Instantiate (Player: Player, Position: Vector3, Direction: Vector3)
    local model = ReplicatedStorage.Models.Watermelon
    local clone = model:Clone()

    clone.Parent = Workspace.fruit

    clone.Position = Position + Vector3.new(0, 3, 0)+ Direction

    -- make it fly
    clone:ApplyImpulse((Direction + Vector3.new(0,1,0)) * 50)

    clone.Touched:Connect(function(part: BasePart) 
        if part.Parent == nil then 
            return
        end
        if Player.Character == nil then
            return 
        end
        if part:IsDescendantOf(Player.Character) then
            return
        end
        clone:Destroy()
        print("melong destroyd..")
    end)
    
end

return m;