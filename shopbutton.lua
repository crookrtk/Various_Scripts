-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Shop = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.843638241, 0, 0.899745047, 0)
Frame.Size = UDim2.new(0, 286, 0, 96)

Shop.Name = "Shop"
Shop.Parent = Frame
Shop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Shop.Position = UDim2.new(0.108391605, 0, 0.177083343, 0)
Shop.Size = UDim2.new(0, 231, 0, 61)
Shop.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
Shop.Font = Enum.Font.Ubuntu
Shop.Text = "Server Hop"
Shop.TextColor3 = Color3.fromRGB(0, 0, 0)
Shop.TextScaled = true
Shop.TextSize = 14.000
Shop.TextWrapped = true
RejoinButton.MouseButton1Down:connect(function()
	ocal LP = game:GetService('Players').LocalPlayer

	local ogChar = LP.Character
	LP.Character = Clone
	LP.Character = ogChar
	function shop()
		pcall(function()
			local Servers =
				game.HttpService:JSONDecode(
				game:HttpGet("https://games.roblox.com/v1/games/417267366/servers/Public?sortOrder=Asc&limit=100")
			)
			while task.wait() do
				v = Servers.data[math.random(#Servers.data)]
				if v.playing < v.maxPlayers - 2 and v.id ~= game.JobId then
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
					break
				end
			end
		end)
	end
	
	
	local function hop()
		shop()
		while task.wait() do
			pcall(shop)
		end
	end
	hop()
end)
