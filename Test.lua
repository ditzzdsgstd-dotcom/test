local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "YoxanXHub | Base Bypass V2.1",
	LoadingTitle = "Bypass Locked Base",
	LoadingSubtitle = "Anti-Death Teleport",
	ConfigurationSaving = {Enabled = false},
	Discord = {Enabled = false},
	KeySystem = false,
})

local MainTab = Window:CreateTab("Teleport", 4483362458)
MainTab:CreateSection("Enter Locked Bases")

MainTab:CreateButton({
	Name = "⚡ GodMode + TP Forward",
	Callback = function()
		local player = game.Players.LocalPlayer
		local char = player.Character or player.CharacterAdded:Wait()
		local root = char:WaitForChild("HumanoidRootPart")
		local humanoid = char:FindFirstChildOfClass("Humanoid")

		-- GOD MODE
		if humanoid then
			humanoid.Name = "YoxanXGod"
			local clone = humanoid:Clone()
			clone.Name = "Humanoid"
			clone.Parent = char
			wait()
			char:FindFirstChild("YoxanXGod"):Destroy()
		end

		-- TELEPORT FORWARD
		for i = 1, 50 do
			root.CFrame = root.CFrame + (root.CFrame.LookVector * 2)
			task.wait(0.05)
		end

		Rayfield:Notify({
			Title = "TP Completed",
			Content = "If you’re still alive, God Mode worked.",
			Duration = 5,
			Image = 4483362458,
		})
	end,
})

MainTab:CreateParagraph({
	Title = "⚠️ Note",
	Content = "If this still kills you, the base might be using server-side anti-TP or death walls. Try facing the right direction before clicking.",
})
