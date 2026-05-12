--// SairHub v2 | Fixed Draggable + Proper Scrolling + Dynamic Themes
local startTime = tick()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--// Remove old UI
pcall(function()
    playerGui:FindFirstChild("SairHub"):Destroy()
end)

--// Themes
local Themes = {
    Purple = {
        Background = Color3.fromRGB(25,23,36),
        Sidebar = Color3.fromRGB(30,28,46),
        Accent = Color3.fromRGB(189,147,249),
        Text = Color3.fromRGB(248,248,242),
        TextDim = Color3.fromRGB(150,148,168),
        Button = Color3.fromRGB(40,38,56),
        ToggleOn = Color3.fromRGB(80,250,123),
        ToggleOff = Color3.fromRGB(40,38,56),
        Close = Color3.fromRGB(255,85,85),
        ToggleOnText = Color3.new(0,0,0)
    },

    Green = {
        Background = Color3.fromRGB(20,30,20),
        Sidebar = Color3.fromRGB(25,38,25),
        Accent = Color3.fromRGB(80,250,123),
        Text = Color3.fromRGB(248,248,242),
        TextDim = Color3.fromRGB(140,160,140),
        Button = Color3.fromRGB(35,50,35),
        ToggleOn = Color3.fromRGB(80,250,123),
        ToggleOff = Color3.fromRGB(35,50,35),
        Close = Color3.fromRGB(255,85,85),
        ToggleOnText = Color3.new(0,0,0)
    },

    Ocean = {
        Background = Color3.fromRGB(13,27,42),
        Sidebar = Color3.fromRGB(18,34,52),
        Accent = Color3.fromRGB(33,158,188),
        Text = Color3.fromRGB(248,248,242),
        TextDim = Color3.fromRGB(120,155,175),
        Button = Color3.fromRGB(22,42,63),
        ToggleOn = Color3.fromRGB(42,157,143),
        ToggleOff = Color3.fromRGB(22,42,63),
        Close = Color3.fromRGB(255,85,85),
        ToggleOnText = Color3.new(0,0,0)
    },

    Sunset = {
        Background = Color3.fromRGB(40,25,25),
        Sidebar = Color3.fromRGB(50,32,32),
        Accent = Color3.fromRGB(255,140,0),
        Text = Color3.fromRGB(248,248,242),
        TextDim = Color3.fromRGB(180,150,130),
        Button = Color3.fromRGB(55,38,38),
        ToggleOn = Color3.fromRGB(255,180,50),
        ToggleOff = Color3.fromRGB(55,38,38),
        Close = Color3.fromRGB(255,85,85),
        ToggleOnText = Color3.new(0,0,0)
    },

    Midnight = {
        Background = Color3.fromRGB(10,10,25),
        Sidebar = Color3.fromRGB(15,15,35),
        Accent = Color3.fromRGB(98,114,230),
        Text = Color3.fromRGB(230,230,250),
        TextDim = Color3.fromRGB(130,130,170),
        Button = Color3.fromRGB(20,20,40),
        ToggleOn = Color3.fromRGB(80,200,120),
        ToggleOff = Color3.fromRGB(20,20,40),
        Close = Color3.fromRGB(255,85,85),
        ToggleOnText = Color3.new(0,0,0)
    }
}

local currentSettings = {
    theme = "Purple",
    globalOpacity = 0.15
}

local Colors = Themes[currentSettings.theme]

--// GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SairHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0,620,0,380)
mainFrame.Position = UDim2.new(0.5,-310,0.5,-190)
mainFrame.BackgroundColor3 = Colors.Background
mainFrame.BackgroundTransparency = currentSettings.globalOpacity
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0,10)

local stroke = Instance.new("UIStroke")
stroke.Color = Colors.Accent
stroke.Thickness = 1.5
stroke.Transparency = 0.3
stroke.Parent = mainFrame

--// Topbar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1,0,0,35)
topBar.BackgroundColor3 = Colors.Sidebar
topBar.BackgroundTransparency = currentSettings.globalOpacity
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

Instance.new("UICorner", topBar).CornerRadius = UDim.new(0,10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-50,1,0)
title.Position = UDim2.new(0,16,0,0)
title.BackgroundTransparency = 1
title.Text = "🔥 SairHub v2"
title.TextColor3 = Colors.Accent
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

--// Close
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,28,0,28)
closeBtn.Position = UDim2.new(1,-34,0,3)
closeBtn.BackgroundColor3 = Colors.Close
closeBtn.BackgroundTransparency = 0.5
closeBtn.Text = "✕"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 15
closeBtn.TextColor3 = Colors.Text
closeBtn.BorderSizePixel = 0
closeBtn.Parent = topBar

Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0,6)

closeBtn.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

--// Sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0,170,1,-35)
sidebar.Position = UDim2.new(0,0,0,35)
sidebar.BackgroundColor3 = Colors.Sidebar
sidebar.BackgroundTransparency = currentSettings.globalOpacity
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0,10)

local navTitle = Instance.new("TextLabel")
navTitle.Size = UDim2.new(1,0,0,22)
navTitle.Position = UDim2.new(0,0,0,8)
navTitle.BackgroundTransparency = 1
navTitle.Text = "NAVIGATION"
navTitle.TextColor3 = Colors.TextDim
navTitle.Font = Enum.Font.GothamBold
navTitle.TextSize = 9
navTitle.Parent = sidebar

--// Content
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1,-170,1,-35)
contentArea.Position = UDim2.new(0,170,0,35)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1,0,1,0)
scrollingFrame.CanvasSize = UDim2.new(0,0,0,800)
scrollingFrame.ScrollBarThickness = 4
scrollingFrame.ScrollBarImageColor3 = Colors.Accent
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.Parent = contentArea
scrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0,10)
layout.Parent = scrollingFrame

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollingFrame.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y + 20)
end)

--// Section Header
local sectionTitle = Instance.new("TextLabel")
sectionTitle.Size = UDim2.new(1,-40,0,50)
sectionTitle.Position = UDim2.new(0,20,0,10)
sectionTitle.BackgroundTransparency = 1
sectionTitle.Text = "MAIN"
sectionTitle.TextColor3 = Colors.Text
sectionTitle.Font = Enum.Font.GothamBlack
sectionTitle.TextSize = 38
sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
sectionTitle.Parent = scrollingFrame

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1,-40,0,18)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Essential Features"
subtitle.TextColor3 = Colors.TextDim
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 12
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = scrollingFrame

--// Toggle creator
local toggles = {}

local function createToggle(text)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-30,0,34)
    btn.BackgroundColor3 = Colors.ToggleOff
    btn.BackgroundTransparency = 0.3
    btn.Text = "  "..text
    btn.TextColor3 = Colors.TextDim
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 13
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = false
    btn.Parent = scrollingFrame

    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)

    local enabled = false

    btn.MouseButton1Click:Connect(function()
        enabled = not enabled

        TweenService:Create(btn,TweenInfo.new(0.15),{
            BackgroundColor3 = enabled and Colors.ToggleOn or Colors.ToggleOff
        }):Play()

        if enabled then
            btn.Text = "  ✓  "..text
            btn.TextColor3 = Colors.ToggleOnText
        else
            btn.Text = "  "..text
            btn.TextColor3 = Colors.TextDim
        end
    end)

    table.insert(toggles, btn)
end

--// Toggles
createToggle("⚡ Speed Hack")
createToggle("🕊️ Fly Hack")
createToggle("👁️ Player ESP")
createToggle("🎯 Teleport")
createToggle("💨 Fast Walk")
createToggle("🌾 Auto Farm")
createToggle("⚔️ Auto Attack")
createToggle("💎 Auto Collect")
createToggle("📦 Auto Loot")
createToggle("🏃 Auto Run")
createToggle("🗺️ Auto Quest")
createToggle("🔧 Noclip")
createToggle("🔧 Infinite Jump")
createToggle("🔧 God Mode")
createToggle("🎯 Silent Aim")
createToggle("🔫 Aimbot")
createToggle("🛡️ Auto Block")
createToggle("⚡ Quick Attack")

--// Sidebar buttons
local selectedButton

local function createSidebarButton(name, icon, y)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,-24,0,34)
    btn.Position = UDim2.new(0,12,0,y)
    btn.BackgroundColor3 = Colors.Button
    btn.BackgroundTransparency = 0.5
    btn.Text = "  "..icon.."  "..name
    btn.TextColor3 = Colors.TextDim
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 12
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.BorderSizePixel = 0
    btn.Parent = sidebar

    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)

    btn.MouseButton1Click:Connect(function()

        if selectedButton then
            selectedButton.BackgroundTransparency = 0.5
            selectedButton.TextColor3 = Colors.TextDim
        end

        selectedButton = btn

        btn.BackgroundTransparency = 0.2
        btn.TextColor3 = Colors.Accent

        sectionTitle.Text = name:upper()
        subtitle.Text = name.." Features"
    end)

    return btn
end

createSidebarButton("Main","🏠",45)
createSidebarButton("Farm","🌾",85)
createSidebarButton("Extra","➕",125)
createSidebarButton("PVP","⚔️",165)
createSidebarButton("Shop","🛒",205)
createSidebarButton("Misc","📦",245)
createSidebarButton("Settings","⚙️",285)

--// Version label
local version = Instance.new("TextLabel")
version.Size = UDim2.new(1,-20,0,20)
version.Position = UDim2.new(0,10,1,-24)
version.BackgroundTransparency = 1
version.Text = "v2.0.1 | Fixed Build"
version.TextColor3 = Colors.TextDim
version.Font = Enum.Font.Gotham
version.TextSize = 9
version.Parent = sidebar

--// Proper draggable fix
local dragging = false
local dragStart
local startPos

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then

        local delta = input.Position - dragStart

        mainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

--// Toggle keybind
UserInputService.InputBegan:Connect(function(input,gp)
    if gp then return end

    if input.KeyCode == Enum.KeyCode.RightControl then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

print("✅ SairHub Loaded in "..string.format("%.3f", tick()-startTime).."ms")
print("🖱️ Fixed Dragging | 📜 Proper Scrolling | 🎨 Dynamic Themes")