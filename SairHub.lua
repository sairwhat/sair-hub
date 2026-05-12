-- SairHub v2 | Modern UI + Dropdown Themes + Unified Opacity
local startTime = tick()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Remove old UI
pcall(function()
    playerGui:FindFirstChild("SairHub"):Destroy()
end)

-- THEMES
local Themes = {

    Purple = {
        Background = Color3.fromRGB(25,23,36),
        Sidebar = Color3.fromRGB(30,28,46),
        Accent = Color3.fromRGB(189,147,249),
        Text = Color3.fromRGB(248,248,242),
        TextDim = Color3.fromRGB(180,175,210),
        Button = Color3.fromRGB(40,38,56),
        ToggleOn = Color3.fromRGB(80,250,123),
        ToggleOff = Color3.fromRGB(40,38,56),
        Close = Color3.fromRGB(255,85,85),
        ToggleOnText = Color3.fromRGB(0,0,0)
    },

    Green = {
        Background = Color3.fromRGB(20,30,20),
        Sidebar = Color3.fromRGB(25,38,25),
        Accent = Color3.fromRGB(80,250,123),
        Text = Color3.fromRGB(248,248,242),
        TextDim = Color3.fromRGB(170,210,170),
        Button = Color3.fromRGB(35,50,35),
        ToggleOn = Color3.fromRGB(80,250,123),
        ToggleOff = Color3.fromRGB(35,50,35),
        Close = Color3.fromRGB(255,85,85),
        ToggleOnText = Color3.fromRGB(0,0,0)
    },

    Ocean = {
        Background = Color3.fromRGB(13,27,42),
        Sidebar = Color3.fromRGB(18,34,52),
        Accent = Color3.fromRGB(33,158,188),
        Text = Color3.fromRGB(240,248,255),
        TextDim = Color3.fromRGB(150,190,220),
        Button = Color3.fromRGB(22,42,63),
        ToggleOn = Color3.fromRGB(42,157,143),
        ToggleOff = Color3.fromRGB(22,42,63),
        Close = Color3.fromRGB(255,85,85),
        ToggleOnText = Color3.fromRGB(0,0,0)
    },

    Sunset = {
        Background = Color3.fromRGB(40,25,25),
        Sidebar = Color3.fromRGB(50,32,32),
        Accent = Color3.fromRGB(255,140,0),
        Text = Color3.fromRGB(255,240,220),
        TextDim = Color3.fromRGB(220,180,150),
        Button = Color3.fromRGB(55,38,38),
        ToggleOn = Color3.fromRGB(255,180,50),
        ToggleOff = Color3.fromRGB(55,38,38),
        Close = Color3.fromRGB(255,85,85),
        ToggleOnText = Color3.fromRGB(0,0,0)
    },

    Midnight = {
        Background = Color3.fromRGB(10,10,25),
        Sidebar = Color3.fromRGB(15,15,35),
        Accent = Color3.fromRGB(98,114,230),
        Text = Color3.fromRGB(230,230,250),
        TextDim = Color3.fromRGB(150,150,200),
        Button = Color3.fromRGB(20,20,40),
        ToggleOn = Color3.fromRGB(80,200,120),
        ToggleOff = Color3.fromRGB(20,20,40),
        Close = Color3.fromRGB(255,85,85),
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
mainFrame.Size = UDim2.new(0,620,0,440)
mainFrame.Position = UDim2.new(0.5,-310,0.5,-220)
mainFrame.BackgroundColor3 = Colors.Background
mainFrame.BackgroundTransparency = 1 - currentSettings.globalOpacity
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0,10)

local stroke = Instance.new("UIStroke")
stroke.Color = Colors.Accent
stroke.Thickness = 1.5
stroke.Transparency = 0.2
stroke.Parent = mainFrame

-- TOPBAR
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1,0,0,38)
topBar.BackgroundColor3 = Colors.Sidebar
topBar.BackgroundTransparency = 1 - currentSettings.globalOpacity
topBar.BorderSizePixel = 0
topBar.Active = true
topBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-50,1,0)
title.Position = UDim2.new(0,18,0,0)
title.BackgroundTransparency = 1
title.Text = "🔥 SairHub v2"
title.TextColor3 = Colors.Accent
title.Font = Enum.Font.GothamBold
title.TextSize = 17
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

-- CLOSE BUTTON
local close = Instance.new("TextButton")
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,4)
close.BackgroundColor3 = Colors.Close
close.BackgroundTransparency = 0.3
close.Text = "✕"
close.TextColor3 = Colors.Text
close.Font = Enum.Font.GothamBold
close.TextSize = 14
close.BorderSizePixel = 0
close.Parent = topBar

Instance.new("UICorner", close).CornerRadius = UDim.new(0,8)

close.MouseButton1Click:Connect(function()
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

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1,-50,0,20)
subtitle.Position = UDim2.new(0,25,0,65)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Features"
subtitle.TextColor3 = Colors.TextDim
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 13
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = contentContainer

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1,-50,0,1)
divider.Position = UDim2.new(0,25,0,95)
divider.BackgroundColor3 = Colors.Accent
divider.BackgroundTransparency = 0.5
divider.BorderSizePixel = 0
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

-- UPDATE UI
local sidebarButtons = {}

local function updateUI()

    Colors = Themes[currentSettings.theme]

    mainFrame.BackgroundColor3 = Colors.Background
    mainFrame.BackgroundTransparency = 1 - currentSettings.globalOpacity

    topBar.BackgroundColor3 = Colors.Sidebar
    topBar.BackgroundTransparency = 1 - currentSettings.globalOpacity

    sidebar.BackgroundColor3 = Colors.Sidebar
    sidebar.BackgroundTransparency = 1 - currentSettings.globalOpacity

    title.TextColor3 = Colors.Accent
    sectionTitle.TextColor3 = Colors.Text
    subtitle.TextColor3 = Colors.TextDim
    divider.BackgroundColor3 = Colors.Accent
    stroke.Color = Colors.Accent

    scrollingFrame.ScrollBarImageColor3 = Colors.Accent

    for _,btn in pairs(sidebarButtons) do
        btn.BackgroundColor3 = Colors.Button

        if btn == selectedButton then
            btn.TextColor3 = Colors.Accent
        else
            btn.TextColor3 = Colors.TextDim
        end
    end
end

-- TOGGLE
local function createToggle(name,y,key,parent)

    toggleStorage[key] = toggleStorage[key] or false

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1,0,0,34)
    button.Position = UDim2.new(0,0,0,y)
    button.BackgroundColor3 = Colors.ToggleOff
    button.BackgroundTransparency = 0.2
    button.Text = "  "..name
    button.TextColor3 = Colors.TextDim
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 13
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.BorderSizePixel = 0
    button.Parent = parent

    Instance.new("UICorner",button).CornerRadius = UDim.new(0,6)

    button.MouseButton1Click:Connect(function()

        toggleStorage[key] = not toggleStorage[key]

        if toggleStorage[key] then
            button.BackgroundColor3 = Colors.ToggleOn
            button.TextColor3 = Colors.ToggleOnText
            button.Text = "  ✓ "..name
        else
            button.BackgroundColor3 = Colors.ToggleOff
            button.TextColor3 = Colors.TextDim
            button.Text = "  "..name
        end
    end)
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

        subtitle.Text = "Hub Configuration"

        -- THEME LABEL
        local themeLabel = Instance.new("TextLabel")
        themeLabel.Size = UDim2.new(1,0,0,20)
        themeLabel.Position = UDim2.new(0,0,0,10)
        themeLabel.BackgroundTransparency = 1
        themeLabel.Text = "🎨 Theme"
        themeLabel.TextColor3 = Colors.TextDim
        themeLabel.Font = Enum.Font.GothamMedium
        themeLabel.TextSize = 12
        themeLabel.TextXAlignment = Enum.TextXAlignment.Left
        themeLabel.Parent = settingsFrame

        -- DROPDOWN
        local dropdownFrame = Instance.new("Frame")
        dropdownFrame.Size = UDim2.new(1,0,0,34)
        dropdownFrame.Position = UDim2.new(0,0,0,35)
        dropdownFrame.BackgroundColor3 = Colors.Button
        dropdownFrame.BackgroundTransparency = 0.2
        dropdownFrame.BorderSizePixel = 0
        dropdownFrame.ClipsDescendants = true
        dropdownFrame.Parent = settingsFrame

        Instance.new("UICorner",dropdownFrame).CornerRadius = UDim.new(0,6)

        local dropdownOpen = false

        local dropdownButton = Instance.new("TextButton")
        dropdownButton.Size = UDim2.new(1,0,0,34)
        dropdownButton.BackgroundTransparency = 1
        dropdownButton.Text = "  ▼  "..currentSettings.theme
        dropdownButton.TextColor3 = Colors.Text
        dropdownButton.Font = Enum.Font.GothamMedium
        dropdownButton.TextSize = 13
        dropdownButton.TextXAlignment = Enum.TextXAlignment.Left
        dropdownButton.Parent = dropdownFrame

        local themes = {"Purple","Green","Ocean","Sunset","Midnight"}

        dropdownButton.MouseButton1Click:Connect(function()

            dropdownOpen = not dropdownOpen

            if dropdownOpen then
                dropdownFrame:TweenSize(
                    UDim2.new(1,0,0,34 + (#themes * 30)),
                    Enum.EasingDirection.Out,
                    Enum.EasingStyle.Quint,
                    0.2,
                    true
                )
            else
                dropdownFrame:TweenSize(
                    UDim2.new(1,0,0,34),
                    Enum.EasingDirection.Out,
                    Enum.EasingStyle.Quint,
                    0.2,
                    true
                )
            end
        end)

        for i,themeName in ipairs(themes) do

            local option = Instance.new("TextButton")
            option.Size = UDim2.new(1,0,0,30)
            option.Position = UDim2.new(0,0,0,34 + ((i-1)*30))
            option.BackgroundTransparency = 1
            option.Text = "   "..themeName
            option.TextColor3 = Colors.TextDim
            option.Font = Enum.Font.GothamMedium
            option.TextSize = 12
            option.TextXAlignment = Enum.TextXAlignment.Left
            option.Parent = dropdownFrame

            option.MouseButton1Click:Connect(function()

                currentSettings.theme = themeName

                dropdownButton.Text = "  ▼  "..themeName

                dropdownOpen = false

                dropdownFrame:TweenSize(
                    UDim2.new(1,0,0,34),
                    Enum.EasingDirection.Out,
                    Enum.EasingStyle.Quint,
                    0.2,
                    true
                )

                updateUI()
                loadSection("Settings")
            end)
        end

        -- OPACITY
        local opacityLabel = Instance.new("TextLabel")
        opacityLabel.Size = UDim2.new(1,0,0,20)
        opacityLabel.Position = UDim2.new(0,0,0,125)
        opacityLabel.BackgroundTransparency = 1
        opacityLabel.Text = "🌑 Background Opacity: "..math.floor(currentSettings.globalOpacity * 100).."%"
        opacityLabel.TextColor3 = Colors.TextDim
        opacityLabel.Font = Enum.Font.GothamMedium
        opacityLabel.TextSize = 12
        opacityLabel.TextXAlignment = Enum.TextXAlignment.Left
        opacityLabel.Parent = settingsFrame

        local sliderBar = Instance.new("Frame")
        sliderBar.Size = UDim2.new(1,0,0,8)
        sliderBar.Position = UDim2.new(0,0,0,155)
        sliderBar.BackgroundColor3 = Colors.Button
        sliderBar.BorderSizePixel = 0
        sliderBar.Parent = settingsFrame

        Instance.new("UICorner",sliderBar).CornerRadius = UDim.new(1,0)

        local fill = Instance.new("Frame")
        fill.Size = UDim2.new(currentSettings.globalOpacity,0,1,0)
        fill.BackgroundColor3 = Colors.Accent
        fill.BorderSizePixel = 0
        fill.Parent = sliderBar

        Instance.new("UICorner",fill).CornerRadius = UDim.new(1,0)

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
                    (input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X,
                    0,
                    1
                )

                currentSettings.globalOpacity = percent

                fill.Size = UDim2.new(percent,0,1,0)

                opacityLabel.Text =
                    "🌑 Background Opacity: "..math.floor(percent * 100).."%"

                updateUI()
            end
        end)

        -- SAVE + AUTOLOAD
        local function createMiniToggle(text,posX,key)

            toggleStorage[key] = toggleStorage[key] or false

            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0.48,0,0,34)
            button.Position = UDim2.new(posX,0,0,205)
            button.BackgroundColor3 = Colors.ToggleOff
            button.BackgroundTransparency = 0.2
            button.BorderSizePixel = 0
            button.Text = text
            button.TextColor3 = Colors.TextDim
            button.Font = Enum.Font.GothamMedium
            button.TextSize = 12
            button.Parent = settingsFrame

            Instance.new("UICorner",button).CornerRadius = UDim.new(0,6)

            button.MouseButton1Click:Connect(function()

                toggleStorage[key] = not toggleStorage[key]

                if toggleStorage[key] then
                    button.BackgroundColor3 = Colors.ToggleOn
                    button.TextColor3 = Colors.ToggleOnText
                    button.Text = "✓ "..text
                else
                    button.BackgroundColor3 = Colors.ToggleOff
                    button.TextColor3 = Colors.TextDim
                    button.Text = text
                end
            end)
        end

        createMiniToggle("💾 Save Config",0,"save")
        createMiniToggle("🔁 Auto Load",0.52,"autoload")

    else

        subtitle.Text = "Features"

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
    button.Font = Enum.Font.GothamBold
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
            selectedButton.BackgroundTransparency = 0.25
            selectedButton.TextColor3 = Colors.TextDim
        end

        selectedButton = button

        button.BackgroundTransparency = 0
        button.TextColor3 = Colors.Accent

        loadSection(section)
    end)

    if i == 1 then
        selectedButton = button
        button.BackgroundTransparency = 0
        button.TextColor3 = Colors.Accent
        loadSection(section)
    end
end

-- VERSION
local version = Instance.new("TextLabel")
version.Size = UDim2.new(1,-24,0,20)
version.Position = UDim2.new(0,12,1,-28)
version.BackgroundTransparency = 1
version.Text = "v2.0.0"
version.TextColor3 = Colors.TextDim
version.Font = Enum.Font.Gotham
version.TextSize = 9
version.Parent = sidebar

-- TOGGLE UI
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

print("✅ SairHub v2 Loaded")
print("🎨 Dropdown Themes Enabled")
print("🌑 Unified Background Opacity")
print("🖱️ Dragging Fixed")
print("📜 Scrollable UI Enabled")