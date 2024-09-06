-- Altera o nome da Ultimate e habilidades do Hero Hunter
local heroHunter = game.Players.LocalPlayer.Character:FindFirstChild("Hero Hunter")

if heroHunter then
    -- Alterar o nome da Ultimate
    local ultimate = heroHunter:FindFirstChild("UltimateName")
    if ultimate then
        ultimate.Value = "FÚRIA ABSOLUTA"  -- Novo nome da Ultimate
    end

    -- Alterar nomes das habilidades
    local habilidades = {
        "Flowing Water",
        "Lethal Whirlwind Stream",
        "Hunter's Grasp",
        "Prey's Peril"
    }

    local novosNomes = {
        "Água que Flui",
        "Furacão Letal",
        "Garra do Caçador",
        "Perigo da Presa"
    }

    for i, habilidade in ipairs(habilidades) do
        local habilidadeObj = heroHunter:FindFirstChild(habilidade)
        if habilidadeObj then
            habilidadeObj.Name = novosNomes[i]  -- Renomear habilidade
        end
    end
end
