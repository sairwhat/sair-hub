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
closeButton.BorderSizePixel = 0
closeButton.Text = "✕"
closeButton.TextColor3 = Colors.Text
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.Parent = topBar

Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0,8)

closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundTransparency = 0.15
end)

closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundTransparency = 0.35
end)

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- SIDEBAR
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0,170,1,-38)
sidebar.Position = UDim2.new(0,0,0,38)
sidebar.BackgroundColor3 = Colors.Sidebar
sidebar.BackgroundTransparency = 1 - currentSettings.globalOpacity
sidebar.BorderSizePixel = 0
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
scrollingFrame.BorderSizePixel = 0
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
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextSize = 13
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.Parent = contentContainer

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1,-50,0,1)
divider.Position = UDim2.new(0,25,0,95)
divider.BackgroundColor3 = Colors.Accent
divider.BackgroundTransparency = 0.5
divider.BorderSizePixel = 0
divider.Parent = contentContainer

-- FRAMES
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

-- TOGGLE CREATOR
local function createToggle(name,y,key,parent)

    toggleStorage[key] = toggleStorage[key] or false

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1,0,0,34)
    button.Position = UDim2.new(0,0,0,y)
    button.BackgroundColor3 = Colors.ToggleOff
    button.BackgroundTransparency = 0.25
    button.BorderSizePixel = 0
    button.Text = "  "..name
    button.TextColor3 = Colors.TextDim
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 13
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.Parent = parent

    Instance.new("UICorner", button).CornerRadius = UDim.new(0,6)

    button.MouseEnter:Connect(function()
        button.BackgroundTransparency = 0.1
    end)

    button.MouseLeave:Connect(function()
        if toggleStorage[key] then
            button.BackgroundTransparency = 0
        else
            button.BackgroundTransparency = 0.25
        end
    end)

    button.MouseButton1Click:Connect(function()

        toggleStorage[key] = not toggleStorage[key]

        if toggleStorage[key] then
            button.BackgroundColor3 = Colors.ToggleOn
            button.TextColor3 = Colors.ToggleOnText
            button.Text = "  ✓  "..name
            button.BackgroundTransparency = 0
        else
            button.BackgroundColor3 = Colors.ToggleOff
            button.TextColor3 = Colors.TextDim
            button.Text = "  "..name
            button.BackgroundTransparency = 0.25
        end
    end)
end

-- SLIDER
local function createSlider(label,min,max,current,y,callback)

    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(1,0,0,20)
    labelText.Position = UDim2.new(0,0,0,y)
    labelText.BackgroundTransparency = 1
    labelText.Text = label..": "..math.floor(current*100).."%"
    labelText.TextColor3 = Colors.TextDim
    labelText.Font = Enum.Font.GothamMedium
    labelText.TextSize = 12
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = settingsFrame

    local sliderBar = Instance.new("Frame")
    sliderBar.Size = UDim2.new(1,0,0,8)
    sliderBar.Position = UDim2.new(0,0,0,y+30)
    sliderBar.BackgroundColor3 = Colors.Button
    sliderBar.BorderSizePixel = 0
    sliderBar.Parent = settingsFrame

    Instance.new("UICorner", sliderBar).CornerRadius = UDim.new(1,0)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(current,0,1,0)
    fill.BackgroundColor3 = Colors.Accent
    fill.BorderSizePixel = 0
    fill.Parent = sliderBar

    Instance.new("UICorner", fill).CornerRadius = UDim.new(1,0)

    local draggingSlider = false

    sliderBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSlider = true
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            draggingSlider = false
        end
    end)

    UserInputService.InputChanged:Connect(function(input)

        if draggingSlider and input.UserInputType == Enum.UserInputType.MouseMovement then

            local percent = math.clamp(
                (input.Position.X - sliderBar.AbsolutePosition.X)
                / sliderBar.AbsoluteSize.X,
                0,
                1
            )

            fill.Size = UDim2.new(percent,0,1,0)

            labelText.Text = label..": "..math.floor(percent*100).."%"

            callback(percent)
        end
    end)
end

-- UPDATE UI
local function updateUI()

    Colors = Themes[currentSettings.theme]

    mainFrame.BackgroundColor3 = Colors.Background
    mainFrame.BackgroundTransparency = 1 - currentSettings.globalOpacity

    topBar.BackgroundColor3 = Colors.Sidebar
    topBar.BackgroundTransparency = 1 - currentSettings.globalOpacity

    sidebar.BackgroundColor3 = Colors.Sidebar
    sidebar.BackgroundTransparency = 1 - currentSettings.globalOpacity

    uiStroke.Color = Colors.Accent
    divider.BackgroundColor3 = Colors.Accent
    titleLabel.TextColor3 = Colors.Accent
    sectionTitle.TextColor3 = Colors.Text
    subtitleLabel.TextColor3 = Colors.TextDim
    scrollingFrame.ScrollBarImageColor3 = Colors.Accent

    for _,button in pairs(sidebarButtons) do

        if button == selectedButton then
            button.BackgroundColor3 = Colors.Accent
            button.TextColor3 = Colors.Text
        else
            button.BackgroundColor3 = Colors.Button
            button.TextColor3 = Colors.TextDim
        end
    end
end

-- CLEAR
local function clearFrames()

    for _,v in pairs(togglesFrame:GetChildren()) do
        v:Destroy()
    end

    for _,v in pairs(settingsFrame:GetChildren()) do
        v:Destroy()
    end
end

-- LOAD SECTION
local function loadSection(name)

    clearFrames()

    sectionTitle.Text = string.upper(name)

    togglesFrame.Visible = name ~= "Settings"
    settingsFrame.Visible = name == "Settings"

    if name == "Settings" then

        subtitleLabel.Text = "Hub Configuration"

        -- Theme cycle button (no dropdown, just one click)
        local themeButton = Instance.new("TextButton")
        themeButton.Size = UDim2.new(1,0,0,34)
        themeButton.Position = UDim2.new(0,0,0,10)
        themeButton.BackgroundColor3 = Colors.Button
        themeButton.BackgroundTransparency = 0.2
        themeButton.BorderSizePixel = 0
        themeButton.Text = "Theme: " .. currentSettings.theme
        themeButton.TextColor3 = Colors.Text
        themeButton.Font = Enum.Font.GothamMedium
        themeButton.TextSize = 13
        themeButton.TextXAlignment = Enum.TextXAlignment.Left
        themeButton.Parent = settingsFrame
        Instance.new("UICorner", themeButton).CornerRadius = UDim.new(0,6)

        local themeOptions = {"Purple","Green","Ocean","Sunset","Midnight"}
        local themeIndex = table.find(themeOptions, currentSettings.theme) or 1

        themeButton.MouseButton1Click:Connect(function()
            themeIndex = themeIndex % #themeOptions + 1  -- cycle to next
            local newTheme = themeOptions[themeIndex]
            currentSettings.theme = newTheme
            themeButton.Text = "Theme: " .. newTheme
            updateUI()
        end)

        -- Re-style on theme update (keep button colors reactive)
        local originalUpdateUI = updateUI
        updateUI = function()
            originalUpdateUI()
            if themeButton then
                themeButton.BackgroundColor3 = Colors.Button
                themeButton.TextColor3 = Colors.Text
            end
        end

        createSlider(
            "🌑 Background Opacity",
            0,
            1,
            currentSettings.globalOpacity,
            90,
            function(value)
                currentSettings.globalOpacity = value
                updateUI()
            end
        )

        -- Replaced Notifications with FPS Boost
        createToggle("🚀 FPS Boost", 170, "fpsboost", settingsFrame)
        createToggle("💾 Save Settings", 210, "save", settingsFrame)
        createToggle("🔁 Auto Load Config", 250, "autoload", settingsFrame)

    else

        subtitleLabel.Text = "Features"

        local toggles = {
            "⚡ Speed Hack",
            "🕊️ Fly Hack",
            "👁️ Player ESP",
            "🎯 Teleport",
            "💨 Fast Walk"
        }

        for i,v in ipairs(toggles) do
            createToggle(v,(i-1)*40,v,togglesFrame)
        end
    end
end

-- SIDEBAR
local sections = {
    "Main",
    "Farm",
    "Extra",
    "PVP",
    "Shop",
    "Misc",
    "Settings"
}

for i,section in ipairs(sections) do

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1,-24,0,36)
    button.Position = UDim2.new(0,12,0,i*42)
    button.BackgroundColor3 = Colors.Button
    button.BackgroundTransparency = 0.25
    button.BorderSizePixel = 0
    button.Text = "  "..section
    button.TextColor3 = Colors.TextDim
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 12
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.Parent = sidebar

    Instance.new("UICorner",button).CornerRadius = UDim.new(0,6)

    table.insert(sidebarButtons,button)

    button.MouseEnter:Connect(function()

        if button ~= selectedButton then
            button.BackgroundTransparency = 0.1
        end
    end)

    button.MouseLeave:Connect(function()

        if button ~= selectedButton then
            button.BackgroundTransparency = 0.25
        end
    end)

    button.MouseButton1Click:Connect(function()

        if selectedButton then
            selectedButton.BackgroundColor3 = Colors.Button
            selectedButton.TextColor3 = Colors.TextDim
        end

        selectedButton = button

        button.BackgroundColor3 = Colors.Accent
        button.TextColor3 = Colors.Text

        loadSection(section)
    end)

    if i == 1 then
        selectedButton = button
        button.BackgroundColor3 = Colors.Accent
        button.TextColor3 = Colors.Text
        loadSection(section)
    end
end

-- VERSION
local versionLabel = Instance.new("TextLabel")
versionLabel.Size = UDim2.new(1,-24,0,20)
versionLabel.Position = UDim2.new(0,12,1,-28)
versionLabel.BackgroundTransparency = 1
versionLabel.Text = "v2.0.1 | Tweaked"
versionLabel.TextColor3 = Colors.TextDim
versionLabel.Font = Enum.Font.Gotham
versionLabel.TextSize = 9
versionLabel.Parent = sidebar

-- TOGGLE
UserInputService.InputBegan:Connect(function(input,gp)

    if gp then return end

    if input.KeyCode == Enum.KeyCode.RightControl then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

-- DRAGGING
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
print("🎨 Dynamic Theme System")
print("🌑 Background Opacity Working")
print("🖱️ Draggable UI Enabled")
print("📜 Scrollable UI Enabled")