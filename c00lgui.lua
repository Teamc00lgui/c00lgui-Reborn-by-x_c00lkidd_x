local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui")

gui.Name = "c00lgui"
gui.ResetOnSpawn = false

local success = pcall(function()
    gui.Parent = CoreGui
end)

if not success then
    local Players = game:GetService("Players")

    local player = Players.LocalPlayer

    gui.Parent = player:WaitForChild("PlayerGui")

    warn("Sem permissão para anexar ao CoreGui. Usando PlayerGui como alternativa.")
end

local container = Instance.new("Frame")

container.Name = "MainContainer"
container.Size = UDim2.fromOffset(400, 270)
container.Position = UDim2.fromScale(0.5, 0.5)
container.AnchorPoint = Vector2.new(0.5, 0.5)
container.BackgroundTransparency = 1
container.BorderSizePixel = 0

container.Parent = gui

local frame = Instance.new("Frame")

frame.Name = "MainFrame"
frame.Size = UDim2.fromOffset(400, 250)
frame.Position = UDim2.fromOffset(0, 0)

frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)

frame.Parent = container

local title = Instance.new("TextLabel")

title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 35)
title.Position = UDim2.fromOffset(0, 0)

title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
title.TextColor3 = Color3.fromRGB(255, 255, 255)

title.Text = "c00lgui Reborn by x_c00lkidd_x"

title.Font = Enum.Font.SourceSans
title.TextSize = 20

title.Parent = frame

local toggleButton = Instance.new("TextButton")

toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.fromOffset(400, 20)
toggleButton.Position = UDim2.fromOffset(0, 250)

toggleButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

toggleButton.BorderSizePixel = 2
toggleButton.BorderColor3 = Color3.fromRGB(255, 0, 0)

toggleButton.Text = "Close"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

toggleButton.Font = Enum.Font.Code
toggleButton.TextSize = 14

toggleButton.Parent = container

local guiOpen = true

toggleButton.MouseButton1Click:Connect(function()
    guiOpen = not guiOpen

    frame.Visible = guiOpen
    toggleButton.Text = guiOpen and "Close" or "Open"
end)

local dragging = false
local dragStart
local startPosition

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true

        dragStart = input.Position
        startPosition = container.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart

        container.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
