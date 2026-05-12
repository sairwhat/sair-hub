-- SairHub v2 | Modern UI + Instant Theme Switch + FPS Boost
local startTime = tick()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

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
        ToggleOnText = Color3.fromRGB(0,0,0)
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
        ToggleOnText = Color3.fromRGB(0,0,0)
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
        ToggleOnText = Color3.fromRGB(0,0,0)
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
        ToggleOnText = Color3.fromRGB(0,0,0)
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
        ToggleOnText = Color3.fromRGB(0,0,0)
    }
}

-- SETTINGS
local currentSettings = {
    theme = "Purple",
    globalOpacity = 0.5
}

local Colors = Themes[currentSettings.theme]

-- FPS BOOST STATE
local fpsBoostEnabled = false

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
topBar.Active = true
topBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1,-50,1,0)
titleLabel.Position = UDim2.new(0,18,0,0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔥 SairHub | Utility Hub"
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
closeButton.TextColor3 = Colors.Text
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
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
scrollingFrame.ScrollBarImageColor3 = Colors.Accent
scrollingFrame.CanvasSize = UDim2.new(0,0,0,700)
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
sectionTitle.Text = "MAIN"
sectionTitle.TextColor3 = Colors.Text
sectionTitle.Font = Enum.Font.GothamBlack
sectionTitle.TextSize = 38
sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
sectionTitle.Parent = contentContainer

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1,-50,0,20)
subtitleLabel.Position = UDim2.new(0,25,0,65)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Essential Features"
subtitleLabel.TextColor3 = Colors.TextDim
subtitleLabel.Parent = contentContainer

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1,-50,0,1)
divider.Position = UDim2.new(0,25,0,95)
divider.BackgroundColor3 = Colors.Accent
divider.Parent = contentContainer

local togglesFrame = Instance.new("Frame")
togglesFrame.Size = UDim2.new(1,-50,0,500)
togglesFrame.Position = UDim2.new(0,25,0,110)
togglesFrame.BackgroundTransparency = 1
togglesFrame.Parent = contentContainer

local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(1,-50,0,500)
settingsFrame.Position = UDim2.new(0,25,0,110)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false
settingsFrame.Parent = contentContainer

local toggleStorage = {}
local selectedButton
local sidebarButtons = {}

-- TOGGLE
local function createToggle(name,y,key,parent)
    toggleStorage[key] = false

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1,0,0,34)
    button.Position = UDim2.new(0,0,0,y)
    button.BackgroundColor3 = Colors.ToggleOff
    button.Text = "  "..name
    button.Parent = parent
    Instance.new("UICorner", button).CornerRadius = UDim.new(0,6)

    button.MouseButton1Click:Connect(function()
        toggleStorage[key] = not toggleStorage[key]

        if toggleStorage[key] then
            button.BackgroundColor3 = Colors.ToggleOn
            button.Text = "  ✓ "..name
        else
            button.BackgroundColor3 = Colors.ToggleOff
            button.Text = "  "..name
        end
    end)
end

-- THEME BUTTONS (NO DROPDOWN)
local function createThemeButton(name, y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1,0,0,34)
    button.Position = UDim2.new(0,0,0,y)
    button.BackgroundColor3 = Colors.Button
    button.Text = "🎨 "..name
    button.Parent = settingsFrame
    Instance.new("UICorner", button).CornerRadius = UDim.new(0,6)

    button.MouseButton1Click:Connect(function()
        currentSettings.theme = name
        Colors = Themes[name]
        updateUI()
    end)
end

-- FPS BOOST
local function toggleFPSBoost()
    fpsBoostEnabled = not fpsBoostEnabled

    if fpsBoostEnabled then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _,v in pairs(game:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Enabled = false
            end
        end
    else
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
    end
end

local function createFPSButton(y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1,0,0,34)
    button.Position = UDim2.new(0,0,0,y)
    button.BackgroundColor3 = Colors.Accent
    button.Text = "⚡ FPS Boost"
    button.Parent = settingsFrame
    Instance.new("UICorner", button).CornerRadius = UDim.new(0,6)

    button.MouseButton1Click:Connect(toggleFPSBoost)
end

-- UPDATE UI
function updateUI()
    Colors = Themes[currentSettings.theme]

    mainFrame.BackgroundColor3 = Colors.Background
    topBar.BackgroundColor3 = Colors.Sidebar
    sidebar.BackgroundColor3 = Colors.Sidebar
    uiStroke.Color = Colors.Accent
    divider.BackgroundColor3 = Colors.Accent
end

-- LOAD SETTINGS
local function loadSection(name)
    for _,v in pairs(settingsFrame:GetChildren()) do v:Destroy() end
    for _,v in pairs(togglesFrame:GetChildren()) do v:Destroy() end

    sectionTitle.Text = name

    if name == "Settings" then
        subtitleLabel.Text = "Customization"

        local themes = {"Purple","Green","Ocean","Sunset","Midnight"}

        for i,v in ipairs(themes) do
            createThemeButton(v, (i-1)*40)
        end

        createFPSButton(240)
    else
        subtitleLabel.Text = "Features"

        createToggle("Speed",0,"speed",togglesFrame)
        createToggle("Fly",40,"fly",togglesFrame)
        createToggle("ESP",80,"esp",togglesFrame)
    end
end

-- SIDEBAR
local sections = {"Main","Farm","PVP","Settings"}

for i,v in ipairs(sections) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1,-20,0,36)
    b.Position = UDim2.new(0,10,0,i*42)
    b.Text = v
    b.Parent = sidebar
    Instance.new("UICorner", b).CornerRadius = UDim.new(0,6)

    b.MouseButton1Click:Connect(function()
        loadSection(v)
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

print("SairHub Loaded ✔")