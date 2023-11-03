Button = Tab:Button({
	name = "Unlock All Premium Faces and Accessories",
	callback = (function()
		local Faces = game:GetService("Players").averylocalcheese.PlayerGui.NoResetGUIHandler.MainEditor.Catalog.Container.ScrollingFrame
		while not Faces:FindFirstChildOfClass("ImageButton") do task.wait() end
		for i,v in pairs(Faces:GetChildren()) do
			if v:IsA("ImageButton") then
				v.FacePassMesh.Visible = false
			end
		end

		local GetFace = game.ReplicatedStorage.RE["1Updat1eAvata1r"]
		local namecall
		namecall = hookmetamethod(game,"__namecall",function(self,...)
			local args = {...}
			local method = getnamecallmethod():lower()
			if not checkcaller() and self == GetFace and method == "fireserver" then
				args[1] = _G.replacementstring or "wear"
				return namecall(self,unpack(args))
			end
			return namecall(self,...)
		end)
	end)
})
