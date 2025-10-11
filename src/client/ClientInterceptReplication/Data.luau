local m = {}

m.SFruits = {}
m.CFruits = {
    ["melon"] = "Nelon"
}
m.CFruitsModules = {
    [m.CFruits.melon] = script.Parent.Fruits.melon
}

m.ClientInitiation = function () 

end

m.ServerInitiation = function ()
    local RequestRemoteEvent = game.ReplicatedStorage.Events.RequestDataInitiation
    RequestRemoteEvent:FireServer();
    local Get = game.ReplicatedStorage.Events.GiveData
    Get.OnClientEvent:Connect(function(fruits) 
        m.SFruits = fruits
    end)

    if m.SFruits ~= m.CFruits then 
    error("ServerInitiation [!] Replication failed...")
    end
end

return m;