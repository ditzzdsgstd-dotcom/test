local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
   Name = "YoxanXHub | Base Teleport V1",
   LoadingTitle = "YoxanXHub",
   LoadingSubtitle = "Teleport Bypass Module",
})
local Tab = Window:CreateTab("Base Tools", nil)
local Section = Tab:CreateSection("Teleport Logic")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local function tpTo(part)
   if not part or not part:IsA("BasePart") then return end
   local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
   local root = char:WaitForChild("HumanoidRootPart")
   root.CFrame = part.CFrame + Vector3.new(0, 3, 0)
end

local function forwardStep(distance)
   local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
   local root = char:WaitForChild("HumanoidRootPart")
   local look = root.CFrame.lookVector * distance
   local goal = root.CFrame.Position + look
   local tween = TweenService:Create(root, TweenInfo.new(0.3), {CFrame = CFrame.new(goal)})
   tween:Play()
end

local function detectBasePrompt()
   for _,v in pairs(workspace:GetDescendants()) do
       if v:IsA("ProximityPrompt") and v.ObjectText == "Steal Base" then
           return v
       end
   end
end

local function attemptTeleportBypass()
   local tries = 0
   repeat
       forwardStep(5)
       tries += 1
       task.wait(0.15)
   until detectBasePrompt() or tries > 20
   local prompt = detectBasePrompt()
   if prompt then
       Rayfield:Notify({Title="YoxanXHub", Content="✅ Prompt Found! Teleport Success", Duration=4})
   else
       Rayfield:Notify({Title="YoxanXHub", Content="❌ Prompt Not Found! Base locked or out of range", Duration=4})
   end
end

Tab:CreateButton({
   Name = "🔁 Manual Step Forward",
   Callback = function()
       forwardStep(5)
   end
})

Tab:CreateButton({
   Name = "🚀 Auto Bypass Forward",
   Callback = function()
       attemptTeleportBypass()
   end
})

Tab:CreateParagraph({
   Title = "Info",
   Content = "Use this to reach locked bases. Auto bypass will stop once it detects a proximity prompt."
})
