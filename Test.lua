local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local Window = Rayfield:CreateWindow({
    Name = "YoxanXHub | V2.0 Teleport Bypass",
    LoadingTitle = "Bypass Loading...",
    LoadingSubtitle = "Teleport Module V2.0",
    ConfigurationSaving = false,
})

local Tab = Window:CreateTab("Teleport", 4483362458)
Tab:CreateSection("Base Entry Tools")

-- Noclip logic
local noclip = false
game:GetService("RunService").Stepped:Connect(function()
    if noclip and Character and Character:FindFirstChild("Humanoid") then
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide == true then
                part.CanCollide = false
            end
        end
    end
end)

Tab:CreateToggle({
    Name = "Noclip Mode",
    CurrentValue = false,
    Callback = function(value)
        noclip = value
    end,
})

-- Forward TP
Tab:CreateButton({
    Name = "Teleport Forward",
    Callback = function()
        local cf = HumanoidRootPart.CFrame
        HumanoidRootPart.CFrame = cf + (cf.LookVector * 10)
    end,
})

-- Fast spam teleport forward
Tab:CreateButton({
    Name = "Spam Forward TP x10",
    Callback = function()
        for _ = 1, 10 do
            local cf = HumanoidRootPart.CFrame
            HumanoidRootPart.CFrame = cf + (cf.LookVector * 5)
            task.wait(0.1)
        end
    end,
})

-- Reset to last position
local lastPosition
Tab:CreateButton({
    Name = "Save Current Position",
    Callback = function()
        lastPosition = HumanoidRootPart.Position
        Rayfield:Notify({
            Title = "Position Saved",
            Content = "Your location has been stored.",
            Duration = 3
        })
    end,
})

Tab:CreateButton({
    Name = "Return to Saved Position",
    Callback = function()
        if lastPosition then
            HumanoidRootPart.CFrame = CFrame.new(lastPosition)
        else
            Rayfield:Notify({
                Title = "No Position Saved",
                Content = "You must save a position first.",
                Duration = 3
            })
        end
    end,
})

-- Teleport Bypass Tools V2.0 (2/4) - YoxanXHub

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local HumanoidRootPart = LocalPlayer.Character:WaitForChild("HumanoidRootPart")

local scanEnabled = false
local autoReturn = false

-- == Auto Forward TP Logic ==
local function autoForwardUntilInBase(maxSteps, delay)
    local enteredBase = false
    for i = 1, maxSteps do
        if not scanEnabled then break end
        HumanoidRootPart.CFrame = HumanoidRootPart.CFrame + (HumanoidRootPart.CFrame.LookVector * 5)
        task.wait(delay or 0.05)

        local touching = Workspace:GetPartsInPart(HumanoidRootPart)
        for _, part in ipairs(touching) do
            if part:IsDescendantOf(Workspace:FindFirstChild("Base", true) or Workspace) then
                enteredBase = true
                break
            end
        end

        if enteredBase then
            Rayfield:Notify({
                Title = "Base Entered",
                Content = "Teleport successful!",
                Duration = 3
            })
            if autoReturn and lastPosition then
                task.wait(1.5)
                HumanoidRootPart.CFrame = CFrame.new(lastPosition)
            end
            break
        end
    end

    if not enteredBase then
        Rayfield:Notify({
            Title = "Entry Failed",
            Content = "Base not entered after "..maxSteps.." steps.",
            Duration = 3
        })
    end
end

-- Add to same Tab from part 1
Tab:CreateToggle({
    Name = "Auto Scan Base Entry",
    CurrentValue = false,
    Callback = function(value)
        scanEnabled = value
        if value then
            Rayfield:Notify({
                Title = "Auto Scan Started",
                Content = "Spamming forward until base is entered...",
                Duration = 4
            })
            task.spawn(function()
                autoForwardUntilInBase(100, 0.03)
                scanEnabled = false
            end)
        end
    end,
})

Tab:CreateToggle({
    Name = "Auto Return After Entry",
    CurrentValue = false,
    Callback = function(value)
        autoReturn = value
    end,
})

-- Optional: Keep noclip ON while scanning
RunService.Stepped:Connect(function()
    if scanEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)

-- Auto Instant Steal (3/4) - YoxanXHub

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local StealRemote = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("Steal") or nil

local instantStealEnabled = false

-- Auto Steal Function
local function autoInstantSteal()
    while instantStealEnabled do
        local target = nil
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Team ~= LocalPlayer.Team and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (plr.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if dist < 30 then
                    target = plr
                    break
                end
            end
        end

        if target and StealRemote then
            StealRemote:FireServer(target)
            Rayfield:Notify({
                Title = "Instant Steal!",
                Content = "Successfully attempted steal from: " .. target.Name,
                Duration = 2
            })
            task.wait(1.5)
        end
        task.wait(0.1)
    end
end

-- Add Toggle to existing tab
Tab:CreateToggle({
    Name = "Auto Instant Steal",
    CurrentValue = false,
    Callback = function(state)
        instantStealEnabled = state
        if state then
            task.spawn(autoInstantSteal)
        end
    end,
})
