-- SairHub v2 | Unified Opacity + Fixed Dragging + Scrollable UI
local startTime = tick()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Remove old UI if exists
pcall(function()
    playerGui:FindFirstChild("SairHub"):Destroy()
end)

-- Theme Presets
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
        ToggleOnText = Color3.fromRGB(0, 0, 0)
    },

    Green = {
        Background = Color3.fromRGB(20, 30, 20),
        Sidebar = Color3.fromRGB(25, 38, 25),
        Accent = Color3.fromRGB(80, 250, 123),
        Text = Color3.fromRGB(248, 248, 242),
        TextDim = Color3.fromRGB(140, 160, 140),
        Button = Color3.fromRGB(35, 50, 35),
        ToggleOn = Color3.fromRGB(80, 250, 123),
        ToggleOff = Color3.fromRGB(35, 50, 35),
        Close = Color3.fromRGB(255, 85, 85),
        ToggleOnText = Color3.fromRGB(0, 0, 0)
    },

    Ocean = {
        Background = Color3.fromRGB(13, 27, 42),
        Sidebar = Color3.fromRGB(18, 34, 52),
        Accent = Color3.fromRGB(33, 158, 188),
        Text = Color3.fromRGB(248, 248, 242),
        TextDim = Color3.fromRGB(120, 155, 175),
        Button = Color3.fromRGB(22, 42, 63),
        ToggleOn = Color3.fromRGB(42, 157, 143),
        ToggleOff = Color3.fromRGB(22, 42, 63),
        Close = Color3.fromRGB(255, 85, 85),
        ToggleOnText = Color3.fromRGB(0, 0, 0)
    },

    Sunset = {
        Background = Color3.fromRGB(40, 25, 25),
        Sidebar = Color3.fromRGB(50, 32, 32),
        Accent = Color3.fromRGB(255, 140, 0),
        Text = Color3.fromRGB(248, 248, 242),
        TextDim = Color3.fromRGB(180, 150, 130),
        Button = Color3.fromRGB(55, 38, 38),
        ToggleOn = Color3.fromRGB(255, 180, 50),
        ToggleOff = Color3.fromRGB(55, 38, 38),
        Close = Color3.fromRGB(255, 85, 85),
        ToggleOnText = Color3.fromRGB(0, 0, 0)
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
        ToggleOnText = Color3.fromRGB(0, 0, 0)
    }
}

-- Settings
local currentSettings = {
    theme = "Purple",
    globalOpacity = 0.15
}

local Colors = Themes[currentSettings.theme]

-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SairHub"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 620, 0, 440)
mainFrame.Position = UDim2.new(0.5, -310, 0.5, -220)
mainFrame.BackgroundColor3 = Colors.Background
mainFrame.BackgroundTransparency = currentSettings.globalOpacity
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Colors.Accent
uiStroke.Thickness = 1.5
uiStroke.Transparency = 0.3
uiStroke.Parent = mainFrame

-- Top Bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 38)
topBar.BackgroundColor3 = Colors.Sidebar
topBar.BackgroundTransparency = currentSettings.globalOpacity
topBar.BorderSizePixel = 0
topBar.Active = true
topBar.Parent = mainFrame

-- Title
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -50, 1, 0)
titleLabel.Position = UDim2.new(0, 18, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔥 SairHub v2"
titleLabel.TextColor3 = Colors.Accent
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 17
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = topBar

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 4)
closeButton.BackgroundColor3 = Colors.Close
closeButton.BackgroundTransparency = 0.4
closeButton.BorderSizePixel = 0
closeButton.Text = "✕"
closeButton.TextColor3 = Colors.Text
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.Parent = topBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 170, 1, -38)
sidebar.Position = UDim2.new(0, 0, 0, 38)
sidebar.BackgroundColor3 = Colors.Sidebar
sidebar.BackgroundTransparency = currentSettings.globalOpacity
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

-- Content Area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -170, 1, -38)
contentArea.Position = UDim2.new(0, 170, 0, 38)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

-- Scroll Frame
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ScrollBarThickness = 4
scrollingFrame.ScrollBarImageColor3 = Colors.Accent
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 700)
scrollingFrame.Parent = contentArea

-- Content Container
local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, 0, 1, 0)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = scrollingFrame

-- Section Title
local sectionTitle = Instance.new("TextLabel")
sectionTitle.Size = UDim2.new(1, -50, 0, 50)
sectionTitle.Position = UDim2.new(0, 25, 0, 15)
sectionTitle.BackgroundTransparency = 1
sectionTitle.Text = "MAIN"
sectionTitle.TextColor3 = Colors.Text
sectionTitle.Font = Enum.Font.GothamBlack
sectionTitle.TextSize = 38
sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
sectionTitle.Parent = contentContainer

-- Subtitle
local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, -50, 0, 20)
subtitleLabel.Position = UDim2.new(0, 25, 0, 65)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Essential Features"
subtitleLabel.TextColor3 = Colors.TextDim
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextSize = 13
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.Parent = contentContainer

-- Divider
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -50, 0, 1)
divider.Position = UDim2.new(0, 25, 0, 95)
divider.BackgroundColor3 = Colors.Accent
divider.BackgroundTransparency = 0.6
divider.BorderSizePixel = 0
divider.Parent = contentContainer

-- Toggles Frame
local togglesFrame = Instance.new("Frame")
togglesFrame.Size = UDim2.new(1, -50, 0, 500)
togglesFrame.Position = UDim2.new(0, 25, 0, 110)
togglesFrame.BackgroundTransparency = 1
togglesFrame.Parent = contentContainer

-- Settings Frame
local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(1, -50, 0, 500)
settingsFrame.Position = UDim2.new(0, 25, 0, 110)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false
settingsFrame.Parent = contentContainer

-- Toggle Data
local toggleStorage = {}
local selectedButton = nil

-- Toggle Creator
local function createToggle(name, yPos, key, parent)
    toggleStorage[key] = toggleStorage[key] or false

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 34)
    button.Position = UDim2.new(0, 0, 0, yPos)
    button.BackgroundColor3 = Colors.ToggleOff
    button.BackgroundTransparency = 0.3
    button.BorderSizePixel = 0
    button.Text = "  " .. name
    button.TextColor3 = Colors.TextDim
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 13
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button

    button.MouseButton1Click:Connect(function()
        toggleStorage[key] = not toggleStorage[key]

        if toggleStorage[key] then
            button.BackgroundColor3 = Colors.ToggleOn
            button.TextColor3 = Colors.ToggleOnText
            button.Text = "  ✓  " .. name
        else
            button.BackgroundColor3 = Colors.ToggleOff
            button.TextColor3 = Colors.TextDim
            button.Text = "  " .. name
        end
    end)
end

-- Dropdown
local function createDropdown(label, options, current, yPos, callback)
    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(1, 0, 0, 20)
    labelText.Position = UDim2.new(0, 0, 0, yPos)
    labelText.BackgroundTransparency = 1
    labelText.Text = label
    labelText.TextColor3 = Colors.TextDim
    labelText.Font = Enum.Font.GothamMedium
    labelText.TextSize = 12
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = settingsFrame

    local dropdown = Instance.new("TextButton")
    dropdown.Size = UDim2.new(1, 0, 0, 34)
    dropdown.Position = UDim2.new(0, 0, 0, yPos + 24)
    dropdown.BackgroundColor3 = Colors.Button
    dropdown.BackgroundTransparency = 0.3
    dropdown.BorderSizePixel = 0
    dropdown.Text = "  ▼  " .. current
    dropdown.TextColor3 = Colors.Text
    dropdown.Font = Enum.Font.GothamMedium
    dropdown.TextSize = 13
    dropdown.TextXAlignment = Enum.TextXAlignment.Left
    dropdown.Parent = settingsFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = dropdown

    local index = table.find(options, current) or 1

    dropdown.MouseButton1Click:Connect(function()
        index += 1
        if index > #options then
            index = 1
        end

        local newValue = options[index]
        dropdown.Text = "  ▼  " .. newValue

        if callback then
            callback(newValue)
        end
    end)
end

-- Slider
local function createSlider(label, min, max, currentValue, yPos, callback)
    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(1, 0, 0, 20)
    labelText.Position = UDim2.new(0, 0, 0, yPos)
    labelText.BackgroundTransparency = 1
    labelText.Text = label .. ": " .. math.floor(currentValue * 100) .. "%"
    labelText.TextColor3 = Colors.TextDim
    labelText.Font = Enum.Font.GothamMedium
    labelText.TextSize = 12
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = settingsFrame

    local sliderBar = Instance.new("Frame")
    sliderBar.Size = UDim2.new(1, 0, 0, 8)
    sliderBar.Position = UDim2.new(0, 0, 0, yPos + 30)
    sliderBar.BackgroundColor3 = Colors.Button
    sliderBar.BorderSizePixel = 0
    sliderBar.Parent = settingsFrame

    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(1, 0)
    sliderCorner.Parent = sliderBar

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(currentValue, 0, 1, 0)
    fill.BackgroundColor3 = Colors.Accent
    fill.BorderSizePixel = 0
    fill.Parent = sliderBar

    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill

    local dragging = false

    sliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local percent = math.clamp(
                (input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X,
                0,
                1
            )

            local value = min + ((max - min) * percent)

            fill.Size = UDim2.new(percent, 0, 1, 0)
            labelText.Text = label .. ": " .. math.floor(value * 100) .. "%"

            if callback then
                callback(value)
            end
        end
    end)
end

-- Update UI Colors
local function updateUI()
    Colors = Themes[currentSettings.theme]

    mainFrame.BackgroundColor3 = Colors.Background
    mainFrame.BackgroundTransparency = currentSettings.globalOpacity

    topBar.BackgroundColor3 = Colors.Sidebar
    topBar.BackgroundTransparency = currentSettings.globalOpacity

    sidebar.BackgroundColor3 = Colors.Sidebar
    sidebar.BackgroundTransparency = currentSettings.globalOpacity

    titleLabel.TextColor3 = Colors.Accent
    divider.BackgroundColor3 = Colors.Accent
    uiStroke.Color = Colors.Accent

    scrollingFrame.ScrollBarImageColor3 = Colors.Accent
end

-- Clear Frames
local function clearFrames()
    for _, v in pairs(togglesFrame:GetChildren()) do
        v:Destroy()
    end

    for _, v in pairs(settingsFrame:GetChildren()) do
        v:Destroy()
    end
end

-- Sections
local sections = {
    "Main",
    "Farm",
    "Extra",
    "PVP",
    "Shop",
    "Misc",
    "Settings"
}

-- Load Content
local function loadSection(name)
    clearFrames()

    sectionTitle.Text = string.upper(name)

    togglesFrame.Visible = name ~= "Settings"
    settingsFrame.Visible = name == "Settings"

    if name == "Settings" then
        subtitleLabel.Text = "Hub Configuration"

        createDropdown(
            "🎨 Theme",
            {"Purple", "Green", "Ocean", "Sunset", "Midnight"},
            currentSettings.theme,
            10,
            function(value)
                currentSettings.theme = value
                updateUI()
            end
        )

        createSlider(
            "🌑 UI Opacity",
            0,
            0.7,
            currentSettings.globalOpacity,
            90,
            function(value)
                currentSettings.globalOpacity = value
                updateUI()
            end
        )

        createToggle("🔔 Enable Notifications", 170, "notif", settingsFrame)
        createToggle("💾 Save Settings", 210, "save", settingsFrame)
        createToggle("🔁 Auto Load Config", 250, "autoload", settingsFrame)
        createToggle("🔊 UI Sounds", 290, "sound", settingsFrame)

    else
        subtitleLabel.Text = "Features"

        local sampleToggles = {
            "⚡ Speed Hack",
            "🕊️ Fly Hack",
            "👁️ Player ESP",
            "🎯 Teleport",
            "💨 Fast Walk"
        }

        for i, toggleName in ipairs(sampleToggles) do
            createToggle(toggleName, (i - 1) * 40, toggleName, togglesFrame)
        end
    end

    scrollingFrame.CanvasPosition = Vector2.new(0, 0)
end

-- Sidebar Buttons
for i, section in ipairs(sections) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -24, 0, 36)
    button.Position = UDim2.new(0, 12, 0, i * 42)
    button.BackgroundColor3 = Colors.Button
    button.BackgroundTransparency = 0.5
    button.BorderSizePixel = 0
    button.Text = "  " .. section
    button.TextColor3 = Colors.TextDim
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 12
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.Parent = sidebar

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button

    button.MouseButton1Click:Connect(function()

        if selectedButton then
            selectedButton.BackgroundTransparency = 0.5
            selectedButton.TextColor3 = Colors.TextDim
        end

        selectedButton = button

        button.BackgroundTransparency = 0.2
        button.TextColor3 = Colors.Accent

        loadSection(section)
    end)

    if i == 1 then
        selectedButton = button
        button.BackgroundTransparency = 0.2
        button.TextColor3 = Colors.Accent
        loadSection(section)
    end
end

-- Version
local versionLabel = Instance.new("TextLabel")
versionLabel.Size = UDim2.new(1, -24, 0, 20)
versionLabel.Position = UDim2.new(0, 12, 1, -28)
versionLabel.BackgroundTransparency = 1
versionLabel.Text = "v2.0.0 | Unified Opacity"
versionLabel.TextColor3 = Colors.TextDim
versionLabel.Font = Enum.Font.Gotham
versionLabel.TextSize = 9
versionLabel.Parent = sidebar

-- Toggle UI
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end

    if input.KeyCode == Enum.KeyCode.RightControl then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

-- FIXED DRAGGING
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

print("✅ SairHub Loaded")
print("🖱️ Dragging Fixed")
print("🌑 Unified Opacity Applied")
print("📜 Scrollable UI Enabled")