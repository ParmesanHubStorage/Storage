# Parmesan Hub UI Lib

---

## Booting the library
```lua
local Main = Library:Init({
	name = "Game Name"
})

```

---

## Adding the Tab

```lua
local Tab = Main:CreateTab({
	name = "Tab Name",
	icon = "rbxassetid://15101013637"
})
```

---

## Adding the Section

```lua
Tab:Section({
	text = "Section Text"
})
```

---

## Adding the Button

```lua
local Button = Tab:Button({
	name = "Button Name",
	callback = (function()
		
	end)
})
```
## Change Button Name

```lua
Button:SetText(text)
```

## Change Button Callback

```lua
Button:SetCallback(function()

end)
```

---

## Adding the Toggle

```lua
local Toggle = Tab:Toggle({
	name = "Toggle Name",
	callback = function(Value)
		
	end
})
```

---

## Adding the Slider

```lua
local Slider = Tab:Slider({
	name = "Slider Name",
	minimum = 1,
	maximum = 1000,
	default = 100,
	valuename = "walkspeed",
	gradient = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 100, 0))};
	callback = function(Value)
		
	end
})
```

---

## Adding a Dropdown

```lua
local Dropdown = Tab:Dropdown({
	name = "Dropdown Name",
	callback = function(Name, Value)
		
	end,
	opencallback = function()
		
	end,
})
```

## Adding a Dropdown Option

```lua
Dropdown:Add("Dropdown Option", 12)
```

---

## Adding an Adaptive Input

```lua
local Input = Tab:Input({
    name = "Input",
    placeholdertext = "Input",
    cleartextonfocus = true,
    callback = function(Value)
    
    end
})
```

---

## Adding the Message

```lua
local Message = Tab:Message({
    name = "Message",
    text = "Message"
})
```

## Change Message Name

```lua
Message:SetName(name)
```

## Change Message Text

```lua
Message:SetText(text)
```

---

## Adding the Information

```lua
local Information = Tab:Information({
    name = "Information",
    text = "Information"
})
```

## Change Information Name

```lua
Information:SetName(name)
```

## Change Information Text

```lua
Information:SetText(text)
```

---

## Adding the Warning

```lua
local Warning = Tab:Warning({
    name = "Warning",
    text = "Warning"
})
```

## Change Warning Name

```lua
Warning:SetName(name)
```

## Change Warning Text

```lua
Warning:SetText(text)
```
