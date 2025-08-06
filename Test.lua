local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "YoxanXHub | Base TP V2.0",
	LoadingTitle = "YoxanXHub Loader",
	LoadingSubtitle = "Bypass Locked Base",
	ConfigurationSaving = {Enabled = false},
	Discord = {Enabled = false},
	KeySystem = false,
})

local MainTab = Window:CreateTab("Base Bypass", 4483362458)
MainTab:CreateSection("Teleport Into Locked Base")

MainTab:CreateButton({
	Name = "⚡ TP Forward into Locked Base",
	Callback = function()
		local function tpForward()
			local player = game.Players.LocalPlayer
			local char = player.Character or player.CharacterAdded:Wait()
			local root = char:WaitForChild("HumanoidRootPart")

			for i = 1, 50 do -- 50 steps forward
				root.CFrame = root.CFrame + (root.CFrame.LookVector * 2)
				task.wait(0.05)
			end
		end

		tpForward()
	end,
})

Rayfield:Notify({
	Title = "YoxanXHub | V2.0",
	Content = "Ready to bypass locked bases using TP Forward!",
	Duration = 6.5,
	Image = 4483362458,
})
