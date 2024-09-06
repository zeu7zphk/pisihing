-- Cria uma GUI personalizada para o mouse
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "CustomMouseGUI"
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 50, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Cor vermelha
frame.BackgroundTransparency = 0.5
frame.Position = UDim2.new(0, 0, 0, 0)
frame.Parent = gui

-- Função para atualizar a posição da GUI com base no toque ou movimento do mouse
local function updatePosition(input)
    local screenPosition = input.Position
    frame.Position = UDim2.new(0, screenPosition.X - frame.Size.X.Offset / 2, 0, screenPosition.Y - frame.Size.Y.Offset / 2)
end

-- Conecta o evento de movimento do mouse
local userInputService = game:GetService("UserInputService")

-- Atualiza a posição para toques e movimentos do mouse
userInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        updatePosition(input)
    end
end)
