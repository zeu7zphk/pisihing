-- Cria uma GUI flutuante, arrastável e minimizável que mostra as animações
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Função para criar uma GUI flutuante
local function createDraggableGui()
    -- Cria a ScreenGui principal
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AnimationsGui"
    screenGui.Parent = playerGui
    screenGui.ResetOnSpawn = false

    -- Frame principal da GUI (flutuante)
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 300, 0, 400)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
    mainFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    mainFrame.BorderSizePixel = 0
    mainFrame.Draggable = true
    mainFrame.Active = true
    mainFrame.Parent = screenGui

    -- Botão para minimizar
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Text = "-"
    minimizeButton.Size = UDim2.new(0, 30, 0, 30)
    minimizeButton.Position = UDim2.new(1, -40, 0, 10)
    minimizeButton.Parent = mainFrame
    minimizeButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)

    -- Frame para exibir a lista de animações
    local animationsFrame = Instance.new("ScrollingFrame")
    animationsFrame.Size = UDim2.new(1, 0, 1, -50)
    animationsFrame.Position = UDim2.new(0, 0, 0, 50)
    animationsFrame.CanvasSize = UDim2.new(0, 0, 10, 0) -- Ajuste para rolagem
    animationsFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
    animationsFrame.BorderSizePixel = 0
    animationsFrame.Parent = mainFrame

    -- Função para alternar a visibilidade
    local isMinimized = false
    minimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        animationsFrame.Visible = not isMinimized
    end)

    return animationsFrame
end

-- Função para encontrar todas as animações no jogo
local function findAllAnimations()
    local animations = {}
    local function findAnimationsInInstance(instance)
        -- Procura por objetos de animação dentro da instância
        for _, obj in ipairs(instance:GetDescendants()) do
            if obj:IsA("Animation") then
                table.insert(animations, obj)
            end
        end
    end
    
    -- Procura no Workspace e nos armazenamentos comuns
    findAnimationsInInstance(game.Workspace)
    findAnimationsInInstance(game.ReplicatedStorage)
    findAnimationsInInstance(game.ServerStorage)
    
    -- Procura em outros locais do jogo que podem ter animações
    findAnimationsInInstance(game.StarterPlayer)
    findAnimationsInInstance(game.StarterCharacterScripts)
    
    return animations
end

-- Função para exibir as animações na GUI
local function displayAnimations(animations, animationsFrame, humanoid)
    -- Cria um Animator se o humanoid não tiver
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then
        animator = Instance.new("Animator")
        animator.Parent = humanoid
    end

    -- Exibe as animações encontradas
    for _, animation in ipairs(animations) do
        local button = Instance.new("TextButton")
        button.Text = animation.Name ~= "" and animation.Name or "Animation (ID: "..animation.AnimationId..")"
        button.Size = UDim2.new(1, 0, 0, 30)
        button.Parent = animationsFrame
        button.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
        button.TextColor3 = Color3.new(1, 1, 1)
        
        -- Quando o botão da animação for clicado, ela é executada
        button.MouseButton1Click:Connect(function()
            local animationTrack = animator:LoadAnimation(animation)
            animationTrack:Play()
        end)
    end
end

-- Função principal
local function main()
    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        -- Cria a GUI
        local animationsFrame = createDraggableGui()
        
        -- Busca e exibe todas as animações no jogo
        local animations = findAllAnimations()
        displayAnimations(animations, animationsFrame, humanoid)
    else
        warn("Humanoid não encontrado no personagem!")
    end
end

-- Executa o script
main()
