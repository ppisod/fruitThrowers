local m = {}

m.Knives = {}
m.Knives.default = "Knife"

m.KnifeTools = {
    [m.Knives.default] = game.ReplicatedStorage.Tools.Knife
}

return m