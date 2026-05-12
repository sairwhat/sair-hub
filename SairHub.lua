-- SairHub v2 | Final Clean Build
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
        Background = Color3.fromRGB(25,23,36),
        Sidebar = Color3.fromRGB(30,28,46),
        Accent = Color3.fromRGB(189,147,249),
        Text = Color3.fromRGB(248,248,242),
        TextDim = Color3.fromRGB(170,165,200),
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
        TextDim = Color3.fromRGB(160,200,160),
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

-- CLOSE
local close = Instance.new("TextButton")
close.Size = UDim2.new(0,30,0,30)
close.Position = UDim2.new(1,-35,0,4)
close.BackgroundColor3 = Colors.Close
close.BackgroundTransparency = 0.3
close.Text = "✕"
close.TextColor3 = Colors.Text
close.Font = Enum.Font.GothamBold
close.TextSize = 14
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
local content = Instance.new("Frame")
content.Size = UDim2.new(1,-170,1,-38)
content.Position = UDim2.new(0,170,0,38)
content.BackgroundTransparency = 1
content.Parent = mainFrame

local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1,0,1,0)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = Colors.Accent
scroll.CanvasSize = UDim2.new(0,0,0,800)
scroll.Parent = content

local container = Instance.new("Frame")
container.Size = UDim2.new(1,0,1,0)
container.BackgroundTransparency = 1
container.Parent = scroll

local sectionTitle = Instance.new("TextLabel")
sectionTitle.Size = UDim2.new(1,-50,0,50)
sectionTitle.Position = UDim2.new(0,25,0,15)
sectionTitle.BackgroundTransparency = 1
sectionTitle.Text = "MAIN"
sectionTitle.TextColor3 = Colors.Text
sectionTitle.Font = Enum.Font.GothamBlack
sectionTitle.TextSize = 38
sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
sectionTitle.Parent = container

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1,-50,0,20)
subtitle.Position = UDim2.new(0,25,0,65)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Features"
subtitle.TextColor3 = Colors.TextDim
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 13
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = container

local divider = Instance.new("Frame")
divider.Size = UDim2.new(1,-50,0,1)
divider.Position = UDim2.new(0,25,0,95)
divider.BackgroundColor3 = Colors.Accent
divider.BackgroundTransparency = 0.5
divider.Parent = container

local togglesFrame = Instance.new("Frame")
togglesFrame.Size = UDim2.new(1,-50,0,500)
togglesFrame.Position = UDim2.new(0,25,0,110)
togglesFrame.BackgroundTransparency = 1
togglesFrame.Parent = container

local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(1,-50,0,500)
settingsFrame.Position = UDim2.new(0,25,0,110)
settingsFrame.BackgroundTransparency = 1
settingsFrame.Visible = false
settingsFrame.Parent = container

local toggleStorage = {}
local selectedButton

-- UI UPDATE
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
    divider.BackgroundColor3 = Colors.Accent
    stroke.Color = Colors.Accent

    scroll.ScrollBarImageColor3 = Colors.Accent

    for _,b in pairs(sidebarButtons) do
        b.BackgroundColor3 = Colors.Button

        if b == selectedButton then
            b.TextColor3 = Colors.Accent
        else
            b.TextColor3 = Colors.TextDim
        end
    end
end

-- TOGGLE
local function createToggle(name,y,key,parent)

    toggleStorage[key] = toggleStorage[key] or false

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,0,34)
    btn.Position = UDim2.new(0,0,0,y)
    btn.BackgroundColor3 = Colors.ToggleOff
    btn.Text = "  "..name
    btn.TextColor3 = Colors.TextDim
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 13
    btn.Parent = parent

    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,6)

    btn.MouseButton1Click:Connect(function()

        toggleStorage[key] = not toggleStorage[key]

        if toggleStorage[key] then
            btn.BackgroundColor3 = Colors.ToggleOn
            btn.TextColor3 = Colors.ToggleOnText
            btn.Text = "✓ "..name
        else
            btn.BackgroundColor3 = Colors.ToggleOff
            btn.TextColor3 = Colors.TextDim
            btn.Text = name
        end
    end)
end

-- SETTINGS (FULL)
local function loadSettings()

    subtitle.Text = "Hub Configuration"

    -- THEME BUTTON GRID
    local themes = {"Purple","Green","Ocean","Sunset","Midnight"}

    local function themeBtn(name,i)

        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.48,0,0,34)
        b.Position = UDim2.new((i%2==0) and 0.52 or 0,0,0,10 + math.floor((i-1)/2)*42)
        b.BackgroundColor3 = Colors.Button
        b.Text = name
        b.TextColor3 = Colors.TextDim
        b.Font = Enum.Font.GothamMedium
        b.TextSize = 12
        b.Parent = settingsFrame

        Instance.new("UICorner",b).CornerRadius = UDim.new(0,6)

        b.MouseButton1Click:Connect(function()
            currentSettings.theme = name
            updateUI()
            loadSection("Settings")
        end)
    end

    for i,v in ipairs(themes) do
        themeBtn(v,i)
    end

    local y = 120

    -- OPACITY
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1,0,0,20)
    label.Position = UDim2.new(0,0,0,y)
    label.BackgroundTransparency = 1
    label.Text = "🌑 Background Opacity"
    label.TextColor3 = Colors.TextDim
    label.Parent = settingsFrame

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1,0,0,8)
    bar.Position = UDim2.new(0,0,0,y+25)
    bar.BackgroundColor3 = Colors.Button
    bar.Parent = settingsFrame

    Instance.new("UICorner",bar).CornerRadius = UDim.new(1,0)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(currentSettings.globalOpacity,0,1,0)
    fill.BackgroundColor3 = Colors.Accent
    fill.Parent = bar

    Instance.new("UICorner",fill).CornerRadius = UDim.new(1,0)

    local dragging = false

    bar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
    end)

    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)

    UserInputService.InputChanged:Connect(function(i)
        if dragging then
            local p = math.clamp((i.Position.X-bar.AbsolutePosition.X)/bar.AbsoluteSize.X,0,1)
            currentSettings.globalOpacity = p
            fill.Size = UDim2.new(p,0,1,0)
            updateUI()
        end
    end)

    y = y + 70

    local function mini(text,x,key)
        toggleStorage[key] = toggleStorage[key] or false

        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0.48,0,0,34)
        b.Position = UDim2.new(x,0,0,y)
        b.BackgroundColor3 = Colors.Button
        b.Text = text
        b.TextColor3 = Colors.TextDim
        b.Parent = settingsFrame

        Instance.new("UICorner",b).CornerRadius = UDim.new(0,6)

        b.MouseButton1Click:Connect(function()
            toggleStorage[key] = not toggleStorage[key]
            b.Text = toggleStorage[key] and "✓ "..text or text
        end)
    end

    mini("💾 Save Config",0,"save")
    mini("🔁 Auto Load",0.52,"autoload")

    -- FPS BOOST
    local fps = Instance.new("TextButton")
    fps.Size = UDim2.new(0.48,0,0,34)
    fps.Position = UDim2.new(0,0,0,y+45)
    fps.BackgroundColor3 = Colors.Button
    fps.Text = "⚡ FPS Boost"
    fps.TextColor3 = Colors.TextDim
    fps.Parent = settingsFrame

    Instance.new("UICorner",fps).CornerRadius = UDim.new(0,6)

    fps.MouseButton1Click:Connect(function()
        setfpscap(999)
        fps.Text = "⚡ FPS Boost ON"
    end)
end

-- SECTION LOADER
local function loadSection(name)

    for _,v in pairs(togglesFrame:GetChildren()) do v:Destroy() end
    for _,v in pairs(settingsFrame:GetChildren()) do v:Destroy() end

    togglesFrame.Visible = name ~= "Settings"
    settingsFrame.Visible = name == "Settings"

    sectionTitle.Text = string.upper(name)

    if name == "Settings" then
        loadSettings()
    else
        subtitle.Text = "Features"

        local list = {"Speed","Fly","ESP","TP","FastWalk"}

        for i,v in ipairs(list) do
            createToggle(v,(i-1)*40,v,togglesFrame)
        end
    end
end

-- SIDEBAR + HOVER GLOW
local sections = {"Main","Farm","Extra","PVP","Shop","Misc","Settings"}

for i,name in ipairs(sections) do

    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1,-24,0,36)
    b.Position = UDim2.new(0,12,0,i*42)
    b.BackgroundColor3 = Colors.Button
    b.Text = name
    b.TextColor3 = Colors.TextDim
    b.Parent = sidebar

    Instance.new("UICorner",b).CornerRadius = UDim.new(0,6)

    b.MouseEnter:Connect(function()
        b.TextColor3 = Colors.Accent
        b.BackgroundTransparency = 0
    end)

    b.MouseLeave:Connect(function()
        if b ~= selectedButton then
            b.TextColor3 = Colors.TextDim
            b.BackgroundTransparency = 0.2
        end
    end)

    b.MouseButton1Click:Connect(function()

        if selectedButton then
            selectedButton.BackgroundTransparency = 0.2
            selectedButton.TextColor3 = Colors.TextDim
        end

        selectedButton = b
        b.TextColor3 = Colors.Accent
        b.BackgroundTransparency = 0

        loadSection(name)
    end)

    if i == 1 then
        selectedButton = b
        b.BackgroundTransparency = 0
        b.TextColor3 = Colors.Accent
        loadSection(name)
    end

    table.insert(sidebarButtons,b)
end

-- DRAG
local dragging,dragStart,startPos

topBar.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = i.Position
        startPos = mainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(i)
    if dragging then
        local d = i.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + d.X,
            startPos.Y.Scale,
            startPos.Y.Offset + d.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

print("SairHub Loaded ✔")
print("Theme Glow Sidebar Enabled ✨")
print("FPS Boost + Settings UI Ready ⚡")