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
    LocalClone.Parent = game.Workspace.fruit
    LocalClone.Position = hrp
end