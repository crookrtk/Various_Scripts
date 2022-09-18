local a = game
	local b = a.Workspace
	local c = a.Lighting
	local d = b.Terrain
	d.WaterWaveSize = 0
	d.WaterWaveSpeed = 0
	d.WaterReflectance = 0
	d.WaterTransparency = 0
	c.GlobalShadows = false
	c.FogEnd = 9e9
	c.Brightness = 1
	settings().Rendering.QualityLevel = "Level01"
	for e, f in pairs(a:GetDescendants()) do
		if f:IsA("Part") or f:IsA("BasePart") or f:IsA("UnionOperation") or f:IsA("CornerWedgePart") or f:IsA("TrussPart") then
			f.Material = "Plastic"
		elseif f:IsA("Decal") or f:IsA("Texture") then
			f:Destroy()
		elseif f:IsA("ParticleEmitter") or f:IsA("Trail") then
			f:Remove()
		elseif f:IsA("Explosion") then
			f:Remove()
		elseif f:IsA("Fire") or f:IsA("Smoke") or f:IsA("Sparkles") then
			f:Remove()
		elseif f:IsA("MeshPart") then
			f.Material = "Plastic"
			f.Reflectance = 0
			f.TextureID = 10385902758728957
		end
	end
	for e, g in pairs(c:GetChildren()) do
		if g:IsA("SunRaysEffect") or g:IsA("ColorCorrectionEffect") or g:IsA("BloomEffect") or g:IsA("DepthOfFieldEffect") then
			g:Remove()
		end
	end
	sethiddenproperty(game.Lighting, "Technology", "Compatibility")
end
repeat wait()
	local a = pcall(function()
		game:WaitForChild("Players").LocalPlayer:WaitForChild("PlayerScripts").ChildAdded:Connect(function(c)
			if c.Name == "PlayerScriptsLoader"then
				c.Disabled = true
			end
		end)
	end)
	if a == true then break end
until true == false
game:WaitForChild("Players").LocalPlayer:WaitForChild("PlayerScripts").ChildAdded:Connect(function(c)
	if c.Name == "PlayerScriptsLoader"then
		c.Disabled = true
	end
end)
