loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()

local marketplaceService = game:GetService("MarketplaceService")
local isSuccessful, info = pcall(marketplaceService.GetProductInfo, marketplaceService, game.PlaceId)

local Bikes = {
	["Bicycle"] = 2,
	["Speedy Vip"] = 4,
	["Classical"] = 5,
	["Retro"] = 6,
	["Modern"] = 7,
	["Sporty"] = 8,
	["Offroader"] = 9,
	["Skybreaker"] = 10,
	["Futuristic"] = 11,
	["Anubis"] = 12,
	["Nature"] = 13,
	["Frostbite"] = 14,
	["Inferno"] = 15,
	["Aquatic"] = 16,
	["Skull Rider"] = 17,
	["Jet Bike"] = 18,
	["Ski-Fi"] = 19,
	["Double Trouble"] = 20,
	["Royal"] = 21,
	["Hyper Bike"] = 22,
	["Golden Bike"] = 24,
	["Competitive Golden Bike"] = 25,
	["Friendly Golden Bike"] = 26,
	["Ultra Competitive Golden Bike"] = 27,
	["Deluxe Golden Bike"] = 28,
	["School Bike"] = 29,
	["Pro Bike"] = 30,
	["Noob Bike"] = 31,
	["Silver Bike"] = 32,
	["Silver Tricycle"] = 33,
	["OP Bike"] = 34,
	["Turbo Racer"] = 35,
	["Wheel Master"] = 36,
	["Unknown Turbo"] = 37,
	["Flying Dragon Bike"] = 38,
	["Spider Bike"] = 39,
	["Pumpkin Bike"] = 40,
	["Bat Bike"] = 41,
	["Skeleton Bike"] = 42,
	["Beastie Bike"] = 43,
	["Evolved Flying Dragon Bike"] = 44,
	["Bat Storm"] = 45,
	["Rocket Bike"] = 46,
	["Galactic Bike"] = 47,
	["Banana Bike"] = 48
}

_G.AutoFarm = false
_G.count = 1
_G.MaxStage = 1
_G.AutoSpin = false

for i,v in pairs(game.workspace.WorldMap.Checkpoints:GetChildren()) do
	if tonumber(v.Name) > MaxStage then MaxStage = tonumber(v.Name) end
end

local function SendWebhook(webhook)
	local url = webhook
	local data = {
		["content"] = "",
		["embeds"] = {{
			["title"] = "Obby But Youre On A Bike",
			["description"] = (os.date("%A, %B %d, %X", os.time())),
			["type"] = "rich",
			["color"] = tonumber(0xE69138),
			["fields"] = {
				{
					["name"] = "",
					["value"] = 
						"\nStage: "..game.Players.LocalPlayer.leaderstats.Stage.Value..
						"\nWins: "..game.Players.LocalPlayer.leaderstats.Wins.Value..
						"\nTrophies: "..game.Players.LocalPlayer.leaderstats.Trophies.Value,
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

local Main = Library:Init({
	name = "Obby But You’re On a Bike"
})

local Tab = Main:CreateTab({
	name = "Auto Farm",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Auto Farm"
})

local Toggle = Tab:Toggle({
	name = "Enabled",
	callback = function(Value)
		_G.Autofarm = Value
		while _G.Autofarm == true do
			for count = game.Players.LocalPlayer.leaderstats.Stage.Value + 1, #(workspace.WorldMap.Checkpoints:GetChildren()), 1 do
				if _G.Autofarm == false then break end
				if workspace.WorldMap.Checkpoints:FindFirstChild(tostring(count)) then
					game.workspace.Characters:FindFirstChild(game.Players.LocalPlayer.Name)["HumanoidRootPart"].CFrame = workspace.WorldMap.Checkpoints:FindFirstChild(tostring(count))["Base"].CFrame
				end
				if game.PlaceId == 14184086618 then
					task.wait(0.585)
				else
					task.wait(0.57)
				end
			end
			if _G.Autofarm == true then game:GetService("ReplicatedStorage").RemoteEvents.ReportReset:FireServer() end
			wait(3)
		end
	end
})

Tab:Section({
	text = "Checkpoints"
})

local Button = Tab:Button({
	name = "1st Stage",
	callback = (function()
		if workspace.WorldMap.Checkpoints:FindFirstChild("1") then
			game.workspace.Characters:FindFirstChild(game.Players.LocalPlayer.Name)["HumanoidRootPart"].CFrame = workspace.WorldMap.Checkpoints:FindFirstChild("1")["Base"].CFrame
		end
	end)
})

local Input = Tab:Input({
	name = "Teleport To Stage (1 - ".._G.MaxStage..")",
	placeholdertext = "stage",
	cleartextonfocus = true,
	callback = function(Value)
		if workspace.WorldMap.Checkpoints:FindFirstChild(tostring(Value)) then
			game.workspace.Characters:FindFirstChild(PlayerName)["HumanoidRootPart"].CFrame = workspace.WorldMap.Checkpoints:FindFirstChild(tostring(Value))["Base"].CFrame
		end
	end
})

local Button = Tab:Button({
	name = "Next Stage",
	callback = (function()
		local NextStage = game.Players.LocalPlayer.leaderstats.Stage.Value + 1 
		if workspace.WorldMap.Checkpoints:FindFirstChild(NextStage) then
			game.workspace.Characters:FindFirstChild(PlayerName)["HumanoidRootPart"].CFrame = workspace.WorldMap.Checkpoints:FindFirstChild(tostring(NextStage))["Base"].CFrame
		end
	end)
})

Tab:Section({
	text = "Instant Win (No Trophies / Leaderboard Time)"
})

local Button = Tab:Button({
	name = "Instant Win",
	callback = (function()
		if workspace.WorldMap.Checkpoints:FindFirstChild(MaxStage) then
			game.workspace.Characters:FindFirstChild(PlayerName)["HumanoidRootPart"].CFrame = workspace.WorldMap.Checkpoints:FindFirstChild(tostring(MaxStage))["Base"].CFrame
		end
	end)
})

local Tab = Main:CreateTab({
	name = "Game",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Delete Obstacles"
})

local Button = Tab:Button({
	name = "Delete Kill Bricks",
	callback = (function()
		if game.workspace.WorldMap:FindFirstChild("KillBricks") then
			game.workspace.WorldMap.KillBricks:Destroy()
		end
	end)
})

local Button = Tab:Button({
	name = "Delete Spinning Bars",
	callback = (function()
		if game.workspace.WorldMap:FindFirstChild("SpinningBars") then
			game.workspace.WorldMap.SpinningBars:Destroy()
		end
	end)
})

local Button = Tab:Button({
	name = "Delete Swinging Balls",
	callback = (function()
		if game.workspace.WorldMap:FindFirstChild("SwingingBalls") then
			game.workspace.WorldMap.SwingingBalls:Destroy()
		end
	end)
})

local Button = Tab:Button({
	name = "Delete Fans",
	callback = (function()
		if game.workspace.WorldMap:FindFirstChild("Fans") then
			game.workspace.WorldMap.Fans:Destroy()
		end
	end)
})


local Button = Tab:Button({
	name = "Delete Ads",
	callback = (function()
		if game.workspace.WorldMap:FindFirstChild("3DAds") then
			game.workspace.WorldMap["3DAds"]:Destroy()
		end
		if game.workspace.WorldMap:FindFirstChild("Ads") then
			game.workspace.WorldMap.Ads:Destroy()
		end
	end)
})

local Tab = Main:CreateTab({
	name = "Teleport",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Teleport To World"
})

local Button = Tab:Button({
	name = "World 1",
	callback = (function()
		game:GetService("TeleportService"):Teleport(14184086618)
	end)
})

local Button = Tab:Button({
	name = "World 2",
	callback = (function()
		game:GetService("TeleportService"):Teleport(14483937954)
	end)
})

local Button = Tab:Button({
	name = "World 3",
	callback = (function()
		game:GetService("TeleportService"):Teleport(14666799841)
	end)
})

local Button = Tab:Button({
	name = "World 4",
	callback = (function()
		game:GetService("TeleportService"):Teleport(14840620690)
	end)
})

local Tab = Main:CreateTab({
	name = "Misc",
	icon = "rbxassetid://15101013637"
})

Tab:Section({
	text = "Miscellaneous"
})

local Dropdown = Tab:Dropdown({
	name = "Dropdown Name",
	callback = function(Name, Value)
		game:GetService("ReplicatedStorage").RemoteEvents.PublishBike:FireServer("BikeType", Value)
	end,
	opencallback = function()

	end,
})

for name, value in pairs(Bikes) do
	Dropdown:Add(name, value)
end

local Toggle = Tab:Toggle({
	name = "Auto Spin",
	callback = function(Value)
		_G.AutoSpin = Value
		while _G.AutoSpin == true and task.wait(1) do
			game:GetService("ReplicatedStorage").RemoteEvents.SpinWheel:FireServer()
		end
	end
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
		_G.SendWebhooks = Value 
		while _G.SendWebhooks == true and task.wait(_G.WebhookTime) do
			SendWebhook(_G.WebhookURL)
		end
	end
})

local Slider = Tab:Slider({
	name = "Send Webhook Every (minutes)",
	minimum = 1,
	maximum = 60,
	default = 10,
	valuename = "minutes(s)",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		_G.WebhookTime = Value * 60
	end
})

local Input = Tab:Input({
	name = "Webhook URL",
	placeholdertext = "URL",
	cleartextonfocus = true,
	callback = function(Value)
		_G.WebhookURL = Value
	end
})
