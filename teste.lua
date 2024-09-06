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

-- Cria a GUI e botão no canto superior direito
local gui = Instance.new("ScreenGui", plr.PlayerGui)
local button = Instance.new("TextButton", gui)
button.Position = UDim2.new(0.85, 0, 0, 0) -- Superior direito
button.Size = UDim2.new(0, 100, 0, 50)
button.Text = "Marcar"
button.TextScaled = true

-- Variável para armazenar o jogador marcado
local markedPlayer = nil

-- Função chamada ao clicar no botão
button.MouseButton1Click:Connect(function()
    -- Encontra o jogador mais próximo
    local closestPlayer = getClosestPlayer()
    
    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
        markedPlayer = closestPlayer  -- Armazena o jogador marcado
        
        -- Marca o jogador com um emoji ☠️ acima da cabeça
        local billboard = Instance.new("BillboardGui", closestPlayer.Character.Head)
        billboard.Size = UDim2.new(1, 0, 1, 0)
        billboard.Adornee = closestPlayer.Character.Head
        
        local label = Instance.new("TextLabel", billboard)
        label.Size = UDim2.new(1, 0, 1, 0)
        label.Text = "☠️"
        label.TextScaled = true
        label.BackgroundTransparency = 1

        -- Aguarda 2 segundos antes de teleportar e executar o ataque
        wait(2)

        -- Teleporta para as costas do jogador marcado
        local targetHRP = markedPlayer.Character:FindFirstChild("HumanoidRootPart")
        if targetHRP then
            chr.HumanoidRootPart.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3) -- Teleporta para trás
        end
        
        -- Executa a ferramenta "Normal Punch" após o teleporte
        local tool = plr.Backpack:FindFirstChild("Normal Punch")
        if tool then
            tool.Parent = chr
            wait(1.6)
            tool.Parent = plr.Backpack
        else
            warn("Normal Punch não encontrado no Backpack")
        end
        
        -- Remove o emoji após o teleporte e ataque
        billboard:Destroy()
    else
        warn("Nenhum jogador próximo encontrado")
    end
end)
