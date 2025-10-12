local CFNew, CFAng, CFtoObjectSpace = CFrame.new, CFrame.Angles, CFrame.new().ToObjectSpace
local asin, pi, hpi = math.asin, math.pi, math.pi / 2

local Plr= game.Players.LocalPlayer

game:GetService("RunService").RenderStepped:Connect(function()
    if Plr.Character then
        local Root, Neck, Humanoid, Camera = Plr.Character:FindFirstChild("HumanoidRootPart"), Plr.Character:FindFirstChild("Neck", true), Plr.Character:FindFirstChild("Humanoid"), workspace.CurrentCamera
        if Root and Neck and Humanoid and Camera.CameraSubject then
            local R6 = Humanoid.RigType == Enum.HumanoidRigType.R6
            if Camera.CameraSubject.Parent == Plr.Character then
                local CameraDirection = CFtoObjectSpace(Root.CFrame, Camera.CFrame).lookVector.unit
                Neck.C0 = CFNew(Neck.C0.p) * CFAng(0, -asin(CameraDirection.x), 0) * (R6 and CFAng(-hpi + asin(CameraDirection.y), 0, pi) or CFAng(asin(CameraDirection.y), 0, 0))
            else
                Neck.C0 = R6 and CFNew(Neck.C0.p) * CFAng(-hpi, 0, pi) or CFNew(Neck.C0.p)
            end
        end
    end
end)