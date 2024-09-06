local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Animações
local dashAnimation = Instance.new("Animation")
dashAnimation.AnimationId = "ANIMATION_DASH_ID" -- Coloque o ID da sua animação aqui

local ability1Animation = Instance.new("Animation")
ability1Animation.AnimationId = "ANIMATION_ABILITY_1_ID" -- Coloque o ID da sua animação aqui

-- Carregar animações
local dashAnimTrack = Humanoid:LoadAnimation(dashAnimation)
local ability1AnimTrack = Humanoid:LoadAnimation(ability1Animation)

-- Função para encontrar o jogador mais próximo
function getClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = math.huge
    
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - Character.HumanoidRootPart.Position).magnitude
            
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = player
            end
        end
    end
    
    return closestPlayer
end

-- Conectar os botões da GUI às funções correspondentes
local gui = Player.PlayerGui:WaitForChild("ScreenGui")

gui.ButtonDash.MouseButton1Click:Connect(function()
    dashAnimTrack:Play()
    -- Adicione lógica para movimento de dash aqui
end)

gui.ButtonAbility1.MouseButton1Click:Connect(function()
    ability1AnimTrack:Play()
    -- Adicione a lógica para a habilidade 1 aqui
end)

gui.ButtonAbility2.MouseButton1Click:Connect(function()
    -- Adicione a lógica para a habilidade 2 aqui
end)

gui.ButtonAbility3.MouseButton1Click:Connect(function()
    -- Adicione a lógica para a habilidade 3 aqui
end)

gui.ButtonAbility4.MouseButton1Click:Connect(function()
    -- Adicione a lógica para a habilidade 4 aqui
end)

gui.ButtonAbility5.MouseButton1Click:Connect(function() -- Habilidade 5 Teleportar e usar habilidade 1
    local closestPlayer = getClosestPlayer()
    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
        Character:SetPrimaryPartCFrame(closestPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)) -- Teleporta atrás do jogador mais próximo
        ability1AnimTrack:Play() -- Usa a habilidade 1
        
        -- Adicione lógica adicional da habilidade aqui se necessário.
    end
end)
