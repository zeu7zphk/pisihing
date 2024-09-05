-- Certifique-se de que o script está rodando apenas para você
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Criação de um novo ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Criação de um Frame como exemplo
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.2, 0, 0.3, 0) -- 20% da largura e 30% da altura da tela
frame.Position = UDim2.new(0.4, 0, 0.35, 0) -- Centralizado na tela
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Cor de fundo preta
frame.Parent = screenGui

-- Criação de um TextLabel dentro do Frame
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0) -- Preenche o Frame
textLabel.Text = "Este é um GUI privado"
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Cor branca
textLabel.BackgroundTransparency = 1 -- Fundo transparente
textLabel.Parent = frame
