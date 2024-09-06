
local plr = game.Players.LocalPlayer
local chr = plr.Character
local hum = chr.Humanoid

-- Cria uma GUI e botão na tela
local gui = Instance.new("ScreenGui", plr.PlayerGui)
local button = Instance.new("TextButton", gui)
button.Position = UDim2.new(0, 0, 0.61, 0)
button.Size = UDim2.new(0, 61, 0, 55)
button.Text = "<"
button.TextScaled = true

-- Cria o frame e os botões dentro dele
local frame = Instance.new("Frame", gui)
frame.Position = UDim2.new(0.063, 0, 0.434, 0)
frame.Size = UDim2.new(0, 181, 0, 246)

local button1 = Instance.new("TextButton", frame)
button1.Position = UDim2.new(0, 0, 0, 0)
button1.Size = UDim2.new(0, 181, 0, 50)
button1.Text = "Saitama"

local button2 = Instance.new("TextButton", frame)
button2.Position = UDim2.new(0, 1, 0.200, 0)
button2.Size = UDim2.new(0, 181, 0, 50)
button2.Text = "Garou"

-- Conecta o botão 1 (Saitama) para equipar e usar ferramentas
button1.MouseButton1Click:Connect(function()
    -- Equipa a primeira ferramenta
    local tool = plr.Backpack["Slash"]
    tool.Parent = chr

    -- Espera antes de devolver a ferramenta ao Backpack
    wait(1.6)
    tool.Parent = plr.Backpack

    -- Equipa a segunda ferramenta
    local tool2 = plr.Backpack.Shove
    tool2.Parent = chr

    -- Espera antes de devolver a segunda ferramenta ao Backpack
    wait(1)
    tool2.Parent = plr.Backpack

    -- Envia um evento de servidor com as teclas pressionadas
    local args = {
        [1] = {
            ["Dash"] = Enum.KeyCode.W,
            ["Key"] = Enum.KeyCode.Q,
            ["Goal"] = "KeyPress"
        }
    }

    -- Dispara o evento de servidor
    game:GetService("Players").LocalPlayer.Character.Communicate:FireServer(unpack(args))
end)
