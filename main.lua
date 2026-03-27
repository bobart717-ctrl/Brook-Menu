-- Простой интерфейс для Brookhaven
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local human = character:WaitForChild("Humanoid")

-- Создаем GUI
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "BrookhavenMenu"

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 150, 0, 200)
mainFrame.Position = UDim2.new(0, 10, 0.4, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Active = true
mainFrame.Draggable = true -- Можно двигать по экрану

local title = Instance.new("TextLabel", mainFrame)
title.Text = "BROOK MENU"
title.Size = UDim2.new(1, 0, 0, 30)
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- Функция для создания кнопок
local function createButton(name, pos, callback)
    local btn = Instance.new("TextButton", mainFrame)
    btn.Text = name
    btn.Size = UDim2.new(0.9, 0, 0, 35)
    btn.Position = UDim2.new(0.05, 0, 0, pos)
    btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.MouseButton1Click:Connect(callback)
end

-- 1. Функция скорости
createButton("Speed 50", 40, function()
    player.Character.Humanoid.WalkSpeed = 50
end)

-- 2. Функция прыжка
createButton("High Jump", 85, function()
    player.Character.Humanoid.JumpPower = 100
end)

-- 3. Телепорт в банк (пример для Брукхейвена)
createButton("Teleport Bank", 130, function()
    player.Character.HumanoidRootPart.CFrame = CFrame.new(-442, 23, -283) -- Координаты банка
end)

-- 4. Сброс настроек
createButton("Reset All", 175, function()
    player.Character.Humanoid.WalkSpeed = 16
    player.Character.Humanoid.JumpPower = 50
end)
