repeat task.wait() until game:IsLoaded()

--services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

--variables
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local lp = Players.LocalPlayer
local mouse = lp:GetMouse()

local CustomFont
if game:GetService("UserInputService").TouchEnabled == true or game:GetService("UserInputService").KeyboardEnabled == false then
	CustomFont = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
else
	CustomFont = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
end

local Library = {}

function Library:Validate(defaults, options)
	for i,v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
end

function Library:tween(object, goal, callback)
	local tween = TweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

local GUI = {
	CurrentTab = nil
}

function Library:Init(options) -- Window, Game Title, FPS and Ping counters
	
	Library:Validate({
		name = "Parmesan Hub - Universal Script",
		keytype = "Free",
		key = "N/A"
	}, options or {})
	
	do -- Main Window
		-- StarterGui.ScreenGui
		GUI["1"] = Instance.new("ScreenGui", RunService:IsStudio() and Players.LocalPlayer:WaitForChild("PlayerGui") or CoreGui);
		GUI["1"]["IgnoreGuiInset"] = true;
		GUI["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
		GUI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
		GUI["1"]["IgnoreGuiInset"] = true
		
		
		GUI["514"] = Instance.new("Frame", GUI["1"]);
		GUI["514"]["BorderSizePixel"] = 0;
		GUI["514"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["514"]["Size"] = UDim2.new(0, 400, 0, 25);
		GUI["514"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["514"]["Position"] = UDim2.fromOffset((viewport.X / 2) - (450 / 2), (viewport.Y / 2) - (300 / 2));
		GUI["514"]["Active"] = true;
		GUI["514"]["Draggable"] = true;
		GUI["514"]["BackgroundTransparency"] = 1;
		
		-- StarterGui.ScreenGui.Main
		GUI["2"] = Instance.new("Frame", GUI["514"]);
		GUI["2"]["ZIndex"] = 0;
		--GUI["2"].Draggable = true;
		--GUI["2"].Active = true;
		GUI["2"]["BorderSizePixel"] = 0;
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
		GUI["2"]["AnchorPoint"] = Vector2.new(1,0);
		GUI["2"]["Size"] = UDim2.new(0, 450, 0, 300);
		GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["2"]["Position"] = UDim2.new(1, 50, 0, 0);
			--UDim2.fromOffset((viewport.X / 2) - (GUI["2"].Size.X.Offset / 2), (viewport.Y / 2) - (GUI["2"].Size.Y.Offset / 2));
		GUI["2"]["Name"] = [[Main]];

		-- StarterGui.ScreenGui.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);
		GUI["3"]["CornerRadius"] = UDim.new(0, 9);
	end
	
	do -- FPS and Ping Counters
		-- StarterGui.ScreenGui.Main.FPS_Ping
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["ZIndex"] = 4;
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["BackgroundColor3"] = Color3.fromRGB(0, 106, 176);
		GUI["4"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["4"]["Size"] = UDim2.new(1, 0, 0, 20);
		GUI["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4"]["Position"] = UDim2.new(0, 0, 1, 1);
		GUI["4"]["Name"] = [[FPS_Ping]];

		-- StarterGui.ScreenGui.Main.FPS_Ping.UICorner
		GUI["5"] = Instance.new("UICorner", GUI["4"]);


		-- StarterGui.ScreenGui.Main.FPS_Ping.Frame
		GUI["6"] = Instance.new("Frame", GUI["4"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(0, 106, 176);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0, 10);
		GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

		-- StarterGui.ScreenGui.Main.FPS_Ping.FPS
		GUI["7"] = Instance.new("TextLabel", GUI["4"]);
		GUI["7"]["BorderSizePixel"] = 0;
		GUI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["FontFace"] = CustomFont
		GUI["7"]["TextSize"] = 12;
		GUI["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["Size"] = UDim2.new(0, 60, 0, 20);
		GUI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["7"]["Text"] = [[FPS: 60]];
		GUI["7"]["Name"] = [[FPS]];
		GUI["7"]["BackgroundTransparency"] = 1;

		-- StarterGui.ScreenGui.Main.FPS_Ping.Ping
		GUI["8"] = Instance.new("TextLabel", GUI["4"]);
		GUI["8"]["BorderSizePixel"] = 0;
		GUI["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["8"]["FontFace"] = CustomFont
		GUI["8"]["TextSize"] = 12;
		GUI["8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["8"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["8"]["Size"] = UDim2.new(0, 70, 1, 0);
		GUI["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["8"]["Text"] = [[Ping: 120 ms]];
		GUI["8"]["Name"] = [[Ping]];
		GUI["8"]["BackgroundTransparency"] = 1;
		GUI["8"]["Position"] = UDim2.new(0, 60, 1, 0);
	end
	
	local pFPS = 0
	
	local function getFPS()
		local oldTime
		game:GetService("RunService").RenderStepped:Connect(function()
			if not oldTime then
				oldTime = tick()
			elseif oldTime then
				pFPS = math.floor(1/(tick()-oldTime))
				oldTime = tick()
			end
		end)
	end
	
	task.spawn(getFPS)
	
	game:GetService("RunService").RenderStepped:Connect(function()
		GUI["7"]["Text"] = "FPS: "..tostring(pFPS)
		if pFPS > 40 then
			GUI["7"]["TextColor3"] = Color3.fromRGB(255,255,255)
		elseif pFPS >= 20 and pFPS <= 40 then
			GUI["7"]["TextColor3"] = Color3.fromRGB(255,238,0)
		elseif pFPS < 20 then
			GUI["7"]["TextColor3"] = Color3.fromRGB(255,0,0)
		end
	end)
	
	--[[game:GetService("RunService").RenderStepped:Connect(function(v)
		GUI["8"]["Text"] = "Ping: "..tostring(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(math.round(2 / v))).." ms"
	end)
	
	print(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())--]]

	
	do -- Game Title
		-- StarterGui.ScreenGui.Main.GameName
		GUI["9"] = Instance.new("Frame", GUI["2"]);
		GUI["9"]["ZIndex"] = 4;
		GUI["9"]["BorderSizePixel"] = 0;
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(59, 62, 66);
		GUI["9"]["Size"] = UDim2.new(1, 0, 0, 25);
		GUI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["9"]["Name"] = [[GameName]];

		-- StarterGui.ScreenGui.Main.GameName.UICorner
		GUI["a"] = Instance.new("UICorner", GUI["9"]);


		-- StarterGui.ScreenGui.Main.GameName.Frame
		GUI["b"] = Instance.new("Frame", GUI["9"]);
		GUI["b"]["BorderSizePixel"] = 0;
		GUI["b"]["BackgroundColor3"] = Color3.fromRGB(59, 62, 66);
		GUI["b"]["AnchorPoint"] = Vector2.new(0, 1);
		GUI["b"]["Size"] = UDim2.new(1, 0, 0, 7);
		GUI["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["b"]["Position"] = UDim2.new(0, 0, 1, 0);

		-- StarterGui.ScreenGui.Main.GameName.TextLabel
		GUI["c"] = Instance.new("TextLabel", GUI["9"]);
		GUI["c"]["TextWrapped"] = true;
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["c"]["FontFace"] = CustomFont
		GUI["c"]["TextSize"] = 14;
		GUI["c"]["TextColor3"] = Color3.fromRGB(148, 150, 157);
		GUI["c"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["c"]["Text"] = options.name;
		GUI["c"]["BackgroundTransparency"] = 1;

		-- StarterGui.ScreenGui.Main.GameName.ImageLabel
		GUI["d"] = Instance.new("ImageButton", GUI["9"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["d"]["Image"] = [[rbxassetid://15116174139]];
		GUI["d"]["Size"] = UDim2.new(0, 12, 0, 12);
		GUI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["d"]["BackgroundTransparency"] = 1;
		GUI["d"]["Position"] = UDim2.new(1,-20,0, 7);

		-- StarterGui.ScreenGui.Main.GameName.ImageLabel
		GUI["e"] = Instance.new("ImageButton", GUI["9"]);
		GUI["e"]["BorderSizePixel"] = 0;
		GUI["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["e"]["ImageTransparency"] = 0.5;
		GUI["e"]["Image"] = [[rbxassetid://15116175756]];
		GUI["e"]["Size"] = UDim2.new(0, 12, 0, 12);
		GUI["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["e"]["BackgroundTransparency"] = 1;
		GUI["e"]["Position"] = UDim2.new(1,-40,0, 7);
	end
	
	do --Tab List
		-- StarterGui.ScreenGui.Main.Navigation
		GUI["4d"] = Instance.new("Frame", GUI["2"]);
		GUI["4d"]["ZIndex"] = 0;
		GUI["4d"]["BorderSizePixel"] = 0;
		GUI["4d"]["BackgroundColor3"] = Color3.fromRGB(38, 38, 39);
		GUI["4d"]["Size"] = UDim2.new(1, -40, 0, 30);
		GUI["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4d"]["Position"] = UDim2.new(0, 40, 0, 25);
		GUI["4d"]["Name"] = [[Navigation]];

		-- StarterGui.ScreenGui.Main.Navigation.NavigationHolder
		GUI["4e"] = Instance.new("Frame", GUI["4d"]);
		GUI["4e"]["BorderSizePixel"] = 0;
		GUI["4e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["4e"]["BackgroundTransparency"] = 1;
		GUI["4e"]["Size"] = UDim2.new(0.9999998807907104, 0, 0, 30);
		GUI["4e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4e"]["Position"] = UDim2.new(6.634255811377443e-08, 0, 0, 0);
		GUI["4e"]["Name"] = [[NavigationHolder]];
		
		GUI["sc"] = Instance.new("ScrollingFrame", GUI["4e"]);
		GUI["sc"]["Active"] = false;
		GUI["sc"]["ScrollingDirection"] = Enum.ScrollingDirection.X;
		GUI["sc"]["BorderSizePixel"] = 0;
		GUI["sc"]["CanvasSize"] = UDim2.new(2, 0, 0, 0);
		GUI["sc"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["sc"]["BackgroundTransparency"] = 1;
		GUI["sc"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["sc"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["sc"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["sc"]["ScrollBarThickness"] = 0;
		
		
		-- StarterGui.ScreenGui.Main.Navigation.NavigationHolder.UIListLayout
		GUI["4f"] = Instance.new("UIListLayout", GUI["sc"]);
		GUI["4f"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
		GUI["4f"]["FillDirection"] = Enum.FillDirection.Horizontal;
		GUI["4f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	end
	
	do --Left Tab
		-- StarterGui.ScreenGui.Main.LeftTab
		GUI["48"] = Instance.new("Frame", GUI["2"]);
		GUI["48"]["BorderSizePixel"] = 0;
		GUI["48"]["BackgroundColor3"] = Color3.fromRGB(52, 52, 52);
		GUI["48"]["Size"] = UDim2.new(0, 40, 1, 1);
		GUI["48"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["48"]["Name"] = [[LeftTab]];

		-- StarterGui.ScreenGui.Main.LeftTab.UICorner
		GUI["49"] = Instance.new("UICorner", GUI["48"]);


		-- StarterGui.ScreenGui.Main.LeftTab.ImageLabel
		GUI["4a"] = Instance.new("ImageButton", GUI["48"]);
		GUI["4a"]["BorderSizePixel"] = 0;
		GUI["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["4a"]["Image"] = [[rbxassetid://15155077816]];
		GUI["4a"]["Size"] = UDim2.new(0, 24, 0, 24);
		GUI["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4a"]["BackgroundTransparency"] = 1;
		GUI["4a"]["ImageTransparency"] = 0.4;
		GUI["4a"]["Position"] = UDim2.new(0,7,1,-55);

		-- StarterGui.ScreenGui.Main.LeftTab.ImageLabel
		GUI["4b"] = Instance.new("ImageButton", GUI["48"]);
		GUI["4b"]["BorderSizePixel"] = 0;
		GUI["4b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["4b"]["ImageTransparency"] = 0.4;
		GUI["4b"]["Image"] = [[rbxassetid://15116290033]];
		GUI["4b"]["Size"] = UDim2.new(0, 22, 0, 22);
		GUI["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4b"]["BackgroundTransparency"] = 1;
		GUI["4b"]["Position"] = UDim2.new(0,9,0,33);

		-- StarterGui.ScreenGui.Main.LeftTab.ImageLabel
		GUI["4c"] = Instance.new("ImageButton", GUI["48"]);
		GUI["4c"]["BorderSizePixel"] = 0;
		GUI["4c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["4c"]["ImageTransparency"] = 0.4;
		GUI["4c"]["Image"] = [[rbxassetid://15116308625]];
		GUI["4c"]["Size"] = UDim2.new(0, 22, 0, 22);
		GUI["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4c"]["BackgroundTransparency"] = 1;
		GUI["4c"]["Position"] = UDim2.new(0,9,1,-90);
		
		-- StarterGui.Main.Main.LeftTab.Key
		GUI["65"] = Instance.new("ImageButton", GUI["48"]);
		GUI["65"]["BorderSizePixel"] = 0;
		GUI["65"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["65"]["ImageTransparency"] = 0.4;
		GUI["65"]["Image"] = [[rbxassetid://15122369361]];
		GUI["65"]["Size"] = UDim2.new(0, 21, 0, 21);
		GUI["65"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["65"]["Name"] = [[Key]];
		GUI["65"]["BackgroundTransparency"] = 1;
		GUI["65"]["Position"] = UDim2.new(0,9,1,-125);

		-- StarterGui.Main.Main.LeftTab.Key.UIGradient
		GUI["66"] = Instance.new("UIGradient", GUI["65"]);
		GUI["66"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(238, 202, 104)),ColorSequenceKeypoint.new(0.492, Color3.fromRGB(250, 243, 150)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(225, 171, 63))};

	end
	
	do --Content Container of Tab Functions
		-- StarterGui.ScreenGui.Main.ContentContainer
		GUI["f"] = Instance.new("Frame", GUI["2"]);
		GUI["f"]["BorderSizePixel"] = 0;
		GUI["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["f"]["BackgroundTransparency"] = 1;
		GUI["f"]["Size"] = UDim2.new(1, -50, 1, -84);
		GUI["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["f"]["Position"] = UDim2.new(0, 45, 0, 60);
		GUI["f"]["Name"] = [[ContentContainer]];
	end
	
	function GUI:Minimize()
		local Minimize = {
			Active = false
		}

		-- Methods
		function Minimize:Toggle()
			if Minimize.Active == false then
				GUI["48"]["Visible"] = false
				GUI["4d"]["Visible"] = false
				GUI["f"]["Visible"] = false
				Library:tween(GUI["2"], {Size = UDim2.new(0, 300, 0, 43)})
				Library:tween(GUI["514"], {Size = UDim2.new(0,250,0,25)})
				Minimize.Active = true
			elseif Minimize.Active == true then
				GUI["48"]["Visible"] = true
				GUI["4d"]["Visible"] = true
				GUI["f"]["Visible"] = true
				Library:tween(GUI["2"], {Size = UDim2.new(0, 450, 0, 300)})
				Library:tween(GUI["514"], {Size = UDim2.new(0,400,0,25)})
				Minimize.Active = false
			end
		end

		-- Logic
		do
			GUI["e"].MouseButton1Click:Connect(function()
				Minimize:Toggle()
			end)
		end
	end
	
	GUI:Minimize()
	
	function GUI:Close()
		-- Logic
		do
			GUI["d"].MouseButton1Click:Connect(function()
				GUI["1"]:Destroy()
			end)
		end
	end
	
	GUI:Close()
	
	function GUI:CreateTab(options)
		Library:Validate({
			name = "Unnamed Tab",
			icon = "rbxassetid://15116174139"
		}, options or {})
		
		local Tab = {
			Hover = false,
			Active = false
		}
		
		do --Tab
			-- StarterGui.ScreenGui.Main.Navigation.NavigationHolder.PlayerInactive
			Tab["53"] = Instance.new("TextButton", GUI["sc"]);
			Tab["53"]["BorderSizePixel"] = 0;
			Tab["53"]["BackgroundColor3"] = Color3.fromRGB(47, 47, 47);
			Tab["53"]["FontFace"] = CustomFont
			Tab["53"]["TextSize"] = 12;
			Tab["53"]["TextColor3"] = Color3.fromRGB(136, 136, 136);
			Tab["53"]["AnchorPoint"] = Vector2.new(1, 0);
			Tab["53"]["Size"] = UDim2.new(0, 80, 1, 0);
			Tab["53"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["53"]["Text"] = options.name;
			Tab["53"]["Name"] = [[PlayerInactive]];
			Tab["53"]["AutoButtonColor"] = false;

			-- StarterGui.ScreenGui.Main.Navigation.NavigationHolder.PlayerInactive.ImageLabel
			Tab["54"] = Instance.new("ImageLabel", Tab["53"]);
			Tab["54"]["BorderSizePixel"] = 0;
			Tab["54"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["54"]["Image"] = options.icon;
			Tab["54"]["Size"] = UDim2.new(0, 10, 0, 10);
			Tab["54"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["54"]["BackgroundTransparency"] = 1;
			Tab["54"]["Position"] = UDim2.new(0, -4, 0, 10);
			Tab["54"]["ImageColor3"] = Color3.fromRGB(136, 136, 136)

			-- StarterGui.ScreenGui.Main.Navigation.NavigationHolder.PlayerInactive.UIPadding
			Tab["55"] = Instance.new("UIPadding", Tab["53"]);
			Tab["55"]["PaddingLeft"] = UDim.new(0, 12);
			
			-- StarterGui.ScreenGui.Main.ContentContainer.PlayerTab
			Tab["10"] = Instance.new("ScrollingFrame", GUI["f"]);
			Tab["10"]["Active"] = true;
			Tab["10"]["BorderSizePixel"] = 0;
			Tab["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Tab["10"]["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always;
			Tab["10"]["BackgroundTransparency"] = 1;
			Tab["10"]["Size"] = UDim2.new(1, 0, 1, 0);
			Tab["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Tab["10"]["ScrollBarThickness"] = 2;
			Tab["10"]["Name"] = [[PlayerTab]];
			Tab["10"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
			Tab["10"]["Visible"] = false;
			Tab["10"]["Active"] = false;
			
			-- StarterGui.Main.Main.ContentContainer.PlayerTab.UIPadding
			Tab["7b"] = Instance.new("UIPadding", Tab["10"]);
			Tab["7b"]["PaddingTop"] = UDim.new(0, 4);
			Tab["7b"]["PaddingLeft"] = UDim.new(0, 2);
			
			-- StarterGui.ScreenGui.Main.ContentContainer.PlayerTab.UIListLayout
			GUI["17"] = Instance.new("UIListLayout", Tab["10"]);
			GUI["17"]["Padding"] = UDim.new(0, 7);
			GUI["17"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
		end
		
		function Tab:Activate()
			if not Tab.Active then
				spawn(function()
					GUI["f"]:WaitForChild("BuyKey").Visible = false;	
					GUI["f"]:WaitForChild("Profile").Visible = false;
					GUI["f"]:WaitForChild("Credits").Visible = false;
				end)
				
				if GUI.CurrentTab ~= nil then
					GUI.CurrentTab:Deactivate()
				end
				
				Tab.Active = true
				Library:tween(Tab["53"], {TextColor3 = Color3.fromRGB(255,255,255)})
				Library:tween(Tab["53"], {BackgroundColor3 = Color3.fromRGB(31,31,31)})
				Library:tween(Tab["54"], {ImageColor3 = Color3.fromRGB(255,255,255)})
				
				GUI.CurrentTab = Tab
				
				Tab["10"]["Visible"] = true
			end
		end
		
		function Tab:Deactivate()
			if Tab.Active then
				Tab.Active = false
				Tab.Hover = false
				Library:tween(Tab["53"], {TextColor3 = Color3.fromRGB(136, 136, 136)})
				Library:tween(Tab["53"], {BackgroundColor3 = Color3.fromRGB(46,46,46)})
				Library:tween(Tab["54"], {ImageColor3 = Color3.fromRGB(136, 136, 136)})
				Tab["10"]["Visible"] = false
			end
		end
		
		
		do --Logic
			Tab["53"].MouseEnter:Connect(function()
				Tab.Hover = true

				if not Tab.Active then
					Library:tween(Tab["53"], {TextColor3 = Color3.fromRGB(255,255,255)})
					Library:tween(Tab["54"], {ImageColor3 = Color3.fromRGB(255,255,255)})
				end
			end)

			Tab["53"].MouseLeave:Connect(function()
				Tab.Hover = false
				if not Tab.Active then
					Library:tween(Tab["53"], {TextColor3 = Color3.fromRGB(136, 136, 136)})
					Library:tween(Tab["54"], {ImageColor3 = Color3.fromRGB(136, 136, 136)})
				end
			end)
			
			Tab["53"].MouseButton1Click:Connect(function()
				Tab:Activate()
			end)
			--[[
			uis.InputBegan:Connect(function(input, gpe)
				if gpe then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						Tab:Activate()
					end
				end
			end)]]--

			if GUI.CurrentTab == nil then
				Tab:Activate()
			end
		end
		
		function Tab:Button(options)
			Library:Validate({
				name = "Unnamed Tab",
				callback = function() end
			}, options or {})
			
			local Button = {
				Hover = false,
				MouseDown = false
			}
			
			--Button Create
			do
				-- StarterGui.ScreenGui.Main.ContentContainer.PlayerTab.TextButton
				Button["11"] = Instance.new("TextButton", Tab["10"]);
				Button["11"]["BorderSizePixel"] = 0;
				Button["11"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
				Button["11"]["Size"] = UDim2.new(1, -5, 0, 32);
				Button["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["11"]["Name"] = [[Button]];
				Button["11"]["Text"] = options.name;
				Button["11"]["TextColor3"] = Color3.fromRGB(255,255,255);
				Button["11"]["TextSize"] = 14;
				Button["11"]["FontFace"] = CustomFont
				Button["11"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["11"]["AutoButtonColor"] = false;
				
				-- StarterGui.ScreenGui.Main.ContentContainer.PlayerTab.Button.ImageLabel
				Button["16"] = Instance.new("ImageLabel", Button["11"]);
				Button["16"]["BorderSizePixel"] = 0;
				Button["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["16"]["AnchorPoint"] = Vector2.new(1, 0);
				Button["16"]["Image"] = [[rbxassetid://15114009114]];
				Button["16"]["Size"] = UDim2.new(0, 20, 0, 20);
				Button["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["16"]["Position"] = UDim2.new(1, -7, 0, 5);
				Button["16"]["BackgroundTransparency"] = 1;

				-- StarterGui.ScreenGui.Main.ContentContainer.PlayerTab.Button.UICorner
				Button["12"] = Instance.new("UICorner", Button["11"]);
				Button["12"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.ScreenGui.Main.ContentContainer.PlayerTab.Button.UIStroke
				Button["13"] = Instance.new("UIStroke", Button["11"]);
				Button["13"]["Color"] = Color3.fromRGB(38, 38, 39);
				Button["13"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				
				-- StarterGui.ScreenGui.Main.ContentContainer.PlayerTab.Button.TextLabel.UIPadding
				Button["14"] = Instance.new("UIPadding", Button["11"]);
				Button["14"]["PaddingLeft"] = UDim.new(0, 15);
			end
			
			--Methods
			function Button:SetText(text)
				Button["11"].Text = text
				options.name = text
			end
			
			function Button:SetCallback(fn)
				options.callback = fn
			end
			
			--Logic
			do
				Button["11"].MouseEnter:Connect(function()
					Button.Hover = true
					Library:tween(Button["13"], {Color = Color3.fromRGB(80, 80, 80)})
				end)
				
				Button["11"].MouseLeave:Connect(function()
					Button.Hover = false
					if not Button.MouseDown then
						Library:tween(Button["13"], {Color = Color3.fromRGB(38, 38, 39)})
					end
				end)
				
				Button["11"].MouseButton1Click:Connect(function()
					options.callback()
				end)
			end
			
			return Button
		end
		
		function Tab:Warning(options)
			Library:Validate({
				name = "Warning",
				text = "Warning"
			}, options or {})
			
			local Warning = {}
			
			--Render
			do
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Warning
				Warning["5c"] = Instance.new("Frame", Tab["10"]);
				Warning["5c"]["BorderSizePixel"] = 0;
				Warning["5c"]["BackgroundColor3"] = Color3.fromRGB(90, 92, 0);
				Warning["5c"]["Size"] = UDim2.new(1, -5, 0, 50);
				Warning["5c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Warning["5c"]["Name"] = [[Warning]];

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Warning.UICorner
				Warning["5d"] = Instance.new("UICorner", Warning["5c"]);
				Warning["5d"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Warning.UIStroke
				Warning["5e"] = Instance.new("UIStroke", Warning["5c"]);
				Warning["5e"]["Color"] = Color3.fromRGB(122, 113, 10);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Warning.TextLabel
				Warning["5f"] = Instance.new("TextLabel", Warning["5c"]);
				Warning["5f"]["BorderSizePixel"] = 0;
				Warning["5f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["5f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Warning["5f"]["FontFace"] = CustomFont
				Warning["5f"]["TextSize"] = 14;
				Warning["5f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["5f"]["Size"] = UDim2.new(1, 0, 0, 30);
				Warning["5f"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["5f"]["Text"] = options.name;
				Warning["5f"]["BackgroundTransparency"] = 1;

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Warning.TextLabel.UIPadding
				Warning["60"] = Instance.new("UIPadding", Warning["5f"]);
				Warning["60"]["PaddingLeft"] = UDim.new(0, 40);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Warning.ImageLabel
				Warning["61"] = Instance.new("ImageLabel", Warning["5c"]);
				Warning["61"]["BorderSizePixel"] = 0;
				Warning["61"]["BackgroundColor3"] = Color3.fromRGB(67, 144, 203);
				Warning["61"]["ImageColor3"] = Color3.fromRGB(204, 204, 0);
				Warning["61"]["Image"] = [[rbxassetid://15122309807]];
				Warning["61"]["Size"] = UDim2.new(0, 17, 0, 17);
				Warning["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Warning["61"]["BackgroundTransparency"] = 1;
				Warning["61"]["Position"] = UDim2.new(0, 9, 0, 6);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Warning.TextLabel
				Warning["62"] = Instance.new("TextLabel", Warning["5c"]);
				Warning["62"]["TextWrapped"] = false;
				Warning["62"]["BorderSizePixel"] = 0;
				Warning["62"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["62"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Warning["62"]["FontFace"] = CustomFont
				Warning["62"]["TextSize"] = 14;
				Warning["62"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["62"]["Size"] = UDim2.new(1, 0, 0, 20);
				Warning["62"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
				Warning["62"]["Text"] = options.text;
				Warning["62"]["BackgroundTransparency"] = 1;
				Warning["62"]["Position"] = UDim2.new(0, 0, 0, 30);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Warning.TextLabel.UIPadding
				Warning["63"] = Instance.new("UIPadding", Warning["62"]);
				Warning["63"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Warning.UIGradient
				Warning["64"] = Instance.new("UIGradient", Warning["5c"]);
				Warning["64"]["Color"] = ColorSequence.new{
					ColorSequenceKeypoint.new(0.000, Color3.fromRGB(252, 255, 0)),
					ColorSequenceKeypoint.new(1.000, Color3.fromRGB(134, 136, 0))
				};
			end
			
			--Methods
			
			function Warning:SetName(name)
				options.name = name
				Warning:_update()
			end
			
			function Warning:SetText(text)
				options.text = text
				Warning["56"].Text = text
			end
			
			function Warning:_update()
				Warning["62"].Text = options.text
				Warning["62"].Size = UDim2.new(Warning["62"].Size.X.Scale, Warning["62"].Size.X.Offset, 0, math.huge)
				Warning["62"].Size = UDim2.new(Warning["62"].Size.X.Scale, Warning["62"].Size.X.Offset, 0, Warning["62"].TextBounds.Y)
				Warning["5c"].Size = UDim2.new(Warning["5c"].Size.X.Scale, Warning["5c"].Size.X.Offset, 0, Warning["62"].TextBounds.Y + 40)
			end
			
			Warning:_update()
			return Warning
		end
		
		function Tab:Information(options)
			Library:Validate({
				name = "Information",
				text = "Information"
			}, options or {})

			local Information = {}

			--Render
			do
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Information
				Information["53"] = Instance.new("Frame", Tab["10"]);
				Information["53"]["BorderSizePixel"] = 0;
				Information["53"]["BackgroundColor3"] = Color3.fromRGB(30, 64, 90);
				Information["53"]["Size"] = UDim2.new(1, -5, 0, 50);
				Information["53"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Information["53"]["Name"] = [[Information]];

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Information.UICorner
				Information["54"] = Instance.new("UICorner", Information["53"]);
				Information["54"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Information.UIStroke
				Information["55"] = Instance.new("UIStroke", Information["53"]);
				Information["55"]["Color"] = Color3.fromRGB(22, 83, 136);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Information.TextLabel
				Information["56"] = Instance.new("TextLabel", Information["53"]);
				Information["56"]["BorderSizePixel"] = 0;
				Information["56"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Information["56"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Information["56"]["FontFace"] = CustomFont
				Information["56"]["TextSize"] = 14;
				Information["56"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Information["56"]["Size"] = UDim2.new(1, 0, 0, 30);
				Information["56"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
				Information["56"]["Text"] = options.name;
				Information["56"]["BackgroundTransparency"] = 1;

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Information.TextLabel.UIPadding
				Information["57"] = Instance.new("UIPadding", Information["56"]);
				Information["57"]["PaddingLeft"] = UDim.new(0, 40);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Information.ImageLabel
				Information["58"] = Instance.new("ImageLabel", Information["53"]);
				Information["58"]["BorderSizePixel"] = 0;
				Information["58"]["BackgroundColor3"] = Color3.fromRGB(67, 144, 203);
				Information["58"]["ImageColor3"] = Color3.fromRGB(67, 144, 203);
				Information["58"]["Image"] = [[rbxassetid://15121867101]];
				Information["58"]["Size"] = UDim2.new(0, 20, 0, 20);
				Information["58"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Information["58"]["BackgroundTransparency"] = 1;
				Information["58"]["Position"] = UDim2.new(0, 9, 0, 6);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Information.TextLabel
				Information["59"] = Instance.new("TextLabel", Information["53"]);
				Information["59"]["TextWrapped"] = true;
				Information["59"]["BorderSizePixel"] = 0;
				Information["59"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Information["59"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Information["59"]["FontFace"] = CustomFont
				Information["59"]["TextSize"] = 14;
				Information["59"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Information["59"]["Size"] = UDim2.new(1, 0, 0, 15);
				Information["59"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
				Information["59"]["Text"] = options.text;
				Information["59"]["BackgroundTransparency"] = 1;
				Information["59"]["Position"] = UDim2.new(0, 0, 0, 30);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Information.TextLabel.UIPadding
				Information["5a"] = Instance.new("UIPadding", Information["59"]);
				Information["5a"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Information.UIGradient
				Information["5b"] = Instance.new("UIGradient", Information["53"]);
				Information["5b"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(84, 181, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(22, 82, 122))};

			end

			--Methods

			function Information:SetName(name)
				options.name = name
				Information:_update()
			end

			function Information:SetText(text)
				options.text = text
				Information["59"].Text = text
			end

			function Information:_update()
				Information["59"].Text = options.text
				Information["59"].Size = UDim2.new(Information["59"].Size.X.Scale, Information["59"].Size.X.Offset, 0, math.huge)
				Information["59"].Size = UDim2.new(Information["59"].Size.X.Scale, Information["59"].Size.X.Offset, 0, Information["59"].TextBounds.Y)
				Information["53"].Size = UDim2.new(Information["53"].Size.X.Scale, Information["53"].Size.X.Offset, 0, Information["59"].TextBounds.Y + 40)
			end

			Information:_update()
			return Information
		end
		
		function Tab:Message(options)
			Library:Validate({
				name = "Message",
				text = "Message"
			}, options or {})

			local Message = {}

			--Render
			do		
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Message
				Message["65"] = Instance.new("Frame", Tab["10"]);
				Message["65"]["BorderSizePixel"] = 0;
				Message["65"]["BackgroundColor3"] = Color3.fromRGB(94, 94, 94);
				Message["65"]["Size"] = UDim2.new(1, -5, 0, 50);
				Message["65"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Message["65"]["Name"] = [[Message]];

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Message.UICorner
				Message["66"] = Instance.new("UICorner", Message["65"]);
				Message["66"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Message.UIStroke
				Message["67"] = Instance.new("UIStroke", Message["65"]);
				Message["67"]["Color"] = Color3.fromRGB(129, 129, 133);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Message.TextLabel
				Message["68"] = Instance.new("TextLabel", Message["65"]);
				Message["68"]["BorderSizePixel"] = 0;
				Message["68"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Message["68"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Message["68"]["FontFace"] = CustomFont
				Message["68"]["TextSize"] = 14;
				Message["68"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Message["68"]["Size"] = UDim2.new(1, 0, 0, 30);
				Message["68"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
				Message["68"]["Text"] = options.name;
				Message["68"]["BackgroundTransparency"] = 1;

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Message.TextLabel.UIPadding
				Message["69"] = Instance.new("UIPadding", Message["68"]);
				Message["69"]["PaddingLeft"] = UDim.new(0, 40);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Message.ImageLabel
				Message["6a"] = Instance.new("ImageLabel", Message["65"]);
				Message["6a"]["BorderSizePixel"] = 0;
				Message["6a"]["BackgroundColor3"] = Color3.fromRGB(71, 71, 71);
				Message["6a"]["ImageColor3"] = Color3.fromRGB(85, 85, 85);
				Message["6a"]["Image"] = [[rbxassetid://15122343175]];
				Message["6a"]["Size"] = UDim2.new(0, 17, 0, 17);
				Message["6a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Message["6a"]["BackgroundTransparency"] = 1;
				Message["6a"]["Position"] = UDim2.new(0, 9, 0, 8);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Message.TextLabel
				Message["6b"] = Instance.new("TextLabel", Message["65"]);
				Message["6b"]["TextWrapped"] = true;
				Message["6b"]["BorderSizePixel"] = 0;
				Message["6b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Message["6b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Message["6b"]["FontFace"] = CustomFont
				Message["6b"]["TextSize"] = 14;
				Message["6b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Message["6b"]["Size"] = UDim2.new(1, 0, 0, 20);
				Message["6b"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
				Message["6b"]["Text"] = options.text;
				Message["6b"]["BackgroundTransparency"] = 1;
				Message["6b"]["Position"] = UDim2.new(0, 0, 0, 30);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Message.TextLabel.UIPadding
				Message["6c"] = Instance.new("UIPadding", Message["6b"]);
				Message["6c"]["PaddingLeft"] = UDim.new(0, 10);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Message.UIGradient
				Message["6d"] = Instance.new("UIGradient", Message["65"]);
				Message["6d"]["Color"] = ColorSequence.new{
					ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),
					ColorSequenceKeypoint.new(1.000, Color3.fromRGB(109, 109, 109))
				};
			end

			--Methods

			function Message:SetName(name)
				options.name = name
				Message:_update()
			end

			function Message:SetText(text)
				options.text = text
				Message["6b"].Text = text
			end

			function Message:_update()
				Message["6b"].Text = options.text
				Message["6b"].Size = UDim2.new(Message["6b"].Size.X.Scale, Message["6b"].Size.X.Offset, 0, Message["6b"].TextBounds.Y)
				Message["65"].Size = UDim2.new(Message["65"].Size.X.Scale, Message["65"].Size.X.Offset, 0, Message["6b"].TextBounds.Y + 40)
			end

			Message:_update()
			return Message
		end
		
		function Tab:Slider(options)
			Library:Validate({
				name = "Slider",
				minimum = 0,
				maximum = 20,
				default = 10,
				valuename = "sections",
				gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};
				callback = function(v) print(v) end
			}, options or {})
			
			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil
			}
			
			--Render
			do
				
				-- StarterGui.Main.Frame.Main.ContentContainer.PlayerTab.Slider
				Slider["19"] = Instance.new("TextButton", Tab["10"]);
				Slider["19"]["BorderSizePixel"] = 0;
				Slider["19"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
				Slider["19"]["Size"] = UDim2.new(1, -5, 0, 55);
				Slider["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["19"]["Name"] = [[Slider]];
				Slider["19"]["AutoButtonColor"] = false;
				Slider["19"]["TextTransparency"] = 1;
				
				-- StarterGui.Main.Frame.Main.ContentContainer.PlayerTab.Slider.UICorner
				Slider["1a"] = Instance.new("UICorner", Slider["19"]);
				Slider["1a"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Frame.Main.ContentContainer.PlayerTab.Slider.UIStroke
				Slider["1b"] = Instance.new("UIStroke", Slider["19"]);
				Slider["1b"]["Color"] = Color3.fromRGB(38, 38, 39);
				Slider["1b"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
				
				-- StarterGui.Main.Frame.Main.ContentContainer.PlayerTab.Slider.TextLabel
				Slider["1c"] = Instance.new("TextLabel", Slider["19"]);
				Slider["1c"]["BorderSizePixel"] = 0;
				Slider["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["1c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["1c"]["FontFace"] = CustomFont
				Slider["1c"]["TextSize"] = 14;
				Slider["1c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["1c"]["Size"] = UDim2.new(1, 0, 1, -30);
				Slider["1c"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["1c"]["Text"] = options.name;
				Slider["1c"]["BackgroundTransparency"] = 1;
				Slider["1c"]["Position"] = UDim2.new(0, 0, 0, 2);

				-- StarterGui.Main.Frame.Main.ContentContainer.PlayerTab.Slider.TextLabel.UIPadding
				Slider["1d"] = Instance.new("UIPadding", Slider["1c"]);
				Slider["1d"]["PaddingBottom"] = UDim.new(0, 2);
				Slider["1d"]["PaddingLeft"] = UDim.new(0, 15);

				-- StarterGui.Main.Frame.Main.ContentContainer.PlayerTab.Slider.SliderBack
				Slider["1e"] = Instance.new("Frame", Slider["19"]);
				Slider["1e"]["Active"] = false;
				Slider["1e"]["BorderSizePixel"] = 0;
				Slider["1e"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
				Slider["1e"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["1e"]["Size"] = UDim2.new(1, -20, 0, 20);
				Slider["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["1e"]["Position"] = UDim2.new(0, 10, 1, -7);
				Slider["1e"]["Name"] = [[SliderBack]];

				-- StarterGui.Main.Frame.Main.ContentContainer.PlayerTab.Slider.SliderBack.UICorner
				Slider["1f"] = Instance.new("UICorner", Slider["1e"]);


				-- StarterGui.Main.Frame.Main.ContentContainer.PlayerTab.Slider.SliderBack.UIStroke
				Slider["20"] = Instance.new("UIStroke", Slider["1e"]);
				Slider["20"]["Color"] = Color3.fromRGB(33, 33, 33);

				-- StarterGui.Main.Frame.Main.ContentContainer.PlayerTab.Slider.SliderBack.Draggable
				Slider["21"] = Instance.new("Frame", Slider["1e"]);
				Slider["21"]["BorderSizePixel"] = 0;
				Slider["21"]["BackgroundColor3"] = Color3.fromRGB(0, 106, 176);
				Slider["21"]["Size"] = UDim2.new(0,((Slider["1e"].AbsoluteSize.X / options.maximum) * options.default),1,0);
					--UDim2.new(0.5, 0, 1, 0);
				Slider["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["21"]["Name"] = [[Draggable]];

				-- StarterGui.Main.Frame.Main.ContentContainer.PlayerTab.Slider.SliderBack.Draggable.UICorner
				Slider["22"] = Instance.new("UICorner", Slider["21"]);


				-- StarterGui.Main.Frame.Main.ContentContainer.PlayerTab.Slider.SliderBack.Draggable.UIGradient
				Slider["23"] = Instance.new("UIGradient", Slider["21"]);
				Slider["23"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.001, Color3.fromRGB(11, 91, 175)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};

				-- StarterGui.Main.Frame.Main.ContentContainer.PlayerTab.Slider.SliderBack.TextLabel
				Slider["24"] = Instance.new("TextLabel", Slider["1e"]);
				Slider["24"]["BorderSizePixel"] = 0;
				Slider["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["24"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["24"]["FontFace"] = CustomFont
				Slider["24"]["TextSize"] = 12;
				Slider["24"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["24"]["Size"] = UDim2.new(1, 0, 1, 0);
				Slider["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["24"]["Text"] = options.default.." "..options.valuename;
				Slider["24"]["BackgroundTransparency"] = 1;

				-- StarterGui.Main.Frame.Main.ContentContainer.PlayerTab.Slider.SliderBack.TextLabel.UIPadding
				Slider["25"] = Instance.new("UIPadding", Slider["24"]);
				Slider["25"]["PaddingLeft"] = UDim.new(0, 10);
			end
			
			--Methods
			
			--[[uis.InputChanged:Connect(function(Input)
				if Hover == true and Input.UserInputType == Enum.UserInputType.MouseMovement then 
					local SizeScale = math.clamp((Input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
					Slider:Set(SliderConfig.Min + ((SliderConfig.Max - SliderConfig.Min) * SizeScale)) 
				end
			end)]]--
			
			function Slider:SetValue(v)
				if v == nil then
					local percentage = math.clamp((mouse.X - Slider["1e"].AbsolutePosition.X) / (Slider["1e"].AbsoluteSize.X), 0, 1)
					local value = ((options.maximum - options.minimum) * percentage) + options.minimum
					value = math.floor(value)
					Slider["24"]["Text"] = tostring(value.." "..options.valuename)
					Slider["21"].Size = UDim2.fromScale(percentage, 1)
				else
					Slider["24"]["Text"] = tostring(v)
					Slider["21"].Size = UDim2.fromScale(((v - options.minimum) / (options.maximum - options.minimum)), 1)
				end
				options.callback(Slider:GetValue())
			end
			
			function Slider:GetValue()
				return tonumber(Slider["24"]["Text"]:match("%d+"))
			end
		
			
			--Logic
			do
				Slider["19"].MouseEnter:Connect(function()
					Slider.Hover = true
					Library:tween(Slider["1b"], {Color = Color3.fromRGB(60, 60, 60)})
					Library:tween(Slider["20"], {Color = Color3.fromRGB(60, 60, 60)})
				end)

				Slider["19"].MouseLeave:Connect(function()
					Slider.Hover = false
					if not Slider.MouseDown then
						Library:tween(Slider["1b"], {Color = Color3.fromRGB(38, 38, 39)})
						Library:tween(Slider["20"], {Color = Color3.fromRGB(38, 38, 39)})
					end
				end)
				
				Slider["19"].MouseButton1Down:Connect(function()
					local frame = Slider["19"]
					Slider.MouseDown = true
					Library:tween(Slider["19"], {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})	
					Library:tween(Slider["1b"], {Color = Color3.fromRGB(60, 60, 60)})
					Library:tween(Slider["20"], {Color = Color3.fromRGB(200, 200, 200)})

					--if not Slider.Connection then
						--Slider.Connection = RunService.RenderStepped:Connect(function()
						--	Slider:SetValue()
						--end)
					while Slider.MouseDown and mouse.X >= frame.AbsolutePosition.X and mouse.X <= frame.AbsolutePosition.X + frame.AbsoluteSize.X
					and mouse.Y >= frame.AbsolutePosition.Y and mouse.Y <= frame.AbsolutePosition.Y + frame.AbsoluteSize.Y do
							Slider:SetValue()
							game:GetService("RunService").RenderStepped:Wait()
						end
					Slider.MouseDown = false

					if Slider.Hover then
						Library:tween(Slider["19"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})	
						Library:tween(Slider["20"], {Color = Color3.fromRGB(60, 60, 60)})
						Library:tween(Slider["1b"], {Color = Color3.fromRGB(60, 60, 60)})
					else	
						Library:tween(Slider["19"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})		
						Library:tween(Slider["20"], {Color = Color3.fromRGB(38, 38, 39)})
						Library:tween(Slider["1b"], {Color = Color3.fromRGB(38, 38, 39)})
					end

					if Slider.Connection then Slider.Connection:Disconnect() end
					Slider.Connection = nil
				end)

				Slider["19"].MouseButton1Up:Connect(function()
					Slider.MouseDown = false

					if Slider.Hover then
						Library:tween(Slider["19"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})	
						Library:tween(Slider["20"], {Color = Color3.fromRGB(60, 60, 60)})
						Library:tween(Slider["1b"], {Color = Color3.fromRGB(60, 60, 60)})
					else	
						Library:tween(Slider["19"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})		
						Library:tween(Slider["20"], {Color = Color3.fromRGB(38, 38, 39)})
						Library:tween(Slider["1b"], {Color = Color3.fromRGB(38, 38, 39)})
					end

					if Slider.Connection then Slider.Connection:Disconnect() end
					Slider.Connection = nil
				end)
			end
		end
		
		function Tab:Toggle(options)
			Library:Validate({
				name = "Toggle",
				callback = function() end
			}, options or {})
			
			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}

			--Render
			do
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.ToggleInactive
				Toggle["36"] = Instance.new("TextButton", Tab["10"]);
				Toggle["36"]["BorderSizePixel"] = 0;
				Toggle["36"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
				Toggle["36"]["Size"] = UDim2.new(1, -5, 0, 32);
				Toggle["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["36"]["Name"] = [[ToggleInactive]];
				Toggle["36"]["TextTransparency"] = 1;
				Toggle["36"]["AutoButtonColor"] = false;
				
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.ToggleInactive.UICorner
				Toggle["37"] = Instance.new("UICorner", Toggle["36"]);
				Toggle["37"]["CornerRadius"] = UDim.new(0, 4);
				
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.ToggleInactive.TextLabel
				Toggle["38"] = Instance.new("TextLabel", Toggle["36"]);
				Toggle["38"]["BorderSizePixel"] = 0;
				Toggle["38"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["38"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["38"]["FontFace"] = CustomFont
				Toggle["38"]["TextSize"] = 14;
				Toggle["38"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["38"]["Size"] = UDim2.new(1, 0, 1, 0);
				Toggle["38"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["38"]["Text"] = options.name;
				Toggle["38"]["BackgroundTransparency"] = 1;

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.ToggleInactive.TextLabel.UIPadding
				Toggle["39"] = Instance.new("UIPadding", Toggle["38"]);
				Toggle["39"]["PaddingLeft"] = UDim.new(0, 15);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.ToggleInactive.CheckmarkHolder
				Toggle["3a"] = Instance.new("Frame", Toggle["36"]);
				Toggle["3a"]["BorderSizePixel"] = 0;
				Toggle["3a"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
				Toggle["3a"]["AnchorPoint"] = Vector2.new(1, 0);
				Toggle["3a"]["Size"] = UDim2.new(0, 22, 0, 22);
				Toggle["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["3a"]["Position"] = UDim2.new(1, -7, 1, -27);
				Toggle["3a"]["Name"] = [[CheckmarkHolder]];

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.ToggleInactive.CheckmarkHolder.UICorner
				Toggle["3b"] = Instance.new("UICorner", Toggle["3a"]);
				Toggle["3b"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.ToggleInactive.CheckmarkHolder.UIStroke
				Toggle["3c"] = Instance.new("UIStroke", Toggle["3a"]);
				Toggle["3c"]["Color"] = Color3.fromRGB(33, 33, 33);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.ToggleInactive.CheckmarkHolder.Checkmark
				Toggle["3d"] = Instance.new("ImageLabel", Toggle["3a"]);
				Toggle["3d"]["BorderSizePixel"] = 0;
				Toggle["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["3d"]["ImageTransparency"] = 1;
				Toggle["3d"]["Image"] = [[rbxassetid://15114786962]];
				Toggle["3d"]["Size"] = UDim2.new(1, -5, 1, -5);
				Toggle["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["3d"]["Name"] = [[Checkmark]];
				Toggle["3d"]["BackgroundTransparency"] = 1;
				Toggle["3d"]["Position"] = UDim2.new(0, 2, 0, 3);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.ToggleInactive.UIStroke
				Toggle["3e"] = Instance.new("UIStroke", Toggle["36"]);
				Toggle["3e"]["Color"] = Color3.fromRGB(38, 38, 39);
				Toggle["3e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
			end
			
			--Methods
			function Toggle:Toggle(b)
				if b == nil then
					Toggle.State = not Toggle.State
				else
					Toggle.State = b
				end
				
				if Toggle.State then
					Library:tween(Toggle["3a"], {BackgroundColor3 = Color3.fromRGB(0, 105, 175)})
					Library:tween(Toggle["3d"], {ImageTransparency = 0})
				else
					Library:tween(Toggle["3a"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
					Library:tween(Toggle["3d"], {ImageTransparency = 1})
				end
				
				options.callback(Toggle.State)
			end
			
			--Logic
			do
				
				Toggle["36"].MouseEnter:Connect(function()
					Toggle.Hover = true
					Library:tween(Toggle["3c"], {Color = Color3.fromRGB(60, 60, 60)})
					Library:tween(Toggle["3e"], {Color = Color3.fromRGB(60, 60, 60)})
				end)

				Toggle["36"].MouseLeave:Connect(function()
					Toggle.Hover = false
					if not Toggle.MouseDown then
						Library:tween(Toggle["3c"], {Color = Color3.fromRGB(38, 38, 39)})
						Library:tween(Toggle["3e"], {Color = Color3.fromRGB(38, 38, 39)})
					end
				end)
				
				Toggle["36"].MouseButton1Click:Connect(function()
					Toggle.MouseDown = true
					Library:tween(Toggle["36"], {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})		
					Library:tween(Toggle["3c"], {Color = Color3.fromRGB(200, 200, 200)})
					Library:tween(Toggle["3e"], {Color = Color3.fromRGB(200, 200, 200)})
					Toggle:Toggle()
					Toggle.MouseDown = false

					if Toggle.Hover then
						Library:tween(Toggle["36"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})
						Library:tween(Toggle["3c"], {Color = Color3.fromRGB(60, 60, 60)})
						Library:tween(Toggle["3e"], {Color = Color3.fromRGB(60, 60, 60)})
					else	
						Library:tween(Toggle["36"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})		
						Library:tween(Toggle["3c"], {Color = Color3.fromRGB(33, 33, 33)})
						Library:tween(Toggle["3e"], {Color = Color3.fromRGB(38, 38, 39)})
					end
				end)
			end
			
			return Toggle
		end
		
		function Tab:Dropdown(options)
			Library:Validate({
				name = "Toggle",
				callback = function(v) end,
				opencallback = function() end,
				items = {}
			}, options or {})
			
			local Dropdown = {
				Items = {
					["id"] = {
						"value"
					}
				},
				Open = false,
				MouseDown = false,
				Hover = false,
				HoveringItem = false
			}
			
			--Render
			do
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown
				Dropdown["25"] = Instance.new("TextButton", Tab["10"]);
				Dropdown["25"]["BorderSizePixel"] = 0;
				Dropdown["25"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
				Dropdown["25"]["Size"] = UDim2.new(1, -5, 0, 30);
				Dropdown["25"]["ClipsDescendants"] = true;
				Dropdown["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["25"]["Position"] = UDim2.new(0, 0, 0.46759259700775146, 0);
				Dropdown["25"]["Name"] = [[Dropdown]];
				Dropdown["25"]["TextTransparency"] = 1;
				Dropdown["25"]["AutoButtonColor"] = false;
				
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.UICorner
				Dropdown["26"] = Instance.new("UICorner", Dropdown["25"]);
				Dropdown["26"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.UIStroke
				Dropdown["27"] = Instance.new("UIStroke", Dropdown["25"]);
				Dropdown["27"]["Color"] = Color3.fromRGB(38, 38, 39);
				Dropdown["27"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.TextLabel
				Dropdown["28"] = Instance.new("TextLabel", Dropdown["25"]);
				Dropdown["28"]["BorderSizePixel"] = 0;
				Dropdown["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["28"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Dropdown["28"]["FontFace"] = CustomFont
				Dropdown["28"]["TextSize"] = 14;
				Dropdown["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["28"]["Size"] = UDim2.new(1, 0, 0, 30);
				Dropdown["28"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["28"]["Text"] = options.name;
				Dropdown["28"]["BackgroundTransparency"] = 1;

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.TextLabel.UIPadding
				Dropdown["29"] = Instance.new("UIPadding", Dropdown["28"]);
				Dropdown["29"]["PaddingLeft"] = UDim.new(0, 15);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.ImageButton
				Dropdown["2a"] = Instance.new("ImageLabel", Dropdown["25"]);
				Dropdown["2a"]["BorderSizePixel"] = 0;
				Dropdown["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["2a"]["AnchorPoint"] = Vector2.new(1, 0);
				Dropdown["2a"]["Image"] = [[rbxassetid://15114393414]];
				Dropdown["2a"]["Size"] = UDim2.new(0, 20, 0, 20);
				Dropdown["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["2a"]["Position"] = UDim2.new(1, -8, 0, 5);
				Dropdown["2a"]["BackgroundTransparency"] = 1;

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.OptionHolder
				Dropdown["2b"] = Instance.new("Frame", Dropdown["25"]);
				Dropdown["2b"]["BorderSizePixel"] = 0;
				Dropdown["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["2b"]["BackgroundTransparency"] = 1;
				Dropdown["2b"]["Size"] = UDim2.new(1, -9, 0, 100);
				Dropdown["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["2b"]["Position"] = UDim2.new(0, 4, 0, 35);
				Dropdown["2b"]["Visible"] = false;
				Dropdown["2b"]["Name"] = [[OptionHolder]];
				
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.TextLabel
				Dropdown["2p"] = Instance.new("TextLabel", Dropdown["25"]);
				Dropdown["2p"]["AnchorPoint"] = Vector2.new(1, 0);
				Dropdown["2p"]["BorderSizePixel"] = 0;
				Dropdown["2p"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["2p"]["TextXAlignment"] = Enum.TextXAlignment.Right;
				Dropdown["2p"]["TextYAlignment"] = Enum.TextYAlignment.Center;
				Dropdown["2p"]["FontFace"] = CustomFont
				Dropdown["2p"]["TextSize"] = 12;
				Dropdown["2p"]["TextColor3"] = Color3.fromRGB(136,136,136);
				Dropdown["2p"]["Size"] = UDim2.new(0, 200, 0, 50);
				Dropdown["2p"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
				Dropdown["2p"]["Text"] = ". . .";
				Dropdown["2p"]["BackgroundTransparency"] = 1;
				Dropdown["2p"]["Position"] = UDim2.new(0, 345,0, -11)
				
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.OptionHolder.ScrollingFrame
				Dropdown["2c"] = Instance.new("ScrollingFrame", Dropdown["2b"]);
				Dropdown["2c"]["Active"] = false;
				Dropdown["2c"]["BorderSizePixel"] = 0;
				Dropdown["2c"]["ScrollBarImageTransparency"] = 0;
				Dropdown["2c"]["BackgroundColor3"] = Color3.fromRGB(38,38,39);
				Dropdown["2c"]["BackgroundTransparency"] = 0;
				Dropdown["2c"]["Size"] = UDim2.new(1, 0, 0, 90);
				Dropdown["2c"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["2c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Dropdown["2c"]["ScrollBarThickness"] = 3;
				Dropdown["2c"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.OptionHolder.ScrollingFrame.UIListLayout
				Dropdown["2d"] = Instance.new("UIListLayout", Dropdown["2c"]);
				Dropdown["2d"]["VerticalAlignment"] = Enum.VerticalAlignment.Top;
				Dropdown["2d"]["Padding"] = UDim.new(0, 6);
				Dropdown["2d"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
				
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.OptionHolder.ScrollingFrame.UIStroke
				Dropdown["2j"] = Instance.new("UIStroke", Dropdown["2c"]);
				Dropdown["2j"]["Color"] = Color3.fromRGB(36,36,36);
				Dropdown["2j"]["Transparency"] = 0;
				Dropdown["2j"]["Thickness"] = 2;
				Dropdown["2j"]["LineJoinMode"] = Enum.LineJoinMode.Round;
				
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.OptionHolder.ScrollingFrame.UIPadding
				Dropdown["2g"] = Instance.new("UIPadding", Dropdown["2c"]);
				Dropdown["2g"]["PaddingLeft"] = UDim.new(0, 6)
				Dropdown["2g"]["PaddingRight"] = UDim.new(0, 3)
				Dropdown["2g"]["PaddingTop"] = UDim.new(0, 8)
				Dropdown["2g"]["PaddingBottom"] = UDim.new(0, 8)
				
				--[[
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.OptionHolder.UIListLayout
				Dropdown["2c"] = Instance.new("UIListLayout", Dropdown["2b"]);
				Dropdown["2c"]["VerticalAlignment"] = Enum.VerticalAlignment.Top;
				Dropdown["2c"]["Padding"] = UDim.new(0, 6);
				Dropdown["2c"]["SortOrder"] = Enum.SortOrder.LayoutOrder;]]--
			end
			
			--Methods
			
			do
				function Dropdown:Add(id, value)
					local Item = {
						Hover = false,
						MouseDown = false,
					}
					
					if Dropdown.Items[id] ~= nil then
						return
					end
					
					Dropdown.Items[id] = {
						instance = {},
						value = value
					}

					-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.OptionHolder.Inactive Option
					Dropdown.Items[id].instance["2v"] = Instance.new("TextButton", Dropdown["2c"]);
					Dropdown.Items[id].instance["2v"]["BorderSizePixel"] = 0;
					Dropdown.Items[id].instance["2v"]["BackgroundColor3"] = Color3.fromRGB(60, 60, 60);
					Dropdown.Items[id].instance["2v"]["FontFace"] = CustomFont
					Dropdown.Items[id].instance["2v"]["TextSize"] = 14;
					Dropdown.Items[id].instance["2v"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
					Dropdown.Items[id].instance["2v"]["Size"] = UDim2.new(1, -3, 0, 25);
					Dropdown.Items[id].instance["2v"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					Dropdown.Items[id].instance["2v"]["Text"] = id;
					Dropdown.Items[id].instance["2v"]["AutoButtonColor"] = false;
					Dropdown.Items[id].instance["2v"]["Name"] = [[Inactive Option]];
					Dropdown.Items[id].instance["2v"]["FontFace"] = CustomFont

					-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.OptionHolder.Inactive Option.UIStroke
					Dropdown.Items[id].instance["2e"] = Instance.new("UIStroke", Dropdown.Items[id].instance["2v"]);
					Dropdown.Items[id].instance["2e"]["Color"] = Color3.fromRGB(76,76,76);
					Dropdown.Items[id].instance["2e"]["LineJoinMode"] = Enum.LineJoinMode.Round;
					Dropdown.Items[id].instance["2e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

					-- StarterGui.Main.Main.ContentContainer.PlayerTab.Dropdown.OptionHolder.Inactive Option.UICorner
					Dropdown.Items[id].instance["2f"] = Instance.new("UICorner", Dropdown.Items[id].instance["2v"]);
					Dropdown.Items[id].instance["2f"]["CornerRadius"] = UDim.new(0, 5);
					
					Dropdown.Items[id].instance["2v"].MouseEnter:Connect(function()
						Item.Hover = true
						Dropdown.HoveringItem = true
						Library:tween(Dropdown.Items[id].instance["2e"], {Color = Color3.fromRGB(60, 60, 60)})
					end)

					Dropdown.Items[id].instance["2v"].MouseLeave:Connect(function()
						Item.Hover = false
						Dropdown.HoveringItem = false
						if not Item.MouseDown then
							Library:tween(Dropdown.Items[id].instance["2e"], {Color = Color3.fromRGB(76,76,76)})
						end
					end)
					
					Dropdown.Items[id].instance["2v"].MouseButton1Click:Connect(function()
						if Dropdown.Items[id] == nil then return end
						Item.MouseDown = true
						--Library:tween(Dropdown.Items[id].instance["2v"], {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})		
						--Library:tween(Dropdown.Items[id].instance["2e"], {Color = Color3.fromRGB(200, 200, 200)})
						Dropdown["2p"]["Text"] = Dropdown.Items[id].instance["2v"].Text
						options.callback(Dropdown.Items[id].instance["2v"].Text, value)
						Dropdown:Toggle()
						
						Item.MouseDown = false
					end)

					
				end

				function Dropdown:Remove(id)
					if Dropdown.Items[id] ~= nil then
						if Dropdown.Items[id].instance ~= nil then
							for i,v in pairs(Dropdown.Items[id].instance) do
								v:Destroy()
							end
						end
						Dropdown.Items[id] = nil
					end
				end

				function Dropdown:Clear()
					if Dropdown.Open == true then
						Dropdown:Toggle()
					end
					for i,v in pairs(Dropdown.Items) do
						Dropdown:Remove(i)
					end
				end

				function Dropdown:Toggle()
					if Dropdown.Open then
						Library:tween(Dropdown["2a"], {Rotation = 0})
						Library:tween(Dropdown["25"], {Size = UDim2.new(1,-5,0,30)}, function() 
							Dropdown["2b"]["Visible"] = false
						end)
					else
						options.opencallback()
						local count = 0
						for i,v in pairs(Dropdown.Items) do
							if v ~= nil then
								count += 1
							end
						end
						
						Library:tween(Dropdown["2a"], {Rotation = 180})
						Dropdown["2b"]["Visible"] = true
						Library:tween(Dropdown["25"], {Size = UDim2.new(1,-5,0, 140)})
					end
					Dropdown.Open = not Dropdown.Open
				end
			end
			
			-- Logic
			
			do
				Dropdown["25"].MouseEnter:Connect(function()
					Dropdown.Hover = true
					Library:tween(Dropdown["27"], {Color = Color3.fromRGB(60, 60, 60)})
				end)

				Dropdown["25"].MouseLeave:Connect(function()
					Dropdown.Hover = false
					if not Dropdown.MouseDown then
						Library:tween(Dropdown["27"], {Color = Color3.fromRGB(38, 38, 39)})
					end
				end)
				
				Dropdown["25"].MouseButton1Click:Connect(function()
					Dropdown.MouseDown = true
					Library:tween(Dropdown["25"], {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})		
					Library:tween(Dropdown["27"], {Color = Color3.fromRGB(200, 200, 200)})

					if not Dropdown.HoveringItem then
						Dropdown:Toggle()
					end
					
					Dropdown.MouseDown = false

					if Dropdown.Hover then
						Library:tween(Dropdown["25"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})	
						Library:tween(Dropdown["27"], {Color = Color3.fromRGB(60, 60, 60)})
					else	
						Library:tween(Dropdown["25"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})		
						Library:tween(Dropdown["27"], {Color = Color3.fromRGB(38, 38, 39)})
					end
				end)
				
				--[[uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Dropdown.Hover then
						Dropdown.MouseDown = true
						Library:tween(Dropdown["25"], {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})		
						Library:tween(Dropdown["27"], {Color = Color3.fromRGB(200, 200, 200)})
						
						if not Dropdown.HoveringItem then
							Dropdown:Toggle()
						end
					end
				end)]]--

				--[[uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Dropdown.MouseDown = false

						if Dropdown.Hover then
							Library:tween(Dropdown["25"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})	
							Library:tween(Dropdown["27"], {Color = Color3.fromRGB(60, 60, 60)})
						else	
							Library:tween(Dropdown["25"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})		
							Library:tween(Dropdown["27"], {Color = Color3.fromRGB(38, 38, 39)})
						end
					end
				end)]]--
			end
			
			return Dropdown
		end
		
		function Tab:Input(options)
			Library:Validate({
				name = "Input",
				placeholdertext = "Input",
				cleartextonfocus = true,
				callback = function(v) end
			}, options or {})
			
			local Input = {
				Hover = false
			}
			
			--Render 
			do
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Input
				Input["8c"] = Instance.new("Frame", Tab["10"]);
				Input["8c"]["BorderSizePixel"] = 0;
				Input["8c"]["BackgroundColor3"] = Color3.fromRGB(44, 44, 44);
				Input["8c"]["Size"] = UDim2.new(1, -5, 0, 32);
				Input["8c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Input["8c"]["Name"] = [[Input]];

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Input.UICorner
				Input["8d"] = Instance.new("UICorner", Input["8c"]);
				Input["8d"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Input.UIStroke
				Input["8e"] = Instance.new("UIStroke", Input["8c"]);
				Input["8e"]["Color"] = Color3.fromRGB(38, 38, 39);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Input.TextLabel
				Input["8f"] = Instance.new("TextLabel", Input["8c"]);
				Input["8f"]["BorderSizePixel"] = 0;
				Input["8f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Input["8f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Input["8f"]["FontFace"] = CustomFont
				Input["8f"]["TextSize"] = 14;
				Input["8f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Input["8f"]["Size"] = UDim2.new(1, 0, 1, 0);
				Input["8f"]["BorderColor3"] = Color3.fromRGB(255, 255, 255);
				Input["8f"]["Text"] = options.name;
				Input["8f"]["BackgroundTransparency"] = 1;

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Input.TextLabel.UIPadding
				Input["90"] = Instance.new("UIPadding", Input["8f"]);
				Input["90"]["PaddingLeft"] = UDim.new(0, 15);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Input.TextBox
				Input["91"] = Instance.new("TextBox", Input["8c"]);
				Input["91"]["CursorPosition"] = -1;
				Input["91"]["BorderSizePixel"] = 0;
				Input["91"]["TextSize"] = 12;
				Input["91"]["TextWrapped"] = true;
				Input["91"]["BackgroundColor3"] = Color3.fromRGB(39, 39, 39);
				Input["91"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Input["91"]["FontFace"] = CustomFont
				Input["91"]["AnchorPoint"] = Vector2.new(0, 0);
				Input["91"]["PlaceholderText"] = options.placeholdertext;
				Input["91"]["Size"] = UDim2.new(0, 65, 0, 19);
				Input["91"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Input["91"]["Text"] = [[]];
				Input["91"]["Position"] = UDim2.new(1, -75,0, 7);
				Input["91"]["AutomaticSize"] = Enum.AutomaticSize.X;
				Input["91"]["ClearTextOnFocus"] = options.cleartextonfocus;
				
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Input.TextBox.UICorner
				Input["92"] = Instance.new("UICorner", Input["91"]);
				Input["92"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Main.ContentContainer.PlayerTab.Input.TextBox.UIStroke
				Input["93"] = Instance.new("UIStroke", Input["91"]);
				Input["93"]["Color"] = Color3.fromRGB(33, 33, 33);
				Input["93"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
			end
			
			--Methods
			
			function Input:TurnOnListener()
				Input["91"].FocusLost:Connect(function()
					options.callback(Input["91"].Text)
				end)
			end
			
			--Logic
			
			do
				Input["8c"].MouseEnter:Connect(function()
					Input.Hover = true
					Library:tween(Input["8e"], {Color = Color3.fromRGB(60, 60, 60)})
					Library:tween(Input["93"], {Color = Color3.fromRGB(60, 60, 60)})
				end)

				Input["8c"].MouseLeave:Connect(function()
					Input.Hover = false
					if not Input.MouseDown then
						Library:tween(Input["8e"], {Color = Color3.fromRGB(38, 38, 39)})
						Library:tween(Input["93"], {Color = Color3.fromRGB(33, 33, 33)})
					end
				end)

				uis.InputBegan:Connect(function(input, gpe)
					if gpe then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Input.Hover then
						Input.MouseDown = true
						Library:tween(Input["8c"], {BackgroundColor3 = Color3.fromRGB(60, 60, 60)})		
						Library:tween(Input["8e"], {Color = Color3.fromRGB(200, 200, 200)})
						Library:tween(Input["93"], {Color = Color3.fromRGB(200, 200, 200)})
					end
				end)

				uis.InputEnded:Connect(function(input, gpe)
					if gpe then return end

					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Input.MouseDown = false

						if Input.Hover then
							Library:tween(Input["8c"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})	
							Library:tween(Input["8e"], {Color = Color3.fromRGB(60, 60, 60)})
							Library:tween(Input["93"], {Color = Color3.fromRGB(60, 60, 60)})
						else	
							Library:tween(Input["8c"], {BackgroundColor3 = Color3.fromRGB(44, 44, 44)})		
							Library:tween(Input["8e"], {Color = Color3.fromRGB(38, 38, 39)})
							Library:tween(Input["93"], {Color = Color3.fromRGB(33, 33, 33)})
						end
					end
				end)
			end
			
			Input:TurnOnListener()
			
			
		end
		
		function Tab:Section(options)
			
			Library:Validate({
				text = "Section Name",
			}, options or {})
			
			local Section = {}
			
			--Render
			do
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.TextLabel
				Section["94"] = Instance.new("TextLabel", Tab["10"]);
				Section["94"]["BorderSizePixel"] = 0;
				Section["94"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Section["94"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Section["94"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Section["94"]["TextSize"] = 16;
				Section["94"]["TextColor3"] = Color3.fromRGB(201, 201, 201);
				Section["94"]["Size"] = UDim2.new(0, 200, 0, 25);
				Section["94"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Section["94"]["Text"] = options.text;
				Section["94"]["BackgroundTransparency"] = 1;
				
				-- StarterGui.Main.Main.ContentContainer.PlayerTab.TextLabel.UIPadding
				Section["95"] = Instance.new("UIPadding", Section["94"]);
				Section["95"]["PaddingLeft"] = UDim.new(0, 4);
			end
		end
		
		function Tab:Key()
			
			local Key = {}
			
			--Render
			do
				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey
				Key["100"] = Instance.new("ScrollingFrame", GUI["f"]);
				Key["100"]["Active"] = false;
				Key["100"]["BorderSizePixel"] = 0;
				Key["100"]["CanvasSize"] = UDim2.new(0, 0, 2, 250);
				Key["100"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["100"]["BackgroundTransparency"] = 1;
				Key["100"]["Size"] = UDim2.new(1, 0, 1, 0);
				Key["100"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["100"]["ScrollBarThickness"] = 1;
				Key["100"]["Visible"] = false;
				Key["100"]["Name"] = [[BuyKey]]; --8c - 100 8d - 101 8e - 102 8f - 103 90 - 104 91 - 105 92 - 106 93 - 107 94 - 108 95 - 109 96 - 110 97 - 111

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.TextLabel
				Key["101"] = Instance.new("TextLabel", Key["100"]);
				Key["101"]["TextWrapped"] = true;
				Key["101"]["BorderSizePixel"] = 0;
				Key["101"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["101"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
				Key["101"]["TextSize"] = 20;
				Key["101"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Key["101"]["AutomaticSize"] = Enum.AutomaticSize.X;
				Key["101"]["Size"] = UDim2.new(0, 175, 0, 25);
				Key["101"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["101"]["Text"] = [[Premium Key]];
				Key["101"]["BackgroundTransparency"] = 1;
				Key["101"]["Position"] = UDim2.new(0, 105, 0, 10);

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.TextLabel.UIGradient
				Key["102"] = Instance.new("UIGradient", Key["101"]);
				Key["102"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(160, 175, 231)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(119, 234, 215))};

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month
				Key["103"] = Instance.new("TextButton", Key["100"]);
				Key["103"]["BorderSizePixel"] = 0;
				Key["103"]["BackgroundColor3"] = Color3.fromRGB(100, 146, 141);
				Key["103"]["Size"] = UDim2.new(0, 100, 0, 60);
				Key["103"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["103"]["Position"] = UDim2.new(0, 145, 0, 240);
				Key["103"]["Name"] = [[1month]];
				Key["103"]["TextTransparency"] = 1;
				
				Key["103"].MouseButton1Click:Connect(function()
					print("sex")
				end)
				
				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.TextLabel
				Key["104"] = Instance.new("TextLabel", Key["103"]);
				Key["104"]["TextWrapped"] = true;
				Key["104"]["BorderSizePixel"] = 0;
				Key["104"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["104"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Key["104"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
				Key["104"]["TextSize"] = 18;
				Key["104"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Key["104"]["AutomaticSize"] = Enum.AutomaticSize.X;
				Key["104"]["Size"] = UDim2.new(0, 100, 0, 25);
				Key["104"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["104"]["Text"] = [[23% OFF]];
				Key["104"]["BackgroundTransparency"] = 1;
				Key["104"]["Position"] = UDim2.new(0, 0, 0, -30);

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.TextLabel
				Key["105"] = Instance.new("TextLabel", Key["103"]);
				Key["105"]["TextWrapped"] = true;
				Key["105"]["BorderSizePixel"] = 0;
				Key["105"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["105"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
				Key["105"]["TextSize"] = 18;
				Key["105"]["TextColor3"] = Color3.fromRGB(122, 193, 255);
				Key["105"]["AutomaticSize"] = Enum.AutomaticSize.X;
				Key["105"]["Size"] = UDim2.new(0, 100, 0, 25);
				Key["105"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["105"]["Text"] = [[3 MONTHS]];
				Key["105"]["BackgroundTransparency"] = 1;
				Key["105"]["Position"] = UDim2.new(0, 0, 0, 5);
				Key["105"]["Active"] = false;
				
				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.TextLabel
				Key["106"] = Instance.new("TextLabel", Key["103"]);
				Key["106"]["TextWrapped"] = true;
				Key["106"]["BorderSizePixel"] = 0;
				Key["106"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["106"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Italic);
				Key["106"]["TextSize"] = 18;
				Key["106"]["TextColor3"] = Color3.fromRGB(122, 193, 255);
				Key["106"]["AutomaticSize"] = Enum.AutomaticSize.X;
				Key["106"]["Size"] = UDim2.new(0, 100, 0, 25);
				Key["106"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["106"]["Text"] = [[6.99 $]];
				Key["106"]["BackgroundTransparency"] = 1;
				Key["106"]["Position"] = UDim2.new(0, 0, 0, 30);
				Key["106"]["Active"] = false;
				
				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.UIStroke
				Key["107"] = Instance.new("UIStroke", Key["103"]);
				Key["107"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.UIGradient
				Key["108"] = Instance.new("UIGradient", Key["103"]);
				Key["108"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(40, 204, 241)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(31, 124, 217))};

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.UICorner
				Key["109"] = Instance.new("UICorner", Key["103"]);
				Key["109"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month
				Key["110"] = Instance.new("TextButton", Key["100"]);
				Key["110"]["BorderSizePixel"] = 0;
				Key["110"]["BackgroundColor3"] = Color3.fromRGB(100, 146, 141);
				Key["110"]["Size"] = UDim2.new(0, 100, 0, 60);
				Key["110"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["110"]["Position"] = UDim2.new(0, 265, 0, 240);
				Key["110"]["Name"] = [[1month]];
				Key["110"]["TextTransparency"] = 1;
				
				Key["110"].MouseButton1Click:Connect(function()
					print("sex")
				end)

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.TextLabel
				Key["97"] = Instance.new("TextButton", Key["110"]);
				Key["97"]["TextWrapped"] = true;
				Key["97"]["BorderSizePixel"] = 0;
				Key["97"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["97"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
				Key["97"]["TextSize"] = 18;
				Key["97"]["TextColor3"] = Color3.fromRGB(122, 193, 255);
				Key["97"]["AutomaticSize"] = Enum.AutomaticSize.X;
				Key["97"]["Size"] = UDim2.new(0, 100, 0, 25);
				Key["97"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["97"]["Text"] = [[6 MONTHS]];
				Key["97"]["BackgroundTransparency"] = 1;
				Key["97"]["Position"] = UDim2.new(0, 0, 0, 5);
				Key["97"]["Active"] = false;
				
				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.TextLabel
				Key["98"] = Instance.new("TextLabel", Key["110"]);
				Key["98"]["TextWrapped"] = true;
				Key["98"]["BorderSizePixel"] = 0;
				Key["98"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["98"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Italic);
				Key["98"]["TextSize"] = 18;
				Key["98"]["TextColor3"] = Color3.fromRGB(122, 193, 255);
				Key["98"]["AutomaticSize"] = Enum.AutomaticSize.X;
				Key["98"]["Size"] = UDim2.new(0, 100, 0, 25);
				Key["98"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["98"]["Text"] = [[12.99 $]];
				Key["98"]["BackgroundTransparency"] = 1;
				Key["98"]["Position"] = UDim2.new(0, 0, 0, 30);
				Key["98"]["Active"] = false;
				
				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.UIStroke
				Key["99"] = Instance.new("UIStroke", Key["110"]);
				Key["99"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.UIGradient
				Key["9a"] = Instance.new("UIGradient", Key["110"]);
				Key["9a"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(40, 204, 241)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(31, 124, 217))};

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.UICorner
				Key["9b"] = Instance.new("UICorner", Key["110"]);
				Key["9b"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.TextLabel
				Key["9c"] = Instance.new("TextLabel", Key["110"]);
				Key["9c"]["TextWrapped"] = true;
				Key["9c"]["BorderSizePixel"] = 0;
				Key["9c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["9c"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Key["9c"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
				Key["9c"]["TextSize"] = 18;
				Key["9c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Key["9c"]["AutomaticSize"] = Enum.AutomaticSize.X;
				Key["9c"]["Size"] = UDim2.new(0, 100, 0, 25);
				Key["9c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["9c"]["Text"] = [[34% OFF]];
				Key["9c"]["BackgroundTransparency"] = 1;
				Key["9c"]["Position"] = UDim2.new(0, 0, 0, -30);
				Key["9c"]["Active"] = false;

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month
				Key["9d"] = Instance.new("TextButton", Key["100"]);
				Key["9d"]["BorderSizePixel"] = 0;
				Key["9d"]["BackgroundColor3"] = Color3.fromRGB(100, 146, 141);
				Key["9d"]["Size"] = UDim2.new(0, 100, 0, 60);
				Key["9d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["9d"]["Position"] = UDim2.new(0, 25, 0, 240);
				Key["9d"]["Name"] = [[1month]];
				Key["9d"]["TextTransparency"] = 1;
				
				Key["9d"].MouseButton1Click:Connect(function()
					print("sex")
				end)

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.TextLabel
				Key["9e"] = Instance.new("TextLabel", Key["9d"]);
				Key["9e"]["TextWrapped"] = true;
				Key["9e"]["BorderSizePixel"] = 0;
				Key["9e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["9e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Heavy, Enum.FontStyle.Italic);
				Key["9e"]["TextSize"] = 18;
				Key["9e"]["TextColor3"] = Color3.fromRGB(122, 193, 255);
				Key["9e"]["AutomaticSize"] = Enum.AutomaticSize.X;
				Key["9e"]["Size"] = UDim2.new(0, 100, 0, 25);
				Key["9e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["9e"]["Text"] = [[2.99 $]];
				Key["9e"]["BackgroundTransparency"] = 1;
				Key["9e"]["Position"] = UDim2.new(0, 0, 0, 30);
				Key["9e"]["Active"] = false;
				
				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.TextLabel
				Key["9f"] = Instance.new("TextLabel", Key["9d"]);
				Key["9f"]["TextWrapped"] = true;
				Key["9f"]["BorderSizePixel"] = 0;
				Key["9f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["9f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Regular, Enum.FontStyle.Italic);
				Key["9f"]["TextStrokeColor3"] = Color3.fromRGB(255, 255, 255);
				Key["9f"]["TextSize"] = 18;
				Key["9f"]["TextColor3"] = Color3.fromRGB(122, 193, 255);
				Key["9f"]["AutomaticSize"] = Enum.AutomaticSize.X;
				Key["9f"]["Size"] = UDim2.new(0, 100, 0, 25);
				Key["9f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["9f"]["Text"] = [[1 MONTH]];
				Key["9f"]["BackgroundTransparency"] = 1;
				Key["9f"]["Position"] = UDim2.new(0, 0, 0, 5);
				Key["9f"]["Active"] = false;
				
				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.UIStroke
				Key["a0"] = Instance.new("UIStroke", Key["9d"]);
				Key["a0"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.UIGradient
				Key["a1"] = Instance.new("UIGradient", Key["9d"]);
				Key["a1"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(40, 204, 241)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(31, 124, 217))};

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.1month.UICorner
				Key["a2"] = Instance.new("UICorner", Key["9d"]);
				Key["a2"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.TextLabel
				Key["a3"] = Instance.new("TextLabel", Key["100"]);
				Key["a3"]["TextWrapped"] = true;
				Key["a3"]["LineHeight"] = 1.159999966621399;
				Key["a3"]["BorderSizePixel"] = 0;
				Key["a3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["a3"]["FontFace"] = CustomFont
				if game:GetService("UserInputService").KeyboardEnabled == false and game:GetService("UserInputService").TouchEnabled == true then
					Key["a3"]["TextSize"] = 12;
				else
					Key["a3"]["TextSize"] = 14;
				end
				Key["a3"]["TextSize"] = 14;
				Key["a3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Key["a3"]["Size"] = UDim2.new(0, 350, 0, 50);
				Key["a3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["a3"]["Text"] = [[Get your own unique premium key, special role in the offical Discord server of Parmesan Hub and use our scripts without watching ads throughout the entire subscription period.]];
				Key["a3"]["BackgroundTransparency"] = 1;
				Key["a3"]["Position"] = UDim2.new(0, 25, 0, 45);

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.TextLabel
				Key["a4"] = Instance.new("TextLabel", Key["100"]);
				Key["a4"]["TextWrapped"] = true;
				Key["a4"]["BorderSizePixel"] = 0;
				Key["a4"]["BackgroundColor3"] = Color3.fromRGB(47, 47, 47);
				Key["a4"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
				Key["a4"]["TextSize"] = 16;
				Key["a4"]["TextColor3"] = Color3.fromRGB(201, 201, 201);
				Key["a4"]["AutomaticSize"] = Enum.AutomaticSize.X;
				Key["a4"]["Size"] = UDim2.new(0, 175, 0, 25);
				Key["a4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["a4"]["Text"] = [[Io2A4i6t-GHjzvF]];
				Key["a4"]["Position"] = UDim2.new(0, 105, 0, 120);
				
				do
					-- Your Variables
					local HowManyCharacters = 15

					local Alphabet = true
					local Numbers = true
					local SpecialCharacters = false
					local Space = false

					-- Random String Generator
					local alphabet = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz'
					local numbers = '1234567890'
					local specialcharacters = ''
					local space = ' '
					local output = ''



					local function ReturnUsable()
						local returntable = {}
						if Alphabet==true then
							table.insert(returntable,1,alphabet)
						end
						if Numbers==true then
							table.insert(returntable,1,numbers)
						end
						if SpecialCharacters==true then
							table.insert(returntable,1,specialcharacters)
						end
						if Space==true then
							table.insert(returntable,1,space)
						end
						return returntable
					end
					
					local temp3
					temp3 = game:GetService("RunService").Stepped:connect(function()
						if Key["100"]["Visible"] == true then
							for i=1,HowManyCharacters do
								local tables = ReturnUsable()
								local CurrentType = tables[math.random(1,#tables)]
								local a = math.random(1,string.len(CurrentType))
								output = output .. string.sub(CurrentType,a,a)
							end
							Key["a4"]["Text"] = output
							output = ""
						end
					end)
				end
				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.TextLabel.UICorner
				Key["a5"] = Instance.new("UICorner", Key["a4"]);
				Key["a5"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.TextLabel.UIStroke
				Key["a6"] = Instance.new("UIStroke", Key["a4"]);
				Key["a6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.UIPadding
				Key["a7"] = Instance.new("UIPadding", Key["100"]);


				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.TextLabel
				Key["a8"] = Instance.new("TextLabel", Key["100"]);
				Key["a8"]["TextWrapped"] = true;
				Key["a8"]["BorderSizePixel"] = 0;
				Key["a8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["a8"]["FontFace"] = CustomFont
				Key["a8"]["TextSize"] = 14;
				Key["a8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Key["a8"]["Size"] = UDim2.new(0, 380, 0, 40);
				Key["a8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["a8"]["Text"] = [[Click on one of the selected subscriptions to copy the payment link if you want to pay via Binance pay, USDT TRC20 or Litecoin.]];
				Key["a8"]["BackgroundTransparency"] = 1;
				Key["a8"]["Position"] = UDim2.new(0, 10, 0, 160);

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.TextLabel
				Key["a9"] = Instance.new("TextLabel", Key["100"]);
				Key["a9"]["TextWrapped"] = true;
				Key["a9"]["BorderSizePixel"] = 0;
				Key["a9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["a9"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
				Key["a9"]["TextSize"] = 20;
				Key["a9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Key["a9"]["AutomaticSize"] = Enum.AutomaticSize.X;
				Key["a9"]["Size"] = UDim2.new(0, 175, 0, 25);
				Key["a9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["a9"]["Text"] = [[OR]];
				Key["a9"]["BackgroundTransparency"] = 1;
				Key["a9"]["Position"] = UDim2.new(0, 105, 0, 315);

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.TextLabel
				Key["aa"] = Instance.new("TextLabel", Key["100"]);
				Key["aa"]["TextWrapped"] = true;
				Key["aa"]["BorderSizePixel"] = 0;
				Key["aa"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Key["aa"]["FontFace"] = CustomFont
				Key["aa"]["TextSize"] = 14;
				Key["aa"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Key["aa"]["Size"] = UDim2.new(0, 350, 0, 30);
				Key["aa"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["aa"]["Text"] = [[Send the amount of money equal to the selected subscription to the Paypal account:]];
				Key["aa"]["BackgroundTransparency"] = 1;
				Key["aa"]["Position"] = UDim2.new(0, 20, 0, 350);

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.TextBox
				Key["ab"] = Instance.new("TextBox", Key["100"]);
				Key["ab"]["CursorPosition"] = -1;
				Key["ab"]["BorderSizePixel"] = 0;
				Key["ab"]["TextEditable"] = false;
				Key["ab"]["TextSize"] = 14;
				Key["ab"]["BackgroundColor3"] = Color3.fromRGB(47, 47, 47);
				Key["ab"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Key["ab"]["FontFace"] = CustomFont
				Key["ab"]["Size"] = UDim2.new(0, 200, 0, 30);
				Key["ab"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Key["ab"]["Text"] = [[parmesanhub@gmail.com]];
				Key["ab"]["Position"] = UDim2.new(0, 95, 0, 390);
				Key["ab"]["ClearTextOnFocus"] = false;

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.TextBox.UICorner
				Key["ac"] = Instance.new("UICorner", Key["ab"]);
				Key["ac"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Frame.Main.ContentContainer.BuyKey.TextBox.UIStroke
				Key["ad"] = Instance.new("UIStroke", Key["ab"]);
				Key["ad"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
			end
			
			--Logic
			do
				GUI["65"].MouseButton1Click:Connect(function()
					GUI["f"]:WaitForChild("Profile").Visible = false;
					GUI["f"]:WaitForChild("Credits").Visible = false;	
					GUI.CurrentTab:Deactivate()
					Key["100"]["Visible"] = true
				end)
			end
		end
		
		if not GUI["f"]:FindFirstChild("BuyKey") then
			Tab:Key()
		end
		
		function Tab:Profile()
			
			local Profile = {}
			
			--Render
			do
				-- StarterGui.Main.Frame.Main.ContentContainer.Profile
				Profile["ae"] = Instance.new("ScrollingFrame", GUI["f"]);
				Profile["ae"]["Active"] = false;
				Profile["ae"]["BorderSizePixel"] = 0;
				Profile["ae"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Profile["ae"]["BackgroundTransparency"] = 1;
				Profile["ae"]["Size"] = UDim2.new(1, 0, 1, 0);
				Profile["ae"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Profile["ae"]["ScrollBarThickness"] = 1;
				Profile["ae"]["Visible"] = false;
				Profile["ae"]["Name"] = [[Profile]];

				-- StarterGui.Main.Frame.Main.ContentContainer.Profile.ImageLabel
				Profile["af"] = Instance.new("ImageLabel", Profile["ae"]);
				Profile["af"]["BorderSizePixel"] = 0;
				Profile["af"]["BackgroundColor3"] = Color3.fromRGB(48, 48, 48);
				Profile["af"]["Image"] = game.Players:GetUserThumbnailAsync(game.Players.LocalPlayer.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size420x420);
				Profile["af"]["Size"] = UDim2.new(0, 75, 0, 75);
				Profile["af"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Profile["af"]["Position"] = UDim2.new(0, 15, 0, 10);

				-- StarterGui.Main.Frame.Main.ContentContainer.Profile.ImageLabel.UICorner
				Profile["b0"] = Instance.new("UICorner", Profile["af"]);


				-- StarterGui.Main.Frame.Main.ContentContainer.Profile.ImageLabel.UIStroke
				Profile["b1"] = Instance.new("UIStroke", Profile["af"]);
				Profile["b1"]["Color"] = Color3.fromRGB(85, 85, 85);
				Profile["b1"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Main.Frame.Main.ContentContainer.Profile.TextLabel
				Profile["b2"] = Instance.new("TextLabel", Profile["ae"]);
				Profile["b2"]["BorderSizePixel"] = 0;
				Profile["b2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Profile["b2"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Profile["b2"]["FontFace"] = CustomFont
				Profile["b2"]["TextSize"] = 14;
				Profile["b2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Profile["b2"]["Size"] = UDim2.new(0, 150, 0, 25);
				Profile["b2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Profile["b2"]["Text"] = "Player ID: "..game.Players.LocalPlayer.UserId;
				Profile["b2"]["BackgroundTransparency"] = 1;
				Profile["b2"]["Position"] = UDim2.new(0, 105, 0, 35);

				-- StarterGui.Main.Frame.Main.ContentContainer.Profile.TextLabel
				Profile["b3"] = Instance.new("TextLabel", Profile["ae"]);
				Profile["b3"]["BorderSizePixel"] = 0;
				Profile["b3"]["BackgroundColor3"] = Color3.fromRGB(46, 46, 46);
				Profile["b3"]["FontFace"] = CustomFont
				Profile["b3"]["TextSize"] = 13;
				Profile["b3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Profile["b3"]["Size"] = UDim2.new(0, 180, 0, 25);
				Profile["b3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Profile["b3"]["Text"] = [[BT_OyBqLwt69553kH8zQ]];
				Profile["b3"]["Position"] = UDim2.new(0, 50, 0, 129);

				-- StarterGui.Main.Frame.Main.ContentContainer.Profile.TextLabel.UICorner
				Profile["b4"] = Instance.new("UICorner", Profile["b3"]);
				Profile["b4"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Frame.Main.ContentContainer.Profile.TextLabel.UIStroke
				Profile["b5"] = Instance.new("UIStroke", Profile["b3"]);
				Profile["b5"]["Enabled"] = false;
				Profile["b5"]["Color"] = Color3.fromRGB(93, 93, 93);
				Profile["b5"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

				-- StarterGui.Main.Frame.Main.ContentContainer.Profile.TextLabel
				Profile["b6"] = Instance.new("TextLabel", Profile["ae"]);
				Profile["b6"]["BorderSizePixel"] = 0;
				Profile["b6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Profile["b6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Profile["b6"]["FontFace"] = CustomFont
				Profile["b6"]["TextSize"] = 16;
				Profile["b6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Profile["b6"]["Size"] = UDim2.new(0, 150, 0, 25);
				Profile["b6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Profile["b6"]["Text"] = game.Players.LocalPlayer.Name;
				Profile["b6"]["BackgroundTransparency"] = 1;
				Profile["b6"]["Position"] = UDim2.new(0, 105, 0, 10);

				-- StarterGui.Main.Frame.Main.ContentContainer.Profile.TextLabel.UIGradient
				Profile["b7"] = Instance.new("UIGradient", Profile["b6"]);
				Profile["b7"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 150, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 0, 0))};

				-- StarterGui.Main.Frame.Main.ContentContainer.Profile.TextLabel
				Profile["b8"] = Instance.new("TextLabel", Profile["ae"]);
				Profile["b8"]["BorderSizePixel"] = 0;
				Profile["b8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Profile["b8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Profile["b8"]["FontFace"] = CustomFont
				Profile["b8"]["TextSize"] = 14;
				Profile["b8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Profile["b8"]["Size"] = UDim2.new(0, 150, 0, 25);
				Profile["b8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Profile["b8"]["Text"] = "Key Type: ";
				Profile["b8"]["BackgroundTransparency"] = 1;
				Profile["b8"]["Position"] = UDim2.new(0, 105, 0, 55);

				-- StarterGui.Main.Frame.Main.ContentContainer.Profile.TextLabel
				Profile["b9"] = Instance.new("TextLabel", Profile["ae"]);
				Profile["b9"]["BorderSizePixel"] = 0;
				Profile["b9"]["BackgroundColor3"] = Color3.fromRGB(46, 46, 46);
				Profile["b9"]["FontFace"] = CustomFont
				Profile["b9"]["TextSize"] = 14;
				Profile["b9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Profile["b9"]["Size"] = UDim2.new(0, 50, 0, 30);
				Profile["b9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Profile["b9"]["Text"] = "Key: ";
				Profile["b9"]["BackgroundTransparency"] = 1;
				Profile["b9"]["Position"] = UDim2.new(0, 5, 0, 125);
			end
			
			--Logic
			do
				GUI["4b"].MouseButton1Click:Connect(function()
					GUI["f"]:WaitForChild("BuyKey").Visible = false;	
					GUI["f"]:WaitForChild("Credits").Visible = false;	
					
					GUI.CurrentTab:Deactivate()
					Profile["ae"]["Visible"] = true
				end)
			end
		end
		
		if not GUI["f"]:FindFirstChild("Profile") then
			Tab:Profile()
		end
		
		function Tab:Credits()
			
			local Credits = {}
			
			--Render
			do
				-- StarterGui.Main.Frame.Main.ContentContainer.Credits
				Credits["ba"] = Instance.new("ScrollingFrame", GUI["f"]);
				Credits["ba"]["Active"] = true;
				Credits["ba"]["BorderSizePixel"] = 0;
				Credits["ba"]["CanvasSize"] = UDim2.new(0, 0, 2, 150);
				Credits["ba"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Credits["ba"]["BackgroundTransparency"] = 1;
				Credits["ba"]["Size"] = UDim2.new(1, 0, 1, 0);
				Credits["ba"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Credits["ba"]["ScrollBarThickness"] = 1;
				Credits["ba"]["Visible"] = false;
				Credits["ba"]["Name"] = [[Credits]];

				-- StarterGui.Main.Frame.Main.ContentContainer.Credits.Frame
				Credits["bb"] = Instance.new("Frame", Credits["ba"]);
				Credits["bb"]["ZIndex"] = 0;
				Credits["bb"]["BorderSizePixel"] = 0;
				Credits["bb"]["BackgroundColor3"] = Color3.fromRGB(47, 47, 47);
				Credits["bb"]["Size"] = UDim2.new(0, 175, 0, 95);
				Credits["bb"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Credits["bb"]["Position"] = UDim2.new(0, 10, 0, 25);

				-- StarterGui.Main.Frame.Main.ContentContainer.Credits.Frame.UICorner
				Credits["bc"] = Instance.new("UICorner", Credits["bb"]);
				Credits["bc"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.Main.Frame.Main.ContentContainer.Credits.Frame.UIStroke
				Credits["bd"] = Instance.new("UIStroke", Credits["bb"]);


				-- StarterGui.Main.Frame.Main.ContentContainer.Credits.Frame.TextLabel
				Credits["be"] = Instance.new("TextLabel", Credits["bb"]);
				Credits["be"]["BorderSizePixel"] = 0;
				Credits["be"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Credits["be"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Credits["be"]["FontFace"] = CustomFont
				Credits["be"]["TextSize"] = 14;
				Credits["be"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Credits["be"]["Size"] = UDim2.new(0, 100, 0, 25);
				Credits["be"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Credits["be"]["Text"] = [[Script Hub by rawparmesan]];
				Credits["be"]["BackgroundTransparency"] = 1;
				Credits["be"]["Position"] = UDim2.new(0, 10, 0, 3);

				-- StarterGui.Main.Frame.Main.ContentContainer.Credits.Frame.TextLabel
				Credits["bf"] = Instance.new("TextLabel", Credits["bb"]);
				Credits["bf"]["BorderSizePixel"] = 0;
				Credits["bf"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Credits["bf"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Credits["bf"]["FontFace"] = CustomFont
				Credits["bf"]["TextSize"] = 14;
				Credits["bf"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Credits["bf"]["Size"] = UDim2.new(0, 100, 0, 25);
				Credits["bf"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Credits["bf"]["Text"] = [[Script by rawparmesan]];
				Credits["bf"]["BackgroundTransparency"] = 1;
				Credits["bf"]["Position"] = UDim2.new(0, 10, 0, 33);

				-- StarterGui.Main.Frame.Main.ContentContainer.Credits.Frame.TextLabel
				Credits["c0"] = Instance.new("TextLabel", Credits["bb"]);
				Credits["c0"]["BorderSizePixel"] = 0;
				Credits["c0"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Credits["c0"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Credits["c0"]["FontFace"] = CustomFont
				Credits["c0"]["TextSize"] = 14;
				Credits["c0"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Credits["c0"]["Size"] = UDim2.new(0, 100, 0, 25);
				Credits["c0"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Credits["c0"]["Text"] = [[UI library by rawparmesan]];
				Credits["c0"]["BackgroundTransparency"] = 1;
				Credits["c0"]["Position"] = UDim2.new(0, 10, 0, 63);

				-- StarterGui.Main.Frame.Main.ContentContainer.Credits.Frame.TextLabel
				Credits["c1"] = Instance.new("TextLabel", Credits["bb"]);
				Credits["c1"]["BorderSizePixel"] = 0;
				Credits["c1"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Credits["c1"]["FontFace"] = CustomFont
				Credits["c1"]["TextSize"] = 14;
				Credits["c1"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Credits["c1"]["Size"] = UDim2.new(0, 100, 0, 25);
				Credits["c1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Credits["c1"]["Text"] = [[Credits]];
				Credits["c1"]["BackgroundTransparency"] = 1;
				Credits["c1"]["Position"] = UDim2.new(0, 35, 0, -27);

				-- StarterGui.Main.Frame.Main.ContentContainer.Credits.TextLabel
				Credits["c2"] = Instance.new("TextLabel", Credits["ba"]);
				Credits["c2"]["TextWrapped"] = true;
				Credits["c2"]["LineHeight"] = 1.350000023841858;
				Credits["c2"]["BorderSizePixel"] = 0;
				Credits["c2"]["TextYAlignment"] = Enum.TextYAlignment.Top;
				Credits["c2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Credits["c2"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Credits["c2"]["FontFace"] = CustomFont
				Credits["c2"]["TextSize"] = 12;
				Credits["c2"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Credits["c2"]["Size"] = UDim2.new(0, 190, 0, 110);
				Credits["c2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Credits["c2"]["Text"] = [[If you find a bug or want to change something in the script, tell about it rawparmesan (Discord) or in the official Discord server of the Parmesan Hub, and get the opportunity to get a premium key for a few days.]];
				Credits["c2"]["BackgroundTransparency"] = 1;
				Credits["c2"]["Position"] = UDim2.new(0, 200, 0, 25);

				-- StarterGui.Main.Frame.Main.ContentContainer.Credits.TextLabel
				Credits["c3"] = Instance.new("TextLabel", Credits["ba"]);
				Credits["c3"]["BorderSizePixel"] = 0;
				Credits["c3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Credits["c3"]["FontFace"] = CustomFont
				Credits["c3"]["TextSize"] = 18;
				Credits["c3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Credits["c3"]["Size"] = UDim2.new(0, 200, 0, 50);
				Credits["c3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Credits["c3"]["Text"] = [[Thanks for using Parmesan Hub!]];
				Credits["c3"]["BackgroundTransparency"] = 1;
				Credits["c3"]["Position"] = UDim2.new(0, 95, 0, 140);
			end
			
			--Logic
			do
				GUI["4c"].MouseButton1Click:Connect(function()
					GUI["f"]:WaitForChild("BuyKey").Visible = false;	
					GUI["f"]:WaitForChild("Profile").Visible = false;	
					GUI.CurrentTab:Deactivate()
					Credits["ba"]["Visible"] = true
				end)
			end
		end
		
		if not GUI["f"]:FindFirstChild("Credits") then
			Tab:Credits()
		end
		
		return Tab
	end
	
	
	return GUI
end
	
task.wait(0.1)

local main = Library:Init({
	name = "Brookhaven RP"
})

local tab = main:CreateTab({
	name = "Player",
	icon = "rbxassetid://15101013637"
})

local tab = main:CreateTab({
	name = "Character",
	icon = "rbxassetid://15101014644"
})

tab:Section({
	text = "Get Gamepasses"
})

local button = tab:Button({
	name = "Unlock All Premium Faces and Accessories",
	callback = (function()
		
	end)
})

local tab2 = main:CreateTab({
	name = "House",
	icon = "rbxassetid://15101018631"
})

main:CreateTab({
	name = "Vehicles",
	icon = "rbxassetid://15101017615"
})

main:CreateTab({
	name = "Teleport",
	icon = "rbxassetid://15105266838"
})

main:CreateTab({
	name = "Tools",
	icon = "rbxassetid://15101015572"
})

main:CreateTab({
	name = "Misc",
	icon = "rbxassetid://15101016621"
})

local button = tab2:Button({
	name = "Bad Button",
	callback = (function()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
	end)
})

local Warning2 = tab:Slider({
	name = "Player Walk Speed",
	minimum = 1,
	maximum = 1000,
	default = 100,
	valuename = "walkspeed",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(v)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v	
	end
})

local Warning2 = tab:Toggle({
	name = "Spam Sounds",
	callback = function(Value)
		print(Value)
	end
})

local Warning2 = tab:Dropdown({
	name = "Teleport to Player's House",
	callback = function(Name, Value)
		print(Name, Value)
	end,
	opencallback = function()
		print("test")
	end,
})

Warning2:Add("sexy bob1", 12)
Warning2:Add("sexy bob2", 12)
Warning2:Add("sexy bob3", 12)
Warning2:Add("sexy bob4", 12)
Warning2:Add("sexy bob5", 12)
Warning2:Add("sexy bob6", 12)
Warning2:Add("sexy bob7", 12)
Warning2:Add("sexy bob8", 12)
Warning2:Add("sexy bob9", 12)

local Warning2 = tab:Section({
	text = "Test"
})

local Warning2 = tab:Message({
	name = "Test Message Title",
	text = "Test Message"
})

local Warning2 = tab:Information({
	name = "Test Information Title",
	text = "Test Information"
})


local Warning2 = tab:Warning({
	name = "Test Warning Title",
	text = "Test Warning"
})
