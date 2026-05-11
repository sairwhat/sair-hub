-- SairHub v2 | Minimal Dracula Purple Theme with Sidebar
local Services = {
    Players = game:GetService("Players"),
    UserInputService = game:GetService("UserInputService"),
    TweenService = game:GetService("TweenService"),
    CoreGui = game:GetService("CoreGui")
}

local player = Services.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Dracula Purple Color Palette
local Colors = {
    Background = Color3.fromRGB(25, 23, 36),     -- Dark purple-black
    Sidebar = Color3.fromRGB(30, 28, 46),         -- Slightly lighter
    Accent = Color3.fromRGB(189, 147, 249),       -- Purple accent
    AccentDark = Color3.fromRGB(139, 107, 199),   -- Darker purple
    Text = Color3.fromRGB(248, 248, 242),         -- Almost white
    TextDim = Color3.fromRGB(150, 148, 168),      -- Dim text
    Button = Color3.fromRGB(40, 38, 56),          -- Button background
    ButtonHover = Color3.fromRGB(60, 57, 82),     -- Button hover
    ToggleOn = Color3.fromRGB(80, 250, 123),      -- Green for ON
    ToggleOff = Color3.fromRGB(40, 38, 56),       -- Same as button
    Close = Color3.fromRGB(255, 85, 85),          -- Red for close
    Separator = Color3.fromRGB(50, 48, 66)        -- Subtle separator
}

-- Create ScreenGui with transparency
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SairHub"
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui

-- Main Container
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 600, 0, 380)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -190)
mainFrame.BackgroundColor3 = Colors.Background
mainFrame.BackgroundTransparency = 0.15  -- Transparent effect
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

-- Rounded corners effect (using UIStroke)
local uiStroke = Instance.new("UIStroke")
uiStroke.Color = Colors.Accent
uiStroke.Thickness = 1
uiStroke.Transparency = 0.5
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
closeButton.Text = "✕"
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

-- Sidebar separator
local sidebarSeparator = Instance.new("Frame")
sidebarSeparator.Size = UDim2.new(0, 1, 1, 0)
sidebarSeparator.Position = UDim2.new(1, 0, 0, 0)
sidebarSeparator.BackgroundColor3 = Colors.Accent
sidebarSeparator.BackgroundTransparency = 0.6
sidebarSeparator.BorderSizePixel = 0
sidebarSeparator.Parent = sidebar

-- Content Area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -150, 1, -30)
contentArea.Position = UDim2.new(0, 150, 0, 30)
contentArea.BackgroundTransparency = 1
contentArea.Parent = mainFrame

-- Content Label (shows current section)
local contentLabel = Instance.new("TextLabel")
contentLabel.Size = UDim2.new(1, -40, 1, -40)
contentLabel.Position = UDim2.new(0, 20, 0, 20)
contentLabel.BackgroundTransparency = 1
contentLabel.Text = "Main"
contentLabel.TextColor3 = Colors.Text
contentLabel.Font = Enum.Font.GothamLight
contentLabel.TextSize = 48
contentLabel.TextXAlignment = Enum.TextXAlignment.Left
contentLabel.TextYAlignment = Enum.TextYAlignment.Top
contentLabel.TextTransparency = 0.8
contentLabel.Parent = contentArea

-- Subtitle
local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1, -40, 0, 20)
subtitleLabel.Position = UDim2.new(0, 20, 0, 70)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.Text = "Welcome to SairHub"
subtitleLabel.TextColor3 = Colors.TextDim
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextSize = 14
subtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
subtitleLabel.Parent = contentArea

-- Sidebar Buttons
local selectedButton = nil

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
            selectedButton.leftBorder.BackgroundTransparency = 1
        end
        
        -- Set new selection
        button.BackgroundTransparency = 0.2
        button.TextColor3 = Colors.Accent
        leftBorder.BackgroundTransparency = 0
        selectedButton = button
        
        -- Update content area
        contentLabel.Text = section
        subtitleLabel.Text = section .. " section - Coming soon"
        
        -- Animate content
        contentLabel.TextTransparency = 0.8
        Services.TweenService:Create(
            contentLabel,
            TweenInfo.new(0.3, Enum.EasingStyle.Quad),
            {TextTransparency = 0.3}
        ):Play()
        
        -- Clear existing toggles when changing sections
        for _, child in pairs(contentArea:GetChildren()) do
            if child:IsA("TextButton") or child:IsA("Frame") then
                if child.Name ~= "SectionLabel" then
                    child:Destroy()
                end
            end
        end
        
        -- Load section-specific content
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

-- Section Content Loader
function loadSectionContent(section)
    local yPos = 0.30
    
    -- Clear old content (except labels)
    for _, child in pairs(contentArea:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    -- Main section
    if section == "Main" then
        local toggles = {
            {"⚡ Speed Hack", "SpeedHack", false},
            {"🕊️ Fly Hack", "FlyHack", false},
            {"👁️ Player ESP", "ESP", false}
        }
        
        for _, toggleData in ipairs(toggles) do
            createContentToggle(toggleData[1], yPos, toggleData[2], toggleData[3])
            yPos = yPos + 0.08
        end
        
        subtitleLabel.Text = "Main features"
        
    -- Farm section
    elseif section == "Farm" then
        local toggles = {
            {"🌾 Auto Farm", "AutoFarm", false},
            {"⚔️ Auto Attack", "AutoAttack", false},
            {"💎 Auto Collect", "AutoCollect", false},
            {"📦 Auto Sell", "AutoSell", false}
        }
        
        for _, toggleData in ipairs(toggles) do
            createContentToggle(toggleData[1], yPos, toggleData[2], toggleData[3])
            yPos = yPos + 0.08
        end
        
        subtitleLabel.Text = "Farming automation"
        
    -- PVP section
    elseif section == "PVP" then
        local toggles = {
            {"🎯 Silent Aim", "SilentAim", false},
            {"🔫 Aimbot", "Aimbot", false},
            {"🛡️ Auto Block", "AutoBlock", false},
            {"💨 Hitbox Extender", "HitboxExtender", false}
        }
        
        for _, toggleData in ipairs(toggles) do
            createContentToggle(toggleData[1], yPos, toggleData[2], toggleData[3])
            yPos = yPos + 0.08
        end
        
        subtitleLabel.Text = "Combat enhancements"
        
    -- Settings section
    elseif section == "Settings" then
        local toggles = {
            {"🔔 Notifications", "Notifications", true},
            {"🎨 Purple Theme", "PurpleTheme", true},
            {"💫 Animations", "Animations", true}
        }
        
        for _, toggleData in ipairs(toggles) do
            createContentToggle(toggleData[1], yPos, toggleData[2], toggleData[3])
            yPos = yPos + 0.08
        end
        
        subtitleLabel.Text = "Hub configuration"
        
    -- Default for other sections
    else
        subtitleLabel.Text = section .. " - Coming soon!"
    end
end

-- Content Toggle Creator (for the right side)
function createContentToggle(name, yPosition, toggleKey, defaultState)
    local toggles = {
        SpeedHack = false,
        FlyHack = false,
        ESP = false,
        AutoFarm = false,
        AutoAttack = false,
        AutoCollect = false,
        AutoSell = false,
        SilentAim = false,
        Aimbot = false,
        AutoBlock = false,
        HitboxExtender = false,
        Notifications = defaultState or false,
        PurpleTheme = defaultState or false,
        Animations = defaultState or false
    }
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0, 28)
    button.Position = UDim2.new(0.05, 0, yPosition, 0)
    button.BackgroundColor3 = Colors.ToggleOff
    button.BackgroundTransparency = 0.3
    button.BorderSizePixel = 0
    button.Text = "  " .. name .. (toggles[toggleKey] and "  ✅" or "")
    button.TextColor3 = toggles[toggleKey] and Colors.ToggleOn or Colors.TextDim
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
            button.TextColor3 = Colors.Background
            button.Text = "  " .. name .. "  ✅"
        else
            button.BackgroundColor3 = Colors.ToggleOff
            button.BackgroundTransparency = 0.3
            button.TextColor3 = Colors.TextDim
            button.Text = "  " .. name
        end
    end)
    
    -- Hover effects
    button.MouseEnter:Connect(function()
        if not toggles[toggleKey] then
            button.BackgroundTransparency = 0.2
        end
    end)
    
    button.MouseLeave:Connect(function()
        if not toggles[toggleKey] then
            button.BackgroundTransparency = 0.3
        end
    end)
    
    return button
end

-- Create Sidebar Buttons
local sidebarButtons = {
    {"Main", "🏠"},
    {"Farm", "🌾"},
    {"Extra", "➕"},
    {"PVP", "⚔️"},
    {"Shop", "🛒"},
    {"Misc", "📦"},
    {"Settings", "⚙️"}
}

for i, btnData in ipairs(sidebarButtons) do
    local button = createSidebarButton(btnData[1], btnData[2], i * 40 - 30, btnData[1])
    
    -- Auto-select Main on first load
    if i == 1 then
        -- Simulate click on Main
        button.BackgroundTransparency = 0.2
        button.TextColor3 = Colors.Accent
        button.leftBorder.BackgroundTransparency = 0
        selectedButton = button
        contentLabel.Text = "Main"
        loadSectionContent("Main")
    end
end

-- User info at bottom of sidebar
local userFrame = Instance.new("Frame")
userFrame.Size = UDim2.new(1, -20, 0, 50)
userFrame.Position = UDim2.new(0, 10, 1, -60)
userFrame.BackgroundTransparency = 1
userFrame.Parent = sidebar

local userIcon = Instance.new("TextLabel")
userIcon.Size = UDim2.new(0, 30, 0, 30)
userIcon.Position = UDim2.new(0, 0, 0, 10)
userIcon.BackgroundColor3 = Colors.Accent
userIcon.BackgroundTransparency = 0.3
userIcon.Text = "👤"
userIcon.TextSize = 16
userIcon.Parent = userFrame

local userName = Instance.new("TextLabel")
userName.Size = UDim2.new(1, -40, 0, 18)
userName.Position = UDim2.new(0, 35, 0, 8)
userName.BackgroundTransparency = 1
userName.Text = player.Name
userName.TextColor3 = Colors.Text
userName.Font = Enum.Font.GothamMedium
userName.TextSize = 13
userName.TextXAlignment = Enum.TextXAlignment.Left
userName.Parent = userFrame

local userStatus = Instance.new("TextLabel")
userStatus.Size = UDim2.new(1, -40, 0, 14)
userStatus.Position = UDim2.new(0, 35, 0, 26)
userStatus.BackgroundTransparency = 1
userStatus.Text = "Online"
userStatus.TextColor3 = Colors.ToggleOn
userStatus.Font = Enum.Font.Gotham
userStatus.TextSize = 11
userStatus.TextXAlignment = Enum.TextXAlignment.Left
userStatus.Parent = userFrame

-- Animate main frame entrance
local function animateEntrance()
    mainFrame.BackgroundTransparency = 1
    mainFrame.Size = UDim2.new(0, 580, 0, 360)
    
    Services.TweenService:Create(
        mainFrame,
        TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {BackgroundTransparency = 0.15, Size = UDim2.new(0, 600, 0, 380)}
    ):Play()
end

-- Right CTRL Keybind with animation
Services.UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.RightControl then
        if mainFrame.Visible then
            mainFrame.Visible = false
        else
            mainFrame.Visible = true
            animateEntrance()
        end
    end
end)

-- Initialization
print("✅ SairHub v2 Loaded!")
print("🎨 Theme: Dracula Purple | Minimal")
print("📌 Press RIGHT CTRL to toggle")