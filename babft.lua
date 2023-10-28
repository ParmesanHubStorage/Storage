local Library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua"),true))()

local TweenService = game:GetService("TweenService")

local Rocks = {"PointedRock", "Rock", "Rock1", "Rock2", "Rock3", "Log", "GrassyRock1", "GrassyRock2", "Ticket", "Pizza", "Token", "Soldier1", "Soldier2", "Soldier3", "Soldier4", "Soldier5", "Soldier6", "Soldier7", "Soldier8", "Soldier9", "Soldier10", "Soldier11", "Soldier12", "Soldier13", "Soldier14", "Soldier15", "Soldier16", "Soldier17", "Soldier18", "DiceWhite", "DiceBlack", "CardPurple", "CardYellow", "CardGreen", "CardRed", "LED1", "LED2", "LED3", "Chip", "Resister1", "Resister2", "Pipe1", "Pipe2", "Pipe3", "Mine", "HoneyStream", "HoneyRock1", "HoneyRock2", "Box", "PaintBrush", "PoisonMushroom", "GrassyRock", "Film", "Hammer", "Pencil", "PagePeice", "MagnifyingGlass", "RoundTestTubeShocking", "RoundTestTubePoisonous", "RoundTestTubeExplosive", "Cattail1", "Cattail2", "Cattail3", "LilyPadSmall", "LilyPad", "Alligator", "Pretzel", "CottonCandy", "Hotdog", "Gear", "Tenticle", "Teal Gem", "Yellow Gem", "Red Gem", "LimeGem", "Acid", "Rusted Iron", "Toxic Barrel", "BatAndGlove", "IceCreamCone", "Popsicle", "Loly", "Popcorn", "Ammo", "BowlingBall1", "BowlingBall2", "BowlingBall3", "BowlingBall4", "BowlingBall5", "BowlingBall6", "Le beignet", "Onek", "Fork", "Twok", "Threek", "BallK", "BallM", "Lily1", "Lily2", "Lily3", "Weapon", "RockExplosive", "Hammer", "FireRock", "FallRock1", "FallRock2", "PufferFish1", "PufferFish2", "PufferFish3", "Lily1", "Lily2", "Lily3"}

getgenv().LocalPlayer = game.Players.LocalPlayer.Character
getgenv().Autofarm = false
getgenv().AutofarmChest = false
getgenv().WaitTime = 26
getgenv().CurrentChest = "Common Chest"
getgenv().AutoBuyChest = falsea
getgenv().BuyChestValue = 1

getgenv().CurrentBlock = "Wood Block"
getgenv().AutoBuyBlock = false
getgenv().BuyBlockValue = 1

getgenv().UpdateIsolationMode = false
getgenv().CurrentPlayer = nil

getgenv().PlayerInfo = nil
getgenv().CurrentSaveSlot = nil
getgenv().AutosaveSlot = false

getgenv().Noclip = false
getgenv().InfJump = false
getgenv().FlyOn = false
getgenv().FlySpeed = 1

getgenv().FirstGold = game:GetService("Players").LocalPlayer.Data.Gold.Value
getgenv().FirstGoldBlock = game:GetService("Players").LocalPlayer.Data.GoldBlock.Value

local function MoveToEnd()
	while not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
		task.wait()
	end
	local TweenPart = game.Players.LocalPlayer.Character.HumanoidRootPart
	TweenPart.Parent.Humanoid:ChangeState("Ragdoll")

	local Info = TweenInfo.new(
		WaitTime,
		Enum.EasingStyle.Linear,
		Enum.EasingDirection.InOut,
		0,
		false,
		0
	)


	local TweenGoals
	TweenGoals = {CFrame = CFrame.new(-47.8657, 55.775, 8350.74)}

	local Tween = TweenService:Create(TweenPart,Info,TweenGoals)

	Tween:Play()
end

local function AutofarmFunc()
	while not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
		task.wait()
	end
	local Player = game.Players.LocalPlayer.Character
	spawn(function()
		while game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 do
			if Player:FindFirstChild("HumanoidRootPart") then
				Player.HumanoidRootPart.Anchored = true
			end
			task.wait(0.5)
			if Player:FindFirstChild("HumanoidRootPart") then
				Player.HumanoidRootPart.Anchored = false
			end
			task.wait(0.1)
		end
	end)
	Player.HumanoidRootPart.Anchored = true
	Player.HumanoidRootPart.CFrame = CFrame.new(-60.2082, 55.7433, 1184.53)
	MoveToEnd()
	while game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 and game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z < 8345 do
		task.wait()
	end
	if game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 then
		if AutofarmChest == true then
			while game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
				Player.HumanoidRootPart.CFrame = game.workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger.CFrame
				task.wait(0.1)
			end
		else
			Player.Humanoid.Health = -1
			Player.HumanoidRootPart:Destroy()
		end
	end
end

spawn(function()
	while true do
		LocalPlayer = game.Players.LocalPlayer.Character
		task.wait(0.1)
	end
end)	

local ParmesanLib = Library:Init({
	name = "Build a Boat for Treasure"
})

local Tab = ParmesanLib:CreateTab({
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
	default = 100,
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
	default = 100,
	valuename = "Jump Power",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(Value)
	end
})

local Toggle = Tab:Toggle({
	name = "Noclip",
	callback = function(Value)
		Noclip = Value
		local Mouse = game.Players.LocalPlayer:GetMouse()
		getgenv().noclips = true

		noclips = not noclips
		local temp
		temp = game:GetService("RunService").Stepped:connect(function()
			if noclips then
				for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			else
				temp:Disconnect()
				for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
					if v.Name == "LowerTorso" or v.Name == "UpperTorso" then
						v.CanCollide = true
					end
				end
			end
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Infinite Jump",
	callback = function(Value)
		InfJump = Value
		local InfJumpFunc
		if InfJumpFunc then InfJumpFunc:Disconnect() end
		if InfJump == true then
			while not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") do
				task.wait()
			end
			InfJumpFunc = game:GetService("UserInputService").JumpRequest:Connect(function()
				if InfJump == true then
					game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
				end
			end)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Fly (PC Only, Press [F] Button to Toggle)",
	callback = function(Value)
		FlyOn = Value
		local Max = 0
		local Players = game.Players
		local LP = Players.LocalPlayer
		local Mouse = LP:GetMouse()
		Mouse.KeyDown:connect(
			function(k)
				if k:lower() == "f" then
					Max = Max + 1
					getgenv().Fly = false
					if FlyOn then
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
							getgenv().Fly = true
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
								until not getgenv().Fly
							end)
							spawn(
								function()
									repeat

										wait()
										if LP.Character:FindFirstChildOfClass("Humanoid") then LP.Character.Humanoid.PlatformStand = false end
										if S.L + S.R ~= 0 or S.F + S.B ~= 0 then
											SPEED = FlySpeed * 40
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
									until not getgenv().Fly
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
							getgenv().Fly = false
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
	valuename = "walkspeed",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		FlySpeed = tonumber(Value)
	end
})

