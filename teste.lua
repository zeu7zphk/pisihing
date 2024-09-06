local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("1").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Slash"

local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("2").Base

local ToolName = baseButton.ToolName


ToolName.Text = "I Am Atomic"

local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("3").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Get off me"

local player = game.Players.LocalPlayer

local playerGui = player.PlayerGui

local hotbar = playerGui:FindFirstChild("Hotbar")

local backpack = hotbar:FindFirstChild("Backpack")

local hotbarFrame = backpack:FindFirstChild("Hotbar")

local baseButton = hotbarFrame:FindFirstChild("4").Base

local ToolName = baseButton.ToolName


ToolName.Text = "Full Counter"

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Função para encontrar o inimigo mais próximo
local function findClosestEnemy()
    local character = player.Character
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local closestEnemy = nil
    local closestDistance = math.huge
    
    for _, v in pairs(game.Workspace.Enemies:GetChildren()) do  -- Supondo que os inimigos estejam dentro de 'Workspace.Enemies'
        if v:FindFirstChild("HumanoidRootPart") then
            local distance = (v.HumanoidRootPart.Position - rootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestEnemy = v
            end
        end
    end
    
    return closestEnemy
end

-- Criar botão na tela
local buttonGui = Instance.new("ScreenGui")
buttonGui.Parent = playerGui

local teleportButton = Instance.new("TextButton")
teleportButton.Text = "Marcar e Teleportar"
teleportButton.Size = UDim2.new(0, 200, 0, 50)
teleportButton.Position = UDim2.new(0.5, -100, 0.8, 0)
teleportButton.BackgroundColor3 = Color3.new(1, 0, 1) -- Cor roxa
teleportButton.Parent = buttonGui

-- Variável para armazenar o inimigo marcado
local markedEnemy = nil
local markIndicator = nil

-- Função para teletransportar e executar a ação
local function teleportBehindEnemy(enemy)
    -- Teletransporta para trás do inimigo
    local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")
    local enemyRootPart = enemy:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = enemyRootPart.CFrame * CFrame.new(0, 0, 3) -- Teleporta para trás do inimigo

    -- Remove o indicador de marcação
    if markIndicator then
        markIndicator:Destroy()
    end
end

-- Função que será chamada ao apertar o botão
teleportButton.MouseButton1Click:Connect(function()
    -- Encontra o inimigo mais próximo
    local closestEnemy = findClosestEnemy()

    if closestEnemy then
        -- Marca o inimigo com uma caveira roxa
        markIndicator = Instance.new("BillboardGui")
        markIndicator.Size = UDim2.new(2, 0, 2, 0)
        markIndicator.StudsOffset = Vector3.new(0, 3, 0)
        markIndicator.Parent = closestEnemy.HumanoidRootPart
        
        local skull = Instance.new("TextLabel")
        skull.Size = UDim2.new(1, 0, 1, 0)
        skull.Text = "☠️"  -- Caveira
        skull.TextColor3 = Color3.new(0.5, 0, 0.5)  -- Roxo
        skull.BackgroundTransparency = 1
        skull.TextScaled = true
        skull.Parent = markIndicator

        -- Espera 2 segundos antes de teletransportar
        wait(2)

        -- Teletransporta para trás do inimigo e remove a marca
        teleportBehindEnemy(closestEnemy)
    else
        print("Nenhum inimigo encontrado.")
    end
end)
