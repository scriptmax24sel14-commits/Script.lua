-- ═══════════════════════════════════════════════════════════
--  Swordhub | Break & Steal | HALLOWEEN RED 🎃
--  + FPS BOOST + LOOP MODE
-- ═══════════════════════════════════════════════════════════

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ═══════════════════════════════════════════════════════════
--  🚀 FPS BOOST (в самом начале)
-- ═══════════════════════════════════════════════════════════
pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
pcall(function()
    Lighting.GlobalShadows = false
    Lighting.ShadowSoftness = 0
    Lighting.FogEnd = 200
    Lighting.FogStart = 0
    Lighting.EnvironmentDiffuseScale = 0
    Lighting.EnvironmentSpecularScale = 0
end)

for _, effect in ipairs(Lighting:GetChildren()) do
    if effect:IsA("BlurEffect") or effect:IsA("SunRaysEffect")
        or effect:IsA("ColorCorrectionEffect") or effect:IsA("BloomEffect")
        or effect:IsA("DepthOfFieldEffect") then
        effect.Enabled = false
    end
end

task.spawn(function()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        local n = obj.Name:lower()
        if n:find("grass") or n:find("bush") or n:find("flower")
            or n:find("rock") or n:find("tree") or n:find("leaf")
            or n:find("particle") or n:find("smoke") or n:find("sparkle") then
            pcall(function() obj:Destroy() end)
        end
    end
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("ParticleEmitter") or obj:IsA("Trail")
            or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then
            pcall(function() obj.Enabled = false end)
        end
    end
end)

-- ID ХЭЛЛОУИН
local IMG_WEB    = "rbxassetid://111661100664834"
local IMG_GHOST  = "rbxassetid://131805536230965"
local IMG_HAT    = "rbxassetid://116044335978276"
local IMG_PUMPKIN= "rbxassetid://99128007730291"
local IMG_GARLAND= "rbxassetid://87282558544263"

local Config = {
    LoopMode = false,
    AutoBreak = false, AutoSteal = false, AutoTrain = false,
    AutoHatch = false, AutoSell = false, AutoUpgrade = false,
    AutoEquipBest = false, AutoClaim = false,
    SpeedEnabled = false, SpeedValue = 60, JumpEnabled = false, JumpValue = 100,
    InfiniteJump = false, FlyEnabled = false, FlySpeed = 80, Noclip = false,
    FullBright = false, EggESP = false, GuardESP = false, StealGod = false,
    AutoBreakRange = 60, StealHold = 1.5, TrainDelay = 1,
    LoopBaseWait = 1.5,
}

local OriginalLighting = {
    Brightness = Lighting.Brightness, Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient, FogEnd = Lighting.FogEnd, FogStart = Lighting.FogStart,
}

-- ═══════════════════════════════════════════════════════════
--  WINDOW
-- ═══════════════════════════════════════════════════════════
local Window = Rayfield:CreateWindow({
    Name = "🎃 Swordhub | Halloween",
    LoadingTitle = "🎃 Swordhub",
    LoadingSubtitle = "Loop Mode + FPS Boost",
    Theme = "Amethyst",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false,
})

-- КРАСНЫЙ ХЭЛЛОУИН ФОН
task.spawn(function()
    for i = 1, 50 do
        task.wait(0.4)
        local gui
        for _, parent in ipairs({game:GetService("CoreGui"), LocalPlayer:FindFirstChild("PlayerGui")}) do
            if parent then
                for _, o in ipairs(parent:GetChildren()) do
                    if o:IsA("ScreenGui") and (o.Name:lower():find("rayfield") or o.Name:lower():find("sirius")) then
                        gui = o; break
                    end
                end
            end
            if gui then break end
        end
        if gui and not gui:FindFirstChild("HalloweenRed") then
            for _, main in ipairs(gui:GetDescendants()) do
                if main:IsA("Frame") and (main.Name == "Main" or main.Name == "MainFrame") then
                    main.Size = UDim2.new(0, 720, 0, 520)
                    main.BackgroundColor3 = Color3.fromRGB(80, 10, 15)
                    main.BackgroundTransparency = 0.05

                    local web = Instance.new("ImageLabel")
                    web.Name = "HalloweenRed"
                    web.Size = UDim2.new(1, 0, 1, 0)
                    web.BackgroundTransparency = 1
                    web.Image = IMG_WEB
                    web.ImageColor3 = Color3.fromRGB(180, 30, 40)
                    web.ImageTransparency = 0.75
                    web.ScaleType = Enum.ScaleType.Crop
                    web.ZIndex = -1
                    web.Parent = main
                    local wc = Instance.new("UICorner") wc.CornerRadius = UDim.new(0, 12) wc.Parent = web

                    local ov = Instance.new("Frame")
                    ov.Size = UDim2.new(1, 0, 1, 0)
                    ov.BackgroundColor3 = Color3.fromRGB(120, 15, 20)
                    ov.BackgroundTransparency = 0.55
                    ov.BorderSizePixel = 0
                    ov.ZIndex = -1
                    ov.Parent = main
                    local oc = Instance.new("UICorner") oc.CornerRadius = UDim.new(0, 12) oc.Parent = ov

                    local garland = Instance.new("ImageLabel")
                    garland.Size = UDim2.new(1, -10, 0, 30)
                    garland.Position = UDim2.new(0, 5, 0, 42)
                    garland.BackgroundTransparency = 1
                    garland.Image = IMG_GARLAND
                    garland.ScaleType = Enum.ScaleType.Stretch
                    garland.ZIndex = 5
                    garland.Parent = main

                    for _, x in ipairs({40, 180, 320, 460, 600}) do
                        local pk = Instance.new("ImageLabel")
                        pk.Size = UDim2.new(0, 35, 0, 35)
                        pk.Position = UDim2.new(0, x, 0, 30)
                        pk.BackgroundTransparency = 1
                        pk.Image = IMG_PUMPKIN
                        pk.ScaleType = Enum.ScaleType.Fit
                        pk.ZIndex = 6
                        pk.Parent = main
                    end

                    local ghost = Instance.new("ImageLabel")
                    ghost.Size = UDim2.new(0, 70, 0, 70)
                    ghost.Position = UDim2.new(0, -15, 0, -20)
                    ghost.BackgroundTransparency = 1
                    ghost.Image = IMG_GHOST
                    ghost.ScaleType = Enum.ScaleType.Fit
                    ghost.ZIndex = 10
                    ghost.Parent = main

                    local hat = Instance.new("ImageLabel")
                    hat.Size = UDim2.new(0, 70, 0, 70)
                    hat.Position = UDim2.new(1, -60, 0, -25)
                    hat.BackgroundTransparency = 1
                    hat.Image = IMG_HAT
                    hat.ScaleType = Enum.ScaleType.Fit
                    hat.ZIndex = 10
                    hat.Parent = main

                    return
                end
            end
        end
    end
end)

-- ═══════════════════════════════════════════════════════════
--  ХЕЛПЕРЫ
-- ═══════════════════════════════════════════════════════════
local function GetHRP() local c = LocalPlayer.Character; return c and c:FindFirstChild("HumanoidRootPart") end
local function GetHumanoid() local c = LocalPlayer.Character; return c and c:FindFirstChildOfClass("Humanoid") end

local function IsEgg(obj)
    if not obj or not obj.Name then return false end
    return obj.Name:lower():find("egg") ~= nil
end

local function IsGuard(obj)
    if not obj or not obj.Name then return false end
    local n = obj.Name:lower()
    if n:find("guard") or n:find("enemy") or n:find("npc")
        or n:find("cop") or n:find("security") or n:find("watch")
        or n:find("protect") or n:find("defend") then return true end
    if obj:IsA("Model") and obj:FindFirstChildOfClass("Humanoid") then
        if not Players:GetPlayerFromCharacter(obj) then return true end
    end
    return false
end

local function GetObjPos(obj)
    if not obj then return nil end
    if obj:IsA("BasePart") then return obj.Position end
    if obj:IsA("Model") then
        local p = obj:FindFirstChild("HumanoidRootPart") or obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
        return p and p.Position
    end
end

local cachedEggs, cachedGuards, cachedLastUpdate = {}, {}, 0
local function RefreshCache()
    if tick() - cachedLastUpdate < 1.0 then return end
    cachedLastUpdate = tick()
    cachedEggs, cachedGuards = {}, {}
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if IsEgg(obj) then table.insert(cachedEggs, obj)
        elseif IsGuard(obj) then table.insert(cachedGuards, obj) end
    end
end

local function GetPrompts(obj)
    if not obj then return {} end
    local list = {}
    for _, d in ipairs(obj:GetDescendants()) do
        if d:IsA("ProximityPrompt") then table.insert(list, d) end
    end
    return list
end

local function TriggerPrompt(p)
    if not p then return end
    pcall(function()
        p:InputHoldBegin()
        if p.HoldDuration and p.HoldDuration > 0 then task.wait(p.HoldDuration) end
        p:InputHoldEnd()
    end)
end

local function TapAt(x, y, hold)
    hold = hold or 0.15
    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 1)
        task.wait(hold)
        VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 1)
    end)
end

local function HoldAt(x, y, holdTime)
    holdTime = holdTime or 1.5
    pcall(function()
        VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 1)
        task.wait(holdTime)
        VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 1)
    end)
end

local function GetPickaxe()
    local char = LocalPlayer.Character
    if char then
        for _, item in ipairs(char:GetChildren()) do
            if item:IsA("Tool") then
                local n = item.Name:lower()
                if n:find("pick") or n:find("axe") or n:find("hammer") then return item end
            end
        end
    end
    local bp = LocalPlayer:FindFirstChild("Backpack")
    if bp then
        for _, item in ipairs(bp:GetChildren()) do
            if item:IsA("Tool") then
                local n = item.Name:lower()
                if n:find("pick") or n:find("axe") or n:find("hammer") then return item end
            end
        end
    end
    return nil
end

-- Поиск базы
local function GetBasePosition()
    -- 1. Ищем по имени
    for _, obj in ipairs(Workspace:GetDescendants()) do
        local n = obj.Name:lower()
        if n == "your base" or n == "yourbase" or n:find("yourbase") then
            local pos = GetObjPos(obj)
            if pos then return pos end
        end
    end
    -- 2. Ищем плот с владельцем
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if obj:IsA("Model") and (obj.Name:lower():find("plot") or obj.Name:lower():find("base")) then
            for _, d in ipairs(obj:GetDescendants()) do
                if d:IsA("ObjectValue") or d:IsA("StringValue") then
                    if tostring(d.Value) == LocalPlayer.Name or d.Value == LocalPlayer then
                        local pos = GetObjPos(obj)
                        if pos then return pos end
                    end
                end
            end
        end
    end
    -- 3. Fallback — спавн
    return Vector3.new(0, 50, 0)
end

-- ═══════════════════════════════════════════════════════════
--  TABS
-- ═══════════════════════════════════════════════════════════
local MainTab = Window:CreateTab("Main", 4483362458)
local EggsTab = Window:CreateTab("Eggs", 4483362458)
local MoveTab = Window:CreateTab("Move", 4483362458)
local VisTab = Window:CreateTab("Visuals", 4483362458)
local SetTab = Window:CreateTab("Settings", 4483362458)

local GodConn
local function SetGod(state)
    Config.StealGod = state
    if GodConn then GodConn:Disconnect() end
    if state then
        GodConn = RunService.Heartbeat:Connect(function()
            local h = GetHumanoid()
            if h then h.MaxHealth = math.huge; h.Health = math.huge end
        end)
    end
end

-- ═══════════════════════════════════════════════════════════
--  🔄 LOOP MODE (автоматический цикл)
-- ═══════════════════════════════════════════════════════════
local LoopRunning = false
MainTab:CreateSection("Loop Mode (Auto Cycle)")

MainTab:CreateToggle({
    Name = "🔄 Loop Mode (Всё автоматом)",
    CurrentValue = false,
    Flag = "LoopMode",
    Callback = function(state)
        Config.LoopMode = state
        if state and not LoopRunning then
            LoopRunning = true
            task.spawn(function()
                while Config.LoopMode do
                    -- 1. Ломаем яйцо
                    pcall(function()
                        local char = LocalPlayer.Character
                        local hum = char and char:FindFirstChildOfClass("Humanoid")
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        if not hum or not hrp then return end

                        local pick = GetPickaxe()
                        if pick and pick.Parent ~= char then
                            pcall(function() hum:EquipTool(pick) end)
                            task.wait(0.2)
                        end

                        RefreshCache()
                        local myPos = hrp.Position
                        local best, bestDist = nil, Config.AutoBreakRange
                        for _, egg in ipairs(cachedEggs) do
                            if egg:IsA("BasePart") and egg.Transparency >= 1 then continue end
                            local pos = GetObjPos(egg)
                            if pos then
                                local d = (pos - myPos).Magnitude
                                if d < bestDist then bestDist = d; best = egg end
                            end
                        end

                        if best then
                            local pos = GetObjPos(best)
                            hrp.CFrame = CFrame.new(pos + Vector3.new(0, 2, 0))
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, pos)
                            task.wait(0.05)
                            local sp, onScreen = Camera:WorldToViewportPoint(pos)
                            if onScreen then TapAt(sp.X, sp.Y, 0.15)
                            else TapAt(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2, 0.15) end
                            if pick then pcall(function() pick:Activate() end) end
                            for _, p in ipairs(GetPrompts(best)) do TriggerPrompt(p) end
                        end
                    end)
                    if not Config.LoopMode then break end
                    task.wait(1)

                    -- 2. Забираем питомца
                    pcall(function()
                        local hrp = GetHRP()
                        if not hrp then return end
                        local best, bestDist = nil, 500
                        for _, obj in ipairs(Workspace:GetDescendants()) do
                            local n = obj.Name:lower()
                            local steal = false
                            if obj:IsA("Tool") then steal = true end
                            if n:find("pet") and not Players:GetPlayerFromCharacter(obj.Parent) then steal = true end
                            if n:find("drop") or n:find("steal") then steal = true end
                            if steal then
                                local pos = GetObjPos(obj)
                                if pos then
                                    local d = (pos - hrp.Position).Magnitude
                                    if d < bestDist then bestDist = d; best = obj end
                                end
                            end
                        end
                        if best then
                            local pos = GetObjPos(best)
                            hrp.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
                            task.wait(0.1)
                            local sp, onScreen = Camera:WorldToViewportPoint(pos)
                            if onScreen then HoldAt(sp.X, sp.Y, Config.StealHold)
                            else HoldAt(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2, Config.StealHold) end
                            for _, p in ipairs(GetPrompts(best)) do TriggerPrompt(p) end
                            if best:IsA("Tool") then
                                local bp = LocalPlayer:FindFirstChild("Backpack")
                                if bp then pcall(function() best.Parent = bp end) end
                            end
                        end
                    end)
                    if not Config.LoopMode then break end
                    task.wait(1)

                    -- 3. ТП на базу
                    pcall(function()
                        local hrp = GetHRP()
                        if not hrp then return end
                        local basePos = GetBasePosition()
                        hrp.CFrame = CFrame.new(basePos + Vector3.new(0, 3, 0))
                    end)
                    task.wait(Config.LoopBaseWait)
                    if not Config.LoopMode then break end

                    -- 4. Открыть меню питомцев (тап по 🐾 в правом нижнем углу)
                    pcall(function()
                        local vp = Camera.ViewportSize
                        TapAt(vp.X - 60, vp.Y - 180, 0.2)
                    end)
                    task.wait(0.8)
                    if not Config.LoopMode then break end

                    -- 5. Нажать Equip Best
                    pcall(function()
                        local pg = LocalPlayer:FindFirstChild("PlayerGui")
                        if pg then
                            for _, d in ipairs(pg:GetDescendants()) do
                                if d:IsA("TextButton") and d.Visible and d.Active then
                                    local t = d.Text:lower()
                                    if t:find("equip best") then
                                        pcall(function() d:Activate() end)
                                        local pos = d.AbsolutePosition + d.AbsoluteSize / 2
                                        TapAt(pos.X, pos.Y, 0.1)
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(0.5)

                    -- 6. Закрыть меню (тап по красной стрелке — приблизительно)
                    pcall(function()
                        local vp = Camera.ViewportSize
                        TapAt(vp.X / 2, vp.Y / 2 - 50, 0.15)
                    end)
                    task.wait(0.5)
                end
                LoopRunning = false
            end)
        end
    end
})

-- ═══════════════════════════════════════════════════════════
--  AUTO BREAK (отдельно)
-- ═══════════════════════════════════════════════════════════
MainTab:CreateSection("Manual Auto Farm")

local AutoBreakRunning = false
MainTab:CreateToggle({
    Name = "Auto Break",
    CurrentValue = false,
    Flag = "AutoBreak",
    Callback = function(state)
        Config.AutoBreak = state
        if state and not AutoBreakRunning then
            AutoBreakRunning = true
            task.spawn(function()
                while Config.AutoBreak do
                    if Config.AutoSteal or Config.LoopMode then task.wait(0.5) continue end
                    pcall(function()
                        local char = LocalPlayer.Character
                        local hum = char and char:FindFirstChildOfClass("Humanoid")
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        if not hum or not hrp then task.wait(0.2) return end

                        local pick = GetPickaxe()
                        if pick and pick.Parent ~= char then
                            pcall(function() hum:EquipTool(pick) end)
                            task.wait(0.2)
                        end

                        RefreshCache()
                        local myPos = hrp.Position
                        local best, bestDist = nil, Config.AutoBreakRange
                        for _, egg in ipairs(cachedEggs) do
                            if egg:IsA("BasePart") and egg.Transparency >= 1 then continue end
                            local pos = GetObjPos(egg)
                            if pos then
                                local d = (pos - myPos).Magnitude
                                if d < bestDist then bestDist = d; best = egg end
                            end
                        end

                        if best then
                            local pos = GetObjPos(best)
                            hrp.CFrame = CFrame.new(pos + Vector3.new(0, 2, 0))
                            Camera.CFrame = CFrame.new(Camera.CFrame.Position, pos)
                            task.wait(0.05)
                            local sp, onScreen = Camera:WorldToViewportPoint(pos)
                            if onScreen then TapAt(sp.X, sp.Y, 0.15)
                            else TapAt(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2, 0.15) end
                            if pick then pcall(function() pick:Activate() end) end
                            for _, p in ipairs(GetPrompts(best)) do TriggerPrompt(p) end
                            task.wait(5)
                        else
                            task.wait(0.3)
                        end
                    end)
                    task.wait(0.2)
                end
                AutoBreakRunning = false
            end)
        end
    end
})

-- AUTO STEAL (отдельно)
local AutoStealRunning = false
MainTab:CreateToggle({
    Name = "Auto Steal (Hold 1.5s)",
    CurrentValue = false,
    Flag = "AutoSteal",
    Callback = function(state)
        Config.AutoSteal = state
        SetGod(state)
        if state and not AutoStealRunning then
            AutoStealRunning = true
            task.spawn(function()
                while Config.AutoSteal do
                    pcall(function()
                        local hrp = GetHRP()
                        if not hrp then return end
                        local best, bestDist = nil, 1000
                        for _, obj in ipairs(Workspace:GetDescendants()) do
                            local n = obj.Name:lower()
                            local steal = false
                            if obj:IsA("Tool") then steal = true end
                            if n:find("pet") and not Players:GetPlayerFromCharacter(obj.Parent) then steal = true end
                            if n:find("drop") or n:find("steal") then steal = true end
                            if steal then
                                local pos = GetObjPos(obj)
                                if pos then
                                    local d = (pos - hrp.Position).Magnitude
                                    if d < bestDist then bestDist = d; best = obj end
                                end
                            end
                        end
                        if best then
                            local pos = GetObjPos(best)
                            hrp.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
                            task.wait(0.1)
                            local sp, onScreen = Camera:WorldToViewportPoint(pos)
                            if onScreen then HoldAt(sp.X, sp.Y, Config.StealHold)
                            else HoldAt(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2, Config.StealHold) end
                            for _, p in ipairs(GetPrompts(best)) do TriggerPrompt(p) end
                            if best:IsA("Tool") then
                                local bp = LocalPlayer:FindFirstChild("Backpack")
                                if bp then pcall(function() best.Parent = bp end) end
                            end
                        end
                    end)
                    task.wait(0.3)
                end
                AutoStealRunning = false
            end)
        end
    end
})

-- ═══════════════════════════════════════════════════════════
--  AUTO TRAIN
-- ═══════════════════════════════════════════════════════════
local TrainRunning = false
MainTab:CreateToggle({
    Name = "Auto Train (Treadmill)",
    CurrentValue = false,
    Flag = "AutoTrain",
    Callback = function(state)
        Config.AutoTrain = state
        if state and not TrainRunning then
            TrainRunning = true
            task.spawn(function()
                while Config.AutoTrain do
                    pcall(function()
                        local hrp = GetHRP()
                        if not hrp then return end
                        local treadmill = nil
                        for _, obj in ipairs(Workspace:GetDescendants()) do
                            if obj.Name:lower():find("treadmill") then
                                treadmill = obj; break
                            end
                        end
                        if treadmill then
                            local pos = GetObjPos(treadmill)
                            if pos then
                                hrp.CFrame = CFrame.new(pos + Vector3.new(0, 3.5, 0))
                                task.wait(0.1)
                                for _, p in ipairs(GetPrompts(treadmill)) do TriggerPrompt(p) end
                            end
                        end
                    end)
                    task.wait(Config.TrainDelay)
                end
                TrainRunning = false
            end)
        end
    end
})

MainTab:CreateSlider({
    Name = "Train Delay", Range = {0.5, 5}, Increment = 0.5, CurrentValue = 1,
    Callback = function(v) Config.TrainDelay = v end
})

-- AUTO EQUIP BEST (отдельно)
local EquipRunning = false
MainTab:CreateToggle({
    Name = "Auto Equip Best",
    CurrentValue = false,
    Flag = "AutoEquipBest",
    Callback = function(state)
        Config.AutoEquipBest = state
        if state and not EquipRunning then
            EquipRunning = true
            task.spawn(function()
                while Config.AutoEquipBest do
                    pcall(function()
                        local pg = LocalPlayer:FindFirstChild("PlayerGui")
                        if pg then
                            for _, d in ipairs(pg:GetDescendants()) do
                                if d:IsA("TextButton") and d.Visible and d.Active then
                                    local t = d.Text:lower()
                                    if t:find("equip best") then
                                        pcall(function() d:Activate() end)
                                        local pos = d.AbsolutePosition + d.AbsoluteSize / 2
                                        TapAt(pos.X, pos.Y, 0.1)
                                    end
                                end
                            end
                        end
                    end)
                    task.wait(2)
                end
                EquipRunning = false
            end)
        end
    end
})

-- ═══════════════════════════════════════════════════════════
--  AUTO PROGRESS
-- ═══════════════════════════════════════════════════════════
MainTab:CreateSection("Auto Progress")

local function MakePromptFarm(name, keywords, flag)
    local run = false
    MainTab:CreateToggle({
        Name = name, CurrentValue = false, Flag = flag,
        Callback = function(state)
            if state and not run then
                run = true
                task.spawn(function()
                    while _G[flag] do
                        pcall(function()
                            for _, obj in ipairs(Workspace:GetDescendants()) do
                                if obj:IsA("ProximityPrompt") then
                                    local txt = (obj.ActionText .. " " .. obj.ObjectText):lower()
                                    for _, kw in ipairs(keywords) do
                                        if txt:find(kw) then TriggerPrompt(obj); break end
                                    end
                                end
                            end
                        end)
                        task.wait(1.5)
                    end
                    run = false
                end)
            end
            _G[flag] = state
        end
    })
end

MakePromptFarm("Auto Hatch", {"hatch", "open"}, "AutoHatch")
MakePromptFarm("Auto Sell", {"sell"}, "AutoSell")

-- ═══════════════════════════════════════════════════════════
--  EGGS TAB
-- ═══════════════════════════════════════════════════════════
EggsTab:CreateSection("Range")
EggsTab:CreateSlider({
    Name = "Break Range", Range = {10, 200}, Increment = 5, CurrentValue = 60,
    Callback = function(v) Config.AutoBreakRange = v end
})

EggsTab:CreateSection("ESP")

local EggESPConn
EggsTab:CreateToggle({
    Name = "Egg ESP (жёлтый)", CurrentValue = false, Flag = "EggESP",
    Callback = function(state)
        Config.EggESP = state
        if EggESPConn then EggESPConn:Disconnect() end
        if state then
            EggESPConn = RunService.Heartbeat:Connect(function()
                RefreshCache()
                for _, egg in ipairs(cachedEggs) do
                    if not egg:FindFirstChild("SH_EggESP") then
                        local hl = Instance.new("Highlight")
                        hl.Name = "SH_EggESP"
                        hl.FillColor = Color3.fromRGB(255, 200, 50)
                        hl.OutlineColor = Color3.fromRGB(255, 200, 50)
                        hl.FillTransparency = 0.6
                        hl.OutlineTransparency = 0
                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        hl.Parent = egg
                    end
                end
            end)
        else
            for _, obj in ipairs(Workspace:GetDescendants()) do
                local hl = obj:FindFirstChild("SH_EggESP")
                if hl then hl:Destroy() end
            end
        end
    end
})

local GuardESPConn
EggsTab:CreateToggle({
    Name = "Guard ESP (красный)", CurrentValue = false, Flag = "GuardESP",
    Callback = function(state)
        Config.GuardESP = state
        if GuardESPConn then GuardESPConn:Disconnect() end
        if state then
            GuardESPConn = RunService.Heartbeat:Connect(function()
                RefreshCache()
                for _, g in ipairs(cachedGuards) do
                    if not g:FindFirstChild("SH_GuardESP") then
                        local hl = Instance.new("Highlight")
                        hl.Name = "SH_GuardESP"
                        hl.FillColor = Color3.fromRGB(255, 40, 40)
                        hl.OutlineColor = Color3.fromRGB(255, 0, 0)
                        hl.FillTransparency = 0.55
                        hl.OutlineTransparency = 0
                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        hl.Parent = g
                    end
                end
            end)
        else
            for _, obj in ipairs(Workspace:GetDescendants()) do
                local hl = obj:FindFirstChild("SH_GuardESP")
                if hl then hl:Destroy() end
            end
        end
    end
})

-- ═══════════════════════════════════════════════════════════
--  MOVEMENT
-- ═══════════════════════════════════════════════════════════
local SpeedConn
MoveTab:CreateToggle({
    Name = "Speed Hack", CurrentValue = false, Flag = "Speed",
    Callback = function(state)
        Config.SpeedEnabled = state
        if SpeedConn then SpeedConn:Disconnect() end
        if state then
            SpeedConn = RunService.Heartbeat:Connect(function()
                local h = GetHumanoid()
                if h and not h.PlatformStand then h.WalkSpeed = Config.SpeedValue end
            end)
        else
            local h = GetHumanoid(); if h then h.WalkSpeed = 16 end
        end
    end
})
MoveTab:CreateSlider({
    Name = "Walk Speed", Range = {16, 300}, Increment = 1, CurrentValue = 60,
    Callback = function(v)
        Config.SpeedValue = v
        if Config.SpeedEnabled then local h = GetHumanoid(); if h then h.WalkSpeed = v end end
    end
})

local JumpConn
MoveTab:CreateToggle({
    Name = "High Jump", CurrentValue = false, Flag = "Jump",
    Callback = function(state)
        Config.JumpEnabled = state
        if JumpConn then JumpConn:Disconnect() end
        if state then
            JumpConn = RunService.Heartbeat:Connect(function()
                local h = GetHumanoid()
                if h then
                    if h.UseJumpPower then h.JumpPower = Config.JumpValue else h.JumpHeight = Config.JumpValue end
                end
            end)
        end
    end
})
MoveTab:CreateSlider({
    Name = "Jump Power", Range = {50, 500}, Increment = 10, CurrentValue = 100,
    Callback = function(v)
        Config.JumpValue = v
        local h = GetHumanoid()
        if h and Config.JumpEnabled then
            if h.UseJumpPower then h.JumpPower = v else h.JumpHeight = v end
        end
    end
})

local InfJumpConn
MoveTab:CreateToggle({
    Name = "Infinite Jump", CurrentValue = false, Flag = "InfJump",
    Callback = function(state)
        Config.InfiniteJump = state
        if InfJumpConn then InfJumpConn:Disconnect() end
        if state then
            InfJumpConn = UserInputService.JumpRequest:Connect(function()
                local h = GetHumanoid()
                if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
        end
    end
})

local FlyConn
MoveTab:CreateToggle({
    Name = "Fly", CurrentValue = false, Flag = "Fly",
    Callback = function(state)
        Config.FlyEnabled = state
        if FlyConn then FlyConn:Disconnect() end
        if state then
            local h = GetHumanoid(); if h then h.PlatformStand = true end
            FlyConn = RunService.RenderStepped:Connect(function(dt)
                local hrp = GetHRP(); if not hrp then return end
                local camLook = Camera.CFrame.LookVector
                local camRight = Camera.CFrame.RightVector
                local md = Vector3.zero
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then md += camLook end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then md -= camLook end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then md += camRight end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then md -= camRight end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then md += Vector3.new(0,1,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then md -= Vector3.new(0,1,0) end
                if md.Magnitude > 0 then md = md.Unit end
                hrp.AssemblyLinearVelocity = Vector3.zero
                hrp.AssemblyAngularVelocity = Vector3.zero
                hrp.CFrame = CFrame.new(hrp.Position + md * Config.FlySpeed * dt) * Camera.CFrame.Rotation
            end)
        else
            local h = GetHumanoid()
            if h then h.PlatformStand = false; h:ChangeState(Enum.HumanoidStateType.GettingUp) end
        end
    end
})
MoveTab:CreateSlider({
    Name = "Fly Speed", Range = {20, 250}, Increment = 5, CurrentValue = 80,
    Callback = function(v) Config.FlySpeed = v end
})

local NoclipConn
MoveTab:CreateToggle({
    Name = "Noclip", CurrentValue = false, Flag = "Noclip",
    Callback = function(state)
        Config.Noclip = state
        if NoclipConn then NoclipConn:Disconnect() end
        if state then
            NoclipConn = RunService.Stepped:Connect(function()
                if LocalPlayer.Character then
                    for _, p in ipairs(LocalPlayer.Character:GetDescendants()) do
                        if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
                    end
                end
            end)
        end
    end
})

-- ═══════════════════════════════════════════════════════════
--  VISUALS
-- ═══════════════════════════════════════════════════════════
VisTab:CreateToggle({
    Name = "Full Bright", CurrentValue = false, Flag = "FullBright",
    Callback = function(state)
        Config.FullBright = state
        if state then
            Lighting.Brightness = 3
            Lighting.Ambient = Color3.fromRGB(200, 200, 200)
            Lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 200)
            Lighting.FogEnd = 100000
            Lighting.FogStart = 0
        else
            Lighting.Brightness = OriginalLighting.Brightness
            Lighting.Ambient = OriginalLighting.Ambient
            Lighting.OutdoorAmbient = OriginalLighting.OutdoorAmbient
            Lighting.FogEnd = OriginalLighting.FogEnd
            Lighting.FogStart = OriginalLighting.FogStart
        end
    end
})

-- ═══════════════════════════════════════════════════════════
--  SETTINGS
-- ═══════════════════════════════════════════════════════════
SetTab:CreateSection("Loop Settings")
SetTab:CreateSlider({
    Name = "Hold Time (сек)", Range = {0.5, 3}, Increment = 0.1, CurrentValue = 1.5,
    Callback = function(v) Config.StealHold = v end
})
SetTab:CreateSlider({
    Name = "Base Wait (сек)", Range = {0.5, 5}, Increment = 0.5, CurrentValue = 1.5,
    Callback = function(v) Config.LoopBaseWait = v end
})

SetTab:CreateSection("Server")
SetTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer) end
})

-- ═══════════════════════════════════════════════════════════
--  РЕСПАВН
-- ═══════════════════════════════════════════════════════════
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if Config.SpeedEnabled then local h = GetHumanoid(); if h then h.WalkSpeed = Config.SpeedValue end end
    if Config.JumpEnabled then
        local h = GetHumanoid()
        if h then
            if h.UseJumpPower then h.JumpPower = Config.JumpValue else h.JumpHeight = Config.JumpValue end
        end
    end
end)
