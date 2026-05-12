-- SairHub v2 | Consolidated Opacity + Scrollable UI
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
    globalOpacity = 0.15, -- Single opacity control for everything
}

local Colors = Themes[currentSettings.theme]

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SairHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Main Container
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 620, 0, 440)
mainFrame.Position = UDim2.new(0.5, -310, 0.5, -220)
mainFrame.BackgroundColor3 = Colors.Background
mainFrame.BackgroundTransparency = currentSettings.globalOpacity
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
uiCorner.CornerRadius = UDim.new(0, 10)
uiCorner.Parent = mainFrame

-- Top Bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 38)
topBar.BackgroundColor3 = Colors.Sidebar
topBar.BackgroundTransparency = 0
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local topGradient = Instance.new("UIGradient")
topGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
    ColorSequenceKeypoint.new(1, Colors.Sidebar)
})
topGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.1),
    NumberSequenceKeypoint.new(1, 0)
})
-- Just styling, keeping it subtle
topGradient.Parent = topBar

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
closeButton.BackgroundTransparency = 0.6
closeButton.BorderSizePixel = 0
closeButton.Text = "✕"
closeButton.TextColor3 = Colors.Text
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 15
closeButton.AutoButtonColor = false
closeButton.Parent = topBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
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
sidebar.Size = UDim2.new(0, 170, 1, -38)
sidebar.Position = UDim2.new(0, 0, 0, 38)
sidebar.BackgroundColor3 = Colors.Sidebar
sidebar.BackgroundTransparency = 0
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

-- Sidebar Header
local sidebarHeader = Instance.new("TextLabel")
sidebarHeader.Size = UDim2.new(1, 0, 0, 25)
sidebarHeader.Position = UDim2.new(0, 0, 0, 10)
sidebarHeader.BackgroundTransparency = 1
sidebarHeader.Text = "NAVIGATION"
sidebarHeader.TextColor3 = Colors.TextDim
sidebarHeader.Font = Enum.Font.GothamBold
sidebarHeader.TextSize = 10
sidebarHeader.TextXAlignment = Enum.TextXAlignment.Center
sidebarHeader.Parent = sidebar

local navDivider = Instance.new("Frame")
navDivider.Size = UDim2.new(1, -30, 0, 1)
navDivider.Position = UDim2.new(0, 15, 0, 40)
navDivider.BackgroundColor3 = Colors.Accent
navDivider.BackgroundTransparency = 0.7
navDivider.BorderSizePixel = 0
navDivider.Parent = sidebar

-- Content Area with Scrolling
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -170, 1, -38)
contentArea.Position = UDim2.new(0, 170, 0, 38)
contentArea.BackgroundTransparency = 1
contentArea.ClipsDescendants = true
contentArea.Parent = mainFrame

-- Scrolling Frame for Content
local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
scrollingFrame.Position = UDim2.new(0, 0, 0, 0)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.BorderSizePixel = 0
scrollingFrame.ScrollBarThickness = 4
scrollingFrame.ScrollBarImageColor3 = Colors.Accent
scrollingFrame.ScrollBarImageTransparency = 0.5
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 400) -- Will be adjusted dynamically
scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
scrollingFrame.Parent = contentArea

-- Content container inside scrolling frame
local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, 0, 1, 0)
contentContainer.BackgroundTransparency = 1
contentContainer.Parent = scrollingFrame

-- Section Title
local sectionTitle = Instance.new("TextLabel")
sectionTitle.Size = UDim2.new(1, -50, 0, 55)
sectionTitle.Position = UDim2.new(0, 25, 0, 15)
sectionTitle.BackgroundTransparency = 1
sectionTitle.Text = "MAIN"
sectionTitle.TextColor3 = Colors.Text
sectionTitle.Font = Enum.Font.GothamBlack
sectionTitle.TextSize = 40
sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
sectionTitle.TextTransparency = 0.1
sectionTitle.Parent = contentContainer

-- Subtitle
local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, -50, 0, 20)
subtitleLabel.Position = UDim2.new(0, 25, 0, 72)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Main Features"
subtitleLabel.TextColor3 = Colors.TextDim
subtitleLabel.Font = Enum.Font.GothamMedium
subtitleLabel.TextSize = 13
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.Parent = contentContainer

-- Divider
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -50, 0, 1)
divider.Position = UDim2.new(0, 25, 0, 100)
divider.BackgroundColor3 = Colors.Accent
divider.BackgroundTransparency = 0.7
divider.BorderSizePixel = 0
divider.Parent = contentContainer

-- Toggles Container
local togglesFrame = Instance.new("Frame")
togglesFrame.Size = UDim2.new(1, -50, 0, 0) -- Will be sized dynamically
togglesFrame.Position = UDim2.new(0, 25, 0, 110)
togglesFrame.BackgroundTransparency = 1
togglesFrame.Parent = contentContainer

-- Settings Container
local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(1, -50, 0, 0)
settingsFrame.Position = UDim2.new(0, 25, 0, 110)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false
settingsFrame.Parent = contentContainer

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
    button.Size = UDim2.new(1, 0, 0, 34)
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
    container.Size = UDim2.new(1, 0, 0, 70)
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
    dropdown.Size = UDim2.new(1, 0, 0, 34)
    dropdown.Position = UDim2.new(0, 0, 0, 28)
    dropdown.BackgroundColor3 = Colors.Button
    dropdown.BackgroundTransparency = 0.3
    dropdown.BorderSizePixel = 0
    dropdown.Text = "  ▼  " .. currentValue
    dropdown.TextColor3 = Colors.Text
    dropdown.Font = Enum.Font.GothamMedium
    dropdown.TextSize = 13
    dropdown.TextXAlignment = Enum.TextXAlignment.Left
    dropdown.AutoButtonColor = false
    dropdown.ZIndex = 10
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
    optionsFrame.ZIndex = 11
    optionsFrame.Parent = container
    
    local optionsCorner = Instance.new("UICorner")
    optionsCorner.CornerRadius = UDim.new(0, 6)
    optionsCorner.Parent = optionsFrame
    
    -- Add options
    for i, option in ipairs(options) do
        local optionBtn = Instance.new("TextButton")
        optionBtn.Size = UDim2.new(1, 0, 0, 30)
        optionBtn.Position = UDim2.new(0, 0, 0, (i-1) * 30)
        optionBtn.BackgroundColor3 = Colors.Button
        optionBtn.BackgroundTransparency = (option == currentValue) and 0.2 or 0.3
        optionBtn.BorderSizePixel = 0
        optionBtn.Text = (option == currentValue) and "  ✓  " .. option or "  " .. option
        optionBtn.TextColor3 = (option == currentValue) and Colors.Accent or Colors.TextDim
        optionBtn.Font = Enum.Font.GothamMedium
        optionBtn.TextSize = 12
        optionBtn.TextXAlignment = Enum.TextXAlignment.Left
        optionBtn.AutoButtonColor = false
        optionBtn.ZIndex = 11
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
    end
    
    dropdown.MouseButton1Click:Connect(function()
        optionsFrame.Size = UDim2.new(1, 0, 0, #options * 30)
        optionsFrame.Visible = not optionsFrame.Visible
    end)
    
    return container
end

-- Create Slider
local function createSlider(label, min, max, currentValue, yPosition, callback)
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 70)
    container.Position = UDim2.new(0, 0, 0, yPosition)
    container.BackgroundTransparency = 1
    container.Parent = settingsFrame
    
    local labelText = Instance.new("TextLabel")
    labelText.Size = UDim2.new(1, 0, 0, 22)
    labelText.BackgroundTransparency = 1
    labelText.Text = label .. ": " .. string.format("%.0f%%", currentValue * 100)
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
    local percentage = math.clamp((currentValue - min) / (max - min), 0, 1)
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
    
    -- Hover effect on knob
    knob.MouseEnter:Connect(function()
        knob.Size = UDim2.new(0, 22, 0, 22)
        knob.Position = UDim2.new(percentage, -11, 0.5, -11)
    end)
    knob.MouseLeave:Connect(function()
        knob.Size = UDim2.new(0, 18, 0, 18)
        knob.Position = UDim2.new(percentage, -9, 0.5, -9)
    end)
    
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
            labelText.Text = label .. ": " .. string.format("%.0f%%", value * 100)
            
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
    mainFrame.BackgroundTransparency = currentSettings.globalOpacity
    uiStroke.Color = Colors.Accent
    topBar.BackgroundColor3 = Colors.Sidebar
    titleLabel.TextColor3 = Colors.Accent
    sidebar.BackgroundColor3 = Colors.Sidebar
    navDivider.BackgroundColor3 = Colors.Accent
    divider.BackgroundColor3 = Colors.Accent
    sectionTitle.TextColor3 = Colors.Text
    subtitleLabel.TextColor3 = Colors.TextDim
    scrollingFrame.ScrollBarImageColor3 = Colors.Accent
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
            {"💨 Fast Walk", "FastWalk"},
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
            {"🏃 Auto Run", "AutoRun"},
            {"🗺️ Auto Quest", "AutoQuest"},
        }
    },
    Extra = {
        title = "EXTRA",
        subtitle = "Additional Features",
        toggles = {
            {"🔧 Noclip", "Noclip"},
            {"🔧 Infinite Jump", "InfJump"},
            {"🔧 God Mode", "GodMode"},
            {"🔧 Wall Hack", "WallHack"},
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
            {"💪 Anti Knockback", "AntiKB"},
            {"🎲 Hitbox Expander", "HitboxExpand"},
        }
    },
    Shop = {
        title = "SHOP",
        subtitle = "Economy Tools",
        toggles = {
            {"🛍️ Auto Buy", "AutoBuy"},
            {"💰 Cash Multiplier", "CashMult"},
            {"💳 Free Items", "FreeItems"},
            {"🏷️ Auto Sell", "AutoSell"},
        }
    },
    Misc = {
        title = "MISC",
        subtitle = "Miscellaneous",
        toggles = {
            {"🎲 Random TP", "RandomTP"},
            {"📸 Screenshot Mode", "ScreenshotMode"},
            {"🎮 Gamepad Support", "Gamepad"},
            {"🌙 Night Mode", "NightMode"},
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
                loadSectionContent("Settings")
            end)
            
            -- Global Opacity Slider
            createSlider("🌑 Global Opacity", 0, 0.7, currentSettings.globalOpacity, 85, function(value)
                currentSettings.globalOpacity = value
                mainFrame.BackgroundTransparency = value
            end)
            
            -- Functional Toggles
            createContentToggle("🔔 Enable Notifications", 165, "Notifications", settingsFrame)
            createContentToggle("💾 Save Settings", 204, "SaveSettings", settingsFrame)
            createContentToggle("🔁 Auto Load Config", 243, "AutoLoad", settingsFrame)
            createContentToggle("🔊 UI Sounds", 282, "UISounds", settingsFrame)
            
            -- Set canvas size for scrolling
            settingsFrame.Size = UDim2.new(1, -50, 0, 350)
            scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 350)
            
        else
            -- Show regular toggles
            togglesFrame.Visible = true
            settingsFrame.Visible = false
            
            local yPos = 5
            local toggleCount = #data.toggles
            for i, toggle in ipairs(data.toggles) do
                createContentToggle(toggle[1], yPos + (i-1) * 40, toggle[2])
            end
            
            -- Adjust canvas size based on number of toggles
            local totalHeight = yPos + toggleCount * 40 + 130 -- 130 for title + subtitle + divider + padding
            togglesFrame.Size = UDim2.new(1, -50, 0, totalHeight)
            scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, math.max(totalHeight, 380)) -- Minimum canvas height
        end
    else
        sectionTitle.Text = section:upper()
        subtitleLabel.Text = "Coming Soon!"
    end
    
    -- Reset scroll position to top
    scrollingFrame.CanvasPosition = Vector2.new(0, 0)
end

-- Sidebar button template
local sidebarBtnTemplate = Instance.new("TextButton")
sidebarBtnTemplate.Size = UDim2.new(1, -24, 0, 36)
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
    button.Position = UDim2.new(0, 12, 0, i * 42 + 8)
    button.Text = "  " .. section.icon .. "  " .. section.name
    button.Parent = sidebar
    
    -- Accent indicator
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
versionLabel.Text = "v2.0.0 | Scrollable"
versionLabel.TextColor3 = Colors.TextDim
versionLabel.Font = Enum.Font.Gotham
versionLabel.TextSize = 9
versionLabel.TextXAlignment = Enum.TextXAlignment.Center
versionLabel.TextTransparency = 0.5
versionLabel.Parent = sidebar

-- Enable mouse wheel scrolling
scrollingFrame.MouseWheelForward = function()
    scrollingFrame.CanvasPosition = Vector2.new(0, math.max(0, scrollingFrame.CanvasPosition.Y - 30))
end
scrollingFrame.MouseWheelBackward = function()
    local maxScroll = scrollingFrame.CanvasSize.Y.Offset - scrollingFrame.AbsoluteSize.Y
    scrollingFrame.CanvasPosition = Vector2.new(0, math.min(maxScroll, scrollingFrame.CanvasPosition.Y + 30))
end

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

-- Make UI draggable
local dragging = false
local dragInput, dragStart, startPos

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

topBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

print("✅ SairHub v2 Scrollable Loaded in " .. string.format("%.3f", tick() - startTime) .. "ms")
print("🎨 Theme System Active | 📜 Scrolling Enabled | 🖱️ Draggable UI")
print("📌 Press RIGHT CTRL to toggle | 👤 Welcome, " .. player.Name .. "!")
print("💡 Go to Settings to customize your theme!")