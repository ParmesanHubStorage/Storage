Button = Tab:Button({
	name = "Unlock Speed Pass",
	callback = (function()
		local ChangeSpeed = game:GetService("ReplicatedStorage").RE["1Player1sCa1r"]
		local namecall
		namecall = hookmetamethod(game,"__namecall",function(self,...)
			local args = {...}
			local method = getnamecallmethod():lower()
			if not checkcaller() and self == ChangeSpeed and method == "fireserver" then
				for i,v in pairs(workspace.Vehicles:GetChildren()) do
					if v.Name == game.Players.LocalPlayer.Name.."Car" then
						v.Body.VehicleSeat.TopSpeed.Value = tonumber(args[2])
					end
				end
				return namecall(self,unpack(args))
			end
			return namecall(self,...)
		end)

		local SpeedButton = game:GetService("Players").LocalPlayer.PlayerGui.MainGUIHandler.CarControl.CarControl.CarButtons.RegSpeed
		local Gui = game:GetService("Players").LocalPlayer.PlayerGui.MainGUIHandler.CarControl.PassSpeedGUI

		SpeedButton.MouseButton1Click:Connect(function()
			Gui.Visible = not Gui.Visible
			game:GetService("Players").LocalPlayer.PlayerGui.MainGUIHandler.CarControl.RegSpeedGUI:Destroy()
		end)
	end)
})
