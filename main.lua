local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Brookhaven VIP | Bobart717",
   LoadingTitle = "Загрузка чит-меню...",
   LoadingSubtitle = "by bobart717-ctrl",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "BrookhavenConfig", 
      FileName = "MainGui"
   }
})

-- ВКЛАДКА: Игрок
local PlayerTab = Window:CreateTab("Игрок", 4483362458) -- Иконка человечка

local SpeedSlider = PlayerTab:CreateSlider({
   Name = "Скорость бега",
   Range = {16, 300},
   Increment = 1,
   Suffix = " SPD",
   CurrentValue = 16,
   Flag = "Slider1", 
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local JumpSlider = PlayerTab:CreateSlider({
   Name = "Сила прыжка",
   Range = {50, 500},
   Increment = 1,
   Suffix = " JP",
   CurrentValue = 50,
   Flag = "Slider2", 
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

-- ВКЛАДКА: Читы
local CheatsTab = Window:CreateTab("Читы", 4483345998)

local FlyToggle = CheatsTab:CreateToggle({
   Name = "Полет (Fly)",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      if Value then
          -- Логика полета (упрощенная)
          _G.Fly = true
          local p = game.Players.LocalPlayer
          local char = p.Character
          local mouse = p:GetMouse()
          local lpart = char.HumanoidRootPart
          local bg = Instance.new("BodyGyro", lpart)
          bg.P = 9e4
          bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
          bg.cframe = lpart.CFrame
          local bv = Instance.new("BodyVelocity", lpart)
          bv.velocity = Vector3.new(0,0.1,0)
          bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
          spawn(function()
              while _G.Fly do
                  wait()
                  p.Character.Humanoid.PlatformStand = true
                  bv.velocity = mouse.Hit.lookVector * 100
                  bg.cframe = CFrame.new(lpart.Position, mouse.Hit.p)
              end
              bg:Destroy()
              bv:Destroy()
              p.Character.Humanoid.PlatformStand = false
          end)
      else
          _G.Fly = false
      end
   end,
})

-- ВКЛАДКА: Телепорты
local TeleportTab = Window:CreateTab("Телепорты", 4483345998)

TeleportTab:CreateButton({
   Name = "Телепорт в Банк",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-442, 23, -283)
      Rayfield:Notify({Title = "Успех", Content = "Вы в банке!", Duration = 3})
   end,
})

TeleportTab:CreateButton({
   Name = "Сейф (Внутри)",
   Callback = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-437, 23, -272)
   end,
})
