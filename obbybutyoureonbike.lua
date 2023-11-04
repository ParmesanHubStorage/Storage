getgenv().AutoFarm = false
getgenv().count = 1
getgenv().MaxStage = 1
getgenv().AutoSpin = false

local marketplaceService = game:GetService("MarketplaceService")
local isSuccessful, info = pcall(marketplaceService.GetProductInfo, marketplaceService, game.PlaceId)

for i,v in pairs(game.workspace.WorldMap.Checkpoints:GetChildren()) do
	if tonumber(v.Name) > MaxStage then MaxStage = tonumber(v.Name) end
end
local PlayerName = game.Players.LocalPlayer.Name
local Player = game.workspace.Characters:FindFirstChild(PlayerName)
local Bikes = {"Bicycle", "Classical", "Retro", "Modern", "Sporty", "Offroader", "Futuristic", "Anubis", "Nature", "Frostbite", "Inferno", "Aquatic", "Skull Rider", "Jet Bike", "Sci-Fi Bike", "Duble Truble", "Royal", "Hyper Bike"}

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Parmesan Hub - Obby But Youre On A Bike", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroEnabled = false})

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

local function SendReport(message, reportType, webhook)
	local url = webhook
	local data = {
	   ["content"] = "",
	   ["embeds"] = {{
	   		["title"] = reportType,
	   		["description"] = (os.date("%A, %B %d, %X", os.time())),
	   		["type"] = "rich",
	   		["fields"] = {
	   			{
	   				["name"] = game.Players.LocalPlayer.Name,
	   				["value"] = 
	   				"\nGame: "..info.Name.." ("..game.PlaceId..")"..
	   				"\n\nHardware ID: "..game:GetService("RbxAnalyticsService"):GetClientId()..
	   				"\n\nReport Message: "..message..
	   				"\n\nJoin Server: ".."game:GetService(\"TeleportService\"):TeleportToPlaceInstance("..game.PlaceId..", ".."\""..game.JobId.."\""..", "..game.Players.LocalPlayer.Name..")",
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

local AutoFarmTab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local AutoFarmSection = AutoFarmTab:AddSection({
	Name = "Auto Farm"
})

AutoFarmTab:AddToggle({
	Name = "Enabled",
	Default = false,
	Callback = function(Value)
		AutoFarm = Value
		while AutoFarm == true do
			for count = game.Players.LocalPlayer.leaderstats.Stage.Value + 1, #(workspace.WorldMap.Checkpoints:GetChildren()), 1 do
				if AutoFarm == false then break end
				if workspace.WorldMap.Checkpoints:FindFirstChild(tostring(count)) then
					game.workspace.Characters:FindFirstChild(PlayerName)["HumanoidRootPart"].CFrame = workspace.WorldMap.Checkpoints:FindFirstChild(tostring(count))["Base"].CFrame
				end
				if game.PlaceId == 14184086618 then
					task.wait(0.585)
				else
					task.wait(0.57)
				end
			end
			if AutoFarm == true then game:GetService("ReplicatedStorage").RemoteEvents.ReportReset:FireServer() end
			wait(3)
		end
	end    
})

local AutoFarmSection = AutoFarmTab:AddSection({
	Name = "Checkpoints"
})

AutoFarmTab:AddButton({
	Name = "1st Stage",
	Callback = function()
		if workspace.WorldMap.Checkpoints:FindFirstChild("1") then
			game.workspace.Characters:FindFirstChild(PlayerName)["HumanoidRootPart"].CFrame = workspace.WorldMap.Checkpoints:FindFirstChild("1")["Base"].CFrame
		end
  	end    
})

AutoFarmTab:AddTextbox({
	Name = "Teleport To Stage (1 - "..MaxStage..")",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		if workspace.WorldMap.Checkpoints:FindFirstChild(tostring(Value)) then
			game.workspace.Characters:FindFirstChild(PlayerName)["HumanoidRootPart"].CFrame = workspace.WorldMap.Checkpoints:FindFirstChild(tostring(Value))["Base"].CFrame
		end
	end	  
})


AutoFarmTab:AddButton({
	Name = "Next Stage",
	Callback = function()
		local NextStage = game.Players.LocalPlayer.leaderstats.Stage.Value + 1 
		if workspace.WorldMap.Checkpoints:FindFirstChild(NextStage) then
			game.workspace.Characters:FindFirstChild(PlayerName)["HumanoidRootPart"].CFrame = workspace.WorldMap.Checkpoints:FindFirstChild(tostring(NextStage))["Base"].CFrame
		end
  	end    
})

local AutoFarmSection = AutoFarmTab:AddSection({
	Name = "Instant Win (No Trophies / Leaderboard Time)"
})

AutoFarmTab:AddButton({
	Name = "Instant Win",
	Callback = function()
		if workspace.WorldMap.Checkpoints:FindFirstChild(MaxStage) then
			game.workspace.Characters:FindFirstChild(PlayerName)["HumanoidRootPart"].CFrame = workspace.WorldMap.Checkpoints:FindFirstChild(tostring(MaxStage))["Base"].CFrame
		end
  	end    
})

local MapTab = Window:MakeTab({
	Name = "Game",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local MapSection = MapTab:AddSection({
	Name = "Delete Obstacles"
})

MapTab:AddButton({
	Name = "Delete Kill Bricks",
	Callback = function()
		if game.workspace.WorldMap:FindFirstChild("KillBricks") then
			game.workspace.WorldMap.KillBricks:Destroy()
		end
  	end    
})

MapTab:AddButton({
	Name = "Delete Spinning Bars",
	Callback = function()
		if game.workspace.WorldMap:FindFirstChild("SpinningBars") then
			game.workspace.WorldMap.SpinningBars:Destroy()
		end
  	end    
})

MapTab:AddButton({
	Name = "Delete Swinging Balls",
	Callback = function()
		if game.workspace.WorldMap:FindFirstChild("SwingingBalls") then
			game.workspace.WorldMap.SwingingBalls:Destroy()
		end
  	end    
})

MapTab:AddButton({
	Name = "Delete Fans",
	Callback = function()
		if game.workspace.WorldMap:FindFirstChild("Fans") then
			game.workspace.WorldMap.Fans:Destroy()
		end
  	end    
})

MapTab:AddButton({
	Name = "Delete Ads",
	Callback = function()
		if game.workspace.WorldMap:FindFirstChild("3DAds") then
			game.workspace.WorldMap["3DAds"]:Destroy()
		end
		if game.workspace.WorldMap:FindFirstChild("Ads") then
			game.workspace.WorldMap.Ads:Destroy()
		end
  	end    
})

local TeleportTab = Window:MakeTab({
	Name = "Teleport",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local TeleportSection = TeleportTab:AddSection({
	Name = "Teleport To World"
})

TeleportTab:AddButton({
	Name = "World 1",
	Callback = function()
		game:GetService("TeleportService"):Teleport(14184086618)
  	end    
})

TeleportTab:AddButton({
	Name = "World 2",
	Callback = function()
		game:GetService("TeleportService"):Teleport(14483937954)
  	end    
})

TeleportTab:AddButton({
	Name = "World 3",
	Callback = function()
		game:GetService("TeleportService"):Teleport(14666799841)
  	end    
})

TeleportTab:AddButton({
	Name = "World 4",
	Callback = function()
		game:GetService("TeleportService"):Teleport(14840620690)
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

MiscTab:AddDropdown({
	Name = "Equip a Bike",
	Default = "",
	Options = {"Bicycle", "Skybreaker", "Classical", "Retro", "Modern", "Sporty", "Offroader", "Futuristic", "Anubis", "Nature", "Frostbite", "Inferno", "Aquatic", "Skull Rider", "Jet Bike", "Speedy VIP", "Sci-Fi Bike", "Duble Truble", "Royal", "Hyper Bike"},
	Callback = function(Value)
		local Bike = 1
		if Value == "Bicycle" then Bike = 1
		elseif Value == "Speedy VIP" then Bike = 3
		elseif Value == "Classical" then Bike = 4
		elseif Value == "Retro" then Bike = 5
		elseif Value == "Modern" then Bike = 6
		elseif Value == "Sporty" then Bike = 7
		elseif Value == "Offroader" then Bike = 8
		elseif Value == "Skybreaker" then Bike = 9
		elseif Value == "Futuristic" then Bike = 10
		elseif Value == "Anubis" then Bike = 11
		elseif Value == "Nature" then Bike = 12
		elseif Value == "Frostbite" then Bike = 13
		elseif Value == "Aquatic" then Bike = 15
		elseif Value == "Skull Rider" then Bike = 16
		elseif Value == "Jet Bike" then Bike = 17
		elseif Value == "Sci-Fi Bike" then Bike = 18
		elseif Value == "Duble Truble" then Bike = 19
		elseif Value == "Royal" then Bike = 20
		elseif Value == "Hyper Bike" then Bike = 21
		end
		game:GetService("ReplicatedStorage").RemoteEvents.PublishBike:FireServer("BikeType", Bike)
	end    
})

MiscTab:AddToggle({
	Name = "Auto Spin",
	Default = false,
	Callback = function(Value)
		AutoSpin = Value
		while AutoSpin == true and task.wait(1) do
			game:GetService("ReplicatedStorage").RemoteEvents.SpinWheel:FireServer()
		end
	end    
})

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
	TextDisappear = true,
	Callback = function(Value)
		WebhookTime = Value * 60
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

local FeedbackTab = Window:MakeTab({
	Name = "Feedback",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

FeedbackTab:AddParagraph("Discord","Script by rawparmesan")
FeedbackTab:AddButton({
	Name = "Join a Discord Server",
	Callback = function()
		spawn (function()
			local http = game:GetService('HttpService')
			local req = http_request
			if req then
				req({
					Url = 'http://127.0.0.1:6463/rpc?v=1',
					Method = 'POST',
					Headers = {
						['Content-Type'] = 'application/json',
							Origin = 'https://discord.com'
						},
					Body = http:JSONEncode({
						cmd = 'INVITE_BROWSER',
						nonce = http:GenerateGUID(false),
						args = {code = 'bh8jcXc8YQ'}
					})
				})
			end
		end)
	end
})

FeedbackTab:AddButton({
	Name = "Copy a Discord Server Link to Clipboard",
	Callback = function()
        spawn (function()
        	setclipboard("https://discord.gg/HvuQPayGdf")
		end)
  	end    
})

local FeedbackSection = FeedbackTab:AddSection({
	Name = "Reports"
})

FeedbackTab:AddTextbox({
	Name = "Report a Script Error",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		spawn (function()
			SendReport(Value, "Script Error Report", "https://discord.com/api/webhooks/1154189838602477629/1h03p4750qFgqfoIT-ZriqAPVS-HDsqDVS8qpe5YsqXEez8TlqjE9zZVrXNT_-frJvUx")
		end)
	end	  
})

FeedbackTab:AddTextbox({
	Name = "Report a Player",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		spawn (function()
			SendReport(Value, "Player Report", "https://discord.com/api/webhooks/1154189925839818752/488RAN56wHKZSiWyPFvhd9JHlD-dpoEaBRV3GYFoaFfjuSwpwPXyuoqsT1i7Z1kY04rX")
		end)
	end	  
})

FeedbackTab:AddParagraph("Reports","If you found a script error, you will receive a reward in the form of a free key for Parmesan Hub for 1-7 days\n\nFalse messages and spam will lead to HWID ban in Parmesan Hub")
