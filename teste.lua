local plr = game.Players.LocalPlayer
local chr = plr.Character
local hum = chr.Humanoid

-- Função para encontrar o jogador mais próximo
local function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= plr and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - chr.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                closestPlayer = player
                shortestDistance = distance
            end
        end
    end
    
    return closestPlayer
end

-- Criação da ferramenta "Marcar"
local tool = Instance.new("Tool")
tool.Name = "Marcar"
tool.RequiresHandle = false
tool.Parent = plr.Backpack

-- Variável para armazenar o jogador marcado
local markedPlayer = nil

-- Função chamada ao usar a ferramenta "Marcar"
tool.Equipped:Connect(function()
    -- Encontra o jogador mais próximo
    local closestPlayer = getClosestPlayer()
    
    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
        markedPlayer = closestPlayer  -- Armazena o jogador marcado
        
        -- Marca o jogador com um emoji ☠️ acima da cabeça
        local billboard = Instance.new("BillboardGui", closestPlayer.Character.Head)
        billboard.Size = UDim2.new(5, 0, 5, 0)  -- Aumenta o tamanho da marca
        billboard.StudsOffset = Vector3.new(0, 3, 0) -- Levanta o emoji mais alto acima da cabeça
        billboard.Adornee = closestPlayer.Character.Head
        billboard.AlwaysOnTop = true  -- Garante que a marca esteja sempre visível

        local label = Instance.new("TextLabel", billboard)
        label.Size = UDim2.new(1, 0, 1, 0)
        label.Text = "☠️"
        label.TextScaled = true
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1, 0, 0)  -- Cor vermelha para dar destaque

        -- Aguarda 2 segundos antes de teleportar e executar o ataque
        wait(2)

        -- Teleporta para as costas do jogador marcado
        local targetHRP = markedPlayer.Character:FindFirstChild("HumanoidRootPart")
        if targetHRP then
            chr.HumanoidRootPart.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3) -- Teleporta para trás
        end
        
        -- Executa a ferramenta "Normal Punch" após o teleporte
        local normalPunch = plr.Backpack:FindFirstChild("Normal Punch")
        if normalPunch then
            normalPunch.Parent = chr
            wait(1.6)
            normalPunch.Parent = plr.Backpack
        else
            warn("Normal Punch não encontrado no Backpack")
        end
        
        -- Remove o emoji após o teleporte e ataque
        billboard:Destroy()
    else
        warn("Nenhum jogador próximo encontrado")
    end
end)
