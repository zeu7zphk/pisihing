local function createOutlineAndLabel(object)
    -- Verifica se o objeto tem uma propriedade CFrame (um objeto físico)
    if object:IsA("BasePart") then
        -- Criação de uma borda vermelha
        local selectionBox = Instance.new("SelectionBox")
        selectionBox.Parent = object
        selectionBox.Adornee = object
        selectionBox.LineThickness = 0.05 -- Espessura da borda
        selectionBox.Color3 = Color3.fromRGB(255, 0, 0) -- Cor vermelha
        
        -- Criação de um BillboardGui para exibir a classe do objeto
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Size = UDim2.new(0, 100, 0, 50) -- Tamanho da BillboardGui
        billboardGui.StudsOffset = Vector3.new(0, 2, 0) -- Eleva o texto acima do objeto
        billboardGui.Adornee = object
        billboardGui.Parent = object
        
        -- Criação de um TextLabel dentro da BillboardGui
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0) -- Preenche a BillboardGui
        textLabel.Text = object.ClassName -- Define o texto como a classe do objeto
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- Texto branco
        textLabel.BackgroundTransparency = 1 -- Sem fundo
        textLabel.TextScaled = true -- Ajusta o texto automaticamente ao tamanho
        textLabel.Parent = billboardGui
    end
end

-- Função para percorrer todos os objetos no jogo
local function addBordersAndLabels()
    -- Percorre todos os descendentes no jogo
    for _, object in pairs(game:GetDescendants()) do
        -- Tenta criar a borda e o rótulo para o objeto
        pcall(function()
            createOutlineAndLabel(object)
        end)
    end
end

-- Executa a função para adicionar as bordas e rótulos
addBordersAndLabels()
