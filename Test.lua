local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "YoxanXHub | TP Bypass V1.0",
	LoadingTitle = "Teleport Handler",
	LoadingSubtitle = "Please wait...",
	ConfigurationSaving = {
		Enabled = false,
	},
})

local MainTab = Window:CreateTab("TP Bypass", 4483362458)
MainTab:CreateParagraph({Title = "Base Entry Tool", Content = "Use this feature to phase into locked bases."})

local function clearAntiTP()
	local char = game.Players.LocalPlayer.Character
	if not char then return end
	for _, obj in ipairs(char:GetDescendants()) do
		if obj:IsA("BodyGyro") or obj:IsA("BodyVelocity") or obj:IsA("AlignPosition") or obj:IsA("BodyPosition") then
			obj:Destroy()
		end
	end
end

local function tpForwardStep()
	local player = game.Players.LocalPlayer
	local char = player.Character or player.CharacterAdded:Wait()
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if hrp then
		clearAntiTP()
		local direction = hrp.CFrame.LookVector
		hrp.CFrame = hrp.CFrame + direction * 5 -- move forward by 5 studs
	end
end

MainTab:CreateButton({
	Name = "TP Forward Bypass (Click Multiple Times)",
	Callback = function()
		for i = 1, 10 do
			tpForwardStep()
			task.wait(0.05)
		end
	end,
})

MainTab:CreateParagraph({
	Title = "⚠️ Notice",
	Content = "Stand in front of a locked base and press the button 3–10 times. Try spamming if it doesn’t work the first time."
})
