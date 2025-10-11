local StarterPlayer = game:GetService("StarterPlayer")
local Data = require(StarterPlayer.StarterPlayerScripts.Client.ClientInterceptReplication.Data)
Data.ServerInitiation()
local m = {}

-- intercepts are used to handle client-side timings for client effects
-- instead of adding all the code within ClientKeyHandler, 
-- increase readability with intercepts

m.EQUIPPED = function (slot: number) 
    Data.CEquipped = slot
end

m.KNIFE_OUT = function () 

end

m.THROWN = function () 
    -- replicate fruit client side
    -- get fruit from slot
    local currentFruit = Data.CDeck[Data.CEquipped]
    local fruitModule = require(Data.CFruitsModules[currentFruit])
    print(currentFruit)
    fruitModule.Instantiate();
end

return m