local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
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

    warn("Using PlayerGui now.")
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

frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(255, 0, 0)

frame.Parent = container

local title = Instance.new("TextLabel")

title.Name = "Title"

title.Size = UDim2.new(1, -4, 0, 31)
title.Position = UDim2.fromOffset(2, 2)

title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
title.BorderSizePixel = 0

title.TextColor3 = Color3.fromRGB(255, 255, 255)

title.Text = "c00lgui Reborn by x_c00lkidd_x"

title.Font = Enum.Font.SourceSans
title.TextSize = 20

title.Active = true

title.Parent = frame

local toggleButton = Instance.new("TextButton")

toggleButton.Name = "ToggleButton"

toggleButton.Size = UDim2.fromOffset(400, 20)
toggleButton.Position = UDim2.fromOffset(0, 250)

toggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

toggleButton.BorderSizePixel = 2
toggleButton.BorderColor3 = Color3.fromRGB(255, 0, 0)

toggleButton.Text = "Close"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

toggleButton.Font = Enum.Font.Code
toggleButton.TextSize = 14

toggleButton.Parent = container

local guiOpen = true
local animationTime = 0.25

local tweenInfo = TweenInfo.new(
    animationTime,
    Enum.EasingStyle.Quart,
    Enum.EasingDirection.Out
)

toggleButton.MouseButton1Click:Connect(function()
    guiOpen = not guiOpen

    if guiOpen then
        toggleButton.Text = "Close"
        frame.Visible = true

        TweenService:Create(
            frame,
            tweenInfo,
            {
                Size = UDim2.fromOffset(400, 250)
            }
        ):Play()

        TweenService:Create(
            toggleButton,
            tweenInfo,
            {
                Position = UDim2.fromOffset(0, 250)
            }
        ):Play()
    else
        toggleButton.Text = "Open"

        TweenService:Create(
            frame,
            tweenInfo,
            {
                Size = UDim2.fromOffset(400, 35)
            }
        ):Play()

        TweenService:Create(
            toggleButton,
            tweenInfo,
            {
                Position = UDim2.fromOffset(0, 35)
            }
        ):Play()
    end
end)

local dragging = false
local dragStart
local startPosition
local dragInput

local function updateDrag(input)
    local delta = input.Position - dragStart

    local newPosition = UDim2.new(
        startPosition.X.Scale,
        startPosition.X.Offset + delta.X,
        startPosition.Y.Scale,
        startPosition.Y.Offset + delta.Y
    )

    container.Position = newPosition
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = container.Position
        dragInput = input

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                dragInput = nil
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then

        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)
