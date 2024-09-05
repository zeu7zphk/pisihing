-- Referência ao botão
local button = script.Parent

-- Estado inicial do botão (desligado)
local isOn = false

-- Função para alternar o estado do botão
local function toggleButton()
    -- Alterna o estado
    isOn = not isOn
    
    -- Atualiza a aparência do botão
    if isOn then
        button.Text = "Desligar"
        button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Verde quando ligado
    else
        button.Text = "Ligar"
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho quando desligado
    end
end

-- Conecta a função ao evento de clique no botão
button.MouseButton1Click:Connect(toggleButton)

-- Define o estado inicial do botão
button.Text = "Ligar"
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho quando desligado
