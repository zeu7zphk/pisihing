-- Cria uma GUI personalizada para o cursor
local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")
local gui = Instance.new("ScreenGui")
gui.Name = "CustomCursorGUI"
gui.Parent = player:WaitForChild("PlayerGui")

local cursor = Instance.new("Frame")
cursor.Size = UDim2.new(0, 30, 0, 30)
cursor.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Cor verde
cursor.BackgroundTransparency = 0.5
cursor.Position = UDim2.new(0, 0, 0, 0)
cursor.Parent = gui

-- Função para atualizar a posição da GUI com base no cursor
local function updateCursorPosition()
    local mouseLocation = userInputService:GetMouseLocation()
    cursor.Position = UDim2.new(0, mouseLocation.X - cursor.Size.X.Offset / 2, 0, mouseLocation.Y - cursor.Size.Y.Offset / 2)
end

-- Atualiza a posição do cursor a cada frame
game:GetService("RunService").RenderStepped:Connect(updateCursorPosition)
