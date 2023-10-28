Library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua"),true))()

local Rocks = {"PointedRock", "Rock", "Rock1", "Rock2", "Rock3", "Log", "GrassyRock1", "GrassyRock2", "Ticket", "Pizza", "Token", "Soldier1", "Soldier2", "Soldier3", "Soldier4", "Soldier5", "Soldier6", "Soldier7", "Soldier8", "Soldier9", "Soldier10", "Soldier11", "Soldier12", "Soldier13", "Soldier14", "Soldier15", "Soldier16", "Soldier17", "Soldier18", "DiceWhite", "DiceBlack", "CardPurple", "CardYellow", "CardGreen", "CardRed", "LED1", "LED2", "LED3", "Chip", "Resister1", "Resister2", "Pipe1", "Pipe2", "Pipe3", "Mine", "HoneyStream", "HoneyRock1", "HoneyRock2", "Box", "PaintBrush", "PoisonMushroom", "GrassyRock", "Film", "Hammer", "Pencil", "PagePeice", "MagnifyingGlass", "RoundTestTubeShocking", "RoundTestTubePoisonous", "RoundTestTubeExplosive", "Cattail1", "Cattail2", "Cattail3", "LilyPadSmall", "LilyPad", "Alligator", "Pretzel", "CottonCandy", "Hotdog", "Gear", "Tenticle", "Teal Gem", "Yellow Gem", "Red Gem", "LimeGem", "Acid", "Rusted Iron", "Toxic Barrel", "BatAndGlove", "IceCreamCone", "Popsicle", "Loly", "Popcorn", "Ammo", "BowlingBall1", "BowlingBall2", "BowlingBall3", "BowlingBall4", "BowlingBall5", "BowlingBall6", "Le beignet", "Onek", "Fork", "Twok", "Threek", "BallK", "BallM", "Lily1", "Lily2", "Lily3", "Weapon", "RockExplosive", "Hammer", "FireRock", "FallRock1", "FallRock2", "PufferFish1", "PufferFish2", "PufferFish3", "Lily1", "Lily2", "Lily3"}

local Player = game.Players.LocalPlayer.Character

getgenv().LocalPlayer = game.Players.LocalPlayer.Character
getgenv().Autofarm = false
getgenv().AutofarmChest = false
getgenv().WaitTime = 26
getgenv().CurrentChest = "Common Chest"
getgenv().AutoBuyChest = false
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

local WaitTime = 20

local function MoveToEnd()
	game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

	local TweenPart = game.Players.LocalPlayer.Character.HumanoidRootPart
	local TweenService = game:GetService("TweenService")

	local Info = TweenInfo.new(WaitTime, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)

	local TweenGoals = {CFrame = CFrame.new(-47.8657, 55.775, 8350.74)}

	local Tween = TweenService:Create(TweenPart,Info,TweenGoals)
	Tween:Play()
end

local function AutofarmFunc()
	game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	spawn(function()
		while game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 do
			if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
			end
			task.wait(0.5)
			if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
			end
			task.wait(0.1)
		end
	end)
	game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-60.2082, 55.7433, 1184.53)
	MoveToEnd()
	while game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 and game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z < 8345 do
		task.wait()
	end
	if game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 then
		if AutofarmChest == true then
			while (game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) == true do
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.BoatStages.NormalStages.TheEnd.GoldenChest.Trigger.CFrame
				task.wait(0.1)
			end
		else
			game.Players.LocalPlayer.Character.Humanoid.Health = -1
			game.Players.LocalPlayer.Character.HumanoidRootPart:Destroy()
		end
	end	
end
