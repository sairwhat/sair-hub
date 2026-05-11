-- SairHub v2 | Fixed & Working Version
local Services = {
    Players = game:GetService("Players"),
    UserInputService = game:GetService("UserInputService"),
    TweenService = game:GetService("TweenService")
}

local player = Services.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Dracula Purple Color Palette
local Colors = {
    Background = Color3.fromRGB(25, 23, 36),
    Sidebar = Color3.fromRGB(30, 28, 46),
    Accent = Color3.fromRGB(189, 147, 249),
    AccentDark = Color3.fromRGB(139, 107, 199),
    Text = Color3.fromRGB(248, 248, 242),
    TextDim = Color3.fromRGB(150, 148, 168),
    Button = Color3.fromRGB(40, 38, 56),
    ButtonHover = Color3.fromRGB(60, 57, 82),
    ToggleOn = Color3.fromRGB(80, 250, 123),
    ToggleOff = Color3.fromRGB(40, 38, 56),
    Close = Color3.fromRGB(255, 85, 85),
    Separator = Color3.fromRGB(50, 48, 66)
}

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SairHub"
screenGui.Parent = playerGui

-- Main Container - START VISIBLE FOR TESTING
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 380)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -190)
mainFrame.BackgroundColor3 = Colors.Background
mainFrame.BackgroundTransparency = 0.15
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true  -- CHANGED TO TRUE SO YOU CAN SEE IT
mainFrame.Parent = screenGui

-- Border effect
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Colors.Accent
uiStroke.Thickness = 1.5
uiStroke.Transparency = 0.3
uiStroke.Parent = mainFrame

-- Top Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Colors.Sidebar
titleBar.BackgroundTransparency = 0.3
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 15, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔥 SairHub"
titleLabel.TextColor3 = Colors.Accent
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 16
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

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
closeButton.Parent = titleBar

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

-- Content Area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -150, 1, -30)
contentArea.Position = UDim2.new(0, 150, 0, 30)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

-- Content Label
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

-- Subtitle
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

-- Toggle storage
local toggles = {}

-- Selected button tracking
local selectedButton = nil

-- Content Toggle Creator
local function createContentToggle(name, yPosition, toggleKey)
    if toggles[toggleKey] == nil then
        toggles[toggleKey] = false
    end
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0, 28)
    button.Position = UDim2.new(0.05, 0, yPosition, 0)
    button.BackgroundColor3 = Colors.ToggleOff
    button.BackgroundTransparency = 0.3
    button.BorderSizePixel = 0
    button.Text = "  " .. name
    button.TextColor3 = Colors.TextDim
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 12
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.AutoButtonColor = false
    button.Parent = contentArea
    
    button.MouseButton1Click:Connect(function()
        toggles[toggleKey] = not toggles[toggleKey]
        
        if toggles[toggleKey] then
            button.BackgroundColor3 = Colors.ToggleOn
            button.BackgroundTransparency = 0.2
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.Text = "  " .. name .. "  ✓"
            print("✅ " .. name .. " enabled")
        else
            button.BackgroundColor3 = Colors.ToggleOff
            button.BackgroundTransparency = 0.3
            button.TextColor3 = Colors.TextDim
            button.Text = "  " .. name
            print("❌ " .. name .. " disabled")
        end
    end)
    
    return button
end

-- Clear content area
local function clearContentArea()
    for _, child in pairs(contentArea:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
end

-- Load section content
local function loadSectionContent(section)
    clearContentArea()
    contentLabel.Text = section
    local yPos = 0.30
    
    if section == "Main" then
        subtitleLabel.Text = "Main features"
        createContentToggle("⚡ Speed Hack", yPos, "SpeedHack")
        createContentToggle("🕊️ Fly Hack", yPos + 0.08, "FlyHack")
        createContentToggle("👁️ Player ESP", yPos + 0.16, "ESP")
        
    elseif section == "Farm" then
        subtitleLabel.Text = "Farming automation"
        createContentToggle("🌾 Auto Farm", yPos, "AutoFarm")
        createContentToggle("⚔️ Auto Attack", yPos + 0.08, "AutoAttack")
        createContentToggle("💎 Auto Collect", yPos + 0.16, "AutoCollect")
        
    elseif section == "PVP" then
        subtitleLabel.Text = "Combat enhancements"
        createContentToggle("🎯 Silent Aim", yPos, "SilentAim")
        createContentToggle("🔫 Aimbot", yPos + 0.08, "Aimbot")
        createContentToggle("🛡️ Auto Block", yPos + 0.16, "AutoBlock")
        
    elseif section == "Settings" then
        subtitleLabel.Text = "Hub configuration"
        createContentToggle("🔔 Notifications", yPos, "Notifications")
        createContentToggle("🎨 Purple Theme", yPos + 0.08, "PurpleTheme")
        
    else
        subtitleLabel.Text = section .. " - Coming soon!"
    end
end

-- Create Sidebar Button
local function createSidebarButton(name, icon, position, section)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 32)
    button.Position = UDim2.new(0, 10, 0, position)
    button.BackgroundColor3 = Colors.Button
    button.BackgroundTransparency = 0.5
    button.BorderSizePixel = 0
    button.Text = "  " .. icon .. "  " .. name
    button.TextColor3 = Colors.TextDim
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 13
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.AutoButtonColor = false
    button.Parent = sidebar
    
    -- Selection indicator (left border)
    local leftBorder = Instance.new("Frame")
    leftBorder.Size = UDim2.new(0, 3, 1, 0)
    leftBorder.Position = UDim2.new(0, 0, 0, 0)
    leftBorder.BackgroundColor3 = Colors.Accent
    leftBorder.BackgroundTransparency = 1
    leftBorder.BorderSizePixel = 0
    leftBorder.Parent = button
    
    button.MouseButton1Click:Connect(function()
        -- Reset previous selection
        if selectedButton then
            selectedButton.BackgroundTransparency = 0.5
            selectedButton.TextColor3 = Colors.TextDim
            if selectedButton:FindFirstChild("Frame") then
                selectedButton:FindFirstChild("Frame").BackgroundTransparency = 1
            end
        end
        
        -- Set new selection
        button.BackgroundTransparency = 0.2
        button.TextColor3 = Colors.Accent
        leftBorder.BackgroundTransparency = 0
        selectedButton = button
        
        -- Load section
        loadSectionContent(section)
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
    
    return button
end

-- Create Sidebar Buttons
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
    local button = createSidebarButton(section.name, section.icon, i * 38 - 25, section.name)
    
    -- Auto-select Main
    if i == 1 then
        button.BackgroundTransparency = 0.2
        button.TextColor3 = Colors.Accent
        if button:FindFirstChild("Frame") then
            button:FindFirstChild("Frame").BackgroundTransparency = 0
        end
        selectedButton = button
        loadSectionContent("Main")
    end
end

-- Keybind System
Services.UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.RightControl then
        mainFrame.Visible = not mainFrame.Visible
        print("📌 GUI " .. (mainFrame.Visible and "shown" or "hidden"))
    end
end)

print("✅ SairHub v2 Loaded Successfully!")
print("📌 Press RIGHT CTRL to toggle GUI")
print("👤 Welcome, " .. player.Name)