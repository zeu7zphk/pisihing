-- Variáveis principais
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local teleportOffset = Vector3.new(0, 0, -5)  -- Posição para teletransportar atrás do jogador marcado

-- Função para encontrar o jogador mais próximo
local function findNearestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge

    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local otherHumanoidRootPart = otherPlayer.Character.HumanoidRootPart
            local distance = (humanoidRootPart.Position - otherHumanoidRootPart.Position).Magnitude

            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = otherPlayer
            end
        end
    end

    return closestPlayer
end

-- Função para marcar o jogador mais próximo
local function markPlayer(playerToMark)
    if not playerToMark or not playerToMark.Character then return end
    local character = playerToMark.Character
    local head = character:FindFirstChild("Head")

    if head then
        -- Cria a marca roxa
        local marker = Instance.new("BillboardGui")
        marker.Size = UDim2.new(0, 100, 0, 100)
        marker.Adornee = head
        marker.AlwaysOnTop = true
        marker.Parent = playerGui

        local markerImage = Instance.new("ImageLabel")
        markerImage.Image = "rbxassetid://6031071053"  -- ID da imagem (um círculo roxo, substitua por qualquer imagem desejada)
        markerImage.Size = UDim2.new(1, 0, 1, 0)
        markerImage.BackgroundTransparency = 1
        markerImage.Parent = marker

        -- Retorna a marca para ser removida posteriormente
        return marker
    end
end

-- Função para teleportar o jogador atrás do jogador marcado
local function teleportBehindPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local targetHumanoidRootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")

    if targetHumanoidRootPart then
        local teleportPosition = targetHumanoidRootPart.Position + teleportOffset
        humanoidRootPart.CFrame = CFrame.new(teleportPosition)
    end
end

-- Função para paralisar o jogador marcado por 2 segundos
local function freezePlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local targetHumanoid = targetPlayer.Character:FindFirstChild("Humanoid")

    if targetHumanoid then
        -- Armazena a velocidade de movimento original
        local originalWalkSpeed = targetHumanoid.WalkSpeed

        -- Define a velocidade de movimento para 0 (paralisa o jogador)
        targetHumanoid.WalkSpeed = 0

        -- Aguarda 2 segundos e restaura a velocidade original
        wait(2)
        targetHumanoid.WalkSpeed = originalWalkSpeed
    end
end

-- Função principal a ser executada quando o botão é pressionado
local function onButtonPress()
    local nearestPlayer = findNearestPlayer()
    
    if nearestPlayer then
        -- Marca o jogador mais próximo
        local marker = markPlayer(nearestPlayer)
        
        -- Aguarda 2 segundos e teleporta
        wait(2)
        teleportBehindPlayer(nearestPlayer)

        -- Remove a marca roxa
        if marker then
            marker:Destroy()
        end

        -- Paralisa o jogador marcado por 2 segundos
        freezePlayer(nearestPlayer)
    else
        warn("Nenhum jogador próximo encontrado.")
    end
end

-- Cria um botão na tela
local function createTeleportButton()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = playerGui

    local teleportButton = Instance.new("TextButton")
    teleportButton.Size = UDim2.new(0, 200, 0, 50)
    teleportButton.Position = UDim2.new(0.5, -100, 0.9, -50)
    teleportButton.Text = "Teleport to Nearest Player"
    teleportButton.BackgroundColor3 = Color3.new(0.4, 0.4, 1)
    teleportButton.TextColor3 = Color3.new(1, 1, 1)
    teleportButton.Parent = screenGui

    -- Conecta a função de teleporte ao botão
    teleportButton.MouseButton1Click:Connect(onButtonPress)
end

-- Cria o botão quando o script é executado
createTeleportButton()
