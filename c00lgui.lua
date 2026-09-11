local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local gui = Instance.new("ScreenGui")

gui.Name = "c00lgui"
gui.ResetOnSpawn = false

local success = pcall(function()
    gui.Parent = CoreGui
end)

if not success then
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

local content = Instance.new("CanvasGroup")

content.Name = "Content"
content.Size = UDim2.new(1, -4, 1, -35)
content.Position = UDim2.fromOffset(2, 35)

content.BackgroundTransparency = 1
content.BorderSizePixel = 0

content.GroupTransparency = 0

content.Parent = frame

local tabBar = Instance.new("Frame")

tabBar.Name = "TabBar"
tabBar.Size = UDim2.new(1, 0, 0, 25)
tabBar.Position = UDim2.fromOffset(0, 0)

tabBar.BackgroundTransparency = 1
tabBar.BorderSizePixel = 0

tabBar.Parent = content

local playerTab = Instance.new("TextButton")

playerTab.Name = "PlayerTab"
playerTab.Size = UDim2.fromOffset(80, 25)
playerTab.Position = UDim2.fromOffset(0, 0)

playerTab.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

playerTab.BorderSizePixel = 0

playerTab.Text = "PLAYER"
playerTab.TextColor3 = Color3.fromRGB(255, 255, 255)

playerTab.Font = Enum.Font.Code
playerTab.TextSize = 14

playerTab.Parent = tabBar

local pages = Instance.new("Frame")

pages.Name = "Pages"
pages.Size = UDim2.new(1, 0, 1, -25)
pages.Position = UDim2.fromOffset(0, 25)

pages.BackgroundTransparency = 1
pages.BorderSizePixel = 0

pages.Parent = content

local playerPage = Instance.new("ScrollingFrame")

playerPage.Name = "PlayerPage"
playerPage.Size = UDim2.fromScale(1, 1)
playerPage.Position = UDim2.fromOffset(0, 0)

playerPage.BackgroundTransparency = 1
playerPage.BorderSizePixel = 0

playerPage.ScrollBarThickness = 3
playerPage.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)

playerPage.ScrollingDirection = Enum.ScrollingDirection.Y
playerPage.CanvasSize = UDim2.fromOffset(0, 100)

playerPage.Active = true
playerPage.Visible = true

playerPage.Parent = pages

local walkSpeedLabel = Instance.new("TextLabel")

walkSpeedLabel.Name = "WalkSpeedLabel"
walkSpeedLabel.Size = UDim2.fromOffset(100, 25)
walkSpeedLabel.Position = UDim2.fromOffset(8, 8)

walkSpeedLabel.BackgroundTransparency = 1

walkSpeedLabel.Text = "WalkSpeed"
walkSpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

walkSpeedLabel.Font = Enum.Font.Code
walkSpeedLabel.TextSize = 14
walkSpeedLabel.TextXAlignment = Enum.TextXAlignment.Left

walkSpeedLabel.Parent = playerPage

local slider = Instance.new("Frame")

slider.Name = "WalkSpeedSlider"
slider.Size = UDim2.fromOffset(190, 4)
slider.Position = UDim2.fromOffset(105, 19)

slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
slider.BorderSizePixel = 0

slider.Parent = playerPage

local fill = Instance.new("Frame")

fill.Name = "Fill"
fill.Size = UDim2.fromScale(0.032, 1)

fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
fill.BorderSizePixel = 0

fill.Parent = slider

local knob = Instance.new("Frame")

knob.Name = "Knob"
knob.Size = UDim2.fromOffset(10, 10)
knob.AnchorPoint = Vector2.new(0.5, 0.5)
knob.Position = UDim2.fromScale(0.032, 0.5)

knob.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
knob.BorderSizePixel = 0

knob.Parent = slider

local valueBox = Instance.new("TextBox")

valueBox.Name = "Value"
valueBox.Size = UDim2.fromOffset(55, 22)
valueBox.Position = UDim2.fromOffset(305, 8)

valueBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

valueBox.BorderSizePixel = 1
valueBox.BorderColor3 = Color3.fromRGB(120, 0, 0)

valueBox.Text = "16"
valueBox.TextColor3 = Color3.fromRGB(255, 255, 255)

valueBox.Font = Enum.Font.Code
valueBox.TextSize = 14

valueBox.ClearTextOnFocus = false

valueBox.Parent = playerPage

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

local player = Players.LocalPlayer

local guiOpen = true
local animating = false

local animationTime = 0.55
local contentFadeTime = 0.25

local tweenInfo = TweenInfo.new(
    animationTime,
    Enum.EasingStyle.Quint,
    Enum.EasingDirection.Out
)

local contentTweenInfo = TweenInfo.new(
    contentFadeTime,
    Enum.EasingStyle.Quint,
    Enum.EasingDirection.Out
)

local transparencyObjects = {}

for _, object in ipairs(content:GetDescendants()) do
    if object:IsA("GuiObject") then
        local data = {
            object = object,
            BackgroundTransparency = object.BackgroundTransparency
        }

        if object:IsA("TextLabel")
            or object:IsA("TextButton")
            or object:IsA("TextBox") then

            data.TextTransparency = object.TextTransparency
            data.TextStrokeTransparency = object.TextStrokeTransparency
        end

        if object:IsA("ImageLabel")
            or object:IsA("ImageButton") then

            data.ImageTransparency = object.ImageTransparency
        end

        table.insert(transparencyObjects, data)
    end
end

local function createContentTween(fadeOut)
    local tweens = {}

    for _, data in ipairs(transparencyObjects) do
        local object = data.object

        if object and object.Parent then
            local properties = {}

            if fadeOut then
                properties.BackgroundTransparency = 1

                if data.TextTransparency ~= nil then
                    properties.TextTransparency = 1
                    properties.TextStrokeTransparency = 1
                end

                if data.ImageTransparency ~= nil then
                    properties.ImageTransparency = 1
                end
            else
                properties.BackgroundTransparency = data.BackgroundTransparency

                if data.TextTransparency ~= nil then
                    properties.TextTransparency = data.TextTransparency
                    properties.TextStrokeTransparency = data.TextStrokeTransparency
                end

                if data.ImageTransparency ~= nil then
                    properties.ImageTransparency = data.ImageTransparency
                end
            end

            local tween = TweenService:Create(
                object,
                contentTweenInfo,
                properties
            )

            table.insert(tweens, tween)
        end
    end

    return tweens
end

local function playContentTweens(tweens)
    for _, tween in ipairs(tweens) do
        tween:Play()
    end
end

toggleButton.MouseButton1Click:Connect(function()
    if animating then
        return
    end

    animating = true

    if guiOpen then
        guiOpen = false
        toggleButton.Text = "Open"

        local fadeTweens = createContentTween(true)

        playContentTweens(fadeTweens)

        task.delay(contentFadeTime, function()
            if guiOpen then
                animating = false
                return
            end

            content.Visible = false

            local frameTween = TweenService:Create(
                frame,
                tweenInfo,
                {
                    Size = UDim2.fromOffset(400, 35)
                }
            )

            local buttonTween = TweenService:Create(
                toggleButton,
                tweenInfo,
                {
                    Position = UDim2.fromOffset(0, 35)
                }
            )

            frameTween:Play()
            buttonTween:Play()

            frameTween.Completed:Once(function()
                animating = false
            end)
        end)

    else
        guiOpen = true
        toggleButton.Text = "Close"

        frame.Visible = true
        content.Visible = true

        frame.Size = UDim2.fromOffset(400, 35)
        toggleButton.Position = UDim2.fromOffset(0, 35)

        local fadeTweens = createContentTween(false)

        local frameTween = TweenService:Create(
            frame,
            tweenInfo,
            {
                Size = UDim2.fromOffset(400, 250)
            }
        )

        local buttonTween = TweenService:Create(
            toggleButton,
            tweenInfo,
            {
                Position = UDim2.fromOffset(0, 250)
            }
        )

        frameTween:Play()
        buttonTween:Play()
        playContentTweens(fadeTweens)

        frameTween.Completed:Once(function()
            animating = false
        end)
    end
end)

local currentValue = 16
local minimumValue = 0
local maximumValue = 500

local function setWalkSpeed(value)
    value = math.clamp(value, minimumValue, maximumValue)

    currentValue = value

    valueBox.Text = tostring(value)

    local percentage = (value - minimumValue) / (maximumValue - minimumValue)

    fill.Size = UDim2.fromScale(percentage, 1)
    knob.Position = UDim2.fromScale(percentage, 0.5)

    local character = player.Character

    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.WalkSpeed = value
        end
    end
end

local draggingSlider = false

local function updateSlider(input)
    local relativeX = input.Position.X - slider.AbsolutePosition.X

    local percentage = math.clamp(
        relativeX / slider.AbsoluteSize.X,
        0,
        1
    )

    local value = minimumValue + (
        (maximumValue - minimumValue) * percentage
    )

    value = math.round(value)

    setWalkSpeed(value)
end

slider.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        draggingSlider = true

        updateSlider(input)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if draggingSlider then
        if input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch then

            updateSlider(input)
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        draggingSlider = false
    end
end)

valueBox.FocusLost:Connect(function()
    local value = tonumber(valueBox.Text)

    if value then
        value = math.clamp(value, minimumValue, maximumValue)

        setWalkSpeed(value)
    else
        valueBox.Text = tostring(currentValue)
    end
end)

setWalkSpeed(16)

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
