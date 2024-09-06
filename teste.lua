local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Criar o ScreenGui (Hotbar)
local hotbar = Instance.new("ScreenGui")
hotbar.Name = "Hotbar"
hotbar.Parent = playerGui

-- Criar o Frame do Backpack
local backpack = Instance.new("Frame")
backpack.Name = "Backpack"
backpack.Size = UDim2.new(0, 400, 0, 100)  -- Define o tamanho do Backpack
backpack.Position = UDim2.new(0.5, -200, 0.8, 0)  -- Posição no meio da tela
backpack.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Cor de fundo
backpack.Parent = hotbar

-- Criar o HotbarFrame dentro do Backpack
local hotbarFrame = Instance.new("Frame")
hotbarFrame.Name = "Hotbar"
hotbarFrame.Size = UDim2.new(1, 0, 1, 0)  -- Tamanho do HotbarFrame
hotbarFrame.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
hotbarFrame.Parent = backpack

-- Criar o botão Base (BaseButton)
local baseButton = Instance.new("TextButton")
baseButton.Name = "Base"
baseButton.Size = UDim2.new(0, 100, 0, 50)  -- Tamanho do botão
baseButton.Position = UDim2.new(0, 0, 0, 0)  -- Posição no HotbarFrame
baseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Cor vermelha
baseButton.Text = "Tool"
baseButton.Parent = hotbarFrame

-- Criar o TextLabel para o ToolName
local toolName = Instance.new("TextLabel")
toolName.Name = "ToolName"
toolName.Size = UDim2.new(1, 0, 0.5, 0)  -- Tamanho do label
toolName.Position = UDim2.new(0, 0, 1, 0)  -- Posição logo abaixo do botão
toolName.Text = "Red"  -- Nome inicial da ferramenta
toolName.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Cor do texto
toolName.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Fundo preto
toolName.Parent = baseButton
