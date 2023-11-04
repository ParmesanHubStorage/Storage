local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

if game.PlaceId == 3200010305 or game.PlaceId == 2797881676 or game.PlaceId == 2625195454 or game.PlaceId == 3590667014 or game.PlaceId == 2951213182 or game.PlaceId == 4518266946 or game.PlaceId == 4661507759 or game.PlaceId == 4768829954 or game.PlaceId == 2215221144 or game.PlaceId == 4134003540 or game.PlaceId == 3925577908 or game.PlaceId == 4388762338 or game.PlaceId == 5071816792 or game.PlaceId == 5188855685 or game.PlaceId == 5862433299 or game.PlaceId == 7799530284 or game.PlaceId == 2500111229 or game.PlaceId == 740581508 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CheesyLiker/bottleofwater/main/1.lua", true))()
elseif game.PlaceId == 13772394625 or game.PlaceId == 14732610803 or game.PlaceId == 14368557094 then
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHub/ScriptStorage/main/blade_ball.lua')))()
elseif game.PlaceId == 13127800756 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XtraCheese/bottleofwater/main/arm2.lua", true))()
elseif game.PlaceId == 14184086618 or game.PlaceId == 14483937954 or game.PlaceId == 14666799841 or game.PlaceId == 14840620690 then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XtraCheese/bottleofwater/main/obbybutbike.lua", true))()
elseif game.PlaceId == 537413528 or game.PlaceId == 1930863474 or game.PlaceId == 1930866268 then
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHub/ScriptStorage/main/babft.lua')))()
elseif game.PlaceId == 4924922222 then
	loadstring(game:HttpGet(('https://raw.githubusercontent.com/ParmesanHub/ScriptStorage/main/brookhaven.lua')))()
else
	OrionLib:MakeNotification({
		Name = "Parmesan Hub",
		Content = "Place or Game isnt supported. Try to execute this script in another place of game (Place Id) or otherwise the game isnt supported.",
		Image = "rbxassetid://4483345998",
		Time = 5
	})
end
