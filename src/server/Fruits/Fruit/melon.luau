local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local m = {}

m.EquipCooldown = 0.7
-- new commit msg
function m.Instantiate (Player: Player, Position: Vector3, Direction: Vector3)
    local model = ReplicatedStorage.Models.Watermelon
    local particleEmitter = ReplicatedStorage.ParticleEmitters.WatermelonParticleEmitter
    local clone = model:Clone()

    clone.Parent = Workspace.fruit
    clone.Position = Position + Vector3.new(0, 3, 0)+ Direction

    -- make it fly
    clone:ApplyImpulse((Direction + Vector3.new(0,2,0)) * 100)
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
        local Position = clone.Position + Vector3.new(0, 0.1, 0)
        clone:Destroy()
        local PEM = particleEmitter:Clone()
        PEM.Parent = Workspace.Temp
        PEM.Position = Position
        task.spawn(function () 
            task.wait(0.2)
            PEM:Destroy()
        end)
        print("melong destroyd..")
    end)
    
end

return m;