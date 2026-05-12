-- SairHub v2 | Modern UI + Unified Opacity + Theme Reactive
local startTime = tick()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

pcall(function()
    playerGui:FindFirstChild("SairHub"):Destroy()
end)

-- THEMES
local Themes = {
    Purple = {
        Background = Color3.fromRGB(25, 23, 36),
        Sidebar = Color3.fromRGB(30, 28, 46),
        Accent = Color3.fromRGB(189, 147, 249),
        Text = Color3.fromRGB(248, 248, 242),
        TextDim = Color3.fromRGB(150, 148, 168),
        Button = Color3.fromRGB(40, 38, 56),
        ToggleOn = Color3.fromRGB(80, 250, 123),
        ToggleOff = Color3.fromRGB(40, 38, 56),
        Close = Color3.fromRGB(255, 85, 85),
        ToggleOnText = Color3.fromRGB(0,0,0),
        CardBg = Color3.fromRGB(35, 33, 50),
        InputBg = Color3.fromRGB(45, 43, 60),
    },

    Green = {
        Background = Color3.fromRGB(20, 30, 20),
        Sidebar = Color3.fromRGB(25, 38, 25),
        Accent = Color3.fromRGB(80, 250, 123),
        Text = Color3.fromRGB(240, 255, 240),
        TextDim = Color3.fromRGB(140, 160, 140),
        Button = Color3.fromRGB(35, 50, 35),
        ToggleOn = Color3.fromRGB(80, 250, 123),
        ToggleOff = Color3.fromRGB(35, 50, 35),
        Close = Color3.fromRGB(255, 85, 85),
        ToggleOnText = Color3.fromRGB(0,0,0),
        CardBg = Color3.fromRGB(28, 42, 28),
        InputBg = Color3.fromRGB(38, 52, 38),
    },

    Ocean = {
        Background = Color3.fromRGB(13, 27, 42),
        Sidebar = Color3.fromRGB(18, 34, 52),
        Accent = Color3.fromRGB(33, 158, 188),
        Text = Color3.fromRGB(240, 248, 255),
        TextDim = Color3.fromRGB(120, 155, 175),
        Button = Color3.fromRGB(22, 42, 63),
        ToggleOn = Color3.fromRGB(42, 157, 143),
        ToggleOff = Color3.fromRGB(22, 42, 63),
        Close = Color3.fromRGB(255, 85, 85),
        ToggleOnText = Color3.fromRGB(0,0,0),
        CardBg = Color3.fromRGB(20, 38, 55),
        InputBg = Color3.fromRGB(28, 46, 65),
    },

    Sunset = {
        Background = Color3.fromRGB(40, 25, 25),
        Sidebar = Color3.fromRGB(50, 32, 32),
        Accent = Color3.fromRGB(255, 140, 0),
        Text = Color3.fromRGB(255, 240, 220),
        TextDim = Color3.fromRGB(180, 150, 130),
        Button = Color3.fromRGB(55, 38, 38),
        ToggleOn = Color3.fromRGB(255, 180, 50),
        ToggleOff = Color3.fromRGB(55, 38, 38),
        Close = Color3.fromRGB(255, 85, 85),
        ToggleOnText = Color3.fromRGB(0,0,0),
        CardBg = Color3.fromRGB(58, 40, 40),
        InputBg = Color3.fromRGB(65, 48, 48),
    },

    Midnight = {
        Background = Color3.fromRGB(10, 10, 25),
        Sidebar = Color3.fromRGB(15, 15, 35),
        Accent = Color3.fromRGB(98, 114, 230),
        Text = Color3.fromRGB(230, 230, 250),
        TextDim = Color3.fromRGB(130, 130, 170),
        Button = Color3.fromRGB(20, 20, 40),
        ToggleOn = Color3.fromRGB(80, 200, 120),
        ToggleOff = Color3.fromRGB(20, 20, 40),
        Close = Color3.fromRGB(255, 85, 85),
        ToggleOnText = Color3.fromRGB(0,0,0),
        CardBg = Color3.fromRGB(18, 18, 38),
        InputBg = Color3.fromRGB(25, 25, 45),
    }
}

local currentSettings = {
    theme = "Purple",
    globalOpacity = 0.5
}

local Colors = Themes[currentSettings.theme]

-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SairHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- MAIN
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 620, 0, 440)
mainFrame.Position = UDim2.new(0.5, -310, 0.5, -220)
mainFrame.BackgroundColor3 = Colors.Background
mainFrame.BackgroundTransparency = 1 - currentSettings.globalOpacity
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Colors.Accent
uiStroke.Thickness = 1.5
uiStroke.Transparency = 0.2
uiStroke.Parent = mainFrame

-- TOPBAR
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1,0,0,38)
topBar.BackgroundColor3 = Colors.Sidebar
topBar.BackgroundTransparency = 1 - currentSettings.globalOpacity
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1,-50,1,0)
titleLabel.Position = UDim2.new(0,18,0,0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔥 SairHub | Blox Fruits Utility"
titleLabel.TextColor3 = Colors.Accent
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 17
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = topBar

-- CLOSE
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0,30,0,30)
closeButton.Position = UDim2.new(1,-35,0,4)
closeButton.BackgroundColor3 = Colors.Close
closeButton.BackgroundTransparency = 0.35
closeButton.Text = "✕"
closeButton.Parent = topBar
Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0,8)

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- SIDEBAR
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0,170,1,-38)
sidebar.Position = UDim2.new(0,0,0,38)
sidebar.BackgroundColor3 = Colors.Sidebar
sidebar.BackgroundTransparency = 1 - currentSettings.globalOpacity
sidebar.Parent = mainFrame

-- CONTENT
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1,-170,1,-38)
contentArea.Position = UDim2.new(0,170,0,38)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1,0,1,0)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.ScrollBarThickness = 4
scrollingFrame.Parent = contentArea

local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1,0,1,0)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = scrollingFrame

-- TITLES
local sectionTitle = Instance.new("TextLabel")
sectionTitle.Size = UDim2.new(1,-50,0,50)
sectionTitle.Position = UDim2.new(0,25,0,15)
sectionTitle.BackgroundTransparency = 1
sectionTitle.Font = Enum.Font.GothamBlack
sectionTitle.TextSize = 38
sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
sectionTitle.Parent = contentContainer

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1,-50,0,20)
subtitleLabel.Position = UDim2.new(0,25,0,65)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextSize = 13
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.Parent = contentContainer

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1,-50,0,1)
divider.Position = UDim2.new(0,25,0,95)
divider.BackgroundTransparency = 0.5
divider.Parent = contentContainer

-- SETTINGS AREA (NEW CLEAN SYSTEM)
local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(1,-50,1,-120)
settingsFrame.Position = UDim2.new(0,25,0,110)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false
settingsFrame.Parent = contentContainer

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0,12)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = settingsFrame

-- CARD SYSTEM
local function createCard(title)
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1,0,0,160)
    card.BackgroundColor3 = Colors.CardBg
    card.BorderSizePixel = 0
    Instance.new("UICorner", card).CornerRadius = UDim.new(0,10)

    local stroke = Instance.new("UIStroke")
    stroke.Color = Colors.Accent
    stroke.Transparency = 0.7
    stroke.Parent = card

    local t = Instance.new("TextLabel")
    t.Size = UDim2.new(1,-20,0,25)
    t.Position = UDim2.new(0,10,0,8)
    t.BackgroundTransparency = 1
    t.Text = title
    t.TextColor3 = Colors.Accent
    t.Font = Enum.Font.GothamBold
    t.TextSize = 13
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.Parent = card

    return card
end

-- UPDATE UI
local function updateUI()
    Colors = Themes[currentSettings.theme]

    mainFrame.BackgroundColor3 = Colors.Background
    topBar.BackgroundColor3 = Colors.Sidebar
    sidebar.BackgroundColor3 = Colors.Sidebar
    uiStroke.Color = Colors.Accent
    divider.BackgroundColor3 = Colors.Accent
end

-- LOAD SETTINGS
local function loadSettings()

    settingsFrame:ClearAllChildren()
    layout.Parent = settingsFrame

    -- APPEARANCE CARD
    local appearance = createCard("🎨 Appearance")
    appearance.Parent = settingsFrame

    local themeBtn = Instance.new("TextButton")
    themeBtn.Size = UDim2.new(1,-20,0,35)
    themeBtn.Position = UDim2.new(0,10,0,45)
    themeBtn.BackgroundColor3 = Colors.InputBg
    themeBtn.Text = "Theme: "..currentSettings.theme
    themeBtn.Parent = appearance
    Instance.new("UICorner", themeBtn)

    themeBtn.MouseButton1Click:Connect(function()
        local list = {"Purple","Green","Ocean","Sunset","Midnight"}
        local i = table.find(list,currentSettings.theme) % #list + 1
        currentSettings.theme = list[i]
        themeBtn.Text = "Theme: "..currentSettings.theme
        updateUI()
    end)

    -- FEATURES CARD
    local features = createCard("⚡ Features")
    features.Parent = settingsFrame

    local function toggle(name,y)
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1,-20,0,30)
        b.Position = UDim2.new(0,10,0,y)
        b.BackgroundColor3 = Colors.Button
        b.Text = name
        b.Parent = features
        Instance.new("UICorner", b)
    end

    toggle("FPS Boost",45)
    toggle("Auto Save",85)
    toggle("Config Sync",125)
end

-- SIDEBAR
local sections = {"Main","Farm","Extra","PVP","Shop","Settings"}

for i,name in ipairs(sections) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1,-24,0,36)
    b.Position = UDim2.new(0,12,0,i*42)
    b.Text = name
    b.Parent = sidebar

    b.MouseButton1Click:Connect(function()
        sectionTitle.Text = name
        subtitleLabel.Text = "Control Panel"

        settingsFrame.Visible = name == "Settings"
        if name == "Settings" then
            loadSettings()
        end
    end)
end

-- DRAG
local dragging, dragStart, startPos

topBar.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = i.Position
        startPos = mainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(i)
    if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
        local d = i.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
    end
end)

UserInputService.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

print("SairHub Loaded - Clean Settings UI") 