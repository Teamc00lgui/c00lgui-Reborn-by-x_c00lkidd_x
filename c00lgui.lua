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

playerTab.Font = Enum.Font.SourceSansBold
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
playerPage.CanvasSize = UDim2.fromOffset(0, 190)

playerPage.Active = true
playerPage.Visible = true

playerPage.Parent = pages

local function createSliderControl(
    name,
    labelText,
    yPosition,
    defaultValue,
    minimumValue,
    maximumValue
)
    local label = Instance.new("TextLabel")

    label.Name = name .. "Label"
    label.Size = UDim2.fromOffset(100, 25)
    label.Position = UDim2.fromOffset(8, yPosition)

    label.BackgroundTransparency = 1

    label.Text = labelText
    label.TextColor3 = Color3.fromRGB(255, 255, 255)

    label.Font = Enum.Font.SourceSans
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left

    label.Parent = playerPage

    local slider = Instance.new("Frame")

    slider.Name = name .. "Slider"
    slider.Size = UDim2.fromOffset(190, 4)
    slider.Position = UDim2.fromOffset(105, yPosition + 11)

    slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    slider.BorderSizePixel = 0

    slider.Parent = playerPage

    local percentage = (
        defaultValue - minimumValue
    ) / (
        maximumValue - minimumValue
    )

    local fill = Instance.new("Frame")

    fill.Name = "Fill"
    fill.Size = UDim2.fromScale(percentage, 1)

    fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    fill.BorderSizePixel = 0

    fill.Parent = slider

    local knob = Instance.new("Frame")

    knob.Name = "Knob"
    knob.Size = UDim2.fromOffset(10, 10)
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.Position = UDim2.fromScale(percentage, 0.5)

    knob.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    knob.BorderSizePixel = 0

    knob.Parent = slider

    local valueBox = Instance.new("TextBox")

    valueBox.Name = "Value"
    valueBox.Size = UDim2.fromOffset(55, 22)
    valueBox.Position = UDim2.fromOffset(305, yPosition)

    valueBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

    valueBox.BorderSizePixel = 1
    valueBox.BorderColor3 = Color3.fromRGB(120, 0, 0)

    valueBox.Text = tostring(defaultValue)
    valueBox.TextColor3 = Color3.fromRGB(255, 255, 255)

    valueBox.Font = Enum.Font.SourceSans
    valueBox.TextSize = 14

    valueBox.ClearTextOnFocus = false

    valueBox.Parent = playerPage

    return {
        label = label,
        slider = slider,
        fill = fill,
        knob = knob,
        valueBox = valueBox,
        currentValue = defaultValue,
        minimumValue = minimumValue,
        maximumValue = maximumValue
    }
end

local walkSpeedControl = createSliderControl(
    "WalkSpeed",
    "WalkSpeed",
    8,
    16,
    0,
    500
)

local jumpPowerControl = createSliderControl(
    "JumpPower",
    "JumpPower",
    38,
    50,
    0,
    300
)

local gravityControl = createSliderControl(
    "Gravity",
    "Gravity",
    68,
    196.2,
    0,
    500
)

local characterSizeControl = createSliderControl(
    "CharacterSize",
    "CharacterSize",
    98,
    1,
    0.1,
    5
)

local toggleButton = Instance.new("TextButton")

toggleButton.Name = "ToggleButton"

toggleButton.Size = UDim2.fromOffset(400, 20)
toggleButton.Position = UDim2.fromOffset(0, 250)

toggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

toggleButton.BorderSizePixel = 2
toggleButton.BorderColor3 = Color3.fromRGB(255, 0, 0)

toggleButton.Text = "Close"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)

toggleButton.Font = Enum.Font.SourceSans
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

        frameTween.Completed:Once(function()
            if not guiOpen then
                animating = false
                return
            end

            playContentTweens(fadeTweens)

            task.delay(contentFadeTime, function()
                if guiOpen then
                    animating = false
                end
            end)
        end)
    end
end)

local function setControlValue(control, value)
    value = math.clamp(
        value,
        control.minimumValue,
        control.maximumValue
    )

    control.currentValue = value
    control.valueBox.Text = tostring(value)

    local percentage = (
        value - control.minimumValue
    ) / (
        control.maximumValue - control.minimumValue
    )

    control.fill.Size = UDim2.fromScale(percentage, 1)
    control.knob.Position = UDim2.fromScale(percentage, 0.5)
end

local function setWalkSpeed(value)
    setControlValue(walkSpeedControl, value)

    local character = player.Character

    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.WalkSpeed = walkSpeedControl.currentValue
        end
    end
end

local function setJumpPower(value)
    setControlValue(jumpPowerControl, value)

    local character = player.Character

    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.UseJumpPower = true
            humanoid.JumpPower = jumpPowerControl.currentValue
        end
    end
end

local function setGravity(value)
    setControlValue(gravityControl, value)

    workspace.Gravity = gravityControl.currentValue
end

local function setCharacterSize(value)
    setControlValue(characterSizeControl, value)

    local character = player.Character

    if not character then
        return
    end

    pcall(function()
        character:ScaleTo(characterSizeControl.currentValue)
    end)
end

local function connectControl(control, setter)
    local dragging = false

    local function updateSlider(input)
        local relativeX = input.Position.X - control.slider.AbsolutePosition.X

        local percentage = math.clamp(
            relativeX / control.slider.AbsoluteSize.X,
            0,
            1
        )

        local value = control.minimumValue + (
            (control.maximumValue - control.minimumValue) * percentage
        )

        if control == characterSizeControl then
            value = math.floor(value * 10 + 0.5) / 10
        elseif control == gravityControl then
            value = math.floor(value * 10 + 0.5) / 10
        else
            value = math.round(value)
        end

        setter(value)
    end

    control.slider.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then

            dragging = true

            updateSlider(input)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging then
            if input.UserInputType == Enum.UserInputType.MouseMovement
                or input.UserInputType == Enum.UserInputType.Touch then

                updateSlider(input)
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then

            dragging = false
        end
    end)

    control.valueBox.FocusLost:Connect(function()
        local value = tonumber(control.valueBox.Text)

        if value then
            setter(value)
        else
            control.valueBox.Text = tostring(control.currentValue)
        end
    end)
end

connectControl(walkSpeedControl, setWalkSpeed)
connectControl(jumpPowerControl, setJumpPower)
connectControl(gravityControl, setGravity)
connectControl(characterSizeControl, setCharacterSize)

local function applyCharacterSettings()
    local character = player.Character

    if not character then
        return
    end

    character:WaitForChild("Humanoid")

    task.wait()

    setWalkSpeed(walkSpeedControl.currentValue)
    setJumpPower(jumpPowerControl.currentValue)
    setCharacterSize(characterSizeControl.currentValue)
end

player.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")

    task.wait(0.1)

    applyCharacterSettings()
end)

setWalkSpeed(16)
setJumpPower(50)
setGravity(196.2)

if player.Character then
    setCharacterSize(1)
end

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
