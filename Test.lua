-- ts file was generated at discord.gg/25ms


local v8 = loadstring(game:HttpGet('https://sirius.menu/rayfield'))();
local v9 = v8:CreateWindow({
    Name = 'ComboChronicle Vault | Nuke Tycoon Nuclear',
    Icon = 12345678901,
    LoadingTitle = "Loading ComboChronicle Vault ❖",
    LoadingSubtitle = 'By COMBO_WICK | Bang.E.Line',
    Theme = 'Ocean'
});
local v10 = v9:CreateTab('Auto-Farm', 4483362458);
local v11 = false;
local v12 = false;
local v13 = false;
local v14 = false;
local v15 = false;
local v16 = {};
local v17 = 0;
local v18 = 10;
local v19 = false;
local v20 = 0.5;
local v21 = false;
local v22 = false;
local v23 = 100;
local v24 = 'Head';
local v25 = 5;
local function v26(v50)
    local v51 = game.Players.LocalPlayer;
    local v52 = v51.Character or v51.CharacterAdded:Wait() ;
    local v53 = v52:WaitForChild('HumanoidRootPart');
    firetouchinterest(v53, v50, 0);
    firetouchinterest(v53, v50, 1);
end
local function v27()
    local v54 = 0;
    while true do
        if (v54 == (0)) then
            for v131, v132 in pairs(workspace:GetDescendants()) do
                if (v132:IsA('BasePart') and (v132.Name == 'ACS_NoDamage')) then
                    v26(v132);
                end
            end
            v8:Notify({
                Title = 'Auto Buy Complete',
                Content = 'All available purchases have been bought.',
                Duration = 3
            });
            break
        end
    end
end
v10:CreateButton({
    Name = 'Auto Buy Everything in Tycoon',
    Callback = function()
        v27();
    end
});
local function v28(v55)
    local v56 = 0;
    local v57;
    while true do
        if (v56 == (1)) then
            return nil
        end
        if (v56 == (0)) then
            v57 = workspace:FindFirstChild('The Nuke Tycoon Entirely Model');
            if v57 then
                local v143 = 0;
                local v144;
                while true do
                    if (v143 == (0)) then
                        v144 = v57.Tycoons:FindFirstChild('Base ' .. v55);
                        if v144 then
                            local v179 = v144.PurchasedObjects:FindFirstChild('Mine');
                            if v179 then
                                return v179:FindFirstChild('Clicker')
                            end
                        end
                        break
                    end
                end
            end
            v56 = 1;
        end
    end
end
local function v29()
    while v14 do
        local v99 = 0;
        while true do
            if (v99 == (0)) then
                for v145, v146 in pairs(v16) do
                    local v147 = v28(v146);
                    if (v147 and v147:IsA('BasePart')) then
                        local v161 = 0;
                        local v162;
                        while true do
                            if ((0) == v161) then
                                v162 = v147:FindFirstChildOfClass('ClickDetector');
                                if v162 then
                                    fireclickdetector(v162);
                                end
                                break
                            end
                        end
                    end
                end
                wait(v17);
                break
            end
        end
    end
end
local function v30()
    while v15 do
        for v105, v106 in pairs(workspace:GetDescendants()) do
            if ((v106.Name == 'Giver') and v106:IsA('BasePart')) then
                local v133 = 0;
                local v134;
                while true do
                    if (v133 == (0)) then
                        v134 = v106:FindFirstChildOfClass('TouchTransmitter');
                        if v134 then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v106, 0);
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v106, 1);
                        end
                        break
                    end
                end
            end
        end
        wait(9.999999999990905E-2);
    end
end
local function v31(v58)
    local v59 = game.Players.LocalPlayer;
    return v58.Team == v59.Team
end
local function v32(v60)
    local v61 = 0;
    local v62;
    while true do
        if (v61 == (0)) then
            v62 = game.Players.LocalPlayer;
            if (v62.Character and v62.Character:FindFirstChild('HumanoidRootPart')) then
                v62.Character.HumanoidRootPart.CFrame = CFrame.new(v60);
            end
            break
        end
    end
end
local function v33(v63)
    if (v63 and v63:FindFirstChild('Head')) then
        if not v63:FindFirstChild('ESP_Highlight') then
            local v135 = 0;
            local v136;
            while true do
                if (v135 == (0)) then
                    v136 = Instance.new('Highlight');
                    v136.Name = 'ESP_Highlight';
                    v135 = 1;
                end
                if (v135 == (2)) then
                    v136.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
                    v136.Parent = v63;
                    break
                end
                if (v135 == (1)) then
                    v136.Adornee = v63;
                    v136.FillColor = Color3.new(0, 1, 0);
                    v135 = 2;
                end
            end
        end
    end
end
local function v34(v64)
    local v65 = v64:FindFirstChild('ESP_Highlight');
    if v65 then
        v65:Destroy();
    end
end
local function v35()
    local v66 = game.Players.LocalPlayer;
    local v67 = v66.Character;
    if (v67 and v67:FindFirstChild('HumanoidRootPart')) then
        local v107 = v67.HumanoidRootPart;
        local v108 = workspace.CurrentCamera;
        local v109 = v108.CFrame.LookVector;
        local v110 = v108.CFrame.Position;
        for v124, v125 in pairs(game.Players:GetPlayers()) do
            if (v125.Character and (v125 ~= v66) and (v125.Team ~= v66.Team)) then
                local v149 = 0;
                local v150;
                local v151;
                local v152;
                while true do
                    if (v149 == (1)) then
                        v152 = v150:FindFirstChild('HumanoidRootPart');
                        if (v152 and v151 and (v151.MoveDirection.magnitude > (0))) then
                            local v180 = 0;
                            local v181;
                            local v182;
                            local v183;
                            local v184;
                            local v185;
                            while true do
                                if (v180 == (1)) then
                                    v183 = nil;
                                    v184 = nil;
                                    v180 = 2;
                                end
                                if (v180 == 2) then
                                    v185 = nil;
                                    while true do
                                        if (v181 == (2)) then
                                            for v199, v200 in pairs(v150:GetChildren()) do
                                                if (v200:IsA('BodyGyro') or v200:IsA('BodyPosition')) then
                                                    v200:Destroy();
                                                end
                                            end
                                            v150:MoveTo(v185 or v182);
                                            v181 = 3;
                                        end
                                        if (v181 == 4) then
                                            v151:ChangeState(Enum.HumanoidStateType.Physics);
                                            break
                                        end
                                        if (v181 == 1) then
                                            v184, v185 = workspace:FindPartOnRay(v183, v150);
                                            if v184 then
                                                v152.CFrame = CFrame.new(v185.X, v185.Y, v185.Z);
                                            else
                                                v152.CFrame = CFrame.new(v182);
                                            end
                                            v181 = 2;
                                        end
                                        if (v181 == (0)) then
                                            local v197 = 0;
                                            while true do
                                                if (v197 == (1)) then
                                                    v181 = 1;
                                                    break
                                                end
                                                if (v197 == (0)) then
                                                    v182 = v110 + (v109 * v18) ;
                                                    v183 = Ray.new(v182, Vector3.new(0, - 10, 0));
                                                    v197 = 1;
                                                end
                                            end
                                        end
                                        if (v181 == (3)) then
                                            v152.Anchored = true;
                                            if v151 then
                                                v151.PlatformStand = false;
                                            end
                                            v181 = 4;
                                        end
                                    end
                                    break
                                end
                                if (v180 == (0)) then
                                    v181 = 0;
                                    v182 = nil;
                                    v180 = 1;
                                end
                            end
                        end
                        break
                    end
                    if (v149 == (0)) then
                        local v169 = 0;
                        while true do
                            if (v169 == (0)) then
                                v150 = v125.Character;
                                v151 = v150:FindFirstChild('Humanoid');
                                v169 = 1;
                            end
                            if (v169 == (1)) then
                                v149 = 1;
                                break
                            end
                        end
                    end
                end
            end
        end
    end
end
local function v36(v68)
    if (v68 and v68:FindFirstChild('HumanoidRootPart')) then
        local v111 = 0;
        local v112;
        while true do
            if ((1) == v111) then
                v112.Transparency = 0.5;
                v112.CanCollide = false;
                break
            end
            if (v111 == 0) then
                v112 = v68.HumanoidRootPart;
                v112.Size = Vector3.new(9, 9, 9);
                v111 = 1;
            end
        end
    end
end
local function v37(v69)
    local v70 = 0;
    local v71;
    while true do
        if (v70 == (1)) then
            if v69.Character then
                v36(v69.Character);
            end
            v69.CharacterAdded:Connect(function(v137)
                v36(v137);
            end);
            break
        end
        if (v70 == (0)) then
            local v126 = 0;
            while true do
                if ((0) == v126) then
                    v71 = game.Players.LocalPlayer;
                    if (v69.Team == v71.Team) then
                        return
                    end
                    v126 = 1;
                end
                if (v126 == (1)) then
                    v70 = 1;
                    break
                end
            end
        end
    end
end
for v72, v73 in pairs(game.Players:GetPlayers()) do
    if (v73 ~= game.Players.LocalPlayer) then
        v37(v73);
    end
end
task.spawn(function()
    while task.wait(1) do
        for v113, v114 in pairs(game.Players:GetPlayers()) do
            if ((v114 ~= game.Players.LocalPlayer) and (v114.Team ~= game.Players.LocalPlayer.Team) and v114.Character) then
                v36(v114.Character);
            end
        end
    end
end);
local function v38()
    local v74 = game.Players.LocalPlayer;
    local v75 = v74:GetMouse();
    local v76 = v23;
    local v77;
    for v100, v101 in ipairs(game.Players:GetPlayers()) do
        if ((v101 ~= v74) and v101.Character and v101.Character:FindFirstChild(v24)) then
            local v127 = 0;
            local v128;
            while true do
                if (v127 == (0)) then
                    v128 = v101.Character[v24];
                    if (v101.Team ~= v74.Team) then
                        local v170 = 0;
                        local v171;
                        local v172;
                        while true do
                            if (v170 == (0)) then
                                v171, v172 = workspace.CurrentCamera:WorldToScreenPoint(v128.Position);
                                if v172 then
                                    local v191 = (Vector2.new(v171.X, v171.Y) - Vector2.new(v75.X, v75.Y)).Magnitude;
                                    if (v191 < v76) then
                                        local v196 = 0;
                                        while true do
                                            if (v196 == (0)) then
                                                v76 = v191;
                                                v77 = v128;
                                                break
                                            end
                                        end
                                    end
                                end
                                break
                            end
                        end
                    end
                    break
                end
            end
        end
    end
    return v77
end
local function v39(v78)
    if v78 then
        local v115 = workspace.CurrentCamera;
        local v116 = v78.Position;
        local v117 = v115.CFrame.Position;
        local v118 = (v116 - v117).Unit;
        local v119 = CFrame.new(v117, v117 + v118);
        v115.CFrame = v115.CFrame:Lerp(v119, (1) / v25);
    end
end
local function v40()
    while task.wait() do
        if v11 then
            local v129 = 0;
            local v130;
            while true do
                if (v129 == 0) then
                    v130 = v38();
                    v39(v130);
                    break
                end
            end
        end
    end
end
task.spawn(v40);
v10:CreateToggle({
    Name = 'Auto Clicker(Check the base number ur in)',
    CurrentValue = false,
    Flag = 'AutoClickToggle',
    Callback = function(v79)
        local v80 = 0;
        while true do
            if (v80 == (0)) then
                v14 = v79;
                if v14 then
                    task.spawn(v29);
                end
                break
            end
        end
    end
});
v10:CreateToggle({
    Name = 'Rob Everyone and your self',
    CurrentValue = false,
    Flag = 'AutoRobToggle',
    Callback = function(v81)
        v15 = v81;
        if v15 then
            task.spawn(v30);
        end
    end
});
v10:CreateToggle({
    Name = 'Teleport Every Player One Place(Kill-All; make sure to turn on/off quick...)',
    CurrentValue = v19,
    Callback = function(v82)
        local v83 = 0;
        local v84;
        while true do
            if (v83 == (0)) then
                v84 = 0;
                while true do
                    if (v84 == (0)) then
                        v19 = v82;
                        if v19 then
                            while v19 do
                                local v173 = 0;
                                local v174;
                                while true do
                                    if (v173 == (0)) then
                                        v174 = 0;
                                        while true do
                                            if (v174 == (0)) then
                                                v35();
                                                wait(v20);
                                                break
                                            end
                                        end
                                        break
                                    end
                                end
                            end
                        end
                        break
                    end
                end
                break
            end
        end
    end
});
v10:CreateToggle({
    Name = 'Toggle ESP(Do it MANUALLY lmao)',
    CurrentValue = v21,
    Callback = function(v85)
        local v86 = 0;
        while true do
            if (v86 == (0)) then
                v21 = v85;
                for v138, v139 in pairs(game.Players:GetPlayers()) do
                    if v139.Character then
                        if v21 then
                            v33(v139.Character);
                        else
                            v34(v139.Character);
                        end
                    end
                    v139.CharacterAdded:Connect(function(v157)
                        if v21 then
                            v33(v157);
                        else
                            v34(v157);
                        end
                    end);
                end
                break
            end
        end
    end
});
v10:CreateToggle({
    Name = 'Enable Hitbox',
    CurrentValue = false,
    Callback = function(v87)
        local v88 = 0;
        local v89;
        while true do
            if (0 == v88) then
                v89 = 0;
                while true do
                    if (v89 == (0)) then
                        v22 = v87;
                        if v22 then
                            for v175, v176 in pairs(game.Players:GetPlayers()) do
                                if (not v31(v176) and v176.Character) then
                                    v36(v176.Character);
                                end
                            end
                        else
                            for v177, v178 in pairs(game.Players:GetPlayers()) do
                                if (v178.Character and v178.Character:FindFirstChild('HumanoidRootPart')) then
                                    local v189 = 0;
                                    local v190;
                                    while true do
                                        if (v189 == (1)) then
                                            v190.Transparency = 0;
                                            v190.CanCollide = true;
                                            break
                                        end
                                        if (v189 == (0)) then
                                            v190 = v178.Character.HumanoidRootPart;
                                            v190.Size = Vector3.new(2, 2, 1);
                                            v189 = 1;
                                        end
                                    end
                                end
                            end
                        end
                        break
                    end
                end
                break
            end
        end
    end
});
local v41 = v10:CreateSection('Select Base ur in for Auto-Clicker');
for v90 = 1, 10 do
    v10:CreateToggle({
        Name = 'Base ' .. v90,
        CurrentValue = false,
        Flag = 'Base' .. v90,
        Callback = function(v102)
            if v102 then
                table.insert(v16, v90);
            else
                for v140, v141 in ipairs(v16) do
                    if (v141 == v90) then
                        table.remove(v16, v140);
                        break
                    end
                end
            end
        end
    });
end
local v42 = v9:CreateTab("✨ Credits", 'info');
local v43 = v42:CreateSection("👑 Creator");
v42:CreateLabel("🛠️ COMBO_WICK - Discord: world_star_hacker");
local v44 = v42:CreateSection("🤝 Co-Developer");
v42:CreateLabel("💡 None - Discord: None");
local v45 = v42:CreateSection("🌐 Discord Server");
v42:CreateLabel("🔗 Join our server/YT: discord.com/invite/mwTHaCKzhw");
v42:CreateButton({
    Name = "📋 Copy Discord Link/Youtube",
    Callback = function()
        local v91 = "Discord: discord.com/invite/mwTHaCKzhw\nYouTube: https://www.youtube.com/@COMBO_WICK";
        setclipboard(v91);
    end
});
local v46 = v9:CreateTab('Aimbot+', 12345678);
v46:CreateToggle({
    Name = 'Enable Aimbot',
    CurrentValue = false,
    Callback = function(v92)
        v11 = v92;
    end
});
v46:CreateToggle({
    Name = 'Enable Auto-Lock',
    CurrentValue = false,
    Callback = function(v93)
        v12 = v93;
    end
});
v46:CreateToggle({
    Name = 'Enable Trickshot Mode',
    CurrentValue = false,
    Callback = function(v94)
        v13 = v94;
    end
});
v46:CreateSlider({
    Name = 'FOV Radius',
    Min = 50,
    Max = 300,
    CurrentValue = v23,
    Callback = function(v95)
        v23 = v95;
    end
});
v46:CreateDropdown({
    Name = 'Target Bone',
    Options = {
        'Head',
        'Torso',
        'Random'
    },
    CurrentOption = v24,
    Callback = function(v96)
        v24 = v96;
    end
});
v46:CreateSlider({
    Name = 'Smoothing Factor',
    Min = 1,
    Max = 10,
    CurrentValue = v25,
    Callback = function(v97)
        v25 = v97;
    end
});
task.spawn(function()
    while task.wait(1) do
        local v103 = 0;
        local v104;
        while true do
            if ((0) == v103) then
                v104 = game.Players.LocalPlayer;
                if (v104.Character and v104.Character:FindFirstChild('Humanoid')) then
                    local v160 = 0;
                    while true do
                        if ((0) == v160) then
                            if (v104.Character.Humanoid.Health <= (0)) then
                                onDeath(v104.Character);
                            end
                            for v186, v187 in pairs(game.Players:GetPlayers()) do
                                if (v187.Character and (v187.Character.Humanoid.Health <= (0))) then
                                    onPlayerKilled(v104, v187);
                                end
                            end
                            break
                        end
                    end
                end
                break
            end
        end
    end
end);
task.spawn(function()
    while task.wait(1) do
        for v121, v122 in pairs(game.Players:GetPlayers()) do
            if ((v122 ~= game.Players.LocalPlayer) and v122.Character) then
                if v21 then
                    v33(v122.Character);
                else
                    v34(v122.Character);
                end
            end
        end
    end
end);
game:GetService('RunService').Heartbeat:Connect(function()
    if v19 then
        v35();
    end
end);
v8:Notify({
    Title = 'Script Loaded',
    Content = 'Tycoon Automation GUI Ready!',
    Duration = 5
});
