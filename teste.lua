-- Criar um ScreenGui para armazenar o GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FloatingIconGui"
screenGui.ResetOnSpawn = false -- Para que o GUI não seja resetado quando o jogador morrer

-- Tornar o GUI visível apenas para o jogador que executa o script
if syn and syn.protect_gui then
    syn.protect_gui(screenGui)
end

screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Criar um botão flutuante
local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 50) -- Tamanho do botão (largura x altura)
button.Position = UDim2.new(0.9, 0, 0.1, 0) -- Posição na tela (canto superior direito)
button.Text = "Off" -- Texto inicial do botão
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Cor inicial (vermelho)
button.Parent = screenGui -- Adicionar o botão no ScreenGui

-- Variável para controlar o estado (ligado/desligado)
local isOn = false

-- Função para alternar o estado do botão
button.MouseButton1Click:Connect(function()
    isOn = not isOn
    if isOn then
        button.Text = "On"
        button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Verde quando ligado
    else
        button.Text = "Off"
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho quando desligado
    end
end)
