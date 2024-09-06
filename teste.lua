-- Estados de animação
hero.Humanoid.WalkState = Enum.HumanoidStateType.Walk
hero.Humanoid.RunState = Enum.HumanoidStateType.Run
hero.Humanoid.JumpState = Enum.HumanoidStateType.Jump
hero.Humanoid.DodgeState = Enum.HumanoidStateType.Dodge
hero.Humanoid.WaitState = Enum.HumanoidStateType.Wait
hero.Humanoid.RecoilState = Enum.HumanoidStateType.Recoil

-- Dicas de animação
hero.Humanoid:LoadAnimation("rbxassetid:1234567890"):Play()
hero.Humanoid:LoadAnimation("rbxassetid:9876543210"):Play()

-- Fatores de movimento
hero.Humanoid.MoveDirection = Vector3.new(0, 0, 0)
hero.Humanoid.WalkDirection = Vector3.new(0, 0, 0)
hero.Humanoid.RunDirection = Vector3.new(0, 0, 0)
hero.Humanoid.JumpDirection = Vector3.new(0, 0, 0)
hero.Humanoid.DodgeDirection = Vector3.new(0, 0, 0)

-- Funções do movimento
function hero.HeroMove()
    -- Script do movimento aqui...
end

function hero.FlowingWater()
    hero.Humanoid:ChangeState(Enum.HumanoidStateType.Dodge)
    -- Script da morte aqui...
end

function hero.Lethal()
    hero.Humanoid:ChangeState(Enum.HumanoidStateType.Recoil)
    -- Script da bind aqui...
end

function hero.HunterGraps()
    -- Script da teste aqui...
end

function hero.PreyPeril()
    hero.Humanoid:ChangeState(Enum.HumanoidStateType.Jump)
    -- Script da esquiva aqui...
end

-- Ativação dos movimentos
hero.Humanoid.StateChanged:Connect(function(oldState, newState)
    if newState == Enum.HumanoidStateType.Dodge then
        hero.FlowingWater()
    elseif newState == Enum.HumanoidStateType.Recoil then
        hero.Lethal()
    end
end)

hero:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    if hero.Humanoid.WalkState == Enum.HumanoidStateType.Walk then
        -- Script do andar...
    end
end)

hero:GetPropertyChangedSignal("RunSpeed"):Connect(function()
    if hero.Humanoid.RunState == Enum.HumanoidStateType.Run then
        -- Script da corrida...
    end
end)

hero:GetPropertyChangedSignal("JumpPower"):Connect(function()
    if hero.Humanoid.JumpState == Enum.HumanoidStateType.Jump then
        -- Script do salto...
    end
end)

-- Poder 5: Ao ser apertado da trás do jogador mais próximo e usa a habilidade 1
hero.Humanoid.PositionChanged:Connect(function(newPosition)
    if newPosition - hero.Humanoid.Position < 3 then
        hero.HunterGraps()
    end
end)

-- Desliga o script
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
