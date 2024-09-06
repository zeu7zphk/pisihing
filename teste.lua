-- Cria uma GUI personalizada para o mouse
local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local gui = Instance.new("ScreenGui")
gui.Name = "CustomMouseGUI"
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 50, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Cor vermelha
frame.BackgroundTransparency = 0.5
frame.Position = UDim2.new(0, 0, 0, 0)
frame.Parent = gui

-- Função para atualizar a posição da GUI com base no cursor ou toque
local function updatePosition(input)
    local screenPosition = input.Position
    frame.Position = UDim2.new(0, screenPosition.X - frame.Size.X.Offset / 2, 0, screenPosition.Y - frame.Size.Y.Offset / 2)
end

-- Atualiza a posição para movimentos do mouse e toques na tela
userInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        updatePosition(input)
    end
end)

-- Para dispositivos móveis, rastreia a posição do toque
local touchInput = userInputService.TouchPanChanged:Connect(function(touch)
    updatePosition(touch)
end)

-- Para garantir que o evento de toque seja desconectado ao final
game:BindToClose(function()
    touchInput:Disconnect()
end)
