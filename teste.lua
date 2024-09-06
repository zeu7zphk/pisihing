-- Obtém serviços necessários
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

-- Obtém o jogador e a tela
local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomMouseGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Cria um ImageLabel para o mouse personalizado
local customMouse = Instance.new("ImageLabel")
customMouse.Name = "CustomMouse"
customMouse.Size = UDim2.new(0, 32, 0, 32) -- Tamanho do cursor (32x32 pixels)
customMouse.Image = "rbxassetid://123456789" -- Substitua pelo ID da imagem do cursor
customMouse.BackgroundTransparency = 1
customMouse.Position = UDim2.new(0, 0, 0, 0)
customMouse.Parent = screenGui

-- Função para atualizar a posição do cursor
local function updateMousePosition(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        local mousePosition = input.Position
        customMouse.Position = UDim2.new(0, mousePosition.X, 0, mousePosition.Y)
    end
end

-- Conecta o evento para capturar o movimento do mouse
UserInputService.InputChanged:Connect(updateMousePosition)

-- Oculta o cursor padrão do Roblox
local function hideDefaultMouse()
    local mouse = player:GetMouse()
    mouse.Icon = ""
end

hideDefaultMouse()
