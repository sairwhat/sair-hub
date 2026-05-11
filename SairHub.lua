-- SairHub v2 | Optimized Performance Version
local startTime = tick()

-- Cache services at top level
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Predefine colors (no function calls needed)
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

-- Create all GUI elements at once using clones (faster)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SairHub"
screenGui.Parent = playerGui

-- Build main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 380)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -190)
mainFrame.BackgroundColor3 = Colors.Background
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Single UIStroke instead of individual borders
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Colors.Accent
uiStroke.Thickness = 1.5
uiStroke.Transparency = 0.3
uiStroke.Parent = mainFrame

-- Use less transparency layers (reduces rendering)
-- Combine title bar with sidebar background
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

-- Close button
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

-- Create sidebar ONCE (no separate background frames)
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 150, 1, -30)
sidebar.Position = UDim2.new(0, 0, 0, 30)
sidebar.BackgroundColor3 = Colors.Sidebar
sidebar.BackgroundTransparency = 0.3
sidebar.BorderSizePixel = 0
sidebar.ClipsDescendants = true
sidebar.Parent = mainFrame

-- Content area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -150, 1, -30)
contentArea.Position = UDim2.new(0, 150, 0, 30)
contentArea.BackgroundTransparency = 1
contentArea.ClipsDescendants = true
contentArea.Parent = mainFrame

-- Content label (reused)
local contentLabel = Instance.new("TextLabel")
contentLabel.Size = UDim2.new(1, -40, 0, 50)
contentLabel.Position = UDim2.new(0, 20, 0, 20)
contentLabel.BackgroundTransparency = 1
contentLabel.Text = "Main"
contentLabel.TextColor3 = Colors.Text
contentLabel.Font = Enum.Font.GothamLight
contentLabel.TextSize = 48
contentLabel.TextXAlignment = Enum.TextXAlignment.Left
contentLabel.TextYAlignment = Enum.TextYAlignment.Top
contentLabel.TextTransparency = 0.3
contentLabel.Parent = contentArea

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, -40, 0, 20)
subtitleLabel.Position = UDim2.new(0, 20, 0, 80)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Welcome to SairHub"
subtitleLabel.TextColor3 = Colors.TextDim
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextSize = 14
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.Parent = contentArea

-- Pre-create a template button for cloning (MASSIVE performance boost)
local buttonTemplate = Instance.new("TextButton")
buttonTemplate.BackgroundTransparency = 0.3
buttonTemplate.BorderSizePixel = 0
buttonTemplate.Font = Enum.Font.GothamMedium
buttonTemplate.TextSize = 12
buttonTemplate.TextXAlignment = Enum.TextXAlignment.Left
buttonTemplate.AutoButtonColor = false

local toggleStorage = {}
local selectedButton = nil

-- Optimized toggle creator using template
local function createContentToggle(name, yPosition, toggleKey)
    if toggleStorage[toggleKey] == nil then
        toggleStorage[toggleKey] = false
    end
    
    -- Clone template instead of creating new (FASTER)
    local button = buttonTemplate:Clone()
    button.Size = UDim2.new(0.9, 0, 0, 28)
    button.Position = UDim2.new(0.05, 0, yPosition, 0)
    button.BackgroundColor3 = Colors.ToggleOff
    button.Text = "  " .. name
    button.TextColor3 = Colors.TextDim
    button.Parent = contentArea
    
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

-- Clear content area efficiently
local function clearContentArea()
    -- Batch destroy children (faster than individual loops)
    local children = contentArea:GetChildren()
    for i = #children, 1, -1 do
        local child = children[i]
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
end

-- Pre-define section data (no table creation during runtime)
local sectionData = {
    Main = {
        subtitle = "Main features",
        toggles = {
            {name = "⚡ Speed Hack", key = "SpeedHack"},
            {name = "🕊️ Fly Hack", key = "FlyHack"},
            {name = "👁️ Player ESP", key = "ESP"},
        }
    },
    Farm = {
        subtitle = "Farming automation",
        toggles = {
            {name = "🌾 Auto Farm", key = "AutoFarm"},
            {name = "⚔️ Auto Attack", key = "AutoAttack"},
            {name = "💎 Auto Collect", key = "AutoCollect"},
        }
    },
    PVP = {
        subtitle = "Combat enhancements",
        toggles = {
            {name = "🎯 Silent Aim", key = "SilentAim"},
            {name = "🔫 Aimbot", key = "Aimbot"},
            {name = "🛡️ Auto Block", key = "AutoBlock"},
        }
    },
    Settings = {
        subtitle = "Hub configuration",
        toggles = {
            {name = "🔔 Notifications", key = "Notifications"},
            {name = "🎨 Purple Theme", key = "PurpleTheme"},
        }
    }
}

-- Optimized section loader
local function loadSectionContent(section)
    clearContentArea()
    contentLabel.Text = section
    
    local data = sectionData[section]
    if data then
        subtitleLabel.Text = data.subtitle
        local yPos = 0.30
        for i, toggle in ipairs(data.toggles) do
            createContentToggle(toggle.name, yPos + (i-1) * 0.08, toggle.key)
        end
    else
        subtitleLabel.Text = section .. " - Coming soon!"
    end
end

-- Create sidebar button template
local sidebarButtonTemplate = Instance.new("TextButton")
sidebarButtonTemplate.Size = UDim2.new(1, -20, 0, 32)
sidebarButtonTemplate.Position = UDim2.new(0, 10, 0, 0)
sidebarButtonTemplate.BackgroundColor3 = Colors.Button
sidebarButtonTemplate.BackgroundTransparency = 0.5
sidebarButtonTemplate.BorderSizePixel = 0
sidebarButtonTemplate.TextColor3 = Colors.TextDim
sidebarButtonTemplate.Font = Enum.Font.GothamMedium
sidebarButtonTemplate.TextSize = 13
sidebarButtonTemplate.TextXAlignment = Enum.TextXAlignment.Left
sidebarButtonTemplate.AutoButtonColor = false

-- Create sidebar buttons using template
local sidebarSections = {
    {name = "Main", icon = "🏠"},
    {name = "Farm", icon = "🌾"},
    {name = "Extra", icon = "➕"},
    {name = "PVP", icon = "⚔️"},
    {name = "Shop", icon = "🛒"},
    {name = "Misc", icon = "📦"},
    {name = "Settings", icon = "⚙️"}
}

for i, section in ipairs(sidebarSections) do
    local button = sidebarButtonTemplate:Clone()
    button.Position = UDim2.new(0, 10, 0, i * 38 - 25)
    button.Text = "  " .. section.icon .. "  " .. section.name
    button.Parent = sidebar
    
    -- Selection indicator
    local leftBorder = Instance.new("Frame")
    leftBorder.Size = UDim2.new(0, 3, 1, 0)
    leftBorder.BackgroundColor3 = Colors.Accent
    leftBorder.BackgroundTransparency = 1
    leftBorder.BorderSizePixel = 0
    leftBorder.Parent = button
    
    button.MouseButton1Click:Connect(function()
        if selectedButton then
            selectedButton.BackgroundTransparency = 0.5
            selectedButton.TextColor3 = Colors.TextDim
            local oldBorder = selectedButton:FindFirstChildOfClass("Frame")
            if oldBorder then
                oldBorder.BackgroundTransparency = 1
            end
        end
        
        button.BackgroundTransparency = 0.2
        button.TextColor3 = Colors.Accent
        leftBorder.BackgroundTransparency = 0
        selectedButton = button
        
        loadSectionContent(section.name)
    end)
    
    -- Hover effects (lightweight)
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
    
    -- Auto-select first
    if i == 1 then
        button.BackgroundTransparency = 0.2
        button.TextColor3 = Colors.Accent
        leftBorder.BackgroundTransparency = 0
        selectedButton = button
        loadSectionContent("Main")
    end
end

-- Single keybind connection (no nested checks)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightControl then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

-- Performance metrics
local loadTime = tick() - startTime
print("✅ SairHub v2 Loaded in " .. string.format("%.3f", loadTime) .. "ms")
print("📌 Press RIGHT CTRL to toggle GUI")