local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("1").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Slash"

local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("2").Base

local ToolName = baseButton.ToolName


ToolName.Text = "I Am Atomic"

local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("3").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Get off me"

local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("4").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Full Counter"

-- Obtém o jogador local
local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui

-- Função para simular o clique no botão
local function simulateButtonClick()
    -- Obtém o Hotbar e o Backpack
    local hotbar = playerGui:FindFirstChild("Hotbar")
    if not hotbar then
        warn("Hotbar not found")
        return
    end

    local backpack = hotbar:FindFirstChild("Backpack")
    if not backpack then
        warn("Backpack not found")
        return
    end

    local hotbarFrame = backpack:FindFirstChild("Hotbar")
    if not hotbarFrame then
        warn("HotbarFrame not found")
        return
    end

    -- Obtém o botão específico
    local baseButton = hotbarFrame:FindFirstChild("1")
    if not baseButton then
        warn("BaseButton not found")
        return
    end

    -- Obtém a função associada ao clique
    local buttonFunction = baseButton:FindFirstChild("ClickFunction")
    if buttonFunction then
        -- Chama a função diretamente
        buttonFunction:Invoke() -- ou buttonFunction:Fire(), dependendo do tipo de função
    else
        warn("ClickFunction not found")
    end
end

-- Executa a função para simular o clique no botão
simulateButtonClick()

