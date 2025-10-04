
local CAS = game:GetService("ContextActionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterPlayer = game:GetService("StarterPlayer")
local InterceptKeys = require(StarterPlayer.StarterPlayerScripts.Client.Intercepts.InterceptKeys)
local EquipKeyCodes = require(ReplicatedStorage.Shared.CrossHandling.EquipKeyCodes)
local equipEvent = game:GetService("ReplicatedStorage").Events.Equip;
local throwEvent = game:GetService("ReplicatedStorage").Events.Throw;

-- TODO: mobile safe implementation...... (gui)s
-- :: mobile unsafe implementation
function equip (actionName: string, inputState: Enum.UserInputState, inputObject: InputObject)

    if inputState == Enum.UserInputState.Begin then
        -- trigger Equip remote event (TODO: add clientside checks to prevent spamming)
        equipEvent.FireServer(EquipKeyCodes.KeyEncode[inputObject.KeyCode])
        InterceptKeys.EQUIPPED(EquipKeyCodes.KeyEncode[inputObject.KeyCode])
    end

end

-- TODO: mobile safe implementation...... (gui)
-- :: mobile unsafe implementation
function throw (actionName: string, inputState: Enum.UserInputState, inputObject: InputObject)

    if inputState == Enum.UserInputState.Begin then
        throwEvent.FireServer();
        InterceptKeys.THROWN();
    end

end


CAS:BindActionAtPriority("equip", equip, false, 2, Enum.KeyCode.One, Enum.KeyCode.Two, Enum.KeyCode.Three, Enum.KeyCode.Four);
CAS:BindActionAtPriority("throw", throw, true, 2, Enum.UserInputType.MouseButton1);