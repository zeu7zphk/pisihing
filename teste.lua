-- Referência ao botão
local button = script.Parent
-- Referência ao Frame que é o popup
local popup = button.Parent

-- Variável que armazena o estado do botão (desligado por padrão)
local isOn = false

-- Função que alterna o estado do botão
local function toggleButton()
    -- Alterna o estado
    isOn = not isOn
    
    -- Atualiza o texto e a cor do botão baseado no estado
    if isOn then
        button.Text = "Desligar"
        button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Verde quando ligado
    else
        button.Text = "Ligar"
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho quando desligado
    end
end

-- Conecta a função de alternar ao evento de clique no botão
button.MouseButton1Click:Connect(toggleButton)

-- Configuração inicial do botão
button.Text = "Ligar"
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Vermelho (inicialmente desligado)

-- Faz o popup (Frame) visível quando o jogo começar
popup.Visible = true
