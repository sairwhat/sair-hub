local Services = {
    Players = game:GetService("Players"),
    UserInputService = game:GetService("UserInputService"),
    CoreGui = game:GetService("CoreGui")
}

local player = Services.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SairHub"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 250)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -40, 1, 0)
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🔥 SairHub"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = titleBar

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 35)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.Parent = titleBar

closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

local separator = Instance.new("Frame")
separator.Size = UDim2.new(1, 0, 0, 1)
separator.Position = UDim2.new(0, 0, 0, 35)
separator.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
separator.BorderSizePixel = 0
separator.Parent = mainFrame

local toggles = {
    SpeedHack = false,
    FlyHack = false,
    ESP = false
}

local function createToggle(name, yPosition, toggleKey)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.9, 0, 0, 35)
    button.Position = UDim2.new(0.05, 0, yPosition, 0)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.BorderSizePixel = 0
    button.Text = name .. ": OFF"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    button.Parent = mainFrame
    
    button.MouseButton1Click:Connect(function()
        toggles[toggleKey] = not toggles[toggleKey]
        
        if toggles[toggleKey] then
            button.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            button.Text = name .. ": ON ✅"
        else
            button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            button.Text = name .. ": OFF"
        end
    end)
    
    return button
end

createToggle("⚡ Speed Hack", 0.20, "SpeedHack")
createToggle("🕊️ Fly Hack", 0.38, "FlyHack")
createToggle("👁️ ESP", 0.56, "ESP")

-- Right CTRL Keybind (Toggle Show/Hide)
Services.UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.RightControl then
        mainFrame.Visible = not mainFrame.Visible
    end
end)

print("✅ SairHub Loaded!")
print("📌 Press RIGHT CTRL to toggle GUI")