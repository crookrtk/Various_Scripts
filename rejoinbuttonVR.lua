----
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local RejoinButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = game.CoreGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0.00938232988, 0, 0.908872902, 0)
Frame.Size = UDim2.new(0, 219, 0, 67)

RejoinButton.Name = "RejoinButton"
RejoinButton.Parent = Frame
RejoinButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RejoinButton.Position = UDim2.new(0.0410959572, 0, 0.164179012, 0)
RejoinButton.Size = UDim2.new(0, 200, 0, 50)
RejoinButton.Style = Enum.ButtonStyle.RobloxRoundDropdownButton
RejoinButton.Font = Enum.Font.RobotoMono
RejoinButton.Text = "Rejoin"
RejoinButton.TextColor3 = Color3.fromRGB(0, 0, 0)
RejoinButton.TextScaled = true
RejoinButton.TextSize = 27.000
RejoinButton.TextWrapped = true
RejoinButton.MouseButton1Down:connect(function()
	local ts = game:GetService("TeleportService")

	local p = game:GetService("Players").LocalPlayer



	ts:Teleport(game.PlaceId, p)
end)
