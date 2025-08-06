local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "YoxanXHub | Base Bypass",
    LoadingTitle = "YoxanXHub",
    LoadingSubtitle = "Loading...",
    ConfigurationSaving = {
        Enabled = false,
    }
})

local TeleportTab = Window:CreateTab("TP Forward", nil)

local isHolding = false
local holdThread = nil

local function teleportForward()
    local char = game.Players.LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    local root = char.HumanoidRootPart
    local offset = Vector3.new(0, 0, -2)

    root.CFrame = root.CFrame + offset
end

TeleportTab:CreateButton({
    Name = "Hold to Force-Enter Base",
    Callback = function()
        isHolding = true
        Rayfield:Notify({
            Title = "YoxanXHub",
            Content = "Hold started. Keep holding until you enter base!",
            Duration = 4,
        })

        holdThread = task.spawn(function()
            while isHolding do
                teleportForward()
                task.wait(0.05)
            end
        end)
    end,
})

TeleportTab:CreateButton({
    Name = "Release Hold (Stop Teleport)",
    Callback = function()
        isHolding = false
        Rayfield:Notify({
            Title = "YoxanXHub",
            Content = "Teleport hold stopped.",
            Duration = 3,
        })
    end,
})
