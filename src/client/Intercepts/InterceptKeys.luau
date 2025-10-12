local m = {}

-- intercepts are used to handle client-side timings for client effects
-- instead of adding all the code within ClientKeyHandler, 
-- increase readability with intercepts

m.EQUIPPED = function (slot: number) 

end

m.KNIFE_OUT = function () 

end

m.THROWN = function (Rotation: Vector3, id: number) 
    -- replicate fruit client side
    -- get fruit from slot
end

return m