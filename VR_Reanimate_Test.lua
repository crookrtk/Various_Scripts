--- decent R6 reanim by Anarky
-- most of the main shit is from Syntax V2, this is just an edit
local player = game.Players.LocalPlayer.Character

if  player.Humanoid.RigType == Enum.HumanoidRigType.R15 then
	
	for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
		if v:IsA("BasePart") and v.Name ~="Head" then 
			game:GetService("RunService").Heartbeat:connect(function()
				v.Velocity = Vector3.new(45,0,0)
			end)
		end
	end
	wait(0.1)



	Vanity = true
	RigidAttach = false --not recommended to be set to true


	Network=coroutine.create(function()
		while true do
			game.Players.LocalPlayer.ReplicationFocus = workspace
			settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
			settings().Physics.AllowSleep = false
			setsimulationradius(math.huge,math.huge)
			if DisconnectingNetworkOwnership then break; end
			game:GetService("RunService").Stepped:wait()
		end
	end)
	coroutine.resume(Network)

	DisconnectingNetworkOwnership = false
	StoppingVanity = false
	local Tween = game:GetService("TweenService")
	local Players = game:GetService("Players")
	local Player = Players.LocalPlayer
	local Cam = workspace.CurrentCamera
	local Character = Player.Character
	Character.Archivable = true
	local Dummy = Character:Clone()
	Dummy.Parent = Character
	Dummy.Name = "Dummy"

	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	local Humanoid2 = Dummy:FindFirstChildOfClass("Humanoid")


	function LoadLibrary(Library)
		if Library == "RbxUtility" then
			return loadstring(game:HttpGet("https://pastebin.com/raw/5C9i4b41",true))()
		end
	end

	local function Align(Part0,Part1)
		A0 = Instance.new("Attachment", Part0) 
		A0.Name = "Attachment1"
		A1 = Instance.new("Attachment", Part1)
		A1.Name = "Attachment2"
		Posiitoner = Instance.new("AlignPosition", Part0)
		Posiitoner.RigidityEnabled = RigidAttach or false
		Posiitoner.Attachment0 = A0
		Posiitoner.Attachment1 = A1
		Posiitoner.Responsiveness = 200
		Posiitoner.MaxVelocity = math.huge
		Posiitoner.MaxForce = 9.9999996802857e+37
		Rotater = Instance.new("AlignOrientation", Part0)
		Rotater.RigidityEnabled = false
		Rotater.Attachment0 = A0
		Rotater.Attachment1 = A1
		Rotater.Responsiveness = 200
		Rotater.MaxAngularVelocity = math.huge
		Rotater.MaxTorque = math.huge
	end



	for _,Value in pairs(Dummy:GetDescendants()) do
		if Value.Parent == Dummy then 
			if Value:IsA("Accessory") or Value:IsA("Hat") or Value:IsA("Accoutrement") then
				Value:Destroy()
			end
		end
		if Value:IsA("BasePart") then
			Value.Transparency = 1
			Value:GetPropertyChangedSignal("Transparency"):connect(function()
				Value.Transparency = 1
			end)
		elseif Value:IsA("Decal") then
			Value.Texture = 133940918
			Value:GetPropertyChangedSignal("Texture"):connect(function()
				Value.Texture = 133940918
			end)
		end
	end

	if Vanity then
		local RemovingAndShit
		local RemoveStuff = function(THINGADDED)
			if StoppingVanity then RemovingAndShit:Disconnect() return end
			if THINGADDED:IsA("BasePart") then
				THINGADDED.Transparency = 1
				THINGADDED:GetPropertyChangedSignal("Transparency"):connect(function()
					THINGADDED.Transparency = 1
				end)
			elseif THINGADDED:IsA("Decal") then
				THINGADDED.Parent = nil
				THINGADDED:GetPropertyChangedSignal("Parent"):connect(function()
					THINGADDED.Parent = nil
				end)
			end
		end
		RemovingAndShit = Dummy.DescendantAdded:connect(RemoveStuff)
	end

	RemoveTheNoclipBro = false
	for _,Value3 in pairs(Character:GetDescendants()) do 
		if not Value3:IsDescendantOf(Dummy) then
			if Value3:IsA("BasePart") then
				local NoclipConnection
				local function NoclipF()
					if RemoveTheNoclipBro then
						NoclipConnection:Disconnect() return
					end
					Value3.CanCollide = false
				end
				NoclipConnection = game:GetService("RunService").Stepped:connect(NoclipF)
			elseif Value3:IsA("Motor6D") and Value3.Part1 ~= Character.Head then
				Value3:Destroy()
			end 
		end
	end


	for _,Value4 in pairs(Character:GetChildren()) do 
		if Value4:IsA("BasePart") and Value4.Name ~= "Head" then
			Align(Value4,Dummy[Value4.Name])
		end
	end
	game:GetService("RunService").Stepped:connect(function()
		for _,Track in pairs(Humanoid:GetPlayingAnimationTracks()) do 
			Track:Stop()
		end
	end)
	Character.Animate.Disabled = true
	for _,Value5 in next, Humanoid:GetChildren() do 
		if Value5:IsA("Animator") then
			Value5:Destroy()
		end
	end
	Character.Animate:GetPropertyChangedSignal("Disabled"):connect(function()
		Character.Animate.Disabled = true
	end)


	Humanoid.Died:connect(function()
		Players.LocalPlayer.Character = Character
		Cam.CameraSubject = Character
		Dummy:Destroy()
		RemoveTheNoclipBro = true
		DisconnectingNetworkOwnership = true
		StoppingVanity = true
		for _,Joint in next, Character:GetDescendants() do 
			if Joint:IsA("JointInstance") or Joint:IsA("AlignPosition") or Joint:IsA("AlignOrientation") then 
				Joint:Destroy()
			end
		end
	end)

	Humanoid2.Died:connect(function()
		Humanoid.Health = 0
	end)


	Players.LocalPlayer.Character = Dummy
	Cam.CameraSubject = Dummy



elseif
	player.Humanoid.RigType == Enum.HumanoidRigType.R6 then


	for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
		if v:IsA("BasePart") and v.Name ~="Head" then 
			game:GetService("RunService").Heartbeat:connect(function()
				v.Velocity = Vector3.new(45,0,0)
			end)
		end
	end
	wait(0.1)

	local Player = game.Players.LocalPlayer
	local Character = Player.Character

	if Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
		Character.Torso["Right Shoulder"]:Destroy()
		Character.Torso["Left Shoulder"]:Destroy()
		Character.Torso["Right Hip"]:Destroy()
		Character.Torso["Left Hip"]:Destroy()
	end
	local Leftarm = Character:FindFirstChild("Left Arm")
	local Rightarm = Character:FindFirstChild("Right Arm")
	local Torso = Character:FindFirstChild("Torso")
	local Leftleg = Character:FindFirstChild("Left Leg")
	local Rightleg = Character:FindFirstChild("Right Leg")
	local SyntaxRig = game:GetObjects("rbxassetid://7567657290")[1]

	SyntaxRig.Parent = Character
	SyntaxRig:MoveTo(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
	SyntaxRig.Humanoid:Move(game.Players.LocalPlayer.Character.Humanoid.MoveDirection, false)
	SyntaxRig.Torso.Anchored = false

	local function Align(Part1, Part0, Position, Angle)
		Part1.CanCollide = false

		local AlignPos = Instance.new("AlignPosition")

		AlignPos.RigidityEnabled = false
		AlignPos.ApplyAtCenterOfMass = false
		AlignPos.MaxForce = 9e9
		AlignPos.MaxVelocity = 9e99
		AlignPos.ReactionForceEnabled = false
		AlignPos.Responsiveness = 9e99
		AlignPos.ApplyAtCenterOfMass = true
		AlignPos.MaxForce = 100000
		AlignPos.MaxVelocity = math.huge
		AlignPos.ReactionForceEnabled = false
		AlignPos.Responsiveness = 200
		AlignPos.RigidityEnabled = false
		AlignPos.Parent = Part1

		local AlignOri = Instance.new("AlignOrientation")
		AlignOri.MaxTorque = 9e99
		AlignOri.MaxAngularVelocity = 9e99
		AlignOri.PrimaryAxisOnly = false
		AlignOri.ReactionTorqueEnabled = false
		AlignOri.Responsiveness = 200
		AlignOri.RigidityEnabled = false
		AlignOri.MaxAngularVelocity = math.huge
		AlignOri.MaxTorque = 100000
		AlignOri.PrimaryAxisOnly = false
		AlignOri.ReactionTorqueEnabled = false
		AlignOri.Responsiveness = 200
		AlignOri.RigidityEnabled = false
		AlignOri.Parent = Part1

		local at1 = Instance.new("Attachment")
		at1.Parent = Part1
		local at2 = Instance.new("Attachment")
		at2.Parent = Part0
		at2.Orientation = Angle
		at2.Position = Position

		AlignPos.Attachment0 = at1
		AlignPos.Attachment1 = at2
		AlignOri.Attachment0 = at1
		AlignOri.Attachment1 = at2
	end


	for _,v in pairs(Character:GetChildren()) do
		if v:IsA("Part") and v.Name ~= "Head" then
			if v.Name == "Torso" then
				Align(Character[v.Name], SyntaxRig[v.Name], Vector3.new(0,0.5,0),Vector3.new(0,0,0))
			else
				Align(Character[v.Name], SyntaxRig[v.Name], Vector3.new(0,0,0),Vector3.new(0,0,0))
			end
		end
	end


	SyntaxRig.HumanoidRootPart.Anchored = false
	spawn(function()
		while true do
			wait()
			if Character:FindFirstChild("Humanoid").Health == 0 then
				Character:BreakJoints()
				SyntaxRig:BreakJoints()
			end
		end
	end)

	function noclipbro(ok)
		for i,v in pairs(Character:GetDescendants()) do
			if v:IsA("BasePart") then
				X=Instance.new("NoCollisionConstraint",v)
				X.Part0 = v
				X.Part1 = ok
			end
		end
	end
	for i,v in pairs(SyntaxRig:GetDescendants()) do
		if v:IsA("BasePart") then
			noclipbro(v)
		end
	end



	spawn(function()

		local Figure = SyntaxRig.Animate.Parent
		local Torso = Figure:WaitForChild("Torso")
		local RightShoulder = Torso:WaitForChild("Right Shoulder")
		local LeftShoulder = Torso:WaitForChild("Left Shoulder")
		local RightHip = Torso:WaitForChild("Right Hip")
		local LeftHip = Torso:WaitForChild("Left Hip")
		local Neck = Torso:WaitForChild("Neck")
		local Humanoid = Figure:WaitForChild("Humanoid")
		local pose = "Standing"

		local currentAnim = ""
		local currentAnimInstance = nil
		local currentAnimTrack = nil
		local currentAnimKeyframeHandler = nil
		local currentAnimSpeed = 1.0
		local animTable = {}
		local animNames = { 
			idle = 	{	
				{ id = "http://www.roblox.com/asset/?id=180435571", weight = 9 },
				{ id = "http://www.roblox.com/asset/?id=180435792", weight = 1 }
			},
			walk = 	{ 	
				{ id = "http://www.roblox.com/asset/?id=180426354", weight = 10 } 
			}, 
			run = 	{
				{ id = "run.xml", weight = 10 } 
			}, 
			jump = 	{
				{ id = "http://www.roblox.com/asset/?id=125750702", weight = 10 } 
			}, 
			fall = 	{
				{ id = "http://www.roblox.com/asset/?id=180436148", weight = 10 } 
			}, 
			climb = {
				{ id = "http://www.roblox.com/asset/?id=180436334", weight = 10 } 
			}, 
			sit = 	{
				{ id = "http://www.roblox.com/asset/?id=178130996", weight = 10 } 
			},	
			toolnone = {
				{ id = "http://www.roblox.com/asset/?id=182393478", weight = 10 } 
			},
			toolslash = {
				{ id = "http://www.roblox.com/asset/?id=129967390", weight = 10 } 
				--				{ id = "slash.xml", weight = 10 } 
			},
			toollunge = {
				{ id = "http://www.roblox.com/asset/?id=129967478", weight = 10 } 
			},
			wave = {
				{ id = "http://www.roblox.com/asset/?id=128777973", weight = 10 } 
			},
			point = {
				{ id = "http://www.roblox.com/asset/?id=128853357", weight = 10 } 
			},
			dance1 = {
				{ id = "http://www.roblox.com/asset/?id=182435998", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491037", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491065", weight = 10 } 
			},
			dance2 = {
				{ id = "http://www.roblox.com/asset/?id=182436842", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491248", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491277", weight = 10 } 
			},
			dance3 = {
				{ id = "http://www.roblox.com/asset/?id=182436935", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491368", weight = 10 }, 
				{ id = "http://www.roblox.com/asset/?id=182491423", weight = 10 } 
			},
			laugh = {
				{ id = "http://www.roblox.com/asset/?id=129423131", weight = 10 } 
			},
			cheer = {
				{ id = "http://www.roblox.com/asset/?id=129423030", weight = 10 } 
			},
		}
		local dances = {"dance1", "dance2", "dance3"}

		-- Existance in this list signifies that it is an emote, the value indicates if it is a looping emote
		local emoteNames = { wave = false, point = false, dance1 = true, dance2 = true, dance3 = true, laugh = false, cheer = false}

		function configureAnimationSet(name, fileList)
			if (animTable[name] ~= nil) then
				for _, connection in pairs(animTable[name].connections) do
					connection:disconnect()
				end
			end
			animTable[name] = {}
			animTable[name].count = 0
			animTable[name].totalWeight = 0	
			animTable[name].connections = {}

			-- check for config values
			local config = SyntaxRig.Animate:FindFirstChild(name)
			if (config ~= nil) then
				--		print("Loading anims " .. name)
				table.insert(animTable[name].connections, config.ChildAdded:connect(function(child) configureAnimationSet(name, fileList) end))
				table.insert(animTable[name].connections, config.ChildRemoved:connect(function(child) configureAnimationSet(name, fileList) end))
				local idx = 1
				for _, childPart in pairs(config:GetChildren()) do
					if (childPart:IsA("Animation")) then
						table.insert(animTable[name].connections, childPart.Changed:connect(function(property) configureAnimationSet(name, fileList) end))
						animTable[name][idx] = {}
						animTable[name][idx].anim = childPart
						local weightObject = childPart:FindFirstChild("Weight")
						if (weightObject == nil) then
							animTable[name][idx].weight = 1
						else
							animTable[name][idx].weight = weightObject.Value
						end
						animTable[name].count = animTable[name].count + 1
						animTable[name].totalWeight = animTable[name].totalWeight + animTable[name][idx].weight
						--			print(name .. " [" .. idx .. "] " .. animTable[name][idx].anim.AnimationId .. " (" .. animTable[name][idx].weight .. ")")
						idx = idx + 1
					end
				end
			end

			-- fallback to defaults
			if (animTable[name].count <= 0) then
				for idx, anim in pairs(fileList) do
					animTable[name][idx] = {}
					animTable[name][idx].anim = Instance.new("Animation")
					animTable[name][idx].anim.Name = name
					animTable[name][idx].anim.AnimationId = anim.id
					animTable[name][idx].weight = anim.weight
					animTable[name].count = animTable[name].count + 1
					animTable[name].totalWeight = animTable[name].totalWeight + anim.weight
					--			print(name .. " [" .. idx .. "] " .. anim.id .. " (" .. anim.weight .. ")")
				end
			end
		end

		-- Setup animation objects
		function scriptChildModified(child)
			local fileList = animNames[child.Name]
			if (fileList ~= nil) then
				configureAnimationSet(child.Name, fileList)
			end	
		end

		SyntaxRig.Animate.ChildAdded:connect(scriptChildModified)
		SyntaxRig.Animate.ChildRemoved:connect(scriptChildModified)
		SyntaxRig.HumanoidRootPart.Anchored = false

		for name, fileList in pairs(animNames) do 
			configureAnimationSet(name, fileList)
		end	

		-- ANIMATION

		-- declarations
		local toolAnim = "None"
		local toolAnimTime = 0

		local jumpAnimTime = 0
		local jumpAnimDuration = 0.3

		local toolTransitionTime = 0.1
		local fallTransitionTime = 0.3
		local jumpMaxLimbVelocity = 0.75

		-- functions

		function stopAllAnimations()
			local oldAnim = currentAnim

			-- return to idle if finishing an emote
			if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] == false) then
				oldAnim = "idle"
			end

			currentAnim = ""
			currentAnimInstance = nil
			if (currentAnimKeyframeHandler ~= nil) then
				currentAnimKeyframeHandler:disconnect()
			end

			if (currentAnimTrack ~= nil) then
				currentAnimTrack:Stop()
				currentAnimTrack:Destroy()
				currentAnimTrack = nil
			end
			return oldAnim
		end

		function setAnimationSpeed(speed)
			if speed ~= currentAnimSpeed then
				currentAnimSpeed = speed
				currentAnimTrack:AdjustSpeed(currentAnimSpeed)
			end
		end

		function keyFrameReachedFunc(frameName)
			if (frameName == "End") then

				local repeatAnim = currentAnim
				-- return to idle if finishing an emote
				if (emoteNames[repeatAnim] ~= nil and emoteNames[repeatAnim] == false) then
					repeatAnim = "idle"
				end

				local animSpeed = currentAnimSpeed
				playAnimation(repeatAnim, 0.0, Humanoid)
				setAnimationSpeed(animSpeed)
			end
		end

		-- Preload animations
		function playAnimation(animName, transitionTime, humanoid) 

			local roll = math.random(1, animTable[animName].totalWeight) 
			local origRoll = roll
			local idx = 1
			while (roll > animTable[animName][idx].weight) do
				roll = roll - animTable[animName][idx].weight
				idx = idx + 1
			end
			--		print(animName .. " " .. idx .. " [" .. origRoll .. "]")
			local anim = animTable[animName][idx].anim

			-- switch animation		
			if (anim ~= currentAnimInstance) then

				if (currentAnimTrack ~= nil) then
					currentAnimTrack:Stop(transitionTime)
					currentAnimTrack:Destroy()
				end

				currentAnimSpeed = 1.0

				-- load it to the humanoid; get AnimationTrack
				currentAnimTrack = humanoid:LoadAnimation(anim)
				currentAnimTrack.Priority = Enum.AnimationPriority.Core

				-- play the animation
				currentAnimTrack:Play(transitionTime)
				currentAnim = animName
				currentAnimInstance = anim

				-- set up keyframe name triggers
				if (currentAnimKeyframeHandler ~= nil) then
					currentAnimKeyframeHandler:disconnect()
				end
				currentAnimKeyframeHandler = currentAnimTrack.KeyframeReached:connect(keyFrameReachedFunc)

			end

		end

		-------------------------------------------------------------------------------------------
		-------------------------------------------------------------------------------------------

		local toolAnimName = ""
		local toolAnimTrack = nil
		local toolAnimInstance = nil
		local currentToolAnimKeyframeHandler = nil

		function toolKeyFrameReachedFunc(frameName)
			if (frameName == "End") then
				--		print("Keyframe : ".. frameName)	
				playToolAnimation(toolAnimName, 0.0, Humanoid)
			end
		end


		function playToolAnimation(animName, transitionTime, humanoid, priority)	 

			local roll = math.random(1, animTable[animName].totalWeight) 
			local origRoll = roll
			local idx = 1
			while (roll > animTable[animName][idx].weight) do
				roll = roll - animTable[animName][idx].weight
				idx = idx + 1
			end
			--		print(animName .. " * " .. idx .. " [" .. origRoll .. "]")
			local anim = animTable[animName][idx].anim

			if (toolAnimInstance ~= anim) then

				if (toolAnimTrack ~= nil) then
					toolAnimTrack:Stop()
					toolAnimTrack:Destroy()
					transitionTime = 0
				end

				-- load it to the humanoid; get AnimationTrack
				toolAnimTrack = humanoid:LoadAnimation(anim)
				if priority then
					toolAnimTrack.Priority = priority
				end

				-- play the animation
				toolAnimTrack:Play(transitionTime)
				toolAnimName = animName
				toolAnimInstance = anim

				currentToolAnimKeyframeHandler = toolAnimTrack.KeyframeReached:connect(toolKeyFrameReachedFunc)
			end
		end

		function stopToolAnimations()
			local oldAnim = toolAnimName

			if (currentToolAnimKeyframeHandler ~= nil) then
				currentToolAnimKeyframeHandler:disconnect()
			end

			toolAnimName = ""
			toolAnimInstance = nil
			if (toolAnimTrack ~= nil) then
				toolAnimTrack:Stop()
				toolAnimTrack:Destroy()
				toolAnimTrack = nil
			end


			return oldAnim
		end

		-------------------------------------------------------------------------------------------
		-------------------------------------------------------------------------------------------


		function onRunning(speed)
			if speed > 0.01 then
				playAnimation("walk", 0.1, Humanoid)
				if currentAnimInstance and currentAnimInstance.AnimationId == "http://www.roblox.com/asset/?id=180426354" then
					setAnimationSpeed(speed / 14.5)
				end
				pose = "Running"
			else
				if emoteNames[currentAnim] == nil then
					playAnimation("idle", 0.1, Humanoid)
					pose = "Standing"
				end
			end
		end

		function onDied()
			pose = "Dead"
		end

		function onJumping()
			playAnimation("jump", 0.1, Humanoid)
			jumpAnimTime = jumpAnimDuration
			pose = "Jumping"
		end

		function onClimbing(speed)
			playAnimation("climb", 0.1, Humanoid)
			setAnimationSpeed(speed / 12.0)
			pose = "Climbing"
		end

		function onGettingUp()
			pose = "GettingUp"
		end

		function onFreeFall()
			if (jumpAnimTime <= 0) then
				playAnimation("fall", fallTransitionTime, Humanoid)
			end
			pose = "FreeFall"
		end

		function onFallingDown()
			pose = "FallingDown"
		end

		function onSeated()
			pose = "Seated"
		end

		function onPlatformStanding()
			pose = "PlatformStanding"
		end

		function onSwimming(speed)
			if speed > 0 then
				pose = "Running"
			else
				pose = "Standing"
			end
		end

		function getTool()	
			for _, kid in ipairs(Figure:GetChildren()) do
				if kid.className == "Tool" then return kid end
			end
			return nil
		end

		function getToolAnim(tool)
			for _, c in ipairs(tool:GetChildren()) do
				if c.Name == "toolanim" and c.className == "StringValue" then
					return c
				end
			end
			return nil
		end

		function animateTool()

			if (toolAnim == "None") then
				playToolAnimation("toolnone", toolTransitionTime, Humanoid, Enum.AnimationPriority.Idle)
				return
			end

			if (toolAnim == "Slash") then
				playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action)
				return
			end

			if (toolAnim == "Lunge") then
				playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action)
				return
			end
		end

		function moveSit()
			RightShoulder.MaxVelocity = 0.15
			LeftShoulder.MaxVelocity = 0.15
			RightShoulder:SetDesiredAngle(3.14 /2)
			LeftShoulder:SetDesiredAngle(-3.14 /2)
			RightHip:SetDesiredAngle(3.14 /2)
			LeftHip:SetDesiredAngle(-3.14 /2)
		end

		local lastTick = 0

		function move(time)
			local amplitude = 1
			local frequency = 1
			local deltaTime = time - lastTick
			lastTick = time

			local climbFudge = 0
			local setAngles = false

			if (jumpAnimTime > 0) then
				jumpAnimTime = jumpAnimTime - deltaTime
			end

			if (pose == "FreeFall" and jumpAnimTime <= 0) then
				playAnimation("fall", fallTransitionTime, Humanoid)
			elseif (pose == "Seated") then
				playAnimation("sit", 0.5, Humanoid)
				return
			elseif (pose == "Running") then
				playAnimation("walk", 0.1, Humanoid)
			elseif (pose == "Dead" or pose == "GettingUp" or pose == "FallingDown" or pose == "Seated" or pose == "PlatformStanding") then
				--		print("Wha " .. pose)
				stopAllAnimations()
				amplitude = 0.1
				frequency = 1
				setAngles = true
			end

			if (setAngles) then
				local desiredAngle = amplitude * math.sin(time * frequency)

				RightShoulder:SetDesiredAngle(desiredAngle + climbFudge)
				LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge)
				RightHip:SetDesiredAngle(-desiredAngle)
				LeftHip:SetDesiredAngle(-desiredAngle)
			end

			-- Tool Animation handling
			local tool = getTool()
			if tool and tool:FindFirstChild("Handle") then

				local animStringValueObject = getToolAnim(tool)

				if animStringValueObject then
					toolAnim = animStringValueObject.Value
					-- message recieved, delete StringValue
					animStringValueObject.Parent = nil
					toolAnimTime = time + .3
				end

				if time > toolAnimTime then
					toolAnimTime = 0
					toolAnim = "None"
				end

				animateTool()		
			else
				stopToolAnimations()
				toolAnim = "None"
				toolAnimInstance = nil
				toolAnimTime = 0
			end
		end

		-- connect events
		Humanoid.Died:connect(onDied)
		Humanoid.Running:connect(onRunning)
		Humanoid.Jumping:connect(onJumping)
		Humanoid.Climbing:connect(onClimbing)
		Humanoid.GettingUp:connect(onGettingUp)
		Humanoid.FreeFalling:connect(onFreeFall)
		Humanoid.FallingDown:connect(onFallingDown)
		Humanoid.Seated:connect(onSeated)
		Humanoid.PlatformStanding:connect(onPlatformStanding)
		Humanoid.Swimming:connect(onSwimming)

		-- setup emote chat hook
		game:GetService("Players").LocalPlayer.Chatted:connect(function(msg)
			local emote = ""
			if msg == "/e dance" then
				emote = dances[math.random(1, #dances)]
			elseif (string.sub(msg, 1, 3) == "/e ") then
				emote = string.sub(msg, 4)
			elseif (string.sub(msg, 1, 7) == "/emote ") then
				emote = string.sub(msg, 8)
			end

			if (pose == "Standing" and emoteNames[emote] ~= nil) then
				playAnimation(emote, 0.1, Humanoid)
			end

		end)


		-- main program

		-- initialize to idle
		playAnimation("idle", 0.1, Humanoid)
		pose = "Standing"

		while Figure.Parent ~= nil do
			local _, time = wait(0.1)
			move(time)
		end
	end)

	game.Players.LocalPlayer.Character.Animate.Disabled = true
	game:GetService("UserInputService").JumpRequest:connect(function(same)
		if SyntaxRig.Humanoid.FloorMaterial~=Enum.Material.Air then
			SyntaxRig.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').Sit = false
		end
	end)
	if Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
		Character.HumanoidRootPart.RootJoint:Destroy()
	end



	game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
	Humanoid = game.Players.LocalPlayer.Character.Humanoid
	game["Run Service"].RenderStepped:Connect(function()
		SyntaxRig.Humanoid:Move(Character.Humanoid.MoveDirection, false)

		local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
		for _,v in pairs(ActiveTracks) do
			v:Stop()
		end
	end)

	game.Workspace.CurrentCamera.CameraSubject = SyntaxRig.Humanoid

	local runservice=game:service"RunService";
	local player=game:service"Players"["LocalPlayer"];
	local character=player["Character"];
	local blacklisted="Head Torso HumanoidRootPart";
	local limbs={};

	for i,v in next,character:children() do
		if (v.ClassName=="Part") and not blacklisted:find(v.Name) then
			local outline = Instance.new("SelectionBox")
			outline.Name = "Outline"
			outline.Color3 = Color3.new(9, 137, 207)
			outline.SurfaceColor3 = Color3.new(0, 1, 0)
			--outline.SurfaceTransparency = 0.9
			outline.LineThickness = 0.01
			outline.Transparency = 0.3
			outline.Adornee = v
			outline.Parent = v
			limbs[v.Name]=v;
		end
	end
end
