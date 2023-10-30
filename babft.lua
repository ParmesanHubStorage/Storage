loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()
local TweenService = game:GetService("TweenService")

local Rocks = {"PointedRock", "Rock", "Rock1", "Rock2", "Rock3", "Log", "GrassyRock1", "GrassyRock2", "Ticket", "Pizza", "Token", "Soldier1", "Soldier2", "Soldier3", "Soldier4", "Soldier5", "Soldier6", "Soldier7", "Soldier8", "Soldier9", "Soldier10", "Soldier11", "Soldier12", "Soldier13", "Soldier14", "Soldier15", "Soldier16", "Soldier17", "Soldier18", "DiceWhite", "DiceBlack", "CardPurple", "CardYellow", "CardGreen", "CardRed", "LED1", "LED2", "LED3", "Chip", "Resister1", "Resister2", "Pipe1", "Pipe2", "Pipe3", "Mine", "HoneyStream", "HoneyRock1", "HoneyRock2", "Box", "PaintBrush", "PoisonMushroom", "GrassyRock", "Film", "Hammer", "Pencil", "PagePeice", "MagnifyingGlass", "RoundTestTubeShocking", "RoundTestTubePoisonous", "RoundTestTubeExplosive", "Cattail1", "Cattail2", "Cattail3", "LilyPadSmall", "LilyPad", "Alligator", "Pretzel", "CottonCandy", "Hotdog", "Gear", "Tenticle", "Teal Gem", "Yellow Gem", "Red Gem", "LimeGem", "Acid", "Rusted Iron", "Toxic Barrel", "BatAndGlove", "IceCreamCone", "Popsicle", "Loly", "Popcorn", "Ammo", "BowlingBall1", "BowlingBall2", "BowlingBall3", "BowlingBall4", "BowlingBall5", "BowlingBall6", "Le beignet", "Onek", "Fork", "Twok", "Threek", "BallK", "BallM", "Lily1", "Lily2", "Lily3", "Weapon", "RockExplosive", "Hammer", "FireRock", "FallRock1", "FallRock2", "PufferFish1", "PufferFish2", "PufferFish3", "Lily1", "Lily2", "Lily3"}
local Blocks = {"Boat Motor", "Bouncy Block", "Brick Block", "Button", "Camera", "Camera Dome", "Candle", "Cannon", "Cannon Turret", "Car Parts", "Chair", "Coal Block", "Concrete Block", "Concrete Rod", "Corner Wedge", "Delay", "Fabric Block", "Flag", "Glass Block", "Glue", "Grass Block", "Harpoon", "Helm", "Hinge", "Ice Block", "Jack-O-Lantern", "Jetpack", "Lamp", "Legacy Car Pack", "Light Bulb", "Locked Door", "Magnet", "Marble Block", "Marble Rod", "Mast", "Metal Block", "Metal Rod", "Minigun", "Motor", "Note", "Obsidian Block", "Parachute Block", "Pine Tree", "Piston", "Plane Parts", "Plastic Block", "PVP Pack", "Rusted Block", "Rusted Rod", "Sand Block", "Seat", "Servo", "Shield Generator", "Sign", "Smooth Wood Block", "Spike Trap", "Spring", "Steel I-Beam", "Step", "Sticks Of TNT", "Stone Block", "Stone Rod", "Switch", "Throne", "Titanium Block", "Titanium Rod", "TNT", "Torch", "Truss", "Wedge", "Window", "Wood Block", "Wood Door", "Wood Rod", "Wood Trap Door"}

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
						"\nEarned Gold per This Session: "..game:GetService("Players").LocalPlayer.Data.Gold.Value - _G.FirstGold..
						"\nCurrent Gold Blocks Amount: "..game:GetService("Players").LocalPlayer.Data.GoldBlock.Value..
						"\nEarned Gold Blocks per This Session: "..game:GetService("Players").LocalPlayer.Data.GoldBlock.Value - _G.FirstGoldBlock,
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
	TweenPart.Parent:WaitForChild("Humanoid"):ChangeState("Ragdoll")

	local Info = TweenInfo.new(
		_G.WaitTime,
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
	Player:WaitForChild("HumanoidRootPart").Anchored = true
	Player:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-60.2082, 55.7433, 1184.53)
	MoveToEnd()
	while game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 and game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z < 8345 do
		task.wait()
	end
	if game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 then
		if _G.AutofarmChest == true then
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

local Toggle = Tab:Toggle({
	name = "Noclip",
	callback = function(Value)
		_G.Noclip = Value
		local Mouse = game.Players.LocalPlayer:GetMouse()
		_G.noclips = true

		_G.noclips = not _G.noclips
		local temp
		temp = game:GetService("RunService").Stepped:connect(function()
			if _G.noclips then
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

local Tab = Main:CreateTab({
	name = "Game",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Game"
})

local Dropdown = Tab:Dropdown({
	name = "Start Deleted Quest",
	callback = function(Name, Value)
		workspace.QuestMakerEvent:FireServer(Value)
	end,
	opencallback = function()

	end,
})

Dropdown:Add("Gift Battle", 99)
Dropdown:Add("Nutcracker Army Invasion", 101)
Dropdown:Add("The Boss (Fabbi the Duck)", 100)

local Toggle = Tab:Toggle({
	name = "Auto Turn On / Turn Off Isolation Mode",
	callback = function(Value)
		_G.UpdateIsolationMode = Value
		while _G.UpdateIsolationMode == true do
			workspace.RefreshLocks:FireServer(true)
			task.wait(1)
			workspace.RefreshLocks:FireServer(false)
			task.wait(1)
		end
	end
})

local Button = Tab:Button({
	name = "Turn Off Isolation Mode (Quests)",
	callback = (function()
		workspace.RefreshLocks:FireServer(false)
	end)
})

local Button = Tab:Button({
	name = "Delete Isolation Mode Parts",
	callback = (function()
		for i,v in pairs(workspace:GetDescendants()) do
			if (v.Name == "IsolationBeams" or v.Name == "Lock") and v.ClassName == "Folder" then
				v:Destroy()
			end
		end
	end)
})

local Button = Tab:Button({
	name = "Delete All Stage Obstacles",
	callback = (function()
		for i,v in pairs(workspace.BoatStages:GetDescendants()) do
			if table.find(Rocks, v.Name) then
				v:Destroy()
			end
		end
	end)
})

local Button = Tab:Button({
	name = "Dont Destroy the Boat at the End",
	callback = (function()
		game:GetService("Workspace").BoatStages.NormalStages.TheEnd.DestroyBoatPart:Destroy()
	end)
})

local Tab = Main:CreateTab({
	name = "Auto Farm",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Auto Farm"
})

local Toggle = Tab:Toggle({
	name = "Auto Farm",
	callback = function(Value)
		_G.Autofarm = Value	
		while _G.Autofarm == true do
			AutofarmFunc()
			while LocalPlayer:FindFirstChild("Humanoid") do
				task.wait()
			end
			wait(0.5)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Teleport to the Treasure at the End",
	callback = function(Value)
		_G.AutofarmChest = Value
	end
})

local Slider = Tab:Slider({
	name = "Autofarm Speed (seconds)",
	minimum = 1,
	maximum = 60,
	default = 26,
	valuename = "second(s)",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		_G.WaitTime = Value
	end
})

local Tab = Main:CreateTab({
	name = "Teleports",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Teleport to Team"
})

local Dropdown = Tab:Dropdown({
	name = "Teleport to Team",
	callback = function(Name, Value)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Value
	end,
	opencallback = function()

	end,
})

Dropdown:Add("White Team", CFrame.new(-48.6634, 41.2634, -370.777))
Dropdown:Add("Red Team", CFrame.new(223.892, 46.4826, -64.6442))
Dropdown:Add("Black Team", CFrame.new(-322.895, 23.2286, -71.8433))
Dropdown:Add("Blue Team", CFrame.new(225.93, 46.4834, 303.061))
Dropdown:Add("Green Team", CFrame.new(-309.565, 32.5871, 284.978))
Dropdown:Add("Yellow Team", CFrame.new(-301.885, 32.5871, 640.103))
Dropdown:Add("Magenta Team", CFrame.new(227.84, 46.4834, 648.887))

Tab:Section({
	text = "Teleport to Place"
})

local Dropdown = Tab:Dropdown({
	name = "Teleport to Place",
	callback = function(Name, Value)
		game:GetService("TeleportService"):Teleport(Value)
	end,
	opencallback = function()

	end,
})

Dropdown:Add("Main Game", 537413528)
Dropdown:Add("Inner Cloud", 1930863474)
Dropdown:Add("Winter Place", 1930866268)
Dropdown:Add("Project Zeg", 5178049460)

Tab:Section({
	text = "Miscellaneous"
})

local Button = Tab:Button({
	name = "Teleport to Treasure",
	callback = (function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-53.998, -222.51, 9386.49)
	end)
})

local Tab = Main:CreateTab({
	name = "Shop",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Buy Chest"
})

local Dropdown = Tab:Dropdown({
	name = "Choose a Chest",
	callback = function(Name, Value)
		_G.CurrentChest = Name
	end,
	opencallback = function()

	end,
})

Dropdown:Add("Common Chest", nil)
Dropdown:Add("Uncommon Chest", nil)
Dropdown:Add("Rare Chest", nil)
Dropdown:Add("Epic Chest", nil)
Dropdown:Add("Legendary Chest", nil)

local Button = Tab:Button({
	name = "Buy a Chest",
	callback = (function()
		workspace.ItemBoughtFromShop:InvokeServer(_G.CurrentChest, _G.BuyChestValue)
	end)
})

local Toggle = Tab:Toggle({
	name = "Auto Buy Chest",
	callback = function(Value)
		_G.AutoBuyChest = Value
		while _G.AutoBuyChest == true do
			workspace.ItemBoughtFromShop:InvokeServer(_G.CurrentChest, _G.BuyChestValue)
			task.wait(0.1)
		end
	end
})

local Input = Tab:Input({
	name = "Buy / Auto Buy Number of Chests",
	placeholdertext = "number",
	cleartextonfocus = true,
	callback = function(Value)
		_G.BuyChestValue = tonumber(Value)
	end
})

Tab:Section({
	text = "Buy Block"
})

local Dropdown = Tab:Dropdown({
	name = "Choose a Block",
	callback = function(Name, Value)
		Name = string.gsub(tostring(Name), " ", "")
		Name = string.gsub(tostring(Name), "-", "")
		_G.CurrentBlock = Name
	end,
	opencallback = function()

	end,
})

for i,v in pairs(Blocks) do
	Dropdown:Add(v, nil)
end

local Button = Tab:Button({
	name = "Buy a Block",
	callback = (function()
		workspace.ItemBoughtFromShop:InvokeServer(_G.CurrentBlock, _G.BuyBlockValue)
	end)
})

local Toggle = Tab:Toggle({
	name = "Auto Buy Block",
	callback = function(Value)
		_G.AutoBuyBlock = Value
		while _G.AutoBuyBlock == true do
			workspace.ItemBoughtFromShop:InvokeServer(_G.CurrentBlock, _G.BuyBlockValue)
			task.wait(0.1)
		end
	end
})

local Input = Tab:Input({
	name = "Buy / Auto Buy Number of Blocks",
	placeholdertext = "number",
	cleartextonfocus = true,
	callback = function(Value)
		_G.BuyBlockValue = tonumber(Value)
	end
})

Tab:Section({
	text = "Miscellaneous"
})

local Dropdown = Tab:Dropdown({
	name = "Buy Deleted Robux Items",
	callback = function(Name, Value)
		workspace.PromptRobuxEvent:InvokeServer(Value, "Product")
	end,
	opencallback = function()

	end,
})

Dropdown:Add("+5 Mega Thrusters", 139121474)
Dropdown:Add("+5 Dragon Harpoons", 1109792341)
Dropdown:Add("+4 Cookie Wheels", 1126385328)
Dropdown:Add("+5 Christmas Harpoons", 915766549)
Dropdown:Add("Easter Bundle", 915766549)

local Dropdown = Tab:Dropdown({
	name = "Gift Deleted Robux Items",
	callback = function(Name, Value)
		workspace.PromptRobuxEvent:InvokeServer(Value, "Product")
	end,
	opencallback = function()

	end,
})

Dropdown:Add("+4 Cookie Wheels [Gift]", 1126385548)
Dropdown:Add("+5 Christmas Harpoons [Gift]", 1161573830)
Dropdown:Add("+100 Glass Blocks [Gift]", 1126344149)
Dropdown:Add("+100 Wood Blocks [Gift]", 964160023)
Dropdown:Add("Easter Bundle [Gift]", 963875471)

local Input = Tab:Input({
	name = "Choose a Gift Target (Input Player Name)",
	placeholdertext = "player",
	cleartextonfocus = true,
	callback = function(Value)
		local Player = nil

		for i,v in pairs (game.Players:GetChildren()) do
			if v.Name == Value then
				Player = v
			end
		end

		workspace.UpdateLastGiftedIDRE:FireServer(Player.UserId, Player.Name)
	end
})

local Button = Tab:Button({
	name = "Set Yourself as a Gift Target",
	callback = (function()
		workspace.UpdateLastGiftedIDRE:FireServer(game.Players.LocalPlayer.UserId, game.Players.LocalPlayer.Name)
	end)
})

local Tab = Main:CreateTab({
	name = "Misc",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Miscellaneous"
})

local Input = Tab:Input({
	name = "Change Gold Value (Fake)",
	placeholdertext = "number",
	cleartextonfocus = true,
	callback = function(Value)
		game.Players.LocalPlayer.Data.Gold.Value = tonumber(Value)
	end	
})

local Button = Tab:Button({
	name = "Get Infinite Blocks (Fake) - Rejoin to Reset",
	callback = (function()
		for i,v in pairs(game.Players.LocalPlayer.Data:GetChildren()) do
			if v.Name ~= "Gold" then
				v.Value = 10000000
			end
		end
	end)
})

Tab:Section({
	text = "Advanced Auto Save (Saves Buildings Every Second)"
})

local Input = Tab:Input({
	name = "Choose Save Slot",
	placeholdertext = "number",
	cleartextonfocus = true,
	callback = function(Value)
		if Value == "1" then
			_G.CurrentSaveSlot = ""
		else
			_G.CurrentSaveSlot = tostring(Value)
		end
	end
})

local Toggle = Tab:Toggle({
	name = "Auto Save",
	callback = function(Value)
		_G.AutosaveSlot = Value
		while _G.AutosaveSlot == true and task.wait(0.1) do
			workspace.SaveBoatData:InvokeServer(_G.CurrentSaveSlot)
		end
	end
})

local Warning = Tab:Warning({
	name = "Auto Save",
	text = "Save slots are compiled in this order:\n\n1 2 3 4 5 6\n\n7 8 9 ...\n\nDont choose the main slot of your building for auto save, otherwise if you make a mistake when building, your bulding with a mistake will be saved almost instantly."
})

Tab:Section({
	text = "Show Player Data"
})

local Input = Tab:Input({
	name = "Get Player Information (Input Player Name First)",
	placeholdertext = "player",
	cleartextonfocus = true,
	callback = function(Value)
		for i,v in pairs (game.Players:GetChildren()) do
			if v.Name == tostring(Value) then
				_G.CurrentPlayer = v
			end
		end
	end
})

local Information = Tab:Information({
	name = "Gold Amount",
	text = ""
})

local Button = Tab:Button({
	name = "Show Amount of the Gold",
	callback = (function()
		Information:SetText(_G.CurrentPlayer.Data.Gold.Value)
	end)
})

local Information = Tab:Information({
	name = "Data Slots",
	text = ""
})

local Button = Tab:Button({
	name = "Show Save Data Slot Names",
	callback = (function()
		local Info2 = ""
		for i,v in pairs (_G.CurrentPlayer.OtherData:GetChildren()) do
			if string.find(v.Name, "NameOfSlot") then
				Info2 = Info2.."\n"..v.Name.."\t"..v.Value
			end
		end
		Information:SetText(Info2)
	end)
})

local Information = Tab:Information({
	name = "Player Tools",
	text = ""
})

local Button = Tab:Button({
	name = "Show Player Tools",
	callback = (function()
		local Info3 = ""
		for i,v in pairs (_G.CurrentPlayer.Backpack:GetChildren()) do
			if v.ClassName == "Tool" then
				Info3 = Info3.."\n"..v.Name
			end
		end
		Information:SetText(Info3)
	end)
})

local Information = Tab:Information({
	name = "Player Blocks",
	text = ""
})

local Button = Tab:Button({
	name = "Show Player Blocks",
	callback = (function()
		local Info4 = ""
		task.wait(0.1)
		for i,v in pairs (_G.CurrentPlayer.Data:GetChildren()) do
			if v.Name ~= "Gold" and v.Name ~= "PaintingTool" and v.Name ~= "BindTool" and v.Name ~= "ScalingTool" and v.Name ~= "TrowelTool" and v.Name ~= "PropertiesTool" and v.Value ~= 0 then
				Info4 = Info4.."\n"..v.Name.." "..v.Value
			end
		end
		Information:SetText(Info4)
	end)
})

local Tab = Main:CreateTab({
	name = "Webhooks",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Send a Webhook"
})

local Toggle = Tab:Toggle({
	name = "Enabled",
	callback = function(Value)
		SendWebhooks = Value 
		spawn(function()
			while SendWebhooks == true and task.wait(WebhookTime) do
				SendWebhook(WebhookURL)
			end
		end)
	end
})

local Input = Tab:Input({
	name = "Send Webhook Every (minutes)",
	placeholdertext = "minutes",
	cleartextonfocus = true,
	callback = function(Value)
		WebhookTime = tonumber(Value) * 60
	end
})

local Input = Tab:Input({
	name = "Webhook URL",
	placeholdertext = "URL",
	cleartextonfocus = true,
	callback = function(Value)
		WebhookURL = Value
	end
})
