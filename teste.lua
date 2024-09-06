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
local function clickButton()
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

    -- Obtém o botão específico e simula o clique
    local baseButton = hotbarFrame:FindFirstChild("1")
    if not baseButton then
        warn("BaseButton not found")
        return
    end

    -- Verifica se o botão tem um evento MouseButton1Click
    local toolName = baseButton:FindFirstChild("ToolName")
    if not toolName then
        warn("ToolName not found")
        return
    end

    -- Simula a ação associada ao clique do botão
    if baseButton:FindFirstChild("MouseButton1Click") then
        baseButton.MouseButton1Click:Fire()
    else
        warn("MouseButton1Click event not found on BaseButton")
    end
end

-- Executa a função para simular o clique no botão
clickButton()

