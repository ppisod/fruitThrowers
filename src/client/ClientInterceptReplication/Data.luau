local StarterPlayer = game:GetService("StarterPlayer")
local Slots = require(StarterPlayer.StarterPlayerScripts.Client.ClientInterceptReplication.Enum.Slots)
local m = {}

m.SFruits = {}
m.CFruits = {
    ["melon"] = "Nelon"
}
m.CFruitsModules = {
    [m.CFruits.melon] = script.Parent.Fruits.melon
}

m.CDeck = {}
m.CEquipped = Slots.slots.unequipped;

m.ClientInitiation = function () 

end

m.ServerInitiation = function ()
    local RequestRemoteEvent = game.ReplicatedStorage.Events.RequestDataInitiation
    RequestRemoteEvent:FireServer();
    local Get = game.ReplicatedStorage.Events.GiveData
    Get.OnClientEvent:Connect(function(fruits, deck) 
        m.SFruits = fruits
        m.CFruits = deck
        if #m.SFruits ~= #m.CFruits then 
            error("ServerInitiation [!] Replication failed... CFruits length not matching!")
        end

        print("Replication succeeded")
    end)
end

return m;