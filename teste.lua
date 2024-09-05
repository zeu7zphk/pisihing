-- Referência ao botão
local button = script.Parent

-- Variável que guarda o estado do botão (desligado por padrão)
local isOn = false

-- Função para alternar o estado do botão
local function toggleButton()
    -- Alterna o estado
    isOn = not isOn

    -- Atualiza a cor e o texto do botão baseado no estado
    if isOn then
        button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Verde quando ligado
        button.Text = "On"
    else
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho quando desligado
        button.Text = "Off"
    end
end

-- Conecta a função ao evento de clique no botão
button.MouseButton1Click:Connect(toggleButton)

-- Configuração inicial do botão
button.Text = "Off"
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho (inicialmente desligado)
