-- Variável para controlar o estado do botão
local isOn = false

-- Função que será chamada ao iniciar o LOVE2D
function love.load()
    -- Define o título da janela
    love.window.setTitle("Botão Liga/Desliga")
    -- Define o tamanho da janela
    love.window.setMode(400, 200)
end

-- Função para desenhar o conteúdo na tela
function love.draw()
    -- Define a cor de fundo da janela
    love.graphics.clear(1, 1, 1) -- Branco

    -- Texto do botão
    local buttonText = isOn and "Desligar" or "Ligar"

    -- Desenha um botão simples
    love.graphics.setColor(0, 0, 0) -- Preto para o texto
    love.graphics.printf("Clique no botão para alternar", 0, 50, 400, "center")
    
    -- Define a cor do botão
    if isOn then
        love.graphics.setColor(0, 1, 0) -- Verde quando ligado
    else
        love.graphics.setColor(1, 0, 0) -- Vermelho quando desligado
    end

    -- Desenha o botão (como um retângulo)
    love.graphics.rectangle("fill", 150, 100, 100, 50)
    
    -- Define a cor para o texto dentro do botão
    love.graphics.setColor(1, 1, 1) -- Branco para o texto do botão
    love.graphics.printf(buttonText, 150, 115, 100, "center")
end

-- Função para detectar cliques do mouse
function love.mousepressed(x, y, button, istouch, presses)
    -- Verifica se o clique foi dentro da área do botão
    if x >= 150 and x <= 250 and y >= 100 and y <= 150 then
        if button == 1 then -- Botão esquerdo do mouse
            -- Alterna o estado do botão
            isOn = not isOn
        end
    end
end
