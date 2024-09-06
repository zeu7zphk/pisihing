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

-- Exemplo de script Roblox para adicionar o botão e realizar as ações desejadas

-- Cria um botão na tela
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
local button = Instance.new("TextButton", screenGui)

button.Size = UDim2.new(0, 200, 0, 50)
button.Position = UDim2.new(0.5, -100, 0.9, -25)
button.Text = "Teleportar Inimigo"
button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
button.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Função para encontrar o inimigo mais próximo
local function findClosestEnemy()
    local closestEnemy = nil
    local shortestDistance = math.huge

    for _, enemy in pairs(game.Workspace:GetChildren()) do
        if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") and enemy.Name ~= player.Name then
            local distance = (player.Character.HumanoidRootPart.Position - enemy.HumanoidRootPart.Position).magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestEnemy = enemy
            end
        end
    end

    return closestEnemy
end

-- Marca o inimigo com uma caveira roxa
local function markEnemy(enemy)
    local head = enemy:FindFirstChild("Head")
    if head then
        local mark = Instance.new("BillboardGui", head)
        mark.Size = UDim2.new(0, 100, 0, 100)
        mark.Adornee = head
        mark.StudsOffset = Vector3.new(0, 2, 0)

        local textLabel = Instance.new("TextLabel", mark)
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.Text = "💀"
        textLabel.TextColor3 = Color3.fromRGB(255, 0, 255) -- Cor roxa para o emoji
        textLabel.TextScaled = true
        textLabel.BackgroundTransparency = 1
    end
end

-- Teleporta o jogador atrás do inimigo
local function teleportBehindEnemy(enemy)
    local enemyPosition = enemy.HumanoidRootPart.Position
    local direction = (player.Character.HumanoidRootPart.Position - enemyPosition).unit
    local teleportPosition = enemyPosition - direction * 10 -- Ajuste a distância conforme necessário
    wait(2)
    player.Character.HumanoidRootPart.CFrame = CFrame.new(teleportPosition)
    print("Teleported behind enemy")
end

-- Define a função do botão
button.MouseButton1Click:Connect(function()
    local closestEnemy = findClosestEnemy()
    if closestEnemy then
        markEnemy(closestEnemy)
        teleportBehindEnemy(closestEnemy)
    else
        print("Nenhum inimigo encontrado")
    end
end)

