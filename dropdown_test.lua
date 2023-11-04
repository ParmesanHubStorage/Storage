loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHubStorage/Storage/main/ParmesanHub_UI_Lib.lua')))()

local function LoopAdd()
	for i,v in pairs(game.Players:GetChildren()) do
		Dropdown:Add(v.Name, nil)
	end
end

local Main = Library:Init({
	name = "Brookhaven RP"
})


local Tab = Main:CreateTab({
	name = "Teleport",
	icon = "rbxassetid://15105266838"
})

Tab:Section({
	text = "Teleport to Player"
})

local Dropdown = Tab:Dropdown({
	name = "Teleport to Player",
	callback = function(Name, Value)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild(Name).HumanoidRootPart.CFrame
	end,
	opencallback = function()
		LoopAdd()
	end,
})

print("5")
