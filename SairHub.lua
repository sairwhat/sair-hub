-- SairHub v2 | Enhanced UI with Theme System + Settings
local startTime = tick()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

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

-- Current Settings
local currentSettings = {
    theme = "Purple",
    backgroundOpacity = 0.15,
    sidebarOpacity = 0.0
}

local Colors = Themes[currentSettings.theme]

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SairHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Main Container
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 420)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -210)
mainFrame.BackgroundColor3 = Colors.Background
mainFrame.BackgroundTransparency = currentSettings.backgroundOpacity
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.Active = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Border
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Colors.Accent
uiStroke.Thickness = 1.5
uiStroke.Transparency = 0.3
uiStroke.Parent = mainFrame

-- Corner Rounding
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = mainFrame

-- Top Bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 35)
topBar.BackgroundColor3 = Colors.Sidebar
topBar.BackgroundTransparency = currentSettings.sidebarOpacity
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 8)
topCorner.Parent = topBar

-- Title with Icon
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔥 SairHub v2"
titleLabel.TextColor3 = Colors.Accent
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = topBar

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 28, 0, 28)
closeButton.Position = UDim2.new(1, -32, 0, 3.5)
closeButton.BackgroundColor3 = Colors.Close
closeButton.BackgroundTransparency = 0.6
closeButton.BorderSizePixel = 0
closeButton.Text = "✕"
closeButton.TextColor3 = Colors.Text
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.AutoButtonColor = false
closeButton.Parent = topBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundTransparency = 0.2
end)
closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundTransparency = 0.6
end)
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 160, 1, -35)
sidebar.Position = UDim2.new(0, 0, 0, 35)
sidebar.BackgroundColor3 = Colors.Sidebar
sidebar.BackgroundTransparency = currentSettings.sidebarOpacity
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

local sidebarCorner = Instance.new("UICorner")
sidebarCorner.CornerRadius = UDim.new(0, 8)
sidebarCorner.Parent = sidebar

-- Sidebar Logo/Header
local sidebarHeader = Instance.new("TextLabel")
sidebarHeader.Size = UDim2.new(1, 0, 0, 25)
sidebarHeader.Position = UDim2.new(0, 0, 0, 8)
sidebarHeader.BackgroundTransparency = 1
sidebarHeader.Text = "NAVIGATION"
sidebarHeader.TextColor3 = Colors.TextDim
sidebarHeader.Font = Enum.Font.GothamBold
sidebarHeader.TextSize = 10
sidebarHeader.TextXAlignment = Enum.TextXAlignment.Center
sidebarHeader.Parent = sidebar

local navDivider = Instance.new("Frame")
navDivider.Size = UDim2.new(1, -30, 0, 1)
navDivider.Position = UDim2.new(0, 15, 0, 38)
navDivider.BackgroundColor3 = Colors.Accent
navDivider.BackgroundTransparency = 0.7
navDivider.BorderSizePixel = 0
navDivider.Parent = sidebar

-- Content Area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -160, 1, -35)
contentArea.Position = UDim2.new(0, 160, 0, 35)
contentArea.BackgroundTransparency = 1
contentArea.ClipsDescendants = true
contentArea.Parent = mainFrame

-- Section Title
local sectionTitle = Instance.new("TextLabel")
sectionTitle.Size = UDim2.new(1, -40, 0, 55)
sectionTitle.Position = UDim2.new(0, 25, 0, 15)
sectionTitle.BackgroundTransparency = 1
sectionTitle.Text = "MAIN"
sectionTitle.TextColor3 = Colors.Text
sectionTitle.Font = Enum.Font.GothamBlack
sectionTitle.TextSize = 40
sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
sectionTitle.TextTransparency = 0.1
sectionTitle.Parent = contentArea

-- Subtitle
local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, -40, 0, 20)
subtitleLabel.Position = UDim2.new(0, 25, 0, 72)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Main Features"
subtitleLabel.TextColor3 = Colors.TextDim
subtitleLabel.Font = Enum.Font.GothamMedium
subtitleLabel.TextSize = 13
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.Parent = contentArea

-- Divider
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -50, 0, 1)
divider.Position = UDim2.new(0, 25, 0, 100)
divider.BackgroundColor3 = Colors.Accent
divider.BackgroundTransparency = 0.7
divider.BorderSizePixel = 0
divider.Parent = contentArea

-- Toggles Container
local togglesFrame = Instance.new("Frame")
togglesFrame.Size = UDim2.new(1, -50, 1, -110)
togglesFrame.Position = UDim2.new(0, 25, 0, 110)
togglesFrame.BackgroundTransparency = 1
togglesFrame.Parent = contentArea

-- Settings Container (special setup for settings page)
local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(1, -50, 1, -110)
settingsFrame.Position = UDim2.new(0, 25, 0, 110)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false
settingsFrame.Parent = contentArea

-- Toggle storage
local toggleStorage = {}
local selectedButton = nil

-- Template for regular toggles
local buttonTemplate = Instance.new("TextButton")
buttonTemplate.BackgroundTransparency = 0.3
buttonTemplate.BorderSizePixel = 0
buttonTemplate.Font = Enum.Font.GothamMedium
buttonTemplate.TextSize = 13
buttonTemplate.TextXAlignment = Enum.TextXAlignment.Left
buttonTemplate.AutoButtonColor = false

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner.Parent = buttonTemplate

-- Create Content Toggle
local function createContentToggle(name, yPosition, toggleKey, parent)
    if toggleStorage[toggleKey] == nil then
        toggleStorage[toggleKey] = false
    end
    
    local button = buttonTemplate:Clone()
    button.Size = UDim2.new(1, 0, 0, 32)
    button.Position = UDim2.new(0, 0, 0, yPosition)
    button.BackgroundColor3 = Colors.ToggleOff
    button.Text = "  " .. name
    button.TextColor3 = Colors.TextDim
    button.Parent = parent or togglesFrame
    
    button.MouseButton1Click:Connect(function()
        toggleStorage[toggleKey] = not toggleStorage[toggleKey]
        
        if toggleStorage[toggleKey] then
            button.BackgroundColor3 = Colors.ToggleOn
            button.BackgroundTransparency = 0.15
            button.TextColor3 = Colors.ToggleOnText
            button.Text = "  ✓  " .. name
        else
            button.BackgroundColor3 = Colors.ToggleOff
            button.BackgroundTransparency = 0.3
            button.TextColor3 = Colors.TextDim
            button.Text = "  " .. name
        end
    end)
    
    return button
end

-- Create Dropdown (for settings)
local function createDropdown(label, options, currentValue, yPosition, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 65)
    container.Position = UDim2.new(0, 0, 0, yPosition)
    container.BackgroundTransparency = 1
    container.Parent = settingsFrame
    
    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(1, 0, 0, 22)
    labelText.BackgroundTransparency = 1
    labelText.Text = label
    labelText.TextColor3 = Colors.TextDim
    labelText.Font = Enum.Font.GothamMedium
    labelText.TextSize = 12
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = container
    
    local dropdown = Instance.new("TextButton")
    dropdown.Size = UDim2.new(1, 0, 0, 32)
    dropdown.Position = UDim2.new(0, 0, 0, 27)
    dropdown.BackgroundColor3 = Colors.Button
    dropdown.BackgroundTransparency = 0.3
    dropdown.BorderSizePixel = 0
    dropdown.Text = "  ▼  " .. currentValue
    dropdown.TextColor3 = Colors.Text
    dropdown.Font = Enum.Font.GothamMedium
    dropdown.TextSize = 13
    dropdown.TextXAlignment = Enum.TextXAlignment.Left
    dropdown.AutoButtonColor = false
    dropdown.Parent = container
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 6)
    dropdownCorner.Parent = dropdown
    
    local optionsFrame = Instance.new("Frame")
    optionsFrame.Size = UDim2.new(1, 0, 0, 0)
    optionsFrame.Position = UDim2.new(0, 0, 1, 3)
    optionsFrame.BackgroundColor3 = Colors.Button
    optionsFrame.BackgroundTransparency = 1
    optionsFrame.BorderSizePixel = 0
    optionsFrame.ClipsDescendants = true
    optionsFrame.Visible = false
    optionsFrame.ZIndex = 10
    optionsFrame.Parent = container
    
    local optionsCorner = Instance.new("UICorner")
    optionsCorner.CornerRadius = UDim.new(0, 6)
    optionsCorner.Parent = optionsFrame
    
    -- Add options
    local optionButtons = {}
    for i, option in ipairs(options) do
        local optionBtn = Instance.new("TextButton")
        optionBtn.Size = UDim2.new(1, 0, 0, 28)
        optionBtn.Position = UDim2.new(0, 0, 0, (i-1) * 28)
        optionBtn.BackgroundColor3 = Colors.Button
        optionBtn.BackgroundTransparency = (option == currentValue) and 0.2 or 0.3
        optionBtn.BorderSizePixel = 0
        optionBtn.Text = (option == currentValue) and "  ✓  " .. option or "  " .. option
        optionBtn.TextColor3 = (option == currentValue) and Colors.Accent or Colors.TextDim
        optionBtn.Font = Enum.Font.GothamMedium
        optionBtn.TextSize = 12
        optionBtn.TextXAlignment = Enum.TextXAlignment.Left
        optionBtn.AutoButtonColor = false
        optionBtn.ZIndex = 10
        optionBtn.Parent = optionsFrame
        
        optionBtn.MouseEnter:Connect(function()
            if option ~= currentValue then
                optionBtn.BackgroundTransparency = 0.2
            end
        end)
        optionBtn.MouseLeave:Connect(function()
            if option ~= currentValue then
                optionBtn.BackgroundTransparency = 0.3
            end
        end)
        
        optionBtn.MouseButton1Click:Connect(function()
            dropdown.Text = "  ▼  " .. option
            optionsFrame.Visible = false
            if callback then
                callback(option)
            end
        end)
        
        table.insert(optionButtons, optionBtn)
    end
    
    dropdown.MouseButton1Click:Connect(function()
        optionsFrame.Size = UDim2.new(1, 0, 0, #options * 28)
        optionsFrame.Visible = not optionsFrame.Visible
    end)
    
    return container
end

-- Create Slider
local function createSlider(label, min, max, currentValue, yPosition, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 65)
    container.Position = UDim2.new(0, 0, 0, yPosition)
    container.BackgroundTransparency = 1
    container.Parent = settingsFrame
    
    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(1, 0, 0, 22)
    labelText.BackgroundTransparency = 1
    labelText.Text = label .. ": " .. string.format("%.2f", currentValue)
    labelText.TextColor3 = Colors.TextDim
    labelText.Font = Enum.Font.GothamMedium
    labelText.TextSize = 12
    labelText.TextXAlignment = Enum.TextXAlignment.Left
    labelText.Parent = container
    
    local sliderBar = Instance.new("Frame")
    sliderBar.Size = UDim2.new(1, 0, 0, 8)
    sliderBar.Position = UDim2.new(0, 0, 0, 32)
    sliderBar.BackgroundColor3 = Colors.Button
    sliderBar.BackgroundTransparency = 0.3
    sliderBar.BorderSizePixel = 0
    sliderBar.Parent = container
    
    local sliderCorner = Instance.new("UICorner")
    sliderCorner.CornerRadius = UDim.new(1, 0)
    sliderCorner.Parent = sliderBar
    
    local fill = Instance.new("Frame")
    local percentage = (currentValue - min) / (max - min)
    fill.Size = UDim2.new(percentage, 0, 1, 0)
    fill.BackgroundColor3 = Colors.Accent
    fill.BackgroundTransparency = 0.2
    fill.BorderSizePixel = 0
    fill.Parent = sliderBar
    
    local fillCorner = Instance.new("UICorner")
    fillCorner.CornerRadius = UDim.new(1, 0)
    fillCorner.Parent = fill
    
    local knob = Instance.new("TextButton")
    knob.Size = UDim2.new(0, 18, 0, 18)
    knob.Position = UDim2.new(percentage, -9, 0.5, -9)
    knob.BackgroundColor3 = Colors.Accent
    knob.BackgroundTransparency = 0
    knob.BorderSizePixel = 0
    knob.Text = ""
    knob.AutoButtonColor = false
    knob.Parent = container
    
    local knobCorner = Instance.new("UICorner")
    knobCorner.CornerRadius = UDim.new(1, 0)
    knobCorner.Parent = knob
    
    local dragging = false
    
    knob.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = UserInputService:GetMouseLocation()
            local barAbsolutePos = sliderBar.AbsolutePosition
            local barAbsoluteSize = sliderBar.AbsoluteSize
            
            local relativeX = math.clamp((mousePos.X - barAbsolutePos.X) / barAbsoluteSize.X, 0, 1)
            local value = min + (max - min) * relativeX
            
            fill.Size = UDim2.new(relativeX, 0, 1, 0)
            knob.Position = UDim2.new(relativeX, -9, 0.5, -9)
            labelText.Text = label .. ": " .. string.format("%.2f", value)
            
            if callback then
                callback(value)
            end
        end
    end)
    
    return container
end

-- Update entire UI colors
local function updateUIColorScheme()
    Colors = Themes[currentSettings.theme]
    
    mainFrame.BackgroundColor3 = Colors.Background
    uiStroke.Color = Colors.Accent
    topBar.BackgroundColor3 = Colors.Sidebar
    titleLabel.TextColor3 = Colors.Accent
    sidebar.BackgroundColor3 = Colors.Sidebar
    navDivider.BackgroundColor3 = Colors.Accent
    divider.BackgroundColor3 = Colors.Accent
    sectionTitle.TextColor3 = Colors.Text
    subtitleLabel.TextColor3 = Colors.TextDim
end

-- Clear toggles
local function clearToggles()
    for _, child in pairs(togglesFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    for _, child in pairs(settingsFrame:GetChildren()) do
        child:Destroy()
    end
end

-- Section Data
local sectionData = {
    Main = {
        title = "MAIN",
        subtitle = "Essential Features",
        toggles = {
            {"⚡ Speed Hack", "SpeedHack"},
            {"🕊️ Fly Hack", "FlyHack"},
            {"👁️ Player ESP", "ESP"},
            {"🎯 Teleport", "Teleport"},
        }
    },
    Farm = {
        title = "FARM",
        subtitle = "Automation Tools",
        toggles = {
            {"🌾 Auto Farm", "AutoFarm"},
            {"⚔️ Auto Attack", "AutoAttack"},
            {"💎 Auto Collect", "AutoCollect"},
            {"📦 Auto Loot", "AutoLoot"},
        }
    },
    Extra = {
        title = "EXTRA",
        subtitle = "Additional Features",
        toggles = {
            {"🔧 Noclip", "Noclip"},
            {"🔧 Infinite Jump", "InfJump"},
            {"🔧 God Mode", "GodMode"},
        }
    },
    PVP = {
        title = "PVP",
        subtitle = "Combat Enhancements",
        toggles = {
            {"🎯 Silent Aim", "SilentAim"},
            {"🔫 Aimbot", "Aimbot"},
            {"🛡️ Auto Block", "AutoBlock"},
            {"⚡ Quick Attack", "QuickAttack"},
        }
    },
    Shop = {
        title = "SHOP",
        subtitle = "Economy Tools",
        toggles = {
            {"🛍️ Auto Buy", "AutoBuy"},
            {"💰 Cash Multiplier", "CashMult"},
            {"💳 Free Items", "FreeItems"},
        }
    },
    Misc = {
        title = "MISC",
        subtitle = "Miscellaneous",
        toggles = {
            {"🎲 Random TP", "RandomTP"},
            {"📸 Screenshot Mode", "ScreenshotMode"},
            {"🎮 Gamepad Support", "Gamepad"},
        }
    },
    Settings = {
        title = "SETTINGS",
        subtitle = "Hub Configuration",
        isSettings = true
    }
}

-- Load Section Content
local function loadSectionContent(section)
    clearToggles()
    
    local data = sectionData[section]
    if data then
        sectionTitle.Text = data.title
        subtitleLabel.Text = data.subtitle
        
        if data.isSettings then
            -- Show settings panel
            togglesFrame.Visible = false
            settingsFrame.Visible = true
            
            -- Theme Dropdown
            createDropdown("🎨 Theme Preset", {"Purple", "Green", "Ocean", "Sunset", "Midnight"}, currentSettings.theme, 5, function(value)
                currentSettings.theme = value
                updateUIColorScheme()
                loadSectionContent("Settings") -- Refresh settings page
            end)
            
            -- Background Opacity Slider
            createSlider("🌑 Background Opacity", 0, 0.8, currentSettings.backgroundOpacity, 75, function(value)
                currentSettings.backgroundOpacity = value
                mainFrame.BackgroundTransparency = value
            end)
            
            -- Sidebar Opacity Slider
            createSlider("📂 Sidebar Opacity", 0, 0.5, currentSettings.sidebarOpacity, 145, function(value)
                currentSettings.sidebarOpacity = value
                sidebar.BackgroundTransparency = value
                topBar.BackgroundTransparency = value
            end)
            
            -- Notification Toggle
            createContentToggle("🔔 Enable Notifications", 220, "Notifications", settingsFrame)
            createContentToggle("💾 Save Settings", 257, "SaveSettings", settingsFrame)
            createContentToggle("🔁 Auto Load Config", 294, "AutoLoad", settingsFrame)
            
        else
            -- Show regular toggles
            togglesFrame.Visible = true
            settingsFrame.Visible = false
            
            local yPos = 5
            for i, toggle in ipairs(data.toggles) do
                createContentToggle(toggle[1], yPos + (i-1) * 38, toggle[2])
            end
        end
    else
        sectionTitle.Text = section:upper()
        subtitleLabel.Text = "Coming Soon!"
    end
end

-- Sidebar button template
local sidebarBtnTemplate = Instance.new("TextButton")
sidebarBtnTemplate.Size = UDim2.new(1, -24, 0, 34)
sidebarBtnTemplate.Position = UDim2.new(0, 12, 0, 0)
sidebarBtnTemplate.BackgroundColor3 = Colors.Button
sidebarBtnTemplate.BackgroundTransparency = 0.5
sidebarBtnTemplate.BorderSizePixel = 0
sidebarBtnTemplate.TextColor3 = Colors.TextDim
sidebarBtnTemplate.Font = Enum.Font.GothamMedium
sidebarBtnTemplate.TextSize = 12
sidebarBtnTemplate.TextXAlignment = Enum.TextXAlignment.Left
sidebarBtnTemplate.AutoButtonColor = false

local sidebarBtnCorner = Instance.new("UICorner")
sidebarBtnCorner.CornerRadius = UDim.new(0, 6)
sidebarBtnCorner.Parent = sidebarBtnTemplate

-- Sidebar Sections
local sidebarSections = {
    {name = "Main", icon = "🏠"},
    {name = "Farm", icon = "🌾"},
    {name = "Extra", icon = "➕"},
    {name = "PVP", icon = "⚔️"},
    {name = "Shop", icon = "🛒"},
    {name = "Misc", icon = "📦"},
    {name = "Settings", icon = "⚙️"}
}

-- Create Sidebar Buttons
for i, section in ipairs(sidebarSections) do
    local button = sidebarBtnTemplate:Clone()
    button.Position = UDim2.new(0, 12, 0, i * 40 + 8)
    button.Text = "  " .. section.icon .. "  " .. section.name
    button.Parent = sidebar
    
    -- Accent indicator (left line)
    local accentLine = Instance.new("Frame")
    accentLine.Size = UDim2.new(0, 3, 0.6, 0)
    accentLine.Position = UDim2.new(0, 0, 0.2, 0)
    accentLine.BackgroundColor3 = Colors.Accent
    accentLine.BackgroundTransparency = 1
    accentLine.BorderSizePixel = 0
    accentLine.Parent = button
    
    button.MouseButton1Click:Connect(function()
        -- Reset old selection
        if selectedButton then
            selectedButton.BackgroundTransparency = 0.5
            selectedButton.TextColor3 = Colors.TextDim
            local oldLine = selectedButton:FindFirstChildOfClass("Frame")
            if oldLine then
                oldLine.BackgroundTransparency = 1
            end
        end
        
        -- Set new selection
        button.BackgroundTransparency = 0.2
        button.TextColor3 = Colors.Accent
        accentLine.BackgroundTransparency = 0
        selectedButton = button
        
        -- Load content
        loadSectionContent(section.name)
    end)
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        if button ~= selectedButton then
            button.BackgroundTransparency = 0.3
        end
    end)
    
    button.MouseLeave:Connect(function()
        if button ~= selectedButton then
            button.BackgroundTransparency = 0.5
        end
    end)
    
    -- Auto-select Main on startup
    if i == 1 then
        button.BackgroundTransparency = 0.2
        button.TextColor3 = Colors.Accent
        accentLine.BackgroundTransparency = 0
        selectedButton = button
        loadSectionContent("Main")
    end
end

-- Version label at bottom of sidebar
local versionLabel = Instance.new("TextLabel")
versionLabel.Size = UDim2.new(1, -24, 0, 20)
versionLabel.Position = UDim2.new(0, 12, 1, -28)
versionLabel.BackgroundTransparency = 1
versionLabel.Text = "v2.0.0 | SairHub"
versionLabel.TextColor3 = Colors.TextDim
versionLabel.Font = Enum.Font.Gotham
versionLabel.TextSize = 9
versionLabel.TextXAlignment = Enum.TextXAlignment.Center
versionLabel.TextTransparency = 0.4
versionLabel.Parent = sidebar

-- KEYBIND: Right Control
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.RightControl and not gameProcessed then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

-- Backup: Left Control
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.LeftControl and not gameProcessed then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

print("✅ SairHub v2 Enhanced Loaded in " .. string.format("%.3f", tick() - startTime) .. "ms")
print("🎨 Theme System Active | 📌 Press RIGHT CTRL to toggle")
print("👤 Welcome, " .. player.Name .. "!")
print("💡 Go to Settings to customize your theme!")