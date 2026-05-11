-- SairHub v2 | Content Display Fix + Right Ctrl Fix
local startTime = tick()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Colors
local Colors = {
    Background = Color3.new(0.098, 0.09, 0.141),
    Sidebar = Color3.new(0.118, 0.11, 0.18),
    Accent = Color3.new(0.741, 0.576, 0.976),
    Text = Color3.new(0.973, 0.973, 0.949),
    TextDim = Color3.new(0.588, 0.58, 0.659),
    Button = Color3.new(0.157, 0.149, 0.22),
    ToggleOn = Color3.new(0.314, 0.98, 0.482),
    ToggleOff = Color3.new(0.157, 0.149, 0.22),
    Close = Color3.new(1, 0.333, 0.333)
}

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SairHub"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Main Container - START VISIBLE
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 380)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -190)
mainFrame.BackgroundColor3 = Colors.Background
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.Active = true
mainFrame.Parent = screenGui

-- Border
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Colors.Accent
uiStroke.Thickness = 1.5
uiStroke.Transparency = 0.3
uiStroke.Parent = mainFrame

-- Top Bar
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 30)
topBar.BackgroundColor3 = Colors.Sidebar
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔥 SairHub"
titleLabel.TextColor3 = Colors.Accent
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = topBar

-- Close Button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -28, 0, 3)
closeButton.BackgroundColor3 = Colors.Close
closeButton.BackgroundTransparency = 0.7
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Colors.Text
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 14
closeButton.AutoButtonColor = false
closeButton.Parent = topBar

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Sidebar
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 150, 1, -30)
sidebar.Position = UDim2.new(0, 0, 0, 30)
sidebar.BackgroundColor3 = Colors.Sidebar
sidebar.BackgroundTransparency = 0.3
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

-- Sidebar Separator Line
local sideSep = Instance.new("Frame")
sideSep.Size = UDim2.new(0, 1, 1, 0)
sideSep.Position = UDim2.new(1, 0, 0, 0)
sideSep.BackgroundColor3 = Colors.Accent
sideSep.BackgroundTransparency = 0.5
sideSep.BorderSizePixel = 0
sideSep.Parent = sidebar

-- Content Area (WHERE TEXT SHOWS)
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -150, 1, -30)
contentArea.Position = UDim2.new(0, 150, 0, 30)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

-- BIG Title Text (Shows "Main", "Farm", etc.)
local sectionTitle = Instance.new("TextLabel")
sectionTitle.Size = UDim2.new(1, -40, 0, 60)
sectionTitle.Position = UDim2.new(0, 25, 0, 15)
sectionTitle.BackgroundTransparency = 1
sectionTitle.Text = "MAIN"
sectionTitle.TextColor3 = Colors.Text
sectionTitle.Font = Enum.Font.GothamBlack
sectionTitle.TextSize = 42
sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
sectionTitle.TextTransparency = 0.1
sectionTitle.Parent = contentArea

-- Subtitle Text
local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, -40, 0, 25)
subtitleLabel.Position = UDim2.new(0, 25, 0, 75)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Main Features"
subtitleLabel.TextColor3 = Colors.TextDim
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextSize = 15
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.Parent = contentArea

-- Divider line under subtitle
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1, -50, 0, 1)
divider.Position = UDim2.new(0, 25, 0, 105)
divider.BackgroundColor3 = Colors.Accent
divider.BackgroundTransparency = 0.7
divider.BorderSizePixel = 0
divider.Parent = contentArea

-- Where toggles will be placed
local togglesFrame = Instance.new("Frame")
togglesFrame.Size = UDim2.new(1, -50, 1, -115)
togglesFrame.Position = UDim2.new(0, 25, 0, 115)
togglesFrame.BackgroundTransparency = 1
togglesFrame.Parent = contentArea

-- Toggle storage
local toggleStorage = {}
local selectedButton = nil

-- Template button for cloning
local buttonTemplate = Instance.new("TextButton")
buttonTemplate.BackgroundTransparency = 0.3
buttonTemplate.BorderSizePixel = 0
buttonTemplate.Font = Enum.Font.GothamMedium
buttonTemplate.TextSize = 12
buttonTemplate.TextXAlignment = Enum.TextXAlignment.Left
buttonTemplate.AutoButtonColor = false

-- Create Content Toggle
local function createContentToggle(name, yPosition, toggleKey)
    if toggleStorage[toggleKey] == nil then
        toggleStorage[toggleKey] = false
    end
    
    local button = buttonTemplate:Clone()
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = UDim2.new(0, 0, 0, yPosition)
    button.BackgroundColor3 = Colors.ToggleOff
    button.Text = "  " .. name
    button.TextColor3 = Colors.TextDim
    button.Parent = togglesFrame
    
    button.MouseButton1Click:Connect(function()
        toggleStorage[toggleKey] = not toggleStorage[toggleKey]
        
        if toggleStorage[toggleKey] then
            button.BackgroundColor3 = Colors.ToggleOn
            button.BackgroundTransparency = 0.2
            button.TextColor3 = Color3.new(0, 0, 0)
            button.Text = "  " .. name .. "  ✓"
        else
            button.BackgroundColor3 = Colors.ToggleOff
            button.BackgroundTransparency = 0.3
            button.TextColor3 = Colors.TextDim
            button.Text = "  " .. name
        end
    end)
    
    return button
end

-- Clear toggles
local function clearToggles()
    for _, child in pairs(togglesFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
end

-- Section Data
local sectionData = {
    Main = {
        title = "MAIN",
        subtitle = "Main Features",
        toggles = {
            {"⚡ Speed Hack", "SpeedHack"},
            {"🕊️ Fly Hack", "FlyHack"},
            {"👁️ Player ESP", "ESP"},
        }
    },
    Farm = {
        title = "FARM",
        subtitle = "Farming Automation",
        toggles = {
            {"🌾 Auto Farm", "AutoFarm"},
            {"⚔️ Auto Attack", "AutoAttack"},
            {"💎 Auto Collect", "AutoCollect"},
        }
    },
    Extra = {
        title = "EXTRA",
        subtitle = "Additional Features",
        toggles = {
            {"🔧 Feature 1", "Extra1"},
            {"🔧 Feature 2", "Extra2"},
        }
    },
    PVP = {
        title = "PVP",
        subtitle = "Combat Enhancements",
        toggles = {
            {"🎯 Silent Aim", "SilentAim"},
            {"🔫 Aimbot", "Aimbot"},
            {"🛡️ Auto Block", "AutoBlock"},
        }
    },
    Shop = {
        title = "SHOP",
        subtitle = "Shop Features",
        toggles = {
            {"🛍️ Auto Buy", "AutoBuy"},
            {"💰 Cash Multiplier", "CashMult"},
        }
    },
    Misc = {
        title = "MISC",
        subtitle = "Miscellaneous",
        toggles = {
            {"🎲 Random Feature", "Misc1"},
        }
    },
    Settings = {
        title = "SETTINGS",
        subtitle = "Hub Configuration",
        toggles = {
            {"🔔 Notifications", "Notifications"},
            {"🎨 Purple Theme", "PurpleTheme"},
        }
    }
}

-- Load Section Content
local function loadSectionContent(section)
    clearToggles()
    
    local data = sectionData[section]
    if data then
        sectionTitle.Text = data.title
        subtitleLabel.Text = data.subtitle
        
        local yPos = 5
        for i, toggle in ipairs(data.toggles) do
            createContentToggle(toggle[1], yPos + (i-1) * 38, toggle[2])
        end
    else
        sectionTitle.Text = section:upper()
        subtitleLabel.Text = "Coming Soon!"
    end
end

-- Sidebar button template
local sidebarBtnTemplate = Instance.new("TextButton")
sidebarBtnTemplate.Size = UDim2.new(1, -20, 0, 32)
sidebarBtnTemplate.Position = UDim2.new(0, 10, 0, 0)
sidebarBtnTemplate.BackgroundColor3 = Colors.Button
sidebarBtnTemplate.BackgroundTransparency = 0.5
sidebarBtnTemplate.BorderSizePixel = 0
sidebarBtnTemplate.TextColor3 = Colors.TextDim
sidebarBtnTemplate.Font = Enum.Font.GothamMedium
sidebarBtnTemplate.TextSize = 13
sidebarBtnTemplate.TextXAlignment = Enum.TextXAlignment.Left
sidebarBtnTemplate.AutoButtonColor = false

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
    button.Position = UDim2.new(0, 10, 0, i * 38 - 20)
    button.Text = "  " .. section.icon .. "  " .. section.name
    button.Parent = sidebar
    
    -- Purple accent line
    local accentLine = Instance.new("Frame")
    accentLine.Size = UDim2.new(0, 3, 1, 0)
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
    
    -- Hover
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

-- KEYBIND FIX: Separate connection, check for RightControl specifically
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    -- Don't check gameProcessed, just check the key directly
    if input.KeyCode == Enum.KeyCode.RightControl then
        mainFrame.Visible = not mainFrame.Visible
        print("🔄 GUI " .. (mainFrame.Visible and "SHOWN" or "HIDDEN"))
    end
end)

-- Also add a backup keybind (Left Ctrl) in case Right Ctrl doesn't work
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.LeftControl then
        mainFrame.Visible = not mainFrame.Visible
        print("🔄 GUI " .. (mainFrame.Visible and "SHOWN" or "HIDDEN") .. " (Left Ctrl backup)")
    end
end)

print("✅ SairHub v2 Loaded in " .. string.format("%.3f", tick() - startTime) .. "ms")
print("📌 Press RIGHT CTRL or LEFT CTRL to toggle GUI")
print("👤 Welcome, " .. player.Name)