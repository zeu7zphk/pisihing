local plr = game.Players.LocalPlayer
local chr = plr.Character

-- Equipa a ferramenta "Normal Punch" do Backpack
local tool = plr.Backpack:FindFirstChild("Normal Punch")
if tool then
    tool.Parent = chr

    -- Espera um tempo antes de devolver a ferramenta ao Backpack
    wait(1.6)
    tool.Parent = plr.Backpack
else
    warn("Normal Punch não encontrado no Backpack")
end
