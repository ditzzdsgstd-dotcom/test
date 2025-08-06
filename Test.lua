local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Load Screen
local Window = Rayfield:CreateWindow({
    Name = "YoxanXHub V2.0 | Steal a Brainrot",
    LoadingTitle = "YoxanXHub Loader",
    LoadingSubtitle = "Teleporting to UI...",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = true,
        Invite = "nu7H3U9C",
        RememberJoins = false
    },
    KeySystem = false
})

-- Tabs
local MainTab = Window:CreateTab("Main", 4483362458) -- Steal, Godmode, Auto
local VisualTab = Window:CreateTab("Visuals", 4483362458) -- ESP, Colors
local TeleportTab = Window:CreateTab("Teleport", 4483362458) -- TP to base, sky, inside
local MiscTab = Window:CreateTab("Misc", 4483362458) -- Settings, Credits

-- Section Placeholder (to be filled in Part 2/10 and beyond)
MainTab:CreateParagraph({Title = "YoxanXHub Initialized", Content = "Welcome to Part 1/10. More features soon."})

-- Auto UI toggle if closed
local openButton = Instance.new("ScreenGui", game.CoreGui)
local btn = Instance.new("TextButton", openButton)
btn.Size = UDim2.new(0, 140, 0, 40)
btn.Position = UDim2.new(0, 20, 0.5, -20)
btn.Text = "Open YoxanXHub"
btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
btn.TextColor3 = Color3.new(1, 1, 1)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 16
btn.BorderSizePixel = 0
btn.Visible = true
btn.AutoButtonColor = true
btn.MouseButton1Click:Connect(function()
    Rayfield:ToggleUI()
end)

-- === AUTO STEAL ===
local autoSteal = false
MainTab:CreateToggle({
    Name = "Auto Steal",
    CurrentValue = false,
    Callback = function(v)
        autoSteal = v
    end
})

task.spawn(function()
    while task.wait(0.25) do
        if autoSteal then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("ProximityPrompt") and v.ObjectText == "Steal" then
                    fireproximityprompt(v)
                end
            end
        end
    end
end)

-- === GOD MODE ===
local godEnabled = false
MainTab:CreateToggle({
    Name = "God Mode (Basic)",
    CurrentValue = false,
    Callback = function(state)
        godEnabled = state
        local player = game.Players.LocalPlayer
        if state then
            local function applyGod()
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                    player.Character.Humanoid.Health = 999999
                end
            end
            applyGod()
            player.CharacterAdded:Connect(function()
                if godEnabled then applyGod() end
            end)
        end
    end
})

-- === ESP BRAINROT PREVIEW ===
local brainrotESP = false
VisualTab:CreateToggle({
    Name = "ESP Brainrots (Preview)",
    CurrentValue = false,
    Callback = function(v)
        brainrotESP = v
    end
})

task.spawn(function()
    while task.wait(1) do
        if brainrotESP then
            for _, npc in pairs(workspace:GetDescendants()) do
                if npc:IsA("Model") and npc:FindFirstChild("Head") and not npc:FindFirstChild("YoxanXESP") then
                    local tag = Instance.new("BillboardGui", npc.Head)
                    tag.Name = "YoxanXESP"
                    tag.Size = UDim2.new(0, 100, 0, 30)
                    tag.StudsOffset = Vector3.new(0, 2, 0)
                    tag.AlwaysOnTop = true

                    local label = Instance.new("TextLabel", tag)
                    label.Size = UDim2.new(1, 0, 1, 0)
                    label.BackgroundTransparency = 1
                    label.TextColor3 = Color3.new(1, 1, 0)
                    label.TextStrokeTransparency = 0
                    label.TextScaled = true
                    label.Text = "[Brainrot]"
                    label.Font = Enum.Font.GothamBold
                end
            end
        else
            for _, tag in pairs(workspace:GetDescendants()) do
                if tag:IsA("BillboardGui") and tag.Name == "YoxanXESP" then
                    tag:Destroy()
                end
            end
        end
    end
end)

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local function safeTP(pos)
    if hrp and typeof(pos) == "Vector3" then
        hrp.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
    end
end

PlayerTab:CreateButton({
    Name = "Teleport To Sky",
    Callback = function()
        safeTP(Vector3.new(hrp.Position.X, 1000, hrp.Position.Z))
    end
})

PlayerTab:CreateButton({
    Name = "Teleport Down",
    Callback = function()
        safeTP(Vector3.new(hrp.Position.X, -100, hrp.Position.Z))
    end
})

PlayerTab:CreateButton({
    Name = "TP Forward (Bypass Walls)",
    Callback = function()
        local forward = hrp.CFrame.LookVector * 15
        hrp.CFrame = hrp.CFrame + forward
    end
})

PlayerTab:CreateButton({
    Name = "TP to Random Base",
    Callback = function()
        local bases = {}
        for _, model in pairs(workspace:GetChildren()) do
            if model:IsA("Model") and model:FindFirstChild("Baseplate") then
                table.insert(bases, model)
            end
        end
        if #bases > 0 then
            local chosen = bases[math.random(1, #bases)]
            if chosen:FindFirstChild("Baseplate") then
                safeTP(chosen.Baseplate.Position)
            end
        end
    end
})

-- === ESP Setup ===
local espEnabled = false
local espObjects = {}

function clearESP()
    for _, v in ipairs(espObjects) do
        v:Destroy()
    end
    table.clear(espObjects)
end

function createESP(target, color, label)
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.AlwaysOnTop = true
    BillboardGui.Size = UDim2.new(0, 100, 0, 20)
    BillboardGui.Adornee = target
    BillboardGui.Name = "YoxanX_ESP"

    local TextLabel = Instance.new("TextLabel", BillboardGui)
    TextLabel.Text = label
    TextLabel.TextColor3 = color
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.TextScaled = true

    BillboardGui.Parent = target
    table.insert(espObjects, BillboardGui)
end

function scanESP()
    clearESP()
    for _, v in ipairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local color = v.Team and v.Team.TeamColor.Color or Color3.fromRGB(255, 0, 0)
            local label = v.Name
            createESP(v.Character.HumanoidRootPart, color, label)
        end
    end
end

VisualsTab:CreateToggle({
    Name = "Enable Player ESP",
    CurrentValue = false,
    Callback = function(state)
        espEnabled = state
        if state then
            task.spawn(function()
                while espEnabled do
                    scanESP()
                    task.wait(2)
                end
            end)
        else
            clearESP()
        end
    end,
})

-- === GodMode ===
local godEnabled = false

PlayerTab:CreateToggle({
    Name = "God Mode",
    CurrentValue = false,
    Callback = function(state)
        godEnabled = state
        local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
        if state then
            for _, obj in pairs(char:GetDescendants()) do
                if obj:IsA("BasePart") then
                    obj.CanCollide = false
                    obj.Anchored = false
                end
            end
            if char:FindFirstChild("Humanoid") then
                char.Humanoid.Health = math.huge
                char.Humanoid.MaxHealth = math.huge
            end
        else
            -- No full revert (rejoin to reset)
        end
    end,
})

-- === Anti Death ===
task.spawn(function()
    while task.wait(1) do
        if godEnabled then
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                if char.Humanoid.Health <= 0 then
                    char.Humanoid.Health = 100
                end
            end
        end
    end
end)

-- === Freeze Bypass ===
task.spawn(function()
    while task.wait(0.5) do
        local char = game.Players.LocalPlayer.Character
        if godEnabled and char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.Anchored then
                    part.Anchored = false
                end
            end
        end
    end
end)

-- === Advanced Rarity ESP ===
local rarityESPEnabled = false
local rarityTargets = {
    ["Secret"] = true,
    ["Brainrot God"] = true,
    ["Mythic"] = true
}

-- Clean up rarity ESP
local function clearRarityESP()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BillboardGui") and v.Name == "YoxanX_RARITY_ESP" then
            v:Destroy()
        end
    end
end

-- Create Billboard ESP
local function createRarityESP(part, text, color)
    local gui = Instance.new("BillboardGui")
    gui.Name = "YoxanX_RARITY_ESP"
    gui.Adornee = part
    gui.AlwaysOnTop = true
    gui.Size = UDim2.new(0, 100, 0, 20)

    local label = Instance.new("TextLabel")
    label.Text = text
    label.Size = UDim2.new(1, 0, 1, 0)
    label.TextColor3 = color
    label.TextScaled = true
    label.BackgroundTransparency = 1
    label.Parent = gui

    gui.Parent = part
end

-- Scan world for rare brainrots
local function scanRarityESP()
    clearRarityESP()
    for _, model in pairs(workspace:GetDescendants()) do
        if model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") then
            local name = model.Name
            for rarity in pairs(rarityTargets) do
                if string.find(string.lower(name), string.lower(rarity)) then
                    createRarityESP(model.HumanoidRootPart, name, Color3.fromRGB(255, 0, 255))
                end
            end
        end
    end
end

VisualsTab:CreateToggle({
    Name = "Rarity ESP (Secret/God/Mythic)",
    CurrentValue = false,
    Callback = function(state)
        rarityESPEnabled = state
        if state then
            task.spawn(function()
                while rarityESPEnabled do
                    scanRarityESP()
                    task.wait(3)
                end
            end)
        else
            clearRarityESP()
        end
    end,
})

-- === ESP for Dropped Brainrots ===
local dropESPEnabled = false

local function clearDropESP()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BillboardGui") and v.Name == "YoxanX_DROP_ESP" then
            v:Destroy()
        end
    end
end

local function scanDropESP()
    clearDropESP()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Part") and v.Name:lower():find("brainrot") then
            createRarityESP(v, "[DROP] "..v.Name, Color3.fromRGB(255, 255, 0))
        end
    end
end

VisualsTab:CreateToggle({
    Name = "Dropped Brainrot ESP",
    CurrentValue = false,
    Callback = function(state)
        dropESPEnabled = state
        if state then
            task.spawn(function()
                while dropESPEnabled do
                    scanDropESP()
                    task.wait(3)
                end
            end)
        else
            clearDropESP()
        end
    end,
})

-- Add this only if you already have `local Window = Rayfield:CreateWindow({...})` in 1/10
-- This just adds the dupe tab

local DupeTab = Window:CreateTab("Dupe System", nil)

DupeTab:CreateSection("Brainrot Dupe")

DupeTab:CreateParagraph({
	Title = "⚠️ Warning",
	Content = "This method may not work on all servers. Drop brainrot, trigger save, then rejoin fast to dupe."
})

DupeTab:CreateButton({
	Name = "Step 1: Drop Brainrot",
	Callback = function()
		for _, item in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
			if item:IsA("Tool") then
				item.Parent = game:GetService("Workspace")
			end
		end
	end,
})

DupeTab:CreateButton({
	Name = "Step 2: Force Save + Lag",
	Callback = function()
		for i = 1, 1000 do
			game:GetService("ReplicatedStorage").Events.DataStoreEvent:FireServer("Save")
			task.wait()
		end
	end,
})

DupeTab:CreateButton({
	Name = "Step 3: Auto Rejoin Server",
	Callback = function()
		local ts = game:GetService("TeleportService")
		local plr = game:GetService("Players").LocalPlayer
		ts:Teleport(game.PlaceId, plr)
	end,
})

-- ⚠️ Make sure this is placed AFTER your existing Rayfield window setup

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local function getHRP()
    local char = lp.Character or lp.CharacterAdded:Wait()
    return char:WaitForChild("HumanoidRootPart")
end

local function getSafeZonePosition()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Part") and obj.Name:lower():find("safe") then
            return obj.Position
        end
    end
end

local function teleportToSafeZone()
    local safePos = getSafeZonePosition()
    if safePos then
        local hrp = getHRP()
        hrp.CFrame = CFrame.new(safePos + Vector3.new(0, 3, 0))
        game.StarterGui:SetCore("SendNotification", {
            Title = "YoxanXHub",
            Text = "✅ Teleported to Safe Zone",
            Duration = 3
        })
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "YoxanXHub",
            Text = "❌ Safe Zone Not Found",
            Duration = 3
        })
    end
end

-- ✅ Add to existing tab in Rayfield UI
TeleportTab = TeleportTab or Window:CreateTab("Teleport", nil)
TeleportTab:CreateButton({
    Name = "🚀 Teleport to Safe Zone",
    Callback = function()
        teleportToSafeZone()
    end,
})

-- ✅ Optionally auto teleport when loaded
-- teleportToSafeZone()

-- Assumes Rayfield & Window already loaded from 1/10

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

-- === Settings ===
local FloatEnabled = false
local SpeedEnabled = false
local SpeedValue = 100
local FloatTargetCFrame = CFrame.new(-100, 10, -100) -- Replace with actual base coordinates
local FloatSpeed = 2

-- UI
local MovementTab = Window:CreateTab("Movement", nil)
MovementTab:CreateToggle({
    Name = "Enable Float to Base",
    CurrentValue = false,
    Callback = function(v)
        FloatEnabled = v
    end,
})

MovementTab:CreateToggle({
    Name = "Enable Speedwalk",
    CurrentValue = false,
    Callback = function(v)
        SpeedEnabled = v
    end,
})

MovementTab:CreateSlider({
    Name = "Speed Value",
    Range = {16, 200},
    Increment = 1,
    CurrentValue = 100,
    Callback = function(val)
        SpeedValue = val
    end,
})

-- === Logic ===
task.spawn(function()
    while task.wait() do
        if SpeedEnabled and lp.Character and lp.Character:FindFirstChild("Humanoid") then
            lp.Character.Humanoid.WalkSpeed = SpeedValue
        elseif lp.Character and lp.Character:FindFirstChild("Humanoid") then
            lp.Character.Humanoid.WalkSpeed = 16
        end

        if FloatEnabled and hrp then
            local currentPos = hrp.Position
            local targetPos = FloatTargetCFrame.Position
            local direction = (targetPos - currentPos).Unit
            local moveStep = direction * FloatSpeed

            hrp.CFrame = hrp.CFrame + moveStep
        end
    end
end)



Rayfield:Notify({
    Title = "YoxanXHub Loaded",
    Content = "Welcome to Version 2.0 — Base UI Ready",
    Duration = 6
})
