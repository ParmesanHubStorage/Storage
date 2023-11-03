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
