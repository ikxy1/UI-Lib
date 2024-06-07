local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Mapple7777/UI-Librarys/main/UI-1/UI.lua"))()
 
 
local Window = Library:Create("Skid Ware","Da hood")
local Tab1 = Window:Tab("Aimlocks",true)
 
Tab1:Label("Aimlock")
 
Tab1:Toggle("Aimlock",function(bool)
    getgenv().AimPart = "HumanoidRootPart"
	getgenv().AimlockKey = "h"
	getgenv().AimRadius = 30
	getgenv().ThirdPerson = true
	getgenv().FirstPerson = true
	getgenv().TeamCheck = false
	getgenv().PredictMovement = true
	getgenv().PredictionVelocity = 6
	local L_27_, L_28_, L_29_, L_30_ =
            game:GetService "Players",
            game:GetService "UserInputService",
            game:GetService "RunService",
            game:GetService "StarterGui"
	local L_31_, L_32_, L_33_, L_34_, L_35_, L_36_, L_37_ =
            L_27_.LocalPlayer,
            L_27_.LocalPlayer:GetMouse(),
            workspace.CurrentCamera,
            CFrame.new,
            Ray.new,
            Vector3.new,
            Vector2.new
	local L_38_, L_39_, L_40_ = true, false, false
	local L_41_
	getgenv().CiazwareUniversalAimbotLoaded = true
	getgenv().WorldToViewportPoint = function(L_42_arg0)
		return L_33_:WorldToViewportPoint(L_42_arg0)
	end
	getgenv().WorldToScreenPoint = function(L_43_arg0)
		return L_33_.WorldToScreenPoint(L_33_, L_43_arg0)
	end
	getgenv().GetObscuringObjects = function(L_44_arg0)
		if L_44_arg0 and L_44_arg0:FindFirstChild(getgenv().AimPart) and L_31_ and L_31_.Character:FindFirstChild("Head") then
			local L_45_ = workspace:FindPartOnRay(L_35_(L_44_arg0[getgenv().AimPart].Position, L_31_.Character.Head.Position))
			if L_45_ then
				return L_45_:IsDescendantOf(L_44_arg0)
			end
		end
	end
	getgenv().GetNearestTarget = function()
		local L_46_ = {}
		local L_47_ = {}
		local L_48_ = {}
		for L_50_forvar0, L_51_forvar1 in pairs(L_27_:GetPlayers()) do
			if L_51_forvar1 ~= L_31_ then
				table.insert(L_46_, L_51_forvar1)
			end
		end
		for L_52_forvar0, L_53_forvar1 in pairs(L_46_) do
			if L_53_forvar1.Character ~= nil then
				local L_54_ = L_53_forvar1.Character:FindFirstChild("Head")
				if getgenv().TeamCheck == true and L_53_forvar1.Team ~= L_31_.Team then
					local L_55_ =
                            (L_53_forvar1.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
					local L_56_ =
                            Ray.new(
                            game.Workspace.CurrentCamera.CFrame.p,
                            (L_32_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * L_55_
                        )
					local L_57_, L_58_ = game.Workspace:FindPartOnRay(L_56_, game.Workspace)
					local L_59_ = math.floor((L_58_ - L_54_.Position).magnitude)
					L_47_[L_53_forvar1.Name .. L_52_forvar0] = {}
					L_47_[L_53_forvar1.Name .. L_52_forvar0].dist = L_55_
					L_47_[L_53_forvar1.Name .. L_52_forvar0].plr = L_53_forvar1
					L_47_[L_53_forvar1.Name .. L_52_forvar0].diff = L_59_
					table.insert(L_48_, L_59_)
				elseif getgenv().TeamCheck == false and L_53_forvar1.Team == L_31_.Team then
					local L_60_ =
                            (L_53_forvar1.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p).magnitude
					local L_61_ =
                            Ray.new(
                            game.Workspace.CurrentCamera.CFrame.p,
                            (L_32_.Hit.p - game.Workspace.CurrentCamera.CFrame.p).unit * L_60_
                        )
					local L_62_, L_63_ = game.Workspace:FindPartOnRay(L_61_, game.Workspace)
					local L_64_ = math.floor((L_63_ - L_54_.Position).magnitude)
					L_47_[L_53_forvar1.Name .. L_52_forvar0] = {}
					L_47_[L_53_forvar1.Name .. L_52_forvar0].dist = L_60_
					L_47_[L_53_forvar1.Name .. L_52_forvar0].plr = L_53_forvar1
					L_47_[L_53_forvar1.Name .. L_52_forvar0].diff = L_64_
					table.insert(L_48_, L_64_)
				end
			end
		end
		if unpack(L_48_) == nil then
			return nil
		end
		local L_49_ = math.floor(math.min(unpack(L_48_)))
		if L_49_ > getgenv().AimRadius then
			return nil
		end
		for L_65_forvar0, L_66_forvar1 in pairs(L_47_) do
			if L_66_forvar1.diff == L_49_ then
				return L_66_forvar1.plr
			end
		end
		return nil
	end
	L_32_.KeyDown:Connect(
            function(L_67_arg0)
		if L_67_arg0 == AimlockKey and L_41_ == nil then
			pcall(
                        function()
				if L_39_ ~= true then
					L_39_ = true
				end
				local L_68_
				L_68_ = GetNearestTarget()
				if L_68_ ~= nil then
					L_41_ = L_68_
				end
			end
                    )
		elseif L_67_arg0 == AimlockKey and L_41_ ~= nil then
			if L_41_ ~= nil then
				L_41_ = nil
			end
			if L_39_ ~= false then
				L_39_ = false
			end
		end
	end
        )
	L_29_.RenderStepped:Connect(
            function()
		if getgenv().ThirdPerson == true and getgenv().FirstPerson == true then
			if
                        (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude > 1 or
                            (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude <= 1
                     then
				L_40_ = true
			else
				L_40_ = false
			end
		elseif getgenv().ThirdPerson == true and getgenv().FirstPerson == false then
			if (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude > 1 then
				L_40_ = true
			else
				L_40_ = false
			end
		elseif getgenv().ThirdPerson == false and getgenv().FirstPerson == true then
			if (L_33_.Focus.p - L_33_.CoordinateFrame.p).Magnitude <= 1 then
				L_40_ = true
			else
				L_40_ = false
			end
		end
		if L_38_ == true and L_39_ == true then
			if L_41_ and L_41_.Character and L_41_.Character:FindFirstChild(getgenv().AimPart) then
				if getgenv().FirstPerson == true then
					if L_40_ == true then
						if getgenv().PredictMovement == true then
							L_33_.CFrame =
                                        L_34_(
                                        L_33_.CFrame.p,
                                        L_41_.Character[getgenv().AimPart].Position +
                                            L_41_.Character[getgenv().AimPart].Velocity / PredictionVelocity
                                    )
						elseif getgenv().PredictMovement == false then
							L_33_.CFrame = L_34_(L_33_.CFrame.p, L_41_.Character[getgenv().AimPart].Position)
						end
					end
				elseif getgenv().ThirdPerson == true then
					if L_40_ == true then
						if getgenv().PredictMovement == true then
							L_33_.CFrame =
                                        L_34_(
                                        L_33_.CFrame.p,
                                        L_41_.Character[getgenv().AimPart].Position +
                                            L_41_.Character[getgenv().AimPart].Velocity / PredictionVelocity
                                    )
						elseif getgenv().PredictMovement == false then
							L_33_.CFrame = L_34_(L_33_.CFrame.p, L_41_.Character[getgenv().AimPart].Position)
						end
					end
				end
			end
		end
	end
        )
end)
 
Tab1:Textbox("Aimlock Keybind","h",function(bool)
    getgenv().AimlockKey = bool
end)
 
Tab1:Dropdown("AimPart",{"Head","HumanoidRootPart","UpperTorso","LowerTorso"},function(value)
    getgenv().AimPart = value
end)
 
local Tab2 = Window:Tab("Player",false)
 
Tab2:Label("Player Scripts")
 
game.StarterGui:SetCore("SendNotification", {
    Title = "Skid Ware";
    Text = "Welcome to Skid Ware";
    Icon = "http://www.roblox.com/asset/?id=17713084815";
    Duration = "5";
    callbakc = bindableFunction;
    Button1 = "Okay";
})
 
Tab2:Button("FLY (X)",function(bool)
    loadstring(game:HttpGet("https://pastebin.com/raw/sUA9m6M6"))()
end)
 
Tab2:Slider("Fov Camera",80,200,function(text)
    workspace.CurrentCamera.FieldOfView = (text)
end)
 
Tab2:Button("Tryhard Anims",function(bool)
    while true do
        wait(1)
        for i, player in ipairs(game.Players:GetChildren()) do
        local Animate = game.Players.LocalPlayer.Character.Animate
    Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782841498"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
    game.Players.LocalPlayer.Character.Humanoid.Jump = false
        end
    end
end)
 
Tab2:Button("Headless Client Sided",function(bool)
    getgenv().game.Players.LocalPlayer.Character.Head.Transparency = 1
    getgenv().game.Players.LocalPlayer.Character.Head.face:Destroy()
    getgenv().game.Players.LocalPlayer.Character.Head.face:Destroy()
end)
 
--[[ Tab2:Button("Korblox Client Sided",function(bool)
	local ply = game.Players.LocalPlayer
	local chr = ply.Character
	chr.RightLowerLeg.MeshId = "902942093"
	chr.RightLowerLeg.Transparency = "1"
	chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
	chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
	chr.RightFoot.MeshId = "902942089"
	chr.RightFoot.Transparency = "1"
end)
--]]
 
Tab2:Button("Trash Talk (J)",function(bool)
    local plr = game.Players.LocalPlayer
repeat wait(1) until plr.Character
local char = plr.Character
 
local garbage = {
    "lint licker";
    "ez";
    "You miss more shots than a autistic Stormtrooper";
    "You could feed all of africa with your deaths";
    "I hope your dinners cold tonight";
    "Good Doggy";
}
 
 
function TrashTalk(inputObject, gameProcessedEvent)
    if inputObject.KeyCode == Enum.KeyCode.J and gameProcessedEvent == false then        
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
        garbage[math.random(1,#garbage)],
        "All"
    )
    end
end
 
game:GetService("UserInputService").InputBegan:connect(TrashTalk)
end)

local Tab3 = Window:Tab("ESP",false)

Tab3:Label("Esp")

--[[ local Tab4 = Window:Tab("Anti-Lock",false)
 
Tab4:Label("Anti-Lock")
 
Tab4:Button("FIX ANTILOCK",function(bool)
 
    for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
        repeat
            wait()
        until game.Players.LocalPlayer.Character
        char.ChildAdded:Connect(function(child)
            if child:IsA("Script") then 
                wait(0.1)
                if child:FindFirstChild("LocalScript") then
                    child.LocalScript:FireServer()
                end
            end
        end)
    end)
 
end)
 
local glitch = false
local clicker = false
 
Tab4:Textbox("AntiLock (use -0.10 to -0.60)","Speed",function(a)
 
    getgenv().Multiplier = a
 
end, {
    ["clear"] = false,
})
 
Tab4:Button("Antilock Improved (Z)",function(bool)
    local userInput = game:service('UserInputService')
    local runService = game:service('RunService')
 
    userInput.InputBegan:connect(function(Key)
        if Key.KeyCode == Enum.KeyCode.Z then
            Enabled = not Enabled
            if Enabled == true then
                repeat
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * getgenv().Multiplier
                    runService.Stepped:wait()
                until Enabled == false
            end
        end
    end)
end)
--]]
 
local Tab5 = Window:Tab("Teleports",false)
 
Tab5:Label("Teleports")

Tab5:Button("Revolver",function(value)
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-638.7486572265625, 21.74802017211914, -118.1715087890625)
end)

Tab5:Button("Double Barrel",function(value)
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1042.7535400390625, 21.74802017211914, -255.73590087890625)
end)

Tab5:Button("Da Bank",function(value)
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-406.2017517089844, 21.74802589416504, -285.49774169921875)
end)

Tab5:Button("Downhill Gunstore",function(value)
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-577.9317626953125, 8.312804222106934, -736.03564453125)
end)

Tab5:Button("Uphill Gunstore",function(value)
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(481.59942626953125, 48.06851577758789, -619.5245361328125)
end)

Tab5:Button("Armor",function(value)
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1178.1571044921875, 28.378028869628906, -497.09161376953125)
end)

Tab5:Button("Flame Thrower",function(value)
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-153.2495880126953, 53.80862808227539, -101.01776123046875)
end)
 
Tab5:Button("RPG",function(value)
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(115.57005310058594, -26.752010345458984, -271.0687561035156)
end)

Tab5:Button("Casino 1v1",function(value)
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-962.7234497070312, 21.25301742553711, -186.8149871826172)
end)

Tab5:Button("Armor",function(value)
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1178.1571044921875, 28.378028869628906, -497.09161376953125)
end)
 
local Tab6 = Window:Tab("Keybind",false)
 
Tab6:Label("Keybind")
 
Tab6:Keybind("Toggle",Enum.KeyCode.B,function()
    Library:Toggle()
end)

Tab6:Button("Unload",function(Destroy)
end)
 
local Tab7 = Window:Tab("Credits",false)
 
Tab7:Label("Skided by Anthony")
 
local Aiming = loadstring(game:HttpGet("https://pastebin.com/raw/vsVecTqs"))()
Aiming.TeamCheck(false)
 
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
 
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local CurrentCamera = Workspace.CurrentCamera
 
local DaHoodSettings = {
    SilentAim = false,
    AimLock = false,
    Prediction = 0.157,
    AimLockKeybind = Enum.KeyCode.E
}
getgenv().DaHoodSettings = DaHoodSettings
 
function Aiming.Check()
    if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then
        return false
    end
 
    local Character = Aiming.Character(Aiming.Selected)
    local KOd = Character:WaitForChild("BodyEffects")["K.O"].Value
    local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
 
    if (KOd or Grabbed) then
        return false
    end
 
    return true
end
 
local __index
__index = hookmetamethod(game, "__index", function(t, k)
    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then
        local SelectedPart = Aiming.SelectedPart
 
        if (DaHoodSettings.SilentAim and (k == "Hit" or k == "Target")) then
            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)
 
            return (k == "Hit" and Hit or SelectedPart)
        end
    end
 
    return __index(t, k)
end)
 
RunService:BindToRenderStep("AimLock", 0, function()
    if (DaHoodSettings.AimLock and Aiming.Check() and UserInputService:IsKeyDown(DaHoodSettings.AimLockKeybind)) then
        local SelectedPart = Aiming.SelectedPart
 
        local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)
 
        CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, Hit.Position)
    end
    end)
