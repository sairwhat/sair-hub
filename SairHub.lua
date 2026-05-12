-- SairHub v2 | Modern UI + Theme Buttons + FPS Boost + Unified Opacity
local startTime = tick()

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

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
    Green = { Background = Color3.fromRGB(20,30,20), Sidebar = Color3.fromRGB(25,38,25), Accent = Color3.fromRGB(80,250,123), Text = Color3.fromRGB(240,255,240), TextDim = Color3.fromRGB(140,160,140), Button = Color3.fromRGB(35,50,35), ToggleOn = Color3.fromRGB(80,250,123), ToggleOff = Color3.fromRGB(35,50,35), Close = Color3.fromRGB(255,85,85), ToggleOnText = Color3.fromRGB(0,0,0) },
    Ocean = { Background = Color3.fromRGB(13,27,42), Sidebar = Color3.fromRGB(18,34,52), Accent = Color3.fromRGB(33,158,188), Text = Color3.fromRGB(240,248,255), TextDim = Color3.fromRGB(120,155,175), Button = Color3.fromRGB(22,42,63), ToggleOn = Color3.fromRGB(42,157,143), ToggleOff = Color3.fromRGB(22,42,63), Close = Color3.fromRGB(255,85,85), ToggleOnText = Color3.fromRGB(0,0,0) },
    Sunset = { Background = Color3.fromRGB(40,25,25), Sidebar = Color3.fromRGB(50,32,32), Accent = Color3.fromRGB(255,140,0), Text = Color3.fromRGB(255,240,220), TextDim = Color3.fromRGB(180,150,130), Button = Color3.fromRGB(55,38,38), ToggleOn = Color3.fromRGB(255,180,50), ToggleOff = Color3.fromRGB(55,38,38), Close = Color3.fromRGB(255,85,85), ToggleOnText = Color3.fromRGB(0,0,0) },
    Midnight = { Background = Color3.fromRGB(10,10,25), Sidebar = Color3.fromRGB(15,15,35), Accent = Color3.fromRGB(98,114,230), Text = Color3.fromRGB(230,230,250), TextDim = Color3.fromRGB(130,130,170), Button = Color3.fromRGB(20,20,40), ToggleOn = Color3.fromRGB(80,200,120), ToggleOff = Color3.fromRGB(20,20,40), Close = Color3.fromRGB(255,85,85), ToggleOnText = Color3.fromRGB(0,0,0) }
}

-- SETTINGS
local currentSettings = {
    theme = "Purple",
    globalOpacity = 0.5,
    fpsBoost = false
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
topBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1,-50,1,0)
titleLabel.Position = UDim2.new(0,18,0,0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔥 SairHub | Utility Script"
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
closeButton.BackgroundTransparency = 0.3
closeButton.Text = "✕"
closeButton.Parent = topBar
Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0,8)

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- SIDEBAR
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0,170,1,-38)
sidebar.Position = UDim2.new(0,0,0,38)
sidebar.BackgroundColor3 = Colors.Sidebar
sidebar.BackgroundTransparency = 1 - currentSettings.globalOpacity
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
scrollingFrame.ScrollBarThickness = 4
scrollingFrame.ScrollBarImageColor3 = Colors.Accent
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
sectionTitle.Font = Enum.Font.GothamBlack
sectionTitle.TextSize = 38
sectionTitle.TextColor3 = Colors.Text
sectionTitle.Parent = contentContainer

local subtitleLabel = Instance.new("TextLabel")
subtitleLabel.Size = UDim2.new(1,-50,0,20)
subtitleLabel.Position = UDim2.new(0,25,0,65)
subtitleLabel.BackgroundTransparency = 1
subtitleLabel.TextColor3 = Colors.TextDim
subtitleLabel.Font = Enum.Font.Gotham
subtitleLabel.TextSize = 13
subtitleLabel.Parent = contentContainer

-- DIVIDER
local divider = Instance.new("Frame")
divider.Size = UDim2.new(1,-50,0,1)
divider.Position = UDim2.new(0,25,0,95)
divider.BackgroundColor3 = Colors.Accent
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

-- TOGGLES
local function createToggle(name,y,key,parent)
    local state = false

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1,0,0,34)
    button.Position = UDim2.new(0,0,0,y)
    button.BackgroundColor3 = Colors.ToggleOff
    button.Text = "  "..name
    button.Parent = parent
    Instance.new("UICorner",button).CornerRadius = UDim.new(0,6)

    button.MouseButton1Click:Connect(function()
        state = not state
        button.BackgroundColor3 = state and Colors.ToggleOn or Colors.ToggleOff
        button.Text = state and " ✓ "..name or " "..name
    end)
end

-- THEME BUTTONS (NO DROPDOWN)
local function createThemeButton(name, y)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,0,34)
    btn.Position = UDim2.new(0,0,0,y)
    btn.BackgroundColor3 = Colors.Button
    btn.Text = "  "..name
    btn.TextColor3 = Colors.TextDim
    btn.Parent = settingsFrame
    Instance.new("UICorner",btn).CornerRadius = UDim.new(0,6)

    btn.MouseButton1Click:Connect(function()
        currentSettings.theme = name
        Colors = Themes[name]

        mainFrame.BackgroundColor3 = Colors.Background
        topBar.BackgroundColor3 = Colors.Sidebar
        sidebar.BackgroundColor3 = Colors.Sidebar
        uiStroke.Color = Colors.Accent
        divider.BackgroundColor3 = Colors.Accent
        scrollingFrame.ScrollBarImageColor3 = Colors.Accent
    end)
end

-- SLIDER
local function createSlider(label,min,max,current,y,callback)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1,0,0,20)
    lbl.Position = UDim2.new(0,0,0,y)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = Colors.TextDim
    lbl.Parent = settingsFrame

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(1,0,0,8)
    bar.Position = UDim2.new(0,0,0,y+30)
    bar.BackgroundColor3 = Colors.Button
    bar.Parent = settingsFrame
    Instance.new("UICorner",bar)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(current,0,1,0)
    fill.BackgroundColor3 = Colors.Accent
    fill.Parent = bar
    Instance.new("UICorner",fill)

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
            fill.Size = UDim2.new(p,0,1,0)
            callback(p)
        end
    end)
end

-- FPS BOOST
local function fpsBoostToggle()
    if currentSettings.fpsBoost then
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    else
        settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
    end
end

-- SETTINGS LAYOUT
local function loadSettings()

    createThemeButton("Purple",10)
    createThemeButton("Green",50)
    createThemeButton("Ocean",90)
    createThemeButton("Sunset",130)
    createThemeButton("Midnight",170)

    createSlider("Background Opacity",0,1,currentSettings.globalOpacity,230,function(v)
        currentSettings.globalOpacity = v
        mainFrame.BackgroundTransparency = 1-v
        topBar.BackgroundTransparency = 1-v
        sidebar.BackgroundTransparency = 1-v
    end)

    -- SIDE BY SIDE BUTTONS
    local autoSave = Instance.new("TextButton")
    autoSave.Size = UDim2.new(0.48,0,0,34)
    autoSave.Position = UDim2.new(0,0,0,300)
    autoSave.Text = "Auto Save"
    autoSave.Parent = settingsFrame
    Instance.new("UICorner",autoSave)

    local autoLoad = Instance.new("TextButton")
    autoLoad.Size = UDim2.new(0.48,0,0,34)
    autoLoad.Position = UDim2.new(0.52,0,0,300)
    autoLoad.Text = "Auto Load"
    autoLoad.Parent = settingsFrame
    Instance.new("UICorner",autoLoad)

    -- FPS BOOST BUTTON
    local fpsBtn = Instance.new("TextButton")
    fpsBtn.Size = UDim2.new(1,0,0,34)
    fpsBtn.Position = UDim2.new(0,0,0,350)
    fpsBtn.Text = "FPS Boost"
    fpsBtn.Parent = settingsFrame
    Instance.new("UICorner",fpsBtn)

    fpsBtn.MouseButton1Click:Connect(function()
        currentSettings.fpsBoost = not currentSettings.fpsBoost
        fpsBoostToggle()
        fpsBtn.Text = currentSettings.fpsBoost and "FPS Boost: ON" or "FPS Boost"
    end)
end

-- SECTION LOAD
local function loadSection(name)
    for _,v in pairs(togglesFrame:GetChildren()) do v:Destroy() end
    for _,v in pairs(settingsFrame:GetChildren()) do v:Destroy() end

    sectionTitle.Text = name:upper()

    if name == "Settings" then
        settingsFrame.Visible = true
        togglesFrame.Visible = false
        loadSettings()
    else
        settingsFrame.Visible = false
        togglesFrame.Visible = true

        for i=1,5 do
            createToggle("Feature "..i,i*40,"t"..i,togglesFrame)
        end
    end
end

-- SIDEBAR
local sections = {"Main","Farm","Extra","PVP","Shop","Misc","Settings"}

for i,v in ipairs(sections) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1,-24,0,36)
    b.Position = UDim2.new(0,12,0,i*42)
    b.Text = v
    b.Parent = sidebar
    Instance.new("UICorner",b)

    b.MouseButton1Click:Connect(function()
        loadSection(v)
    end)
end

-- DRAG FIX
local dragging,dragStart,startPos

topBar.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=true
        dragStart=i.Position
        startPos=mainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(i)
    if dragging then
        local d=i.Position-dragStart
        mainFrame.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)
    end
end)

print("SairHub Loaded Clean v2") 