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
        AccentLight = Color3.fromRGB(210, 175, 255),
        Text = Color3.fromRGB(248, 248, 242),
        TextDim = Color3.fromRGB(150, 148, 168),
        TextBright = Color3.fromRGB(255, 255, 255),
        Button = Color3.fromRGB(40, 38, 56),
        ToggleOn = Color3.fromRGB(80, 250, 123),
        ToggleOff = Color3.fromRGB(40, 38, 56),
        Close = Color3.fromRGB(255, 85, 85),
        ToggleOnText = Color3.fromRGB(0, 0, 0),
        CardBg = Color3.fromRGB(35, 33, 50),
        InputBg = Color3.fromRGB(45, 43, 60),
        SliderBg = Color3.fromRGB(50, 48, 65),
        SliderFill = Color3.fromRGB(189, 147, 249),
        Gradient1 = Color3.fromRGB(189, 147, 249),
        Gradient2 = Color3.fromRGB(130, 100, 200)
    },

    Green = {
        Background = Color3.fromRGB(15, 25, 15),
        Sidebar = Color3.fromRGB(20, 32, 20),
        Accent = Color3.fromRGB(80, 250, 123),
        AccentLight = Color3.fromRGB(130, 255, 160),
        Text = Color3.fromRGB(240, 255, 240),
        TextDim = Color3.fromRGB(140, 160, 140),
        TextBright = Color3.fromRGB(255, 255, 255),
        Button = Color3.fromRGB(30, 45, 30),
        ToggleOn = Color3.fromRGB(80, 250, 123),
        ToggleOff = Color3.fromRGB(30, 45, 30),
        Close = Color3.fromRGB(255, 85, 85),
        ToggleOnText = Color3.fromRGB(0, 0, 0),
        CardBg = Color3.fromRGB(24, 38, 24),
        InputBg = Color3.fromRGB(32, 48, 32),
        SliderBg = Color3.fromRGB(38, 55, 38),
        SliderFill = Color3.fromRGB(80, 250, 123),
        Gradient1 = Color3.fromRGB(80, 250, 123),
        Gradient2 = Color3.fromRGB(50, 180, 90)
    },

    Ocean = {
        Background = Color3.fromRGB(10, 22, 35),
        Sidebar = Color3.fromRGB(15, 28, 44),
        Accent = Color3.fromRGB(33, 158, 188),
        AccentLight = Color3.fromRGB(80, 190, 220),
        Text = Color3.fromRGB(240, 248, 255),
        TextDim = Color3.fromRGB(120, 155, 175),
        TextBright = Color3.fromRGB(255, 255, 255),
        Button = Color3.fromRGB(18, 35, 54),
        ToggleOn = Color3.fromRGB(42, 157, 143),
        ToggleOff = Color3.fromRGB(18, 35, 54),
        Close = Color3.fromRGB(255, 85, 85),
        ToggleOnText = Color3.fromRGB(0, 0, 0),
        CardBg = Color3.fromRGB(16, 32, 48),
        InputBg = Color3.fromRGB(22, 40, 58),
        SliderBg = Color3.fromRGB(26, 45, 65),
        SliderFill = Color3.fromRGB(33, 158, 188),
        Gradient1 = Color3.fromRGB(33, 158, 188),
        Gradient2 = Color3.fromRGB(20, 110, 140)
    },

    Sunset = {
        Background = Color3.fromRGB(35, 20, 20),
        Sidebar = Color3.fromRGB(44, 26, 26),
        Accent = Color3.fromRGB(255, 140, 0),
        AccentLight = Color3.fromRGB(255, 175, 60),
        Text = Color3.fromRGB(255, 240, 220),
        TextDim = Color3.fromRGB(180, 150, 130),
        TextBright = Color3.fromRGB(255, 255, 240),
        Button = Color3.fromRGB(50, 32, 32),
        ToggleOn = Color3.fromRGB(255, 180, 50),
        ToggleOff = Color3.fromRGB(50, 32, 32),
        Close = Color3.fromRGB(255, 85, 85),
        ToggleOnText = Color3.fromRGB(0, 0, 0),
        CardBg = Color3.fromRGB(50, 34, 34),
        InputBg = Color3.fromRGB(58, 42, 42),
        SliderBg = Color3.fromRGB(62, 48, 48),
        SliderFill = Color3.fromRGB(255, 140, 0),
        Gradient1 = Color3.fromRGB(255, 140, 0),
        Gradient2 = Color3.fromRGB(200, 100, 0)
    },

    Midnight = {
        Background = Color3.fromRGB(8, 8, 22),
        Sidebar = Color3.fromRGB(12, 12, 32),
        Accent = Color3.fromRGB(98, 114, 230),
        AccentLight = Color3.fromRGB(140, 155, 255),
        Text = Color3.fromRGB(230, 230, 250),
        TextDim = Color3.fromRGB(130, 130, 170),
        TextBright = Color3.fromRGB(255, 255, 255),
        Button = Color3.fromRGB(16, 16, 36),
        ToggleOn = Color3.fromRGB(80, 200, 120),
        ToggleOff = Color3.fromRGB(16, 16, 36),
        Close = Color3.fromRGB(255, 85, 85),
        ToggleOnText = Color3.fromRGB(0, 0, 0),
        CardBg = Color3.fromRGB(14, 14, 34),
        InputBg = Color3.fromRGB(20, 20, 42),
        SliderBg = Color3.fromRGB(24, 24, 48),
        SliderFill = Color3.fromRGB(98, 114, 230),
        Gradient1 = Color3.fromRGB(98, 114, 230),
        Gradient2 = Color3.fromRGB(60, 75, 180)
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
topBar.Size = UDim2.new(1, 0, 0, 38)
topBar.BackgroundColor3 = Colors.Sidebar
topBar.BackgroundTransparency = 1 - currentSettings.globalOpacity
topBar.BorderSizePixel = 0
topBar.Active = true
topBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -50, 1, 0)
titleLabel.Position = UDim2.new(0, 18, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔥 SairHub | Blox Fruits Utility"
titleLabel.TextColor3 = Colors.Accent
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 17
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = topBar

-- CLOSE
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 4)
closeButton.BackgroundColor3 = Colors.Close
closeButton.BackgroundTransparency = 0.35
closeButton.BorderSizePixel = 0
closeButton.Text = "✕"
closeButton.TextColor3 = Colors.Text
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.Parent = topBar

Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0, 8)

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
sidebar.Size = UDim2.new(0, 170, 1, -38)
sidebar.Position = UDim2.new(0, 0, 0, 38)
sidebar.BackgroundColor3 = Colors.Sidebar
sidebar.BackgroundTransparency = 1 - currentSettings.globalOpacity
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

-- SIDEBAR GRADIENT
local sidebarGradient = Instance.new("UIGradient")
sidebarGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Colors.Background),
                                           ColorSequenceKeypoint.new(1, Colors.Sidebar)})
sidebarGradient.Rotation = 90
sidebarGradient.Parent = sidebar

-- CONTENT
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -170, 1, -38)
contentArea.Position = UDim2.new(0, 170, 0, 38)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ScrollBarThickness = 4
scrollingFrame.ScrollBarImageColor3 = Colors.Accent
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 700)
scrollingFrame.Parent = contentArea

local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, 0, 1, 0)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = scrollingFrame

-- TITLES
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

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -50, 0, 1)
divider.Position = UDim2.new(0, 25, 0, 95)
divider.BackgroundColor3 = Colors.Accent
divider.BackgroundTransparency = 0.5
divider.BorderSizePixel = 0
divider.Parent = contentContainer

-- FRAMES
local togglesFrame = Instance.new("Frame")
togglesFrame.Size = UDim2.new(1, -50, 0, 500)
togglesFrame.Position = UDim2.new(0, 25, 0, 110)
togglesFrame.BackgroundTransparency = 1
togglesFrame.Parent = contentContainer

local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(1, -50, 0, 500)
settingsFrame.Position = UDim2.new(0, 25, 0, 110)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false
settingsFrame.Parent = contentContainer

local toggleStorage = {}
local selectedButton
local sidebarButtons = {}

-- TOGGLE CREATOR (Enhanced)
local function createToggle(name, y, key, parent)
    toggleStorage[key] = toggleStorage[key] or false

    local toggleContainer = Instance.new("Frame")
    toggleContainer.Size = UDim2.new(1, 0, 0, 40)
    toggleContainer.Position = UDim2.new(0, 0, 0, y)
    toggleContainer.BackgroundTransparency = 1
    toggleContainer.Parent = parent

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 36)
    button.Position = UDim2.new(0, 0, 0, 2)
    button.BackgroundColor3 = Colors.ToggleOff
    button.BackgroundTransparency = 0.25
    button.BorderSizePixel = 0
    button.Text = ""
    button.Parent = toggleContainer

    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

    local buttonGradient = Instance.new("UIGradient")
    buttonGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Colors.ToggleOff),
                                              ColorSequenceKeypoint.new(1, Colors.Button)})
    buttonGradient.Rotation = 45
    buttonGradient.Parent = button

    local iconLabel = Instance.new("TextLabel")
    iconLabel.Size = UDim2.new(0, 30, 0, 30)
    iconLabel.Position = UDim2.new(0, 8, 0, 3)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Text = "○"
    iconLabel.TextColor3 = Colors.TextDim
    iconLabel.Font = Enum.Font.GothamBold
    iconLabel.TextSize = 16
    iconLabel.Parent = toggleContainer

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, -50, 1, 0)
    nameLabel.Position = UDim2.new(0, 42, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.TextColor3 = Colors.TextDim
    nameLabel.Font = Enum.Font.GothamMedium
    nameLabel.TextSize = 13
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Parent = toggleContainer

    button.MouseEnter:Connect(function()
        button.BackgroundTransparency = 0.1
    end)

    button.MouseLeave:Connect(function()
        if toggleStorage[key] then
            button.BackgroundTransparency = 0.05
        else
            button.BackgroundTransparency = 0.25
        end
    end)

    button.MouseButton1Click:Connect(function()
        toggleStorage[key] = not toggleStorage[key]

        if toggleStorage[key] then
            button.BackgroundColor3 = Colors.ToggleOn
            buttonGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Colors.ToggleOn),
                                                      ColorSequenceKeypoint.new(1, Colors.Accent)})
            iconLabel.Text = "●"
            iconLabel.TextColor3 = Colors.TextBright
            nameLabel.TextColor3 = Colors.TextBright
            button.BackgroundTransparency = 0.05

            local glow = Instance.new("UIStroke")
            glow.Color = Colors.AccentLight
            glow.Thickness = 1.5
            glow.Transparency = 0.5
            glow.Parent = button
            game:GetService("Debris"):AddItem(glow, 0.1)
        else
            button.BackgroundColor3 = Colors.ToggleOff
            buttonGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Colors.ToggleOff),
                                                      ColorSequenceKeypoint.new(1, Colors.Button)})
            iconLabel.Text = "○"
            iconLabel.TextColor3 = Colors.TextDim
            nameLabel.TextColor3 = Colors.TextDim
            button.BackgroundTransparency = 0.25
        end
    end)
end

-- CREATE CARD
local function createCard(y, height)
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, 0, 0, height)
    card.Position = UDim2.new(0, 0, 0, y)
    card.BackgroundColor3 = Colors.CardBg
    card.BackgroundTransparency = 0.4
    card.BorderSizePixel = 0
    card.ClipsDescendants = true
    card.Parent = settingsFrame

    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)

    local cardGradient = Instance.new("UIGradient")
    cardGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Colors.CardBg),
                                            ColorSequenceKeypoint.new(1, Colors.Background)})
    cardGradient.Rotation = -45
    cardGradient.Parent = card

    local stroke = Instance.new("UIStroke")
    stroke.Color = Colors.Accent
    stroke.Thickness = 1
    stroke.Transparency = 0.7
    stroke.Parent = card

    return card, cardGradient, stroke
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

    sidebarGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Colors.Background),
                                               ColorSequenceKeypoint.new(1, Colors.Sidebar)})

    uiStroke.Color = Colors.Accent
    divider.BackgroundColor3 = Colors.Accent
    titleLabel.TextColor3 = Colors.Accent
    sectionTitle.TextColor3 = Colors.Text
    subtitleLabel.TextColor3 = Colors.TextDim
    scrollingFrame.ScrollBarImageColor3 = Colors.Accent

    for _, button in pairs(sidebarButtons) do
        if button == selectedButton then
            button.BackgroundColor3 = Colors.Accent
            button.TextColor3 = Colors.TextBright
            if button:FindFirstChild("UIGradient") then
                button:FindFirstChild("UIGradient").Color = ColorSequence.new({ColorSequenceKeypoint.new(0,
                    Colors.Accent), ColorSequenceKeypoint.new(1, Colors.AccentLight)})
            end
        else
            button.BackgroundColor3 = Colors.Button
            button.TextColor3 = Colors.TextDim
            if button:FindFirstChild("UIGradient") then
                button:FindFirstChild("UIGradient").Color = ColorSequence.new({ColorSequenceKeypoint.new(0,
                    Colors.Button), ColorSequenceKeypoint.new(1, Colors.Background)})
            end
        end
    end
end

-- CLEAR
local function clearFrames()
    for _, v in pairs(togglesFrame:GetChildren()) do
        v:Destroy()
    end
    for _, v in pairs(settingsFrame:GetChildren()) do
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
        subtitleLabel.Text = "⚙️ Hub Configuration"

        -- ═══════════ APPEARANCE CARD ═══════════
        local appearanceCard, cardGrad1, cardStroke1 = createCard(0, 170)

        local cardHeader1 = Instance.new("Frame")
        cardHeader1.Size = UDim2.new(1, 0, 0, 4)
        cardHeader1.Position = UDim2.new(0, 0, 0, 0)
        cardHeader1.BackgroundColor3 = Colors.Accent
        cardHeader1.BorderSizePixel = 0
        cardHeader1.Parent = appearanceCard

        local cardTitle1 = Instance.new("TextLabel")
        cardTitle1.Size = UDim2.new(1, -20, 0, 25)
        cardTitle1.Position = UDim2.new(0, 15, 0, 12)
        cardTitle1.BackgroundTransparency = 1
        cardTitle1.Text = "🎨 APPEARANCE"
        cardTitle1.TextColor3 = Colors.Accent
        cardTitle1.Font = Enum.Font.GothamBlack
        cardTitle1.TextSize = 14
        cardTitle1.TextXAlignment = Enum.TextXAlignment.Left
        cardTitle1.Parent = appearanceCard

        local cardDiv1 = Instance.new("Frame")
        cardDiv1.Size = UDim2.new(1, -30, 0, 1)
        cardDiv1.Position = UDim2.new(0, 15, 0, 40)
        cardDiv1.BackgroundColor3 = Colors.Accent
        cardDiv1.BackgroundTransparency = 0.8
        cardDiv1.BorderSizePixel = 0
        cardDiv1.Parent = appearanceCard

        -- Theme selector label
        local themeLabel = Instance.new("TextLabel")
        themeLabel.Size = UDim2.new(0, 130, 0, 20)
        themeLabel.Position = UDim2.new(0, 20, 0, 50)
        themeLabel.BackgroundTransparency = 1
        themeLabel.Text = "🎯 Theme Color"
        themeLabel.TextColor3 = Colors.TextDim
        themeLabel.Font = Enum.Font.GothamBold
        themeLabel.TextSize = 11
        themeLabel.TextXAlignment = Enum.TextXAlignment.Left
        themeLabel.Parent = appearanceCard

        -- Theme preview dot
        local themeDot = Instance.new("Frame")
        themeDot.Size = UDim2.new(0, 10, 0, 10)
        themeDot.Position = UDim2.new(0, 140, 0, 55)
        themeDot.BackgroundColor3 = Colors.Accent
        themeDot.BorderSizePixel = 0
        themeDot.Parent = appearanceCard
        Instance.new("UICorner", themeDot).CornerRadius = UDim.new(1, 0)

        -- Theme button
        local themeButton = Instance.new("TextButton")
        themeButton.Size = UDim2.new(1, -30, 0, 38)
        themeButton.Position = UDim2.new(0, 15, 0, 75)
        themeButton.BackgroundColor3 = Colors.InputBg
        themeButton.BackgroundTransparency = 0.3
        themeButton.BorderSizePixel = 0
        themeButton.Text = ""
        themeButton.Parent = appearanceCard
        Instance.new("UICorner", themeButton).CornerRadius = UDim.new(0, 8)

        local themeBtnGrad = Instance.new("UIGradient")
        themeBtnGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Colors.Accent),
                                                ColorSequenceKeypoint.new(1, Colors.Gradient2)})
        themeBtnGrad.Rotation = 90
        themeBtnGrad.Parent = themeButton

        local themeBtnText = Instance.new("TextLabel")
        themeBtnText.Size = UDim2.new(1, 0, 1, 0)
        themeBtnText.BackgroundTransparency = 1
        themeBtnText.Text = "  " .. currentSettings.theme .. " Theme"
        themeBtnText.TextColor3 = Colors.TextBright
        themeBtnText.Font = Enum.Font.GothamBold
        themeBtnText.TextSize = 14
        themeBtnText.TextXAlignment = Enum.TextXAlignment.Left
        themeBtnText.Parent = themeButton

        local themeArrow = Instance.new("TextLabel")
        themeArrow.Size = UDim2.new(0, 20, 1, 0)
        themeArrow.Position = UDim2.new(1, -25, 0, 0)
        themeArrow.BackgroundTransparency = 1
        themeArrow.Text = "↻"
        themeArrow.TextColor3 = Colors.TextBright
        themeArrow.Font = Enum.Font.GothamBold
        themeArrow.TextSize = 18
        themeArrow.Parent = themeButton

        local themeOptions = {"Purple", "Green", "Ocean", "Sunset", "Midnight"}
        local themeIndex = table.find(themeOptions, currentSettings.theme) or 1

        themeButton.MouseButton1Click:Connect(function()
            themeIndex = themeIndex % #themeOptions + 1
            local newTheme = themeOptions[themeIndex]
            currentSettings.theme = newTheme
            themeBtnText.Text = "  " .. newTheme .. " Theme"
            themeDot.BackgroundColor3 = Themes[newTheme].Accent
            themeBtnGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Themes[newTheme].Accent),
                                                    ColorSequenceKeypoint.new(1, Themes[newTheme].Gradient2)})
            updateUI()
        end)

        -- Background Opacity
        local opacitySection = Instance.new("Frame")
        opacitySection.Size = UDim2.new(1, -30, 0, 40)
        opacitySection.Position = UDim2.new(0, 15, 0, 122)
        opacitySection.BackgroundTransparency = 1
        opacitySection.Parent = appearanceCard

        local opacityLabel = Instance.new("TextLabel")
        opacityLabel.Size = UDim2.new(0, 150, 0, 18)
        opacityLabel.Position = UDim2.new(0, 5, 0, 0)
        opacityLabel.BackgroundTransparency = 1
        opacityLabel.Text = "🌑 Opacity"
        opacityLabel.TextColor3 = Colors.TextDim
        opacityLabel.Font = Enum.Font.GothamBold
        opacityLabel.TextSize = 11
        opacityLabel.TextXAlignment = Enum.TextXAlignment.Left
        opacityLabel.Parent = opacitySection

        local opacityValue = Instance.new("TextLabel")
        opacityValue.Size = UDim2.new(0, 50, 0, 18)
        opacityValue.Position = UDim2.new(1, -55, 0, 0)
        opacityValue.BackgroundTransparency = 1
        opacityValue.Text = math.floor(currentSettings.globalOpacity * 100) .. "%"
        opacityValue.TextColor3 = Colors.Accent
        opacityValue.Font = Enum.Font.GothamBold
        opacityValue.TextSize = 12
        opacityValue.TextXAlignment = Enum.TextXAlignment.Right
        opacityValue.Parent = opacitySection

        local opacitySlider = Instance.new("Frame")
        opacitySlider.Size = UDim2.new(1, -10, 0, 6)
        opacitySlider.Position = UDim2.new(0, 5, 0, 25)
        opacitySlider.BackgroundColor3 = Colors.SliderBg
        opacitySlider.BorderSizePixel = 0
        opacitySlider.Parent = opacitySection
        Instance.new("UICorner", opacitySlider).CornerRadius = UDim.new(1, 0)

        local opacityFill = Instance.new("Frame")
        opacityFill.Size = UDim2.new(currentSettings.globalOpacity, 0, 1, 0)
        opacityFill.BackgroundColor3 = Colors.SliderFill
        opacityFill.BorderSizePixel = 0
        opacityFill.Parent = opacitySlider
        Instance.new("UICorner", opacityFill).CornerRadius = UDim.new(1, 0)

        local opacityGradient = Instance.new("UIGradient")
        opacityGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Colors.Gradient1),
                                                   ColorSequenceKeypoint.new(1, Colors.Gradient2)})
        opacityGradient.Parent = opacityFill

        local opacityKnob = Instance.new("Frame")
        opacityKnob.Size = UDim2.new(0, 14, 0, 14)
        opacityKnob.Position = UDim2.new(currentSettings.globalOpacity, -7, 0, -4)
        opacityKnob.BackgroundColor3 = Colors.AccentLight
        opacityKnob.BorderSizePixel = 0
        opacityKnob.Parent = opacitySlider
        Instance.new("UICorner", opacityKnob).CornerRadius = UDim.new(1, 0)

        local knobStroke = Instance.new("UIStroke")
        knobStroke.Color = Colors.TextBright
        knobStroke.Thickness = 2
        knobStroke.Transparency = 0.3
        knobStroke.Parent = opacityKnob

        local draggingOpacity = false

        opacitySlider.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                draggingOpacity = true
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                draggingOpacity = false
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if draggingOpacity and input.UserInputType == Enum.UserInputType.MouseMovement then
                local percent = math.clamp((input.Position.X - opacitySlider.AbsolutePosition.X) /
                                               opacitySlider.AbsoluteSize.X, 0, 1)
                opacityFill.Size = UDim2.new(percent, 0, 1, 0)
                opacityKnob.Position = UDim2.new(percent, -7, 0, -4)
                opacityValue.Text = math.floor(percent * 100) .. "%"
                currentSettings.globalOpacity = percent
                updateUI()
            end
        end)

        -- ═══════════ FEATURES CARD ═══════════
        local featuresCard, cardGrad2, cardStroke2 = createCard(185, 185)

        local cardHeader2 = Instance.new("Frame")
        cardHeader2.Size = UDim2.new(1, 0, 0, 4)
        cardHeader2.Position = UDim2.new(0, 0, 0, 0)
        cardHeader2.BackgroundColor3 = Colors.Accent
        cardHeader2.BorderSizePixel = 0
        cardHeader2.Parent = featuresCard

        local cardTitle2 = Instance.new("TextLabel")
        cardTitle2.Size = UDim2.new(1, -20, 0, 25)
        cardTitle2.Position = UDim2.new(0, 15, 0, 12)
        cardTitle2.BackgroundTransparency = 1
        cardTitle2.Text = "⚡ FEATURES"
        cardTitle2.TextColor3 = Colors.Accent
        cardTitle2.Font = Enum.Font.GothamBlack
        cardTitle2.TextSize = 14
        cardTitle2.TextXAlignment = Enum.TextXAlignment.Left
        cardTitle2.Parent = featuresCard

        local cardDiv2 = Instance.new("Frame")
        cardDiv2.Size = UDim2.new(1, -30, 0, 1)
        cardDiv2.Position = UDim2.new(0, 15, 0, 40)
        cardDiv2.BackgroundColor3 = Colors.Accent
        cardDiv2.BackgroundTransparency = 0.8
        cardDiv2.BorderSizePixel = 0
        cardDiv2.Parent = featuresCard

        createToggle("🚀 FPS Boost", 50, "fpsboost", featuresCard)
        createToggle("💾 Save Settings", 95, "save", featuresCard)
        createToggle("🔁 Auto Load Config", 140, "autoload", featuresCard)

    else
        subtitleLabel.Text = "Features"
        local toggles = {"⚡ Speed Hack", "🕊️ Fly Hack", "👁️ Player ESP", "🎯 Teleport", "💨 Fast Walk"}
        for i, v in ipairs(toggles) do
            createToggle(v, (i - 1) * 43, v, togglesFrame)
        end
    end
end

-- SIDEBAR WITH ICONS
local sections = {{
    name = "Main",
    icon = "🏠"
}, {
    name = "Farm",
    icon = "🌾"
}, {
    name = "Extra",
    icon = "➕"
}, {
    name = "PVP",
    icon = "⚔️"
}, {
    name = "Shop",
    icon = "🛒"
}, {
    name = "Misc",
    icon = "📦"
}, {
    name = "Settings",
    icon = "⚙️"
}}

for i, section in ipairs(sections) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -24, 0, 38)
    button.Position = UDim2.new(0, 12, 0, i * 44 - 32)
    button.BackgroundColor3 = Colors.Button
    button.BackgroundTransparency = 0.25
    button.BorderSizePixel = 0
    button.Text = ""
    button.Parent = sidebar
    Instance.new("UICorner", button).CornerRadius = UDim.new(0, 8)

    local btnGradient = Instance.new("UIGradient")
    btnGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Colors.Button),
                                           ColorSequenceKeypoint.new(1, Colors.Background)})
    btnGradient.Rotation = 45
    btnGradient.Parent = button

    local btnIcon = Instance.new("TextLabel")
    btnIcon.Size = UDim2.new(0, 24, 1, 0)
    btnIcon.Position = UDim2.new(0, 8, 0, 0)
    btnIcon.BackgroundTransparency = 1
    btnIcon.Text = section.icon
    btnIcon.TextSize = 14
    btnIcon.Parent = button

    local btnText = Instance.new("TextLabel")
    btnText.Size = UDim2.new(1, -40, 1, 0)
    btnText.Position = UDim2.new(0, 32, 0, 0)
    btnText.BackgroundTransparency = 1
    btnText.Text = section.name
    btnText.TextColor3 = Colors.TextDim
    btnText.Font = Enum.Font.GothamMedium
    btnText.TextSize = 12
    btnText.TextXAlignment = Enum.TextXAlignment.Left
    btnText.Parent = button

    table.insert(sidebarButtons, button)

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
            if selectedButton:FindFirstChild("UIGradient") then
                selectedButton:FindFirstChild("UIGradient").Color =
                    ColorSequence.new({ColorSequenceKeypoint.new(0, Colors.Button),
                                       ColorSequenceKeypoint.new(1, Colors.Background)})
            end
            for _, child in pairs(selectedButton:GetChildren()) do
                if child:IsA("TextLabel") then
                    child.TextColor3 = Colors.TextDim
                end
            end
        end

        selectedButton = button
        button.BackgroundColor3 = Colors.Accent
        button.BackgroundTransparency = 0.1

        if button:FindFirstChild("UIGradient") then
            button:FindFirstChild("UIGradient").Color = ColorSequence.new(
                {ColorSequenceKeypoint.new(0, Colors.Accent), ColorSequenceKeypoint.new(1, Colors.AccentLight)})
        end

        for _, child in pairs(button:GetChildren()) do
            if child:IsA("TextLabel") then
                child.TextColor3 = Colors.TextBright
            end
        end

        loadSection(section.name)
    end)

    if i == 1 then
        selectedButton = button
        button.BackgroundColor3 = Colors.Accent
        button.BackgroundTransparency = 0.1

        if button:FindFirstChild("UIGradient") then
            button:FindFirstChild("UIGradient").Color = ColorSequence.new(
                {ColorSequenceKeypoint.new(0, Colors.Accent), ColorSequenceKeypoint.new(1, Colors.AccentLight)})
        end

        for _, child in pairs(button:GetChildren()) do
            if child:IsA("TextLabel") then
                child.TextColor3 = Colors.TextBright
            end
        end

        loadSection(section.name)
    end
end

-- VERSION
local versionLabel = Instance.new("TextLabel")
versionLabel.Size = UDim2.new(1, -24, 0, 20)
versionLabel.Position = UDim2.new(0, 12, 1, -28)
versionLabel.BackgroundTransparency = 1
versionLabel.Text = "v2.2.0 | Premium UI"
versionLabel.TextColor3 = Colors.TextDim
versionLabel.Font = Enum.Font.GothamBold
versionLabel.TextSize = 9
versionLabel.Parent = sidebar

-- TOGGLE
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then
        return
    end
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
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale,
            startPos.Y.Offset + delta.Y)
    end
end)

print("✅ SairHub Loaded - Premium Edition")
print("🎨 Dynamic Theme System with Gradients")
print("🌑 Interactive Opacity Slider with Knob")
print("🖱️ Draggable UI Enabled")
print("📜 Scrollable UI with Cards")
