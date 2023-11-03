loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()

local Children = {"Baby Boy", "Baby Girl", "Baby Boy [Premium 1]", "Baby Boy [Premium 2]", "Baby Boy [Premium 3]", "Baby Girl [Premium 1]", "Baby Girl [Premium 2]", "Baby Girl [Premium 3]"}
local Houses = {"1 [Motel]", "2 [Motel]", "3 [Motel]", "4 [Motel]", "5 [Motel]", "6 [Apartment]", "7 [Apartment]", "11 [House]", "12 [House]", "13 [House]", "14 [House]", "15 [House]", "13 [House]", "14 [House]", "15 [House]", "16 [House]", "17 [House]", "18 [House]", "19 [House]", "20 [House]", "21 [House]", "22 [House]", "23 [House]", "24 [House]", "28 [Lake Side House]", "29 [Hidden Valley House]", "30 [Lake House]", "31 [Eagle View House]", "32 [Gold Ranch House]", "33 [North Estate]", "34 [South Estate]"}

_G.PlayersHighlightOn = false
_G.PlayersTracersOn = false
_G.CandyHighlightOn = false
_G.CandyTracersOn = false
_G.VehiclesHighlightOn = false

_G.CopyPlayerAvatarName = nil
_G.CopyPlayerIncludeWalkStyle = false
_G.IncludeWalkStyle = false
_G.RainbowName = false
_G.RainbowBio = false
_G.RainbowSkin = false
_G.LoopJobs = false
_G.RainbowHouseBio = false
_G.RainbowHouse = false
_G.AutoUnban = false

_G.SpamCurtains = false
_G.SpamGarage = false
_G.SpamComputer = false
_G.SpamLockHouse = false
_G.SpamBabyOption = false
_G.SpamDishwasher = false
_G.SpamCampfire = false
_G.SpamFridge = false
_G.SpamUnlock = false
_G.SpamHouseLight = false
_G.SpamMailBox = false
_G.SpamOven = false
_G.SpamSafe = false
_G.SpamSink = false
_G.SpamTV = false
_G.SpamPool = false

_G.SpamKnock = false
_G.SpamBell = false
_G.BellKnockTarget = nil

_G.RoomMateTarget = nil
_G.RoomMateHouseTarget = nil

_G.LoopBurnAvatar = false
_G.LoopSmokeAvatar = false

_G.TargetVehicle = nil
_G.RainbowCar = false
_G.RainbowBike = false
_G.SpamFire = false
_G.SpamDuke1 = false
_G.SpamDuke2 = false
_G.SpamTurbo = false
_G.SpamHorn = false
_G.SpamLight = false
_G.SpamHazard = false
_G.SpamHeight = false
_G.SpamWheel = false

_G.SpamShoot = false
_G.SpamShootAll = false

_G.RainbowNascarTruck = false
_G.RainbowNascarTruckPremium = false

_G.RainbowFoodTruck = false
_G.LoopFoodTruckWindow = false
_G.LoopFoodTruckDesign = false

_G.RainbowHorse = false

_G.RainbowSaddle = false
_G.RainbowHorseHair = false
_G.RainbowHorseBody = false

_G.DoorFling = nil

_G.RainbowSignText = false

_G.LoopCartFood = false

_G.LoopHelicopterDesign = false

_G.ChoosedSound = 0
_G.SpamSounds = false
_G.SpamSoundsSpeed = 1
_G.SpamFastSounds = false

_G.PlayerForKill = nil

_G.SpamChildren = false
_G.RainbowChildName = false

_G.Noclip = false
_G.InfJump = false
_G.FlyOn = false
_G.FlySpeed = 1

local function PlayersHighlight()
	for i,v in pairs(game.Players:GetChildren()) do
		pcall(function()
			if v ~= game.Players.LocalPlayer and not v.Character:FindFirstChild("Highlight") then
				local NewHighlight = Instance.new("Highlight")
				NewHighlight.Parent = v.Character
				NewHighlight.FillColor = Color3.fromRGB(255, 255, 255)
				NewHighlight.FillTransparency = 0.15
				NewHighlight.OutlineColor = Color3.fromRGB(0, 0, 0)
				NewHighlight.OutlineTransparency = 0.15
			end
		end)
	end
end

local function playersTracers()
	for i,v in pairs(game.Players:GetChildren()) do
		pcall(function()
			
			for a,b in pairs(game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
				if b.ClassName == "Beam" and not game.Players:FindFirstChild(b.Name) then
					b:Destroy()
				end
			end

			if not v.Character.HumanoidRootPart:FindFirstChild("PlayerTracer") or not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild(v.Name) then
				local one = nil
				local two = nil

				local NewBeam = Instance.new("Beam")
				NewBeam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
				NewBeam.Width0 = 0.05
				NewBeam.Width1 = 0.05
				NewBeam.Transparency = NumberSequence.new(0,0)
				NewBeam.Name = v.Name
				NewBeam.FaceCamera = true
				NewBeam.Color = ColorSequence.new(Color3.fromRGB(255,255,255), Color3.fromRGB(255,255,255))
				
				if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("LocalPlayerTracer") then
					one = Instance.new("Attachment", game.Players.LocalPlayer.Character.HumanoidRootPart)
					one.Name = "LocalPlayerTracer"
				else
					one = game.Players.LocalPlayer.Character.HumanoidRootPart.LocalPlayerTracer
				end
				
				if not v.Character.HumanoidRootPart:FindFirstChild("PlayerTracer") then
					two = Instance.new("Attachment", v.Character.HumanoidRootPart)
					two.Name = "PlayerTracer"
				else
					two = v.Character.HumanoidRootPart.PlayerTracer
				end

				NewBeam.Attachment0 = one
				NewBeam.Attachment1 = two
			end
		end)
	end    
end

local function tpNpc(Npc, NpcPos, Noclip)
	if Noclip == 1 then
		for i,v in pairs(Npc:GetDescendants()) do
			if (v.ClassName == "MeshPart" or v.ClassName == "Part" or v.ClassName == "Seat") and v.CanCollide == true then
				v.CanCollide = false
			end
		end
	end
	if not Npc:WaitForChild("Chassis"):FindFirstChild("MyForceInstance") then
		local ForceInstance = Instance.new("BodyPosition")
		ForceInstance.Parent = Npc:WaitForChild("Chassis").Platform
		ForceInstance.Name = "MyForceInstance"
		ForceInstance.P = 1000000
		ForceInstance.MaxForce = Vector3.new(2500000, 2500000, 2500000)
	end
	Npc:WaitForChild("Chassis").Platform.MyForceInstance.Position = NpcPos
end

local function AddAlignPosition(Part)
	
	local object = Part
	local NewAttach1 = nil
	
	Part.CanCollide = false
	local NewAlignPosition = Instance.new("AlignPosition", object)
	NewAlignPosition.MaxForce = 10000000272564224
	NewAlignPosition.MaxVelocity = 10000000272564224
	NewAlignPosition.Responsiveness = 200

	local NewAttach0 = Instance.new("Attachment", object)
	NewAttach0.Name = "AlignAttach0"
	
	if not game.Players.LocalPlayer.Character.Head:FindFirstChild("AlignAttach1") then
		NewAttach1 = Instance.new("Attachment", game.Players.LocalPlayer.Character.Head)
		NewAttach1.Name = "AlignAttach1"
	else
		NewAttach1 = game.Players.LocalPlayer.Character.Head.AlignAttach1
	end
	
	NewAlignPosition.Attachment0 = NewAttach0
	NewAlignPosition.Attachment1 = NewAttach1
end

local function AddTorque(Part)
	local object = Part
	local NewAttach3 = nil
	Part.CanCollide = false
	
	local NewAttach2 = Instance.new("Attachment", object)
	NewAttach2.Name = "TorqueAttach2"

	if not game.Players.LocalPlayer.Character.Head:FindFirstChild("TorqueAttach3") then
		NewAttach3 = Instance.new("Attachment", game.Players.LocalPlayer.Character.Head)
		NewAttach3.Name = "TorqueAttach3"
	else
		NewAttach3 = game.Players.LocalPlayer.Character.Head.TorqueAttach3
	end

	local Torque = Instance.new("Torque")
	Torque.Parent = object
	Torque.Torque = Vector3.new(100000, 100000, 100000)
	Torque.RelativeTo = "Attachment0"

	Torque.Attachment0 = NewAttach2
	Torque.Attachment1 = NewAttach3
end

local function ChangeAvatar(Avatar)
	local ohTable2 = {
		[1] = Avatar.Torso, --torso
		[2] = Avatar.RightArm, --right arm
		[3] = Avatar.LeftArm, --left arm
		[4] = Avatar.RightLeg, --right leg
		[5] = Avatar.LeftLeg, --left leg
		[6] = Avatar.Head
	}
	game:GetService("ReplicatedStorage").RE["1Avata1rOrigina1l"]:FireServer("CharacterChange", ohTable2, "")
end

local Main = Library:Init({
	name = "Build a Boat for Treasure"
})

local Tab = Main:CreateTab({
	name = "Player",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Player"
})

local Slider = Tab:Slider({
	name = "Walk Speed",
	minimum = 1,
	maximum = 1000,
	default = 16,
	valuename = "Walk Speed",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Value)
	end
})

local Slider = Tab:Slider({
	name = "Jump Power",
	minimum = 1,
	maximum = 1000,
	default = 50,
	valuename = "Jump Power",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(Value)
	end
})

local Slider = Tab:Slider({
	name = "Gravity",
	minimum = -1,
	maximum = 1000,
	default = 196,
	valuename = "Gravity",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		workspace.Gravity = tonumber(Value)
	end
})

local Toggle = Tab:Toggle({
	name = "Noclip",
	callback = function(Value)
		_G.Noclip = Value
		if _G.Noclip == true then
			local temp
			temp = game:GetService("RunService").Stepped:connect(function()
				if _G.Noclip == true then
					for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v:IsA("BasePart") then
							v.CanCollide = false
						end
					end
				else
					for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
						if v.Name == "LowerTorso" or v.Name == "UpperTorso" then
							v.CanCollide = true
						end
					end
					temp:Disconnect()
				end
			end)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Infinite Jump",
	callback = function(Value)
		_G.InfJump = Value
		local InfJumpFunc
		if InfJumpFunc then InfJumpFunc:Disconnect() end
		if _G.InfJump == true then
			while not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") do
				task.wait()
			end
			InfJumpFunc = game:GetService("UserInputService").JumpRequest:Connect(function()
				if _G.InfJump == true then
					game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
				end
			end)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Fly (PC Only, Press [F] Button to Toggle)",
	callback = function(Value)
		_G.FlyOn = Value
		local Max = 0
		local Players = game.Players
		local LP = Players.LocalPlayer
		local Mouse = LP:GetMouse()
		Mouse.KeyDown:connect(
			function(k)
				if k:lower() == "f" then
					Max = Max + 1
					_G.Fly = false
					if _G.FlyOn then
						local T = LP.Character.UpperTorso
						local S = {
							F = 0,
							B = 0,
							L = 0,
							R = 0
						}
						local S2 = {
							F = 0,
							B = 0,
							L = 0,
							R = 0
						}
						local SPEED = 500
						local function FLY()
							_G.Fly = true
							local BodyGyro = Instance.new("BodyGyro", T)
							local BodyVelocity = Instance.new("BodyVelocity", T)
							BodyGyro.P = 9e4
							BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
							BodyGyro.cframe = T.CFrame
							BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
							BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
							spawn(function()
								repeat
									game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Ragdoll")
									task.wait()
								until not _G.Fly
							end)
							spawn(
								function()
									repeat

										wait()
										if LP.Character:FindFirstChildOfClass("Humanoid") then LP.Character.Humanoid.PlatformStand = false end
										if S.L + S.R ~= 0 or S.F + S.B ~= 0 then
											SPEED = _G.FlySpeed * 40
										elseif not (S.L + S.R ~= 0 or S.F + S.B ~= 0) and SPEED ~= 0 then
											SPEED = 0
										end
										if (S.L + S.R) ~= 0 or (S.F + S.B) ~= 0 then
											BodyVelocity.velocity =
												((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (S.F + S.B)) +
													((game.Workspace.CurrentCamera.CoordinateFrame *
														CFrame.new(S.L + S.R, (S.F + S.B) * 0.2, 0).p) -
														game.Workspace.CurrentCamera.CoordinateFrame.p)) *
												SPEED
											S2 = {
												F = S.F,
												B = S.B,
												L = S.L,
												R = S.R
											}
										elseif (S.L + S.R) == 0 and (S.F + S.B) == 0 and SPEED ~= 0 then
											BodyVelocity.velocity =
												((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (S2.F + S2.B)) +
													((game.Workspace.CurrentCamera.CoordinateFrame *
														CFrame.new(S2.L + S2.R, (S2.F + S2.B) * 0.2, 0).p) -
														game.Workspace.CurrentCamera.CoordinateFrame.p)) *
												SPEED
										else
											BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
										end
										BodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame
									until not _G.Fly
									S = {
										F = 0,
										B = 0,
										L = 0,
										R = 0
									}
									S2 = {
										F = 0,
										B = 0,
										L = 0,
										R = 0
									}
									SPEED = 0
									BodyGyro:destroy()
									BodyVelocity:destroy()
									LP.Character.Humanoid.PlatformStand = false
									game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("GettingUp")
								end
							)
						end
						Mouse.KeyDown:connect(
							function(k)
								if k:lower() == "w" then
									S.F = 1
								elseif k:lower() == "s" then
									S.B = -1
								elseif k:lower() == "a" then
									S.L = -1
								elseif k:lower() == "d" then
									S.R = 1
								end
							end
						)
						Mouse.KeyUp:connect(
							function(k)
								if k:lower() == "w" then
									S.F = 0
								elseif k:lower() == "s" then
									S.B = 0
								elseif k:lower() == "a" then
									S.L = 0
								elseif k:lower() == "d" then
									S.R = 0
								end
							end
						)
						FLY()
						if Max == 2 then
							_G.Fly = false
							Max = 0
						end
					end
				end
			end
		)
	end
})

local Slider = Tab:Slider({
	name = "Change Fly Speed",
	minimum = 1,
	maximum = 250,
	default = 1,
	valuename = "Fly Speed",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		_G.FlySpeed = tonumber(Value)
	end
})

Tab:Section({
	text = "Visuals"
})

local Toggle = Tab:Toggle({
	name = "Players ESP",
	callback = function(Value)
		_G.PlayersHighlightOn = Value
		if _G.PlayersHighlightOn == true then
			local testtest1
			testtest1 = game:GetService("RunService").Stepped:connect(function()
				if _G.PlayersHighlightOn == true then
					PlayersHighlight()
				elseif _G.PlayersHighlightOn == false then
					for i,v in pairs(game.Players:GetChildren()) do
						if v.Name ~= game.Players.LocalPlayer.Name and v.Character:FindFirstChild("Highlight") then
							v.Character.Highlight:Destroy()
						end
					end
					testtest1:Disconnect()
				end
			end)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Players Tracers",
	callback = function(Value)
		_G.PlayersTracersOn = Value
		if _G.PlayersTracersOn == true then
			local testtest2
			testtest2 = game:GetService("RunService").Stepped:connect(function()
				if _G.PlayersTracersOn == true then
					playersTracers()
				elseif _G.PlayersTracersOn == false then
					for i,v in pairs (game.Players.LocalPlayer.Character.HumanoidRootPart:GetChildren()) do
						if v.ClassName == "Beam" then v:Destroy() end
					end
					for i,v in pairs (game.Players:GetPlayers()) do
						if v.Character.HumanoidRootPart:FindFirstChild("PlayerTracer") then
							v.Character.HumanoidRootPart.PlayerTracer:Destroy()
						end
					end
					testtest2:Disconnect()
				end
			end)
		end
	end
})

local Tab = Main:CreateTab({
	name = "Avatar",
	icon = "rbxassetid://15101014644"
})

Tab:Section({
	text = "Avatar"
})

local Button = Tab:Button({
	name = "Faceless (FE)",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Updat1eAvata1r"]:FireServer("wear", 12350593459)
		task.wait(0.5)
		game:GetService("ReplicatedStorage").RE["1Updat1eAvata1r"]:FireServer("wear", 12350593459)
	end)
})

local Input = Tab:Input({
	name = "Wear Custom Face / Shirt / Pants / Accessory",
	placeholdertext = "ID",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1Updat1eAvata1r"]:FireServer("wear", tonumber(Value))
	end
})

Tab:Section({
	text = "Copy Avatar"
})

local Input = Tab:Input({
	name = "Enter Player's Name",
	placeholdertext = "Player",
	cleartextonfocus = true,
	callback = function(Value)
		_G.CopyPlayerAvatarName = tostring(Value)
	end
})

local Button = Tab:Button({
	name = "Copy Player Avatar",
	callback = (function()
		local UpdateAvatar = game:GetService("ReplicatedStorage").RE["1Updat1eAvata1r"]
		local HumanoidDescription = game.Players:FindFirstChild(_G.CopyPlayerAvatarName).Character.Humanoid.HumanoidDescription
		game:GetService("ReplicatedStorage").RE["1Avata1rOrigina1l"]:FireServer("OCA")
		task.wait(0.5)
		ChangeAvatar(game.Players:WaitForChild(_G.CopyPlayerAvatarName).Character.Humanoid.HumanoidDescription)
		task.wait(0.5)
		ChangeAvatar(game.Players:WaitForChild(_G.CopyPlayerAvatarName).Character.Humanoid.HumanoidDescription)
		task.wait(0.5)
		ChangeAvatar(game.Players:WaitForChild(_G.CopyPlayerAvatarName).Character.Humanoid.HumanoidDescription)
		task.wait(0.5)
		UpdateAvatar:FireServer("skintone", tostring(game.Players:FindFirstChild(_G.CopyPlayerAvatarName).Character.Head.BrickColor))
		task.wait(0.5)
		UpdateAvatar:FireServer("skintone", tostring(game.Players:FindFirstChild(_G.CopyPlayerAvatarName).Character.Head.BrickColor))
		task.wait(0.5)
		UpdateAvatar:FireServer("skintone", tostring(game.Players:FindFirstChild(_G.CopyPlayerAvatarName).Character.Head.BrickColor))
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", 63690008)
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", 144075659)
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", 144076760)
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", 144076358)	
		task.wait(0.5)
		UpdateAvatar:FireServer("wear")
		task.wait(0.5)

		for i,v in pairs(string.split(HumanoidDescription.FaceAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		UpdateAvatar:FireServer("wear", 144075659)
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", tonumber(HumanoidDescription.Pants))
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", tonumber(HumanoidDescription.Shirt))
		task.wait(0.5)
		UpdateAvatar:FireServer("wear", tonumber(HumanoidDescription.GraphicTShirt))
		task.wait(0.5)

		for i,v in pairs(string.split(HumanoidDescription.BackAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		for i,v in pairs(string.split(HumanoidDescription.HairAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		for i,v in pairs(string.split(HumanoidDescription.HatAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		for i,v in pairs(string.split(HumanoidDescription.FrontAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		for i,v in pairs(string.split(HumanoidDescription.NeckAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		for i,v in pairs(string.split(HumanoidDescription.WaistAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		for i,v in pairs(string.split(HumanoidDescription.ShouldersAccessory, ",")) do
			UpdateAvatar:FireServer("wear", tonumber(v))
			task.wait(0.5)
		end

		UpdateAvatar:FireServer("wear", tonumber(HumanoidDescription.Face))
		task.wait(0.5)

		if _G.IncludeWalkStyle == true then
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.ClimbAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.FallAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.IdleAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.JumpAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.MoodAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.RunAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.SwimAnimation)
			task.wait(0.5)
			UpdateAvatar:FireServer("wearWalkStyle", HumanoidDescription.WalkAnimation)
			task.wait(0.5)
		end
	end)
})

local Toggle = Tab:Toggle({
	name = "Include Walk Style",
	callback = function(Value)
		_G.IncludeWalkStyle = Value
	end
})

local Button = Tab:Button({
	name = "Teleport To Player",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(_G.CopyPlayerAvatarName).Character.HumanoidRootPart.CFrame
	end)
})

local Button = Tab:Button({
	name = "Reset Player Outfit",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Avata1rOrigina1l"]:FireServer("OCA")
	end)
})

Tab:Section({
	text = "Change RP Name"
})

local Input = Tab:Input({
	name = "Change RP Name",
	placeholdertext = "RP Name",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", tostring(Value))
	end
})

local Input = Tab:Input({
	name = "Copy RP Name of the Player",
	placeholdertext = "Player",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", game.Players:FindFirstChild(Value).PlayersBag.RPName.Value)
		task.wait(0.3)
		game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", game.Players:FindFirstChild(Value).PlayersBag.RPNameColor.Value)
	end
})

local Button = Tab:Button({
	name = "Delete RP Name",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "")
	end)
})

local Toggle = Tab:Toggle({
	name = "Rainbow RP Name",
	callback = function(Value)
		_G.RainbowName = Value
		while _G.RainbowName == true do
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(1, 0, 0))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(1, 0, 1))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(0.666667, 0, 0))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(0, 0, 1))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(0, 1, 1))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(0, 1, 0))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(1, 1, 0))
			task.wait(0.5)
		end
	end
})

Tab:Section({
	text = "Change Bio"
})

local Input = Tab:Input({
	name = "Change Bio",
	placeholdertext = "Bio",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayBio", tostring(Value))
	end
})

local Input = Tab:Input({
	name = "Copy Bio of the Player",
	placeholdertext = "Player",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayBio", game.Players:FindFirstChild(Value).PlayersBag.RPBio.Value)
		task.wait(0.3)
		game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", game.Players:FindFirstChild(Value).PlayersBag.RPBioColor.Value)
	end
})

local Button = Tab:Button({
	name = "Delete Bio",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayBio", "")
	end)
})

local Toggle = Tab:Toggle({
	name = "Rainbow Bio",
	callback = function(Value)
		_G.RainbowBio = Value
		while _G.RainbowBio == true do
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(1, 0, 0))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(1, 0, 1))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(0.666667, 0, 0))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(0, 0, 1))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(0, 1, 1))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(0, 1, 0))
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPBioColor", Color3.new(1, 1, 0))
			task.wait(0.5)
		end
	end
})

Tab:Section({
	text = "Spawn a Child"
})

local Dropdown = Tab:Dropdown({
	name = "Children",
	callback = function(Name, Value)
		game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", Value)
	end,
	opencallback = function()

	end,
})

Dropdown:Add("Baby Boy", "BabyBoy")
Dropdown:Add("Baby Girl", "BabyGirl")
Dropdown:Add("Baby Boy [Premium 1]", "BabyBoy1")
Dropdown:Add("Baby Boy [Premium 2]", "BabyBoy2")
Dropdown:Add("Baby Boy [Premium 3]", "BabyBoy3")
Dropdown:Add("Baby Girl [Premium 1]", "BabyGirl1")
Dropdown:Add("Baby Girl [Premium 2]", "BabyGirl2")
Dropdown:Add("Baby Girl [Premium 3]", "BabyGirl3")

local Toggle = Tab:Toggle({
	name = "Spam Spawn Child",
	callback = function(Value)
		_G.SpamChildren = Value
		while _G.SpamChildren == true do
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyBoy")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyGirl")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyBoy1")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyBoy2")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyBoy3")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyGirl1")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyGirl2")
			task.wait(0.5)
			game:GetService("ReplicatedStorage").RE["1Bab1yFollo1w"]:FireServer("CharacterFollowSpawnPlayer", "BabyGirl3")
			task.wait(0.5)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Rainbow Child Name",
	callback = function(Value)
		_G.RainbowChildName = Value
		while _G.RainbowChildName == true do
			for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.NoResetGUIHandler.MainAvatarMenu.Catalog.Container.ScrollingFrameKid2.Frame:GetChildren()) do
				if v.Name == "FollowColor" then
					game:GetService("ReplicatedStorage").RE["1RPNam1eColo1r"]:FireServer("PickingRPFollowColor", v.Color)
					task.wait(0.5)
				end
			end
			task.wait()
		end
	end	
})

Tab:Section({
	text = "Rainbow Skin"
})

local Toggle = Tab:Toggle({
	name = "Rainbow Skin",
	callback = function(Value)
		_G.RainbowSkin = Value
		while _G.RainbowSkin == true do
			game:GetService("ReplicatedStorage").RE["1Updat1eAvata1r"]:FireServer("skintone", BrickColor.new(math.random(1,365)).Name)
			task.wait(0.3)
		end
	end
})

Tab:Section({
	text = "Jobs"
})

local Toggle = Tab:Toggle({
	name = "Loop Jobs",
	callback = function(Value)
		_G.LoopJobs = Value
		while _G.LoopJobs == true do
			for i,v in pairs (game:GetService("Workspace").WorkspaceCom["001_GiveJobs"]:GetChildren()) do
				game:GetService("ReplicatedStorage").RE["1Jo1b"]:FireServer("GiveJobUIMenu", v.Name, v.Name, true)
				task.wait(0.1)
			end
			task.wait()
		end
	end
})

local Button = Tab:Button({
	name = "Quit Job",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Jo1b"]:FireServer("QuitJob")
	end)
})

Tab:Section({
	text = "Player Size"
})

local Button = Tab:Button({
	name = "Small Character",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Clothe1s"]:FireServer("CharacterSizeDown", 10)
	end)
})

local Button = Tab:Button({
	name = "Normal Character",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Clothe1s"]:FireServer("CharacterSizeUp", 1)
	end)
})

Tab:Section({
	text = "Burn / Smoke Avatar"
})

local Button = Tab:Button({
	name = "Burn Avatar",
	callback = (function()
		firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_HappyBurger"].CatchFire, 0)
		firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_BrooksDiner"].CatchFire, 0)
		task.wait(0.1)
		firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_BrooksDiner"].CatchFire, 1)
		firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_HappyBurger"].CatchFire, 1)
	end)
})

local Toggle = Tab:Toggle({
	name = "Loop Burn Avatar",
	callback = function(Value)
		_G.LoopBurnAvatar = Value
		while _G.LoopBurnAvatar == true and task.wait(0.1) do
			firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_HappyBurger"].CatchFire, 0)
			firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_BrooksDiner"].CatchFire, 0)
			task.wait(0.1)
			firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_BrooksDiner"].CatchFire, 1)
			firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_HappyBurger"].CatchFire, 1)

		end
	end
})

local Button = Tab:Button({
	name = "Smoke Avatar",
	callback = (function()
		firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_Pizza"].CatchFire, 0)
		task.wait(0.1)
		firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_Pizza"].CatchFire, 1)
	end)
})

local Toggle = Tab:Toggle({
	name = "Loop Smoke Avatar",
	callback = function(Value)
		_G.LoopSmokeAvatar = Value
		while _G.LoopSmokeAvatar == true and task.wait(0.1) do
			firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_Pizza"].CatchFire, 0)
			task.wait(0.1)
			firetouchinterest(game.Players.LocalPlayer.Character.Head, game:GetService("Workspace").WorkspaceCom["001_Mall"]["001_Pizza"].CatchFire, 1)
		end
	end
})

local Tab = Main:CreateTab({
	name = "Houses",
	icon = "rbxassetid://15101018631"
})

Tab:Section({
	text = "House Name"
})

local Input = Tab:Input({
	name = "House Name",
	placeholdertext = "Name",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1RPHous1eEven1t"]:FireServer("BusinessName", tostring(Value))
	end
})

local Toggle = Tab:Toggle({
	name = "Rainbow House Name",
	callback = function(Value)
		_G.RainbowHouseBio = Value
		while _G.RainbowHouseBio == true do
			for i,v in pairs(game:GetService("Players").averytiredcheese.PlayerGui.MainGUIHandler.HouseControl.HomeBus.HomeText.Picks.Frame:GetChildren()) do
				if v.Name == "Colors" then
					game:GetService("ReplicatedStorage").RE["1RPHous1eEven1tColo1r"]:FireServer("PickingBusinessNameColor", v.Color)
					task.wait(1)
				end
			end
			task.wait()
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Rainbow House",
	callback = function(Value)
		_G.RainbowHouse = Value
		while _G.RainbowHouse == true do
			for i,v in pairs(game:GetService("Players").averytiredcheese.PlayerGui.MainGUIHandler.HouseControl.HomeBus.HomeText.Picks.Frame:GetChildren()) do
				game:GetService("ReplicatedStorage").RE["1Player1sHous1e"]:FireServer("ColorPickHouse", Color3.new(math.random(), math.random(), math.random()))
				task.wait(1.5)
			end
			task.wait()
		end
	end
})

Tab:Section({
	text = "Spam Things"
})

local Toggle = Tab:Toggle({
	name = "Spam Curtains",
	callback = function(Value)
		_G.SpamCurtains = Value
		while _G.SpamCurtains == true do
			game:GetService("ReplicatedStorage").RE["1Player1sHous1e"]:FireServer("Curtains")
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Garage",
	callback = function(Value)
		_G.SpamGarage = Value
		while _G.SpamGarage == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_HouseDoors"].GarageOpeners.Button.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Computer",
	callback = function(Value)
		_G.SpamComputer = Value
		while _G.SpamComputer == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Computer"].ChannelDown.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Dishwasher",
	callback = function(Value)
		_G.SpamDishwasher = Value
		while _G.SpamDishwasher == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_DishWasher"].Door.Interactive.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Campfire",
	callback = function(Value)
		_G.SpamCampfire = Value
		while _G.SpamCampfire == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Fire"].FireClicker.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Fridge",
	callback = function(Value)
		_G.SpamFridge = Value
		while _G.SpamFridge == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Fridge"].RightDoor.Handle.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Fridge"].LeftDoor.Handle.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Lock / Unlock Door",
	callback = function(Value)
		_G.SpamUnlock = Value
		while _G.SpamUnlock == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_HouseDoors"].LockDoorButton)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam House Lights",
	callback = function(Value)
		_G.SpamHouseLight = Value
		while _G.SpamHouseLight == true do
			for i,v in pairs (game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_HouseLights"]:GetChildren()) do
				fireclickdetector(v.ClickDetector)
				task.wait(1)
			end
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Mail Box",
	callback = function(Value)
		_G.SpamMailBox = Value
		while _G.SpamMailBox == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_MailBox"].ModelMove.Door.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Oven",
	callback = function(Value)
		_G.SpamOven = Value
		while _G.SpamOven == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Oven"].OvenDoor.Interactive.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Safe",
	callback = function(Value)
		_G.SpamSafe = Value
		while _G.SpamSafe == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Safe"].OpenSafeDoorButton.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Sink",
	callback = function(Value)
		_G.SpamSink = Value
		while _G.SpamSink == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Sink"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Sink2"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Sink3"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Sink4"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Sink5"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_Sink7"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_SinkTub"].Sink0.WaterOnOff.ClickDetector)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam TV",
	callback = function(Value)
		_G.SpamTV = Value
		while _G.SpamTV == true do
			fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(game.Players.LocalPlayer.Name.."House").HousePickedByPlayer.HouseModel["001_TV"].ChannelDown)
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Pool",
	callback = function(Value)
		_G.SpamPool = Value
		while _G.SpamPool == true do
			game:GetService("ReplicatedStorage").RE["1Player1sHous1e"]:FireServer("PoolOnOff")
			task.wait(1)
		end
	end
})

Tab:Section({
	text = "Spam Bell / Knock"
})

local Input = Tab:Input({
	name = "Enter Target Name",
	placeholdertext = "Player",
	cleartextonfocus = true,
	callback = function(Value)
		_G.BellKnockTarget = tostring(Value)
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Bell",
	callback = function(Value)
		_G.SpamBell = Value
		while _G.SpamBell == true do
			if game.Players.LocalPlayer:DistanceFromCharacter(game:GetService("Workspace")["001_Lots"]:FindFirstChild(_G.BellKnockTarget.."House").HousePickedByPlayer.HouseModel["001_DoorBell"].TouchBell.Position) < 35 then
				fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(_G.BellKnockTarget.."House").HousePickedByPlayer.HouseModel["001_DoorBell"].TouchBell.ClickDetector)
			end
			task.wait(1)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Spam Knock",
	callback = function(Value)
		_G.SpamKnock = Value
		while _G.SpamKnock == true do
			if game.Players.LocalPlayer:DistanceFromCharacter(game:GetService("Workspace")["001_Lots"]:FindFirstChild(_G.BellKnockTarget.."House").HousePickedByPlayer.HouseModel["001_HouseDoors"].HouseDoorFront.Knock.TouchBell.Position) < 35 then
				fireclickdetector(game:GetService("Workspace")["001_Lots"]:FindFirstChild(_G.BellKnockTarget.."House").HousePickedByPlayer.HouseModel["001_HouseDoors"].HouseDoorFront.Knock.TouchBell.ClickDetector)
			end
			task.wait(1)
		end
	end	
})

Tab:Section({
	text = "Roommate Player"
})

local Input = Tab:Input({
	name = "Enter Target Name",
	placeholdertext = "Input",
	cleartextonfocus = true,
	callback = function(Value)
		_G.RoomMateTarget = tostring(Value)
	end
})

local Dropdown = Tab:Dropdown({
	name = "Choose Land",
	callback = function(Name, Value)
		_G.RoomMateHouseTarget = Value
	end,
	opencallback = function()

	end,
})

for i,v in pairs(Houses) do
	local Value = string.match(v, "%d+")
	Dropdown:Add(v, tonumber(Value))
end

local Button = Tab:Button({
	name = "Give Roommate Permissions",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Playe1rTrigge1rEven1t"]:FireServer("GivePermissionLoopToServer", game:GetService("Players"):FindFirstChild(_G.RoomMateTarget), _G.RoomMateHouseTarget)
	end)
})

local Button = Tab:Button({
	name = "Remove Roommate Permissions",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Playe1rTrigge1rEven1t"]:FireServer("RemovePermissionLoopToServer", game:GetService("Players"):FindFirstChild(_G.RoomMateTarget), _G.RoomMateHouseTarget)
	end)
})

Tab:Section({
	text = "Unban From All Houses"
})

local Button = Tab:Button({
	name = "Unban From All Houses",
	callback = (function()
		for i,v in pairs(game:GetService("Workspace")["001_Lots"]:GetChildren()) do
			if v:IsA("Part") and v:FindFirstChild("HousePickedByPlayer") then
				for a,b in pairs(v.HousePickedByPlayer.HouseModel:GetChildren()) do
					if b.Name:find("BannedBlock") then
						b:Destroy()
						break
					end
				end
			end
		end
	end)
})

local Toggle = Tab:Toggle({
	name = "Auto Unban",
	callback = function(Value)
		_G.AutoUnban = Value
		if _G.AutoUnban == true then
			local temp2
			temp2 = game:GetService("RunService").Stepped:connect(function()
				if _G.AutoUnban == true then
					for i,v in pairs(game:GetService("Workspace")["001_Lots"]:GetChildren()) do
						if v:IsA("Part") and v:FindFirstChild("HousePickedByPlayer") then
							for a,b in pairs(v.HousePickedByPlayer.HouseModel:GetChildren()) do
								if b.Name:find("BannedBlock") then
									b:Destroy()
									break
								end
							end
						end
					end
				else
					temp2:Disconnect()
				end
			end)
		end
	end
})

Tab:Section({
	text = "Miscellaneous"
})

local Button = Tab:Button({
	name = "Burn Your House",
	callback = (function()
		game:GetService("ReplicatedStorage").RE["1Player1sHous1e"]:FireServer("PlayerWantsFireOnFirePassNotShowingAnyone")
	end)
})

local Input = Tab:Input({
	name = "Set House Music",
	placeholdertext = "ID",
	cleartextonfocus = true,
	callback = function(Value)
		game:GetService("ReplicatedStorage").RE["1Player1sHous1e"]:FireServer("PickHouseMusicText", tonumber(Value))
	end
})


print("5")
