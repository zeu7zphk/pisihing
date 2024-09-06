-- Obtém o jogador e o personagem
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Funções para executar cada movimento
local function move1()
    -- Substitua 'Move1' pelo nome real do seu movimento
    humanoid:LoadAnimation(script.Move1):Play()
end

local function move2()
    -- Substitua 'Move2' pelo nome real do seu movimento
    humanoid:LoadAnimation(script.Move2):Play()
end

local function move3()
    -- Substitua 'Move3' pelo nome real do seu movimento
    humanoid:LoadAnimation(script.Move3):Play()
end

local function move4()
    -- Substitua 'Move4' pelo nome real do seu movimento
    humanoid:LoadAnimation(script.Move4):Play()
end

-- Função para executar o combo
local function executeCombo()
    move1()
    wait(1)  -- Ajuste o tempo de espera conforme necessário
    move2()
    wait(1)
    move3()
    wait(1)
    move4()
end

-- Executa o combo automaticamente em loop
while true do
    executeCombo()
    wait(5)  -- Ajuste o intervalo entre combos conforme necessário
end
