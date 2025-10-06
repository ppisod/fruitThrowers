
local CAS = game:GetService("ContextActionService")
-- services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")
-- modules
local InterceptKeys = require(StarterPlayer.StarterPlayerScripts.Client.Intercepts.InterceptKeys)
local EquipKeyCodes = require(ReplicatedStorage.Shared.CrossHandling.EquipKeyCodes)
-- rE
local equipEvent = game:GetService("ReplicatedStorage").Events.Equip;
local throwEvent = game:GetService("ReplicatedStorage").Events.Throw;
local knifeEvent = game:GetService("ReplicatedStorage").Events.KnifeOut;
-- gui wait for child please
local mobileButtons = game.Players.LocalPlayer.PlayerGui:WaitForChild("MobileButtons");

-- TODO: mobile safe implementation...... (gui)
-- :: mobile unsafe implementation
function equip (actionName: string, inputState: Enum.UserInputState, inputObject: InputObject)

    if inputState == Enum.UserInputState.Begin then
        -- trigger Equip remote event (TODO: add clientside checks to prevent spamming)
        equipEvent:FireServer(EquipKeyCodes.KeyEncode[inputObject.KeyCode])
        InterceptKeys.EQUIPPED(EquipKeyCodes.KeyEncode[inputObject.KeyCode])
    end

end


function knifeOut (actionName: string, inputState: Enum.UserInputState, inputObject: InputObject) 
    
    if inputState == Enum.UserInputState.Begin then
        knifeEvent:FireServer();
    end

end

function throw (actionName: string, inputState: Enum.UserInputState, inputObject: InputObject)

    if inputState == Enum.UserInputState.Begin then
        throwEvent:FireServer();
        InterceptKeys.THROWN();
    end

end

-- BINDS
CAS:BindActionAtPriority("equip", equip, false, 2, Enum.KeyCode.One, Enum.KeyCode.Two, Enum.KeyCode.Three, Enum.KeyCode.Four);
CAS:BindActionAtPriority("knifeOut", knifeOut, true, 2, Enum.KeyCode.F);
CAS:BindActionAtPriority("throw", throw, true, 2, Enum.UserInputType.MouseButton1);

-- MOBILE BUTTON POSITIONING
local throwButton = CAS:GetButton("throw");
local knifeOutButton = CAS:GetButton("knifeOut");

if (throwButton ~= nil or knifeOutButton ~= nil) then 
    throwButton.Parent = mobileButtons.Frame
    knifeOutButton.Parent = mobileButtons.Frame

    throwButton.Position = UDim2.new(0.3, 0, 0.3, 0)
    throwButton.Size = UDim2.new(0, 60, 0, 60)

    knifeOutButton.Position = UDim2.new(0.5, 0, 0.5, 0)
end