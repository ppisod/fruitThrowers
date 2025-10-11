local m = {}
local model = game.ReplicatedStorage.Models.Watermelon

m.Instantiate = function () 
    local player = game.Players.LocalPlayer
    local char = player.Character
    if char == nil then
        warn("character is nil (Melon.luau client)")
        return
    end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp == nil then
        warn("hrp nil (melon.luau client)")
        return
    end

    local LocalClone = model:Clone()
    LocalClone.CanCollide = false;
    LocalClone.Parent = game.Workspace.fruit
    local direction = hrp.CFrame.LookVector
    LocalClone.Position = hrp.Position + Vector3.new(0, 3, 0)+ direction
    LocalClone:ApplyImpulse((direction + Vector3.new(0,2,0)) * 100)

    LocalClone.Touched:Connect(function(part: BasePart) 
        if (part.Parent == nil or char == nil) then
            LocalClone:Destroy()
            return 
        end
        if part:IsDescendantOf(char) or part:IsDescendantOf(game.Workspace.fruit) then
            return 
        end
        LocalClone:Destroy()
        print(part.Parent:GetChildren())
        print("client melon destoryed")
    end)
end

return m;