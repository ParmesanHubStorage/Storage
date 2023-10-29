local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Parmesan Hub - Build a Boat for Treasure", HidePremium = false, SaveConfig = false, IntroEnabled = false, ConfigFolder = "OrionTest"})
local TweenService = game:GetService("TweenService")

local Rocks = {"PointedRock", "Rock", "Rock1", "Rock2", "Rock3", "Log", "GrassyRock1", "GrassyRock2", "Ticket", "Pizza", "Token", "Soldier1", "Soldier2", "Soldier3", "Soldier4", "Soldier5", "Soldier6", "Soldier7", "Soldier8", "Soldier9", "Soldier10", "Soldier11", "Soldier12", "Soldier13", "Soldier14", "Soldier15", "Soldier16", "Soldier17", "Soldier18", "DiceWhite", "DiceBlack", "CardPurple", "CardYellow", "CardGreen", "CardRed", "LED1", "LED2", "LED3", "Chip", "Resister1", "Resister2", "Pipe1", "Pipe2", "Pipe3", "Mine", "HoneyStream", "HoneyRock1", "HoneyRock2", "Box", "PaintBrush", "PoisonMushroom", "GrassyRock", "Film", "Hammer", "Pencil", "PagePeice", "MagnifyingGlass", "RoundTestTubeShocking", "RoundTestTubePoisonous", "RoundTestTubeExplosive", "Cattail1", "Cattail2", "Cattail3", "LilyPadSmall", "LilyPad", "Alligator", "Pretzel", "CottonCandy", "Hotdog", "Gear", "Tenticle", "Teal Gem", "Yellow Gem", "Red Gem", "LimeGem", "Acid", "Rusted Iron", "Toxic Barrel", "BatAndGlove", "IceCreamCone", "Popsicle", "Loly", "Popcorn", "Ammo", "BowlingBall1", "BowlingBall2", "BowlingBall3", "BowlingBall4", "BowlingBall5", "BowlingBall6", "Le beignet", "Onek", "Fork", "Twok", "Threek", "BallK", "BallM", "Lily1", "Lily2", "Lily3", "Weapon", "RockExplosive", "Hammer", "FireRock", "FallRock1", "FallRock2", "PufferFish1", "PufferFish2", "PufferFish3", "Lily1", "Lily2", "Lily3"}

_G.LocalPlayer = game.Players.LocalPlayer.Character
_G.Autofarm = false
_G.AutofarmChest = false
_G.WaitTime = 26
_G.CurrentChest = "Common Chest"
_G.AutoBuyChest = false
_G.BuyChestValue = 1

_G.CurrentBlock = "Wood Block"
_G.AutoBuyBlock = false
_G.BuyBlockValue = 1

_G.UpdateIsolationMode = false
_G.CurrentPlayer = nil

_G.PlayerInfo = nil
_G.CurrentSaveSlot = nil
_G.AutosaveSlot = false

_G.Noclip = false
_G.InfJump = false
_G.FlyOn = false
_G.FlySpeed = 1

_G.FirstGold = game:GetService("Players").LocalPlayer.Data.Gold.Value
_G.FirstGoldBlock = game:GetService("Players").LocalPlayer.Data.GoldBlock.Value

local function SendWebhook(webhook)
	local url = webhook
	local data = {
		["content"] = "",
		["embeds"] = {{
			["title"] = "Build a Boat for Treasure",
			["description"] = (os.date("%A, %B %d, %X", os.time())),
			["type"] = "rich",
			["color"] = tonumber(0xE69138),
			["fields"] = {
				{
					["name"] = game.Players.LocalPlayer.Name,
					["value"] = 
						"Current Gold Amount: "..game:GetService("Players").LocalPlayer.Data.Gold.Value..
						"\nEarned Gold per This Session: "..game:GetService("Players").LocalPlayer.Data.Gold.Value - FirstGold..
						"\nCurrent Gold Blocks Amount: "..game:GetService("Players").LocalPlayer.Data.GoldBlock.Value..
						"\nEarned Gold Blocks per This Session: "..game:GetService("Players").LocalPlayer.Data.GoldBlock.Value - FirstGoldBlock,
					["inline"] = true
				}
			}
		}}
	}
	local newdata = game:GetService("HttpService"):JSONEncode(data)

	local headers = {
		["content-type"] = "application/json"
	}
	request = http_request or request or HttpPost or syn.request
	local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
	request(abcdef)
end

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

	local TweenGoals = {CFrame = CFrame.new(-47.8657, 55.775, 8350.74)}

	local Tween = TweenService:Create(TweenPart,Info,TweenGoals)

	do Tween:Play() end
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

local PlayerTab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = PlayerTab:AddSection({
	Name = "Player"
})

PlayerTab:AddSlider({
	Name = "Walk Speed",
	Min = 1,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(127,199,255),
	Increment = 1,
	ValueName = "Walk Speed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Value)
	end    
})

PlayerTab:AddSlider({
	Name = "Jump Power",
	Min = 1,
	Max = 500,
	Default = 50,
	Color = Color3.fromRGB(127,199,255),
	Increment = 1,
	ValueName = "Jump Power",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(Value)
	end    
})

PlayerTab:AddToggle({
	Name = "Noclip",
	Default = false,
	Callback = function(Value)
		Noclip = Value
		local Mouse = game.Players.LocalPlayer:GetMouse()
		_G.noclips = true

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
		end)

	end    
})

PlayerTab:AddToggle({
	Name = "Infinite Jump",
	Default = false,
	Callback = function(Value)
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

PlayerTab:AddToggle({
	Name = "Fly (PC Only, Press [F] Button to Toggle)",
	Default = false,
	Callback = function(Value)
		FlyOn = Value
		local Max = 0
		local Players = game.Players
		local LP = Players.LocalPlayer
		local Mouse = LP:GetMouse()
		Mouse.KeyDown:connect(
			function(k)
				if k:lower() == "f" then
					Max = Max + 1
					_G.Fly = false
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

PlayerTab:AddSlider({
	Name = "Change Fly Speed",
	Min = 1,
	Max = 250,
	Default = 1,
	Color = Color3.fromRGB(127,199,255),
	Increment = 1,
	ValueName = "Fly Speed",
	Callback = function(Value)
		FlySpeed = tonumber(Value)
	end    
})

local GameTab = Window:MakeTab({
	Name = "Game",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = GameTab:AddSection({
	Name = "Game"
})

GameTab:AddDropdown({
	Name = "Start Deleted Quest",
	Default = "",
	Options = {"Gift Battle", "Nutcracker Army Invasion", "The Boss (Fabbi the Duck)"},
	Callback = function(Value)
		local QuestId = nil
		if Value == "Gift Battle" then
			QuestId = 99
		elseif Value == "Nutcracker Army Invasion" then
			QuestId = 101
		elseif Value == "The Boss (Fabbi the Duck)" then
			QuestId = 100
		end
		workspace.QuestMakerEvent:FireServer(QuestId)
	end    
})

GameTab:AddToggle({
	Name = "Auto Turn On / Turn Off Isolation Mode",
	Default = false,
	Callback = function(Value)
		UpdateIsolationMode = Value
		while UpdateIsolationMode == true do
			workspace.RefreshLocks:FireServer(true)
			task.wait(1)
			workspace.RefreshLocks:FireServer(false)
			task.wait(1)
		end
	end    
})

GameTab:AddButton({
	Name = "Turn Off Isolation Mode (Quests)",
	Callback = function()
		workspace.RefreshLocks:FireServer(false)
	end    
})

GameTab:AddButton({
	Name = "Delete Isolation Mode Parts",
	Callback = function()
		for i,v in pairs(workspace:GetDescendants()) do
			if (v.Name == "IsolationBeams" or v.Name == "Lock") and v.ClassName == "Folder" then
				v:Destroy()
			end
		end
	end    
})


GameTab:AddButton({
	Name = "Delete All Stage Obstacles",
	Callback = function()
		for i,v in pairs(workspace.BoatStages:GetDescendants()) do
			if table.find(Rocks, v.Name) then
				v:Destroy()
			end
		end
	end    
})

GameTab:AddButton({
	Name = "Dont Destroy the Boat at the End",
	Callback = function()
		game:GetService("Workspace").BoatStages.NormalStages.TheEnd.DestroyBoatPart:Destroy()
	end    
})

local AutofarmTab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = AutofarmTab:AddSection({
	Name = "Auto Farm"
})

AutofarmTab:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(Value)
		Autofarm = Value	
		while Autofarm == true do
			AutofarmFunc()
			while LocalPlayer:FindFirstChild("Humanoid") do
				task.wait()
			end
			wait(0.5)
		end
	end    
})

AutofarmTab:AddToggle({
	Name = "Teleport to the Treasure at the End",
	Default = false,
	Callback = function(Value)
		AutofarmChest = Value
	end    
})

AutofarmTab:AddSlider({
	Name = "Autofarm Speed (seconds)",
	Min = 1,
	Max = 60,
	Default = 26,
	Color = Color3.fromRGB(127,199,255),
	Increment = 1,
	ValueName = "second(s)",
	Callback = function(Value)
		WaitTime = Value
	end    
})

local TeleportTab = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local TeleportSection = TeleportTab:AddSection({
	Name = "Teleport to Team"
})

TeleportTab:AddDropdown({
	Name = "Teleport to Team",
	Default = "",
	Options = {"White Team", "Red Team", "Black Team", "Blue Team", "Green Team", "Yellow Team", "Magenta Team"},
	Callback = function(Value)
		if Value == "White Team" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-48.6634, 41.2634, -370.777)
		elseif Value == "Black Team" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-322.895, 23.2286, -71.8433)
		elseif Value == "Red Team" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(223.892, 46.4826, -64.6442)
		elseif Value == "Blue Team" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(225.93, 46.4834, 303.061)
		elseif Value == "Magenta Team" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(227.84, 46.4834, 648.887)
		elseif Value == "Green Team" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-309.565, 32.5871, 284.978)
		elseif Value == "Yellow Team" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-301.885, 32.5871, 640.103)
		end
	end    
})

local TeleportSection = TeleportTab:AddSection({
	Name = "Teleport to Place"
})

TeleportTab:AddDropdown({
	Name = "Teleport to Place",
	Default = "",
	Options = {"Main Game", "Inner Cloud", "Winter Place", "Project Zeg"},
	Callback = function(Value)
		if Value == "Main Name" then
			game:GetService("TeleportService"):Teleport(537413528)
		elseif Value == "Inner Cloud" then
			game:GetService("TeleportService"):Teleport(1930863474)
		elseif Value == "Winter Place" then
			game:GetService("TeleportService"):Teleport(1930866268)
		elseif Value == "Project Zeg" then
			game:GetService("TeleportService"):Teleport(5178049460)
		end
	end    --2500111229
})

local TeleportSection = TeleportTab:AddSection({
	Name = "Miscellaneous"
})

TeleportTab:AddButton({
	Name = "Teleport to Treasure",
	Callback = function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-53.998, -222.51, 9386.49)
	end    
})

local ShopTab = Window:MakeTab({
	Name = "Shop",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local ShopSection = ShopTab:AddSection({
	Name = "Buy Chest"
})

ShopSection:AddDropdown({
	Name = "Choose a Chest",
	Default = "",
	Options = {"Common Chest", "Uncommon Chest", "Rare Chest", "Epic Chest", "Legendary Chest"},
	Callback = function(Value)
		CurrentChest = Value
	end    
})

ShopSection:AddButton({
	Name = "Buy a Chest",
	Callback = function()
		workspace.ItemBoughtFromShop:InvokeServer(CurrentChest, BuyChestValue)
	end    
})

ShopSection:AddToggle({
	Name = "Auto Buy Chest",
	Default = false,
	Callback = function(Value)
		AutoBuyChest = Value
		while AutoBuyChest == true do
			workspace.ItemBoughtFromShop:InvokeServer(CurrentChest, BuyChestValue)
			task.wait(0.1)
		end
	end    
})

ShopSection:AddTextbox({
	Name = "Buy / Auto Buy Number of Chests",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		BuyChestValue = tonumber(Value)
	end	  
})

local ShopSection = ShopTab:AddSection({
	Name = "Buy Block"
})

ShopSection:AddDropdown({
	Name = "Choose a Block",
	Default = "",
	Options = {"Boat Motor", "Bouncy Block", "Brick Block", "Button", "Camera", "Camera Dome", "Candle", "Cannon", "Cannon Turret", "Car Parts", "Chair", "Coal Block", "Concrete Block", "Concrete Rod", "Corner Wedge", "Delay", "Fabric Block", "Flag", "Glass Block", "Glue", "Grass Block", "Harpoon", "Helm", "Hinge", "Ice Block", "Jack-O-Lantern", "Jetpack", "Lamp", "Legacy Car Pack", "Light Bulb", "Locked Door", "Magnet", "Marble Block", "Marble Rod", "Mast", "Metal Block", "Metal Rod", "Minigun", "Motor", "Note", "Obsidian Block", "Parachute Block", "Pine Tree", "Piston", "Plane Parts", "Plastic Block", "PVP Pack", "Rusted Block", "Rusted Rod", "Sand Block", "Seat", "Servo", "Shield Generator", "Sign", "Smooth Wood Block", "Spike Trap", "Spring", "Steel I-Beam", "Step", "Sticks Of TNT", "Stone Block", "Stone Rod", "Switch", "Throne", "Titanium Block", "Titanium Rod", "TNT", "Torch", "Truss", "Wedge", "Window", "Wood Block", "Wood Door", "Wood Rod", "Wood Trap Door"},
	Callback = function(Value)
		Value = string.gsub(tostring(Value), " ", "")
		Value = string.gsub(tostring(Value), "-", "")
		CurrentBlock = Value
	end    
})

ShopSection:AddButton({
	Name = "Buy a Block",
	Callback = function()
		workspace.ItemBoughtFromShop:InvokeServer(CurrentBlock, BuyBlockValue)
	end    
})

ShopSection:AddToggle({
	Name = "Auto Buy Block",
	Default = false,
	Callback = function(Value)
		AutoBuyBlock = Value
		while AutoBuyBlock == true do
			workspace.ItemBoughtFromShop:InvokeServer(CurrentBlock, BuyBlockValue)
			task.wait(0.1)
		end
	end    
})

ShopSection:AddTextbox({
	Name = "Buy / Auto Buy Number of Blocks",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		BuyBlockValue = tonumber(Value)
	end	  
})


local ShopSection = ShopTab:AddSection({
	Name = "Miscellaneous"
})

ShopTab:AddDropdown({
	Name = "Buy Deleted Robux Items",
	Default = "",
	Options = {"+5 Mega Thrusters", "+5 Dragon Harpoons", "+4 Cookie Wheels", "+5 Christmas Harpoons", "Easter Bundle"},
	Callback = function(Value)
		local ShopRobuxId = nil
		if Value == "+5 Mega Thrusters" then
			ShopRobuxId = 139121474
		elseif Value == "+5 Dragon Harpoons" then
			ShopRobuxId = 1109792341
		elseif Value == "+4 Cookie Wheels" then
			ShopRobuxId = 1126385328
		elseif Value == "+5 Christmas Harpoons" then
			ShopRobuxId = 915766549
		elseif Value == "Easter Bundle" then
			ShopRobuxId = 1161573715
		end
		workspace.PromptRobuxEvent:InvokeServer(ShopRobuxId, "Product")
	end    
})

ShopTab:AddDropdown({
	Name = "Gift Deleted Robux Items",
	Default = "",
	Options = {"+4 Cookie Wheels [Gift]", "+5 Christmas Harpoons [Gift]", "+100 Glass Blocks [Gift]", "+100 Wood Blocks [Gift]", "Easter Bundle [Gift]"},
	Callback = function(Value)
		local ShopRobuxId = nil
		if Value == "+4 Cookie Wheels [Gift]" then
			ShopRobuxId = 1126385548
		elseif Value == "Easter Bundle [Gift]" then
			ShopRobuxId = 1161573830
		elseif Value == "+5 Christmas Harpoons [Gift]" then
			ShopRobuxId = 1126344149
		elseif Value == "+100 Glass Blocks [Gift]" then
			ShopRobuxId = 964160023
		elseif Value == "+100 Wood Blocks [Gift]" then
			ShopRobuxId = 963875471
		end
		workspace.PromptRobuxEvent:InvokeServer(ShopRobuxId, "Product")
	end    
})

ShopTab:AddTextbox({
	Name = "Choose a Gift Target (Input Player Name)",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		local Player = nil

		for i,v in pairs (game.Players:GetChildren()) do
			if v.Name == Value then
				Player = v
			end
		end

		workspace.UpdateLastGiftedIDRE:FireServer(Player.UserId, Player.Name)
	end	  
})

ShopTab:AddButton({
	Name = "Set Yourself as a Gift Target",
	Callback = function()
		workspace.UpdateLastGiftedIDRE:FireServer(game.Players.LocalPlayer.UserId, game.Players.LocalPlayer.Name)
	end    
})

local MiscTab = Window:MakeTab({
	Name = "Miscellaneous",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local MiscSection = MiscTab:AddSection({
	Name = "Miscellaneous"
})

MiscTab:AddTextbox({
	Name = "Change Gold Value (Fake)",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		game.Players.LocalPlayer.Data.Gold.Value = tonumber(Value)
	end	  
})

MiscTab:AddButton({
	Name = "Get Infinite Blocks (Fake) - Rejoin to Reset",
	Callback = function()
		for i,v in pairs(game.Players.LocalPlayer.Data:GetChildren()) do
			if v.Name ~= "Gold" then
				v.Value = 10000000
			end
		end
	end    
})

local MiscSection = MiscTab:AddSection({
	Name = "Advanced Auto Save (Saves Buildings Every Second)"
})

MiscTab:AddTextbox({
	Name = "Choose Save Slot",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		if Value == "1" then
			CurrentSaveSlot = ""
		else
			CurrentSaveSlot = tostring(Value)
		end
	end	  
})

MiscTab:AddToggle({
	Name = "Auto Save",
	Default = false,
	Callback = function(Value)
		AutosaveSlot = Value
		while AutosaveSlot == true and task.wait(0.1) do
			workspace.SaveBoatData:InvokeServer(CurrentSaveSlot)
		end
	end    
})


MiscTab:AddParagraph("Auto Save","Save slots are compiled in this order:\n\n1 2 3 4 5 6\n\n7 8 9 ...\n\nвљ пёЏ Dont choose the main slot of your building for auto save, otherwise if you make a mistake when building, your bulding with a mistake will be saved almost instantly")

local MiscSection = MiscTab:AddSection({
	Name = "Show Player Data"
})

MiscTab:AddTextbox({
	Name = "Get Player Information (Input Player Name First)",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		for i,v in pairs (game.Players:GetChildren()) do
			if v.Name == tostring(Value) then
				CurrentPlayer = v
			end
		end
	end	  
})

MiscTab:AddButton({
	Name = "Show Amount of Gold",
	Callback = function()
		Info1 = ""
		Info1 = CurrentPlayer.Data.Gold.Value
		PlayerInfo1:Set(Info1)
	end    
})

local Info1 = ""
PlayerInfo1 = MiscTab:AddParagraph("Player Amount of Gold:","")

MiscTab:AddButton({
	Name = "Show Save Data Slot Names",
	Callback = function()
		Info2 = ""
		for i,v in pairs (CurrentPlayer.OtherData:GetChildren()) do
			if string.find(v.Name, "NameOfSlot") then
				Info2 = Info2.."\n"..v.Name.."\t"..v.Value
			end
		end
		PlayerInfo2:Set(Info2)
	end    
})

local Info2 = ""
PlayerInfo2 = MiscTab:AddParagraph("Player Slot Names","")

MiscTab:AddButton({
	Name = "Show Player Tools",
	Callback = function()
		Info3 = ""
		for i,v in pairs (CurrentPlayer.Backpack:GetChildren()) do
			if v.ClassName == "Tool" then
				Info3 = Info3.."\n"..v.Name
			end
		end
		PlayerInfo3:Set(Info3)
	end    
})

local Info3 = ""
PlayerInfo3 = MiscTab:AddParagraph("Player Tools","")

MiscTab:AddButton({
	Name = "Show Player Blocks",
	Callback = function()
		Info4 = ""
		task.wait(0.1)
		for i,v in pairs (CurrentPlayer.Data:GetChildren()) do
			if v.Name ~= "Gold" and v.Name ~= "PaintingTool" and v.Name ~= "BindTool" and v.Name ~= "ScalingTool" and v.Name ~= "TrowelTool" and v.Name ~= "PropertiesTool" and v.Value ~= 0 then
				Info4 = Info4.."\n"..v.Name.." "..v.Value
			end
		end
		PlayerInfo4:Set(Info4)
	end    
})

local Info4 = ""
PlayerInfo4 = MiscTab:AddParagraph("Player Blocks","")

local WebhookTab = Window:MakeTab({
	Name = "Webhooks",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local WebhookSection = WebhookTab:AddSection({
	Name = "Send a Webhook"
})

WebhookTab:AddToggle({
	Name = "Enabled",
	Default = false,
	Callback = function(Value)
		SendWebhooks = Value 
		spawn(function()
			while SendWebhooks == true and task.wait(WebhookTime) do
				SendWebhook(WebhookURL)
			end
		end)
	end    
})

WebhookTab:AddTextbox({
	Name = "Send Webhook Every (minutes)",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		WebhookTime = tonumber(Value) * 60
	end	  
})

WebhookTab:AddTextbox({
	Name = "Webhook URL",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		WebhookURL = Value
	end	  
})
