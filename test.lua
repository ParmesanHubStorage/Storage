repeat task.wait() until game:IsLoaded()

--services
local TweenService = game:GetService("TweenService")

--variables
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
local viewport = workspace.CurrentCamera.ViewportSize

local Library = {}

function Library:tween(object, goal, callback)
	local tween = TweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function CreateKeySystem()
	
	local KeySystem = {}
	
	--Render
	do 
		-- StarterGui.KeySystem
		KeySystem["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
		KeySystem["1"]["Name"] = [[KeySystem]];
		KeySystem["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
		KeySystem["1"]["IgnoreGuiInset"] = true;
		
		--StarterGui.Draggable
		KeySystem["ae"] = Instance.new("Frame", KeySystem["1"]);
		KeySystem["ae"]["Size"] = UDim2.new(0, 200, 0, 25);
		KeySystem["ae"]["Position"] = UDim2.fromOffset((viewport.X / 2) - (250 / 2), (viewport.Y / 2) - (300 / 2));
		KeySystem["ae"]["Draggable"] = true;
		KeySystem["ae"]["BackgroundTransparency"] = 1;
		KeySystem["ae"]["Active"] = true;
		
		-- StarterGui.KeySystem.Frame
		KeySystem["2"] = Instance.new("Frame", KeySystem["ae"]);
		KeySystem["2"]["BorderSizePixel"] = 0;
		KeySystem["2"]["BackgroundColor3"] = Color3.fromRGB(38, 38, 38);
		KeySystem["2"]["Size"] = UDim2.new(0, 250, 0, 300);
		KeySystem["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		KeySystem["2"]["Position"] = UDim2.new(0, 0, 0, 0);

		-- StarterGui.KeySystem.Frame.UICorner
		KeySystem["3"] = Instance.new("UICorner", KeySystem["2"]);
		KeySystem["3"]["CornerRadius"] = UDim.new(0, 6);

		-- StarterGui.KeySystem.Frame.UIStroke
		KeySystem["4"] = Instance.new("UIStroke", KeySystem["2"]);
		KeySystem["4"]["Enabled"] = false;
		KeySystem["4"]["Color"] = Color3.fromRGB(55, 55, 55);
		KeySystem["4"]["Thickness"] = 2;
		KeySystem["4"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

		-- StarterGui.KeySystem.Frame.TextLabel
		KeySystem["5"] = Instance.new("TextLabel", KeySystem["2"]);
		KeySystem["5"]["TextWrapped"] = true;
		KeySystem["5"]["BorderSizePixel"] = 0;
		KeySystem["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		KeySystem["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/Roboto.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
		KeySystem["5"]["TextSize"] = 22;
		KeySystem["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		KeySystem["5"]["AutomaticSize"] = Enum.AutomaticSize.X;
		KeySystem["5"]["Size"] = UDim2.new(0, 175, 0, 25);
		KeySystem["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		KeySystem["5"]["Text"] = [[Parmesan Hub]];
		KeySystem["5"]["BackgroundTransparency"] = 1;
		KeySystem["5"]["Position"] = UDim2.new(0, 40, 0, 40);

		-- StarterGui.KeySystem.Frame.TextLabel.UIGradient
		KeySystem["6"] = Instance.new("UIGradient", KeySystem["5"]);
		KeySystem["6"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 120, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 212, 53))};

		-- StarterGui.KeySystem.Frame.TextBox
		KeySystem["7"] = Instance.new("TextBox", KeySystem["2"]);
		KeySystem["7"]["CursorPosition"] = -1;
		KeySystem["7"]["BorderSizePixel"] = 0;
		KeySystem["7"]["TextSize"] = 14;
		KeySystem["7"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		KeySystem["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		KeySystem["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		KeySystem["7"]["PlaceholderText"] = [[Key]];
		KeySystem["7"]["Size"] = UDim2.new(0, 178, 0, 25);
		KeySystem["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		KeySystem["7"]["Text"] = [[]];
		KeySystem["7"]["Position"] = UDim2.new(0, 35, 0, 240);

		-- StarterGui.KeySystem.Frame.TextBox.UICorner
		KeySystem["8"] = Instance.new("UICorner", KeySystem["7"]);
		KeySystem["8"]["CornerRadius"] = UDim.new(0, 4);

		-- StarterGui.KeySystem.Frame.TextBox.UIStroke
		KeySystem["9"] = Instance.new("UIStroke", KeySystem["7"]);
		KeySystem["9"]["Color"] = Color3.fromRGB(23, 23, 23);
		KeySystem["9"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

		-- StarterGui.KeySystem.Frame.TextLabel
		KeySystem["a"] = Instance.new("TextLabel", KeySystem["2"]);
		KeySystem["a"]["BorderSizePixel"] = 0;
		KeySystem["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		KeySystem["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		KeySystem["a"]["TextSize"] = 12;
		KeySystem["a"]["TextColor3"] = Color3.fromRGB(201, 201, 201);
		KeySystem["a"]["Size"] = UDim2.new(0, 125, 0, 25);
		KeySystem["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		KeySystem["a"]["Text"] = [[Enter the key here:]];
		KeySystem["a"]["BackgroundTransparency"] = 1;
		KeySystem["a"]["Position"] = UDim2.new(0, 60, 0, 215);

		-- StarterGui.KeySystem.Frame.GameName
		KeySystem["b"] = Instance.new("Frame", KeySystem["2"]);
		KeySystem["b"]["ZIndex"] = 4;
		KeySystem["b"]["BorderSizePixel"] = 0;
		KeySystem["b"]["BackgroundColor3"] = Color3.fromRGB(59, 62, 66);
		KeySystem["b"]["Size"] = UDim2.new(1, 0, 0, 25);
		KeySystem["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		KeySystem["b"]["Name"] = [[GameName]];

		-- StarterGui.KeySystem.Frame.GameName.UICorner
		KeySystem["c"] = Instance.new("UICorner", KeySystem["b"]);


		-- StarterGui.KeySystem.Frame.GameName.Frame
		KeySystem["d"] = Instance.new("Frame", KeySystem["b"]);
		KeySystem["d"]["BorderSizePixel"] = 0;
		KeySystem["d"]["BackgroundColor3"] = Color3.fromRGB(59, 62, 66);
		KeySystem["d"]["AnchorPoint"] = Vector2.new(0, 1);
		KeySystem["d"]["Size"] = UDim2.new(1, 0, 0, 7);
		KeySystem["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		KeySystem["d"]["Position"] = UDim2.new(0, 0, 1, 0);
		
		-- StarterGui.KeySystem.Frame.GameName.Frame.UICorner
		KeySystem["15"] = Instance.new("UICorner", KeySystem["d"]);
		KeySystem["15"]["CornerRadius"] = UDim.new(0, 0);

		-- StarterGui.KeySystem.Frame.GameName.TextLabel
		KeySystem["e"] = Instance.new("TextLabel", KeySystem["b"]);
		KeySystem["e"]["TextWrapped"] = true;
		KeySystem["e"]["BorderSizePixel"] = 0;
		KeySystem["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		KeySystem["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		KeySystem["e"]["TextSize"] = 12;
		KeySystem["e"]["TextColor3"] = Color3.fromRGB(148, 150, 157);
		KeySystem["e"]["Size"] = UDim2.new(0, 175, 1, 0);
		KeySystem["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		KeySystem["e"]["Text"] = [[Parmesan Hub - Key System]];
		KeySystem["e"]["BackgroundTransparency"] = 1;
		KeySystem["e"]["Position"] = UDim2.new(0, 25, 0, 0);

		-- StarterGui.KeySystem.Frame.GameName.ImageLabel
		KeySystem["f"] = Instance.new("ImageButton", KeySystem["b"]);
		KeySystem["f"]["BorderSizePixel"] = 0;
		KeySystem["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		KeySystem["f"]["Image"] = [[rbxassetid://15116174139]];
		KeySystem["f"]["Size"] = UDim2.new(0, 12, 0, 12);
		KeySystem["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		KeySystem["f"]["BackgroundTransparency"] = 1;
		KeySystem["f"]["Position"] = UDim2.new(1, -20, 0, 7);

		-- StarterGui.KeySystem.Frame.GameName.ImageLabel
		KeySystem["10"] = Instance.new("ImageButton", KeySystem["b"]);
		KeySystem["10"]["BorderSizePixel"] = 0;
		KeySystem["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		KeySystem["10"]["ImageTransparency"] = 0.5;
		KeySystem["10"]["Image"] = [[rbxassetid://15116175756]];
		KeySystem["10"]["Size"] = UDim2.new(0, 12, 0, 12);
		KeySystem["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		KeySystem["10"]["BackgroundTransparency"] = 1;
		KeySystem["10"]["Position"] = UDim2.new(1, -40, 0, 7);

		-- StarterGui.KeySystem.Frame.TextLabel
		KeySystem["11"] = Instance.new("TextLabel", KeySystem["2"]);
		KeySystem["11"]["TextWrapped"] = true;
		KeySystem["11"]["LineHeight"] = 1.100000023841858;
		KeySystem["11"]["BorderSizePixel"] = 0;
		KeySystem["11"]["TextScaled"] = true;
		KeySystem["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		KeySystem["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		KeySystem["11"]["TextSize"] = 12;
		KeySystem["11"]["TextColor3"] = Color3.fromRGB(201, 201, 201);
		KeySystem["11"]["Size"] = UDim2.new(0, 170, 0, 40);
		KeySystem["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		KeySystem["11"]["Text"] = [[Please open this invite link to official Discord server of Parmesan Hub to get a key:]];
		KeySystem["11"]["BackgroundTransparency"] = 1;
		KeySystem["11"]["Position"] = UDim2.new(0, 40, 0, 80);

		-- StarterGui.KeySystem.Frame.TextBox
		KeySystem["12"] = Instance.new("TextBox", KeySystem["2"]);
		KeySystem["12"]["CursorPosition"] = -1;
		KeySystem["12"]["BorderSizePixel"] = 0;
		KeySystem["12"]["TextEditable"] = false;
		KeySystem["12"]["TextSize"] = 12;
		KeySystem["12"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		KeySystem["12"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		KeySystem["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		KeySystem["12"]["Size"] = UDim2.new(0, 178, 0, 25);
		KeySystem["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		KeySystem["12"]["Text"] = [[https://discord.gg/gnkWRkEEm8]];
		KeySystem["12"]["Position"] = UDim2.new(0, 35, 0, 140);
		KeySystem["12"]["ClearTextOnFocus"] = false;

		-- StarterGui.KeySystem.Frame.TextBox.UICorner
		KeySystem["13"] = Instance.new("UICorner", KeySystem["12"]);
		KeySystem["13"]["CornerRadius"] = UDim.new(0, 4);

		-- StarterGui.KeySystem.Frame.TextLabel
		KeySystem["14"] = Instance.new("TextLabel", KeySystem["2"]);
		KeySystem["14"]["BorderSizePixel"] = 0;
		KeySystem["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		KeySystem["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/Ubuntu.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		KeySystem["14"]["TextSize"] = 9;
		KeySystem["14"]["TextColor3"] = Color3.fromRGB(201, 201, 201);
		KeySystem["14"]["Size"] = UDim2.new(0, 125, 0, 25);
		KeySystem["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		KeySystem["14"]["Text"] = [[script hub by rawparmesan]];
		KeySystem["14"]["BackgroundTransparency"] = 1;
		KeySystem["14"]["Position"] = UDim2.new(0, 63, 0, 270);
	end
	
	--Logic
	KeySystem["7"].FocusLost:Connect(function()
		print(KeySystem["7"].Text)
	end)
	
	function KeySystem:Minimize()
		local Minimize = {
			Active = false
		}

		-- Methods
		function Minimize:Toggle()
			if Minimize.Active == false then
				KeySystem["5"]["Visible"] = false
				KeySystem["7"]["Visible"] = false
				KeySystem["a"]["Visible"] = false
				KeySystem["11"]["Visible"] = false
				KeySystem["12"]["Visible"] = false
				KeySystem["14"]["Visible"] = false
				Library:tween(KeySystem["2"], {Size = UDim2.new(0, 250, 0, 25)})
				KeySystem["15"]["CornerRadius"] = UDim.new(0, 8);
				--Library:tween(KeySystem["514"], {Size = UDim2.new(0,250,0,25)})
				Minimize.Active = true
			elseif Minimize.Active == true then
				KeySystem["15"]["CornerRadius"] = UDim.new(0, 0);
				Library:tween(KeySystem["2"], {Size = UDim2.new(0, 250, 0, 300)})
				task.wait(0.2)
				KeySystem["5"]["Visible"] = true
				KeySystem["7"]["Visible"] = true
				KeySystem["a"]["Visible"] = true
				KeySystem["11"]["Visible"] = true
				KeySystem["12"]["Visible"] = true
				KeySystem["14"]["Visible"] = true
				--Library:tween(KeySystem["514"], {Size = UDim2.new(0,400,0,25)})
				Minimize.Active = false
			end
		end

		-- Logic
		do
			KeySystem["10"].MouseButton1Click:Connect(function()
				Minimize:Toggle()
			end)
		end
	end

	KeySystem:Minimize()

	function KeySystem:Close()
		-- Logic
		do
			KeySystem["f"].MouseButton1Click:Connect(function()
				KeySystem["1"]:Destroy()
			end)
		end
	end

	KeySystem:Close()
end

CreateKeySystem()
