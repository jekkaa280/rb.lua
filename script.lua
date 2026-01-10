-- Simple GUI Script for Roblox
-- Author: YourName
-- Version: 1.0

-- Wait for player to load
local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- Create main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TestGUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Create main window Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainWindow"
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100) -- Center screen
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true -- Allows dragging
MainFrame.Draggable = true -- Makes frame draggable
MainFrame.Selectable = true

-- Add rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Add shadow
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(80, 80, 90)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- Create title bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.Position = UDim2.new(0, 0, 0, 0)
TitleBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
TitleBar.BorderSizePixel = 0

local TitleBarCorner = Instance.new("UICorner")
TitleBarCorner.CornerRadius = UDim.new(0, 8)
TitleBarCorner.Parent = TitleBar

-- Title text
local TitleText = Instance.new("TextLabel")
TitleText.Name = "Title"
TitleText.Size = UDim2.new(0.7, 0, 1, 0)
TitleText.Position = UDim2.new(0, 10, 0, 0)
TitleText.BackgroundTransparency = 1
TitleText.Text = "Тестовое Окно"
TitleText.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleText.TextSize = 16
TitleText.Font = Enum.Font.GothamSemibold
TitleText.TextXAlignment = Enum.TextXAlignment.Left

-- Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.Font = Enum.Font.GothamBold

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 8)
CloseButtonCorner.Parent = CloseButton

-- Hover effect for close button
CloseButton.MouseEnter:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(220, 80, 80)
end)

CloseButton.MouseLeave:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
end)

-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    print("Окно закрыто")
end)

-- Main content
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "Content"
ContentFrame.Size = UDim2.new(1, -20, 1, -50)
ContentFrame.Position = UDim2.new(0, 10, 0, 40)
ContentFrame.BackgroundTransparency = 1

-- Hello message
local HelloText = Instance.new("TextLabel")
HelloText.Name = "HelloLabel"
HelloText.Size = UDim2.new(1, 0, 0, 60)
HelloText.Position = UDim2.new(0, 0, 0, 20)
HelloText.BackgroundTransparency = 1
HelloText.Text = "Привет! 👋\nЭто тестовое окно\nМожно перетаскивать за верхнюю панель"
HelloText.TextColor3 = Color3.fromRGB(255, 255, 255)
HelloText.TextSize = 18
HelloText.Font = Enum.Font.Gotham
HelloText.TextWrapped = true

-- Info text
local InfoText = Instance.new("TextLabel")
InfoText.Name = "InfoLabel"
InfoText.Size = UDim2.new(1, 0, 0, 40)
InfoText.Position = UDim2.new(0, 0, 0, 100)
InfoText.BackgroundTransparency = 1
InfoText.Text = "Нажмите крестик чтобы закрыть\nИли перетащите окно"
InfoText.TextColor3 = Color3.fromRGB(200, 200, 200)
InfoText.TextSize = 14
InfoText.Font = Enum.Font.Gotham
InfoText.TextWrapped = true

-- Test button
local TestButton = Instance.new("TextButton")
TestButton.Name = "TestButton"
TestButton.Size = UDim2.new(0, 120, 0, 35)
TestButton.Position = UDim2.new(0.5, -60, 0, 150)
TestButton.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
TestButton.Text = "Нажми меня!"
TestButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TestButton.TextSize = 14
TestButton.Font = Enum.Font.GothamSemibold

local TestButtonCorner = Instance.new("UICorner")
TestButtonCorner.CornerRadius = UDim.new(0, 6)
TestButtonCorner.Parent = TestButton

-- Button hover effect
TestButton.MouseEnter:Connect(function()
    TestButton.BackgroundColor3 = Color3.fromRGB(75, 115, 235)
end)

TestButton.MouseLeave:Connect(function()
    TestButton.BackgroundColor3 = Color3.fromRGB(65, 105, 225)
end)

-- Button click functionality
local clickCount = 0
TestButton.MouseButton1Click:Connect(function()
    clickCount = clickCount + 1
    HelloText.Text = string.format("Привет! 👋\nКнопка нажата: %d раз\nПродолжай тестировать!", clickCount)
    
    -- Small animation
    TestButton.Size = UDim2.new(0, 115, 0, 33)
    wait(0.1)
    TestButton.Size = UDim2.new(0, 120, 0, 35)
end)

-- Parent all elements
TitleBar.Parent = MainFrame
TitleText.Parent = TitleBar
CloseButton.Parent = TitleBar
ContentFrame.Parent = MainFrame
HelloText.Parent = ContentFrame
InfoText.Parent = ContentFrame
TestButton.Parent = ContentFrame
MainFrame.Parent = ScreenGui
ScreenGui.Parent = PlayerGui

-- Make frame draggable ONLY by title bar
TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local dragStart = input.Position
        local frameStart = MainFrame.Position
        
        local dragging
        dragging = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging:Disconnect()
            else
                local delta = input.Position - dragStart
                MainFrame.Position = UDim2.new(
                    frameStart.X.Scale,
                    frameStart.X.Offset + delta.X,
                    frameStart.Y.Scale,
                    frameStart.Y.Offset + delta.Y
                )
            end
        end)
    end
end)

-- Notification
print("Тестовый GUI загружен!")
game.StarterGui:SetCore("SendNotification", {
    Title = "GUI Загружен",
    Text = "Открыто тестовое окно",
    Duration = 3,
    Icon = "rbxassetid://0"
})

-- Optional: Toggle button (press F to hide/show)
local UIS = game:GetService("UserInputService")
local visible = true

UIS.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.F then
        visible = not visible
        MainFrame.Visible = visible
        print("Окно " .. (visible and "показано" or "скрыто"))
    end
end)

-- Instructions in output
print("\n══════════════════════════════════")
print("📱 ТЕСТОВЫЙ GUI ЗАГРУЖЕН")
print("══════════════════════════════════")
print("• Перетаскивайте окно за верхнюю панель")
print("• Нажмите крестик (X) чтобы закрыть")
print("• Нажмите F чтобы скрыть/показать окно")
print("• Кнопка 'Нажми меня!' считает клики")
print("══════════════════════════════════")
