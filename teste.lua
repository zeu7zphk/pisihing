-- Cria uma GUI personalizada para o mouse
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local gui = Instance.new("ScreenGui")
gui.Name = "CustomMouseGUI"
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 50, 0, 50)
frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Cor vermelha
frame.BackgroundTransparency = 0.5
frame.Position = UDim2.new(0, 0, 0, 0)
frame.Parent = gui

-- Atualiza a posição da GUI para seguir o cursor
local function updatePosition()
    frame.Position = UDim2.new(0, mouse.X - frame.Size.X.Offset / 2, 0, mouse.Y - frame.Size.Y.Offset / 2)
end

-- Conecta a função de atualização ao evento RenderStepped
game:GetService("RunService").RenderStepped:Connect(updatePosition)
