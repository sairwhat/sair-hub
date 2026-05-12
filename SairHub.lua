--// SairHub v2 Remastered
--// Modern UI + Fixed Dragging + Proper Scrolling + Full Theme Support

local startTime = tick()

--// Services
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// Blur
local blur = Instance.new("BlurEffect")
blur.Size = 12
blur.Parent = Lighting

--// Themes
local Themes = {
	Purple = {
		Background = Color3.fromRGB(25,23,36),
		Sidebar = Color3.fromRGB(30,28,46),
		Accent = Color3.fromRGB(189,147,249),
		Text = Color3.fromRGB(248,248,242),
		TextDim = Color3.fromRGB(160,160,180),
		Button = Color3.fromRGB(40,38,56),
		ToggleOn = Color3.fromRGB(80,250,123),
		Close = Color3.fromRGB(255,85,85),
	},

	Ocean = {
		Background = Color3.fromRGB(13,27,42),
		Sidebar = Color3.fromRGB(18,34,52),
		Accent = Color3.fromRGB(33,158,188),
		Text = Color3.fromRGB(248,248,242),
		TextDim = Color3.fromRGB(140,170,190),
		Button = Color3.fromRGB(22,42,63),
		ToggleOn = Color3.fromRGB(42,157,143),
		Close = Color3.fromRGB(255,85,85),
	},

	Green = {
		Background = Color3.fromRGB(20,30,20),
		Sidebar = Color3.fromRGB(25,38,25),
		Accent = Color3.fromRGB(80,250,123),
		Text = Color3.fromRGB(248,248,242),
		TextDim = Color3.fromRGB(150,180,150),
		Button = Color3.fromRGB(35,50,35),
		ToggleOn = Color3.fromRGB(80,250,123),
		Close = Color3.fromRGB(255,85,85),
	}
}

local Settings = {
	Theme = "Purple",
	Opacity = 0.15
}

local Colors = Themes[Settings.Theme]

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "SairHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

--// Main Frame
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 650, 0, 420)
main.Position = UDim2.new(0.5,-325,0.5,-210)
main.BackgroundColor3 = Colors.Background
main.BackgroundTransparency = Settings.Opacity
main.BorderSizePixel = 0
main.Parent = gui
main.Active = true

Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)

local stroke = Instance.new("UIStroke")
stroke.Color = Colors.Accent
stroke.Transparency = 0.3
stroke.Parent = main

--// Shadow
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.Image = "rbxassetid://1316045217"
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10,10,118,118)
shadow.Size = UDim2.new(1,30,1,30)
shadow.Position = UDim2.new(0,-15,0,-15)
shadow.BackgroundTransparency = 1
shadow.ImageTransparency = 0.5
shadow.ZIndex = 0
shadow.Parent = main

--// Topbar
local topbar = Instance.new("Frame")
topbar.Size = UDim2.new(1,0,0,40)
topbar.BackgroundColor3 = Colors.Sidebar
topbar.BackgroundTransparency = Settings.Opacity
topbar.BorderSizePixel = 0
topbar.Parent = main

Instance.new("UICorner", topbar).CornerRadius = UDim.new(0,12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-50,1,0)
title.Position = UDim2.new(0,15,0,0)
title.BackgroundTransparency = 1
title.Text = "🔥 SairHub v2 Remastered"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Colors.Accent
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topbar

--// Close Button
local close = Instance.new("TextButton")
close.Size = UDim2.new(0,28,0,28)
close.Position = UDim2.new(1,-36,0,6)
close.BackgroundColor3 = Colors.Close
close.Text = "✕"
close.TextColor3 = Colors.Text
close.Font = Enum.Font.GothamBold
close.TextSize = 15
close.BorderSizePixel = 0
close.Parent = topbar

Instance.new("UICorner", close).CornerRadius = UDim.new(0,6)

close.MouseEnter:Connect(function()
	TweenService:Create(close,TweenInfo.new(.15),{
		BackgroundTransparency = .2
	}):Play()
end)

close.MouseLeave:Connect(function()
	TweenService:Create(close,TweenInfo.new(.15),{
		BackgroundTransparency = .5
	}):Play()
end)

close.MouseButton1Click:Connect(function()
	main.Visible = false
end)

--// Sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0,180,1,-40)
sidebar.Position = UDim2.new(0,0,0,40)
sidebar.BackgroundColor3 = Colors.Sidebar
sidebar.BackgroundTransparency = Settings.Opacity
sidebar.BorderSizePixel = 0
sidebar.Parent = main

local sidebarPadding = Instance.new("UIPadding")
sidebarPadding.PaddingTop = UDim.new(0,15)
sidebarPadding.PaddingLeft = UDim.new(0,10)
sidebarPadding.PaddingRight = UDim.new(0,10)
sidebarPadding.Parent = sidebar

local sidebarLayout = Instance.new("UIListLayout")
sidebarLayout.Padding = UDim.new(0,8)
sidebarLayout.Parent = sidebar

--// Content
local content = Instance.new("ScrollingFrame")
content.Size = UDim2.new(1,-180,1,-40)
content.Position = UDim2.new(0,180,0,40)
content.BackgroundTransparency = 1
content.BorderSizePixel = 0
content.ScrollBarThickness = 4
content.ScrollBarImageColor3 = Colors.Accent
content.AutomaticCanvasSize = Enum.AutomaticSize.Y
content.CanvasSize = UDim2.new(0,0,0,0)
content.Parent = main

local contentPadding = Instance.new("UIPadding")
contentPadding.PaddingTop = UDim.new(0,20)
contentPadding.PaddingLeft = UDim.new(0,20)
contentPadding.PaddingRight = UDim.new(0,20)
contentPadding.Parent = content

local contentLayout = Instance.new("UIListLayout")
contentLayout.Padding = UDim.new(0,10)
contentLayout.Parent = content

--// Title
local sectionTitle = Instance.new("TextLabel")
sectionTitle.Size = UDim2.new(1,0,0,45)
sectionTitle.BackgroundTransparency = 1
sectionTitle.Text = "MAIN"
sectionTitle.Font = Enum.Font.GothamBlack
sectionTitle.TextSize = 35
sectionTitle.TextColor3 = Colors.Text
sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
sectionTitle.Parent = content

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1,0,0,20)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Main Features"
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 12
subtitle.TextColor3 = Colors.TextDim
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = content

--// Divider
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1,0,0,1)
divider.BackgroundColor3 = Colors.Accent
divider.BackgroundTransparency = .6
divider.BorderSizePixel = 0
divider.Parent = content

--// Toggle Holder
local holder = Instance.new("Frame")
holder.Size = UDim2.new(1,0,0,0)
holder.BackgroundTransparency = 1
holder.AutomaticSize = Enum.AutomaticSize.Y
holder.Parent = content

local holderLayout = Instance.new("UIListLayout")
holderLayout.Padding = UDim.new(0,8)
holderLayout.Parent = holder

--// Toggle Storage
local Toggles = {}

--// Toggle Creator
local function CreateToggle(text,key)

	Toggles[key] = false

	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1,0,0,36)
	btn.BackgroundColor3 = Colors.Button
	btn.BackgroundTransparency = .2
	btn.Text = "  "..text
	btn.Font = Enum.Font.GothamMedium
	btn.TextSize = 13
	btn.TextColor3 = Colors.TextDim
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.BorderSizePixel = 0
	btn.AutoButtonColor = false
	btn.Parent = holder

	Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8)

	btn.MouseEnter:Connect(function()
		if not Toggles[key] then
			TweenService:Create(btn,TweenInfo.new(.15),{
				BackgroundTransparency = .05
			}):Play()
		end
	end)

	btn.MouseLeave:Connect(function()
		if not Toggles[key] then
			TweenService:Create(btn,TweenInfo.new(.15),{
				BackgroundTransparency = .2
			}):Play()
		end
	end)

	btn.MouseButton1Click:Connect(function()

		Toggles[key] = not Toggles[key]

		if Toggles[key] then

			TweenService:Create(btn,TweenInfo.new(.15),{
				BackgroundColor3 = Colors.ToggleOn
			}):Play()

			btn.TextColor3 = Color3.new(0,0,0)
			btn.Text = "  ✓  "..text

		else

			TweenService:Create(btn,TweenInfo.new(.15),{
				BackgroundColor3 = Colors.Button
			}):Play()

			btn.TextColor3 = Colors.TextDim
			btn.Text = "  "..text
		end
	end)
end

--// Toggles
CreateToggle("⚡ Speed Hack","speed")
CreateToggle("🕊️ Fly Hack","fly")
CreateToggle("👁️ Player ESP","esp")
CreateToggle("🎯 Teleport","tp")
CreateToggle("💨 Fast Walk","walk")
CreateToggle("⚔️ Silent Aim","silent")
CreateToggle("🔫 Aimbot","aimbot")
CreateToggle("🛡️ Auto Block","block")
CreateToggle("🌾 Auto Farm","farm")
CreateToggle("💎 Auto Collect","collect")
CreateToggle("📦 Auto Loot","loot")
CreateToggle("🔧 Noclip","noclip")
CreateToggle("🔧 Infinite Jump","infjump")
CreateToggle("🌙 Night Mode","night")

--// Sidebar Buttons
local sections = {
	{"🏠 Main"},
	{"🌾 Farm"},
	{"⚔️ PVP"},
	{"📦 Misc"},
	{"⚙️ Settings"}
}

for _,v in pairs(sections) do

	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1,0,0,36)
	btn.BackgroundColor3 = Colors.Button
	btn.BackgroundTransparency = .3
	btn.Text = "  "..v[1]
	btn.Font = Enum.Font.GothamMedium
	btn.TextSize = 13
	btn.TextColor3 = Colors.TextDim
	btn.TextXAlignment = Enum.TextXAlignment.Left
	btn.BorderSizePixel = 0
	btn.AutoButtonColor = false
	btn.Parent = sidebar

	Instance.new("UICorner",btn).CornerRadius = UDim.new(0,8)

	btn.MouseEnter:Connect(function()
		TweenService:Create(btn,TweenInfo.new(.15),{
			BackgroundTransparency = .1
		}):Play()
	end)

	btn.MouseLeave:Connect(function()
		TweenService:Create(btn,TweenInfo.new(.15),{
			BackgroundTransparency = .3
		}):Play()
	end)
end

--// Theme Updater
local function UpdateTheme()

	Colors = Themes[Settings.Theme]

	main.BackgroundColor3 = Colors.Background
	sidebar.BackgroundColor3 = Colors.Sidebar
	topbar.BackgroundColor3 = Colors.Sidebar

	title.TextColor3 = Colors.Accent
	stroke.Color = Colors.Accent
	divider.BackgroundColor3 = Colors.Accent

	content.ScrollBarImageColor3 = Colors.Accent

	for _,obj in pairs(gui:GetDescendants()) do

		if obj:IsA("TextButton") then

			if obj ~= close then
				obj.BackgroundColor3 = Colors.Button
				obj.TextColor3 = Colors.TextDim
			end
		end

		if obj:IsA("TextLabel") then
			if obj ~= title and obj ~= sectionTitle then
				obj.TextColor3 = Colors.TextDim
			end
		end
	end
end

--// Keybind
UIS.InputBegan:Connect(function(input,gp)
	if gp then return end

	if input.KeyCode == Enum.KeyCode.RightControl then
		main.Visible = not main.Visible
	end
end)

--// Proper Dragging
local dragging = false
local dragInput
local dragStart
local startPos

local function Update(input)

	local delta = input.Position - dragStart

	main.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

topbar.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseButton1 then

		dragging = true
		dragStart = input.Position
		startPos = main.Position

		input.Changed:Connect(function()

			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

topbar.InputChanged:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)

	if input == dragInput and dragging then
		Update(input)
	end
end)

print("✅ SairHub Remastered Loaded")
print("🖱️ Fixed Dragging")
print("📜 Proper Scrolling")
print("🎨 Dynamic Themes")
print("⚡ Smooth Tween Animations")
print("👤 Welcome "..player.Name)