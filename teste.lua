local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Criar o ScreenGui
local newGui = Instance.new("ScreenGui")
newGui.Name = "Hotbar"
newGui.Parent = playerGui

-- Criar o Frame do Hotbar
local hotbarFrame = Instance.new("Frame")
hotbarFrame.Name = "HotbarFrame"
hotbarFrame.Size = UDim2.new(0, 300, 0, 100)  -- Tamanho do hotbar
hotbarFrame.Position = UDim2.new(0.5, -150, 0.9, -50)  -- Posição central na parte inferior
hotbarFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Cor de fundo
hotbarFrame.Parent = newGui

-- Criar o Botão Base
local baseButton = Instance.new("TextButton")
baseButton.Name = "BaseButton"
baseButton.Size = UDim2.new(0, 100, 0, 100)  -- Tamanho do botão
baseButton.Position = UDim2.new(0, 0, 0, 0)  -- Posição no hotbar
baseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Cor de fundo vermelha
baseButton.Text = "Use Tool"
baseButton.Parent = hotbarFrame

-- Criar o Label ToolName
local toolName = Instance.new("TextLabel")
toolName.Name = "ToolName"
toolName.Size = UDim2.new(0, 100, 0, 50)  -- Tamanho do label
toolName.Position = UDim2.new(0, 0, 1, 0)  -- Abaixo do botão
toolName.Text = "Red"  -- Texto inicial
toolName.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Cor do texto
toolName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Cor de fundo do label
toolName.Parent = baseButton
