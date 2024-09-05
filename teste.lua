-- URL do servidor para onde enviar os dados
local serverUrl = "https://60af20dd-528d-4c87-b354-8572f89f6b88-00-2lfz1g1a06tkk.kirk.replit.dev" -- Substitua pelo URL do seu servidor

-- Função para coletar informações dos objetos
local function collectObjectData()
    local objectData = {}
    
    local function traverseObject(object)
        table.insert(objectData, {
            Name = object.Name,
            Class = object.ClassName,
            Parent = object.Parent and object.Parent.Name or "None"
        })
        
        for _, child in pairs(object:GetChildren()) do
            traverseObject(child)
        end
    end

    -- Define as pastas a serem percorridas
    local foldersToTraverse = {
        game:GetService("Workspace"),
        game:GetService("ReplicatedStorage"),
        game:GetService("Players"),
        game:GetService("ServerStorage"),
        game:GetService("StarterPlayer"),
        game:GetService("StarterPack"),
        game:GetService("StarterGui"),
        game:GetService("Lighting"),
        game:GetService("Teams"),
        game:GetService("Chat"),
        -- Adicione mais serviços e pastas se necessário
    }

    -- Coleta dados de cada pasta definida
    for _, folder in pairs(foldersToTraverse) do
        traverseObject(folder)
    end

    return objectData
end

-- Função para enviar dados para o servidor
local function sendDataToServer(data)
    local HttpService = game:GetService("HttpService")
    local jsonData = HttpService:JSONEncode(data)
    
    local success, response = pcall(function()
        return HttpService:PostAsync(serverUrl, jsonData, Enum.HttpContentType.ApplicationJson)
    end)

    if success then
        print("Dados enviados com sucesso.")
    else
        warn("Falha ao enviar dados: " .. response)
    end
end

-- Coleta os dados e os envia para o servidor
local objectData = collectObjectData()
sendDataToServer(objectData)
