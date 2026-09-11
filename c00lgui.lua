local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer

local existingCoreGui = CoreGui:FindFirstChild("c00lgui")

if existingCoreGui then
    existingCoreGui:Destroy()
end

local playerGui = player:FindFirstChild("PlayerGui")

if playerGui then
    local existingPlayerGui = playerGui:FindFirstChild("c00lgui")

    if existingPlayerGui then
        existingPlayerGui:Destroy()
    end
end

local gui = Instance.new("ScreenGui")

gui.Name = "c00lgui"
gui.ResetOnSpawn = false

local success = pcall(function()
    gui.Parent = CoreGui
end)

if not success then
    gui.Parent = player:WaitForChild("PlayerGui")
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

local pages = Instance.new("Frame")

pages.Name = "Pages"
pages.Size = UDim2.new(1, 0, 1, -25)
pages.Position = UDim2.fromOffset(0, 25)

pages.BackgroundTransparency = 1
pages.BorderSizePixel = 0

pages.ZIndex = 1

pages.Parent = content

local pageSelector = Instance.new("TextButton")

pageSelector.Name = "PageSelector"
pageSelector.Size = UDim2.fromOffset(140, 25)
pageSelector.Position = UDim2.fromOffset(6, 0)

pageSelector.BackgroundTransparency = 1
pageSelector.BorderSizePixel = 0

pageSelector.Text = "PLAYER  ▼"
pageSelector.TextColor3 = Color3.fromRGB(255, 255, 255)

pageSelector.Font = Enum.Font.SourceSansBold
pageSelector.TextSize = 14
pageSelector.TextXAlignment = Enum.TextXAlignment.Left

pageSelector.AutoButtonColor = false
pageSelector.ZIndex = 10

pageSelector.Parent = content

local pageDropdown = Instance.new("Frame")

pageDropdown.Name = "PageDropdown"
pageDropdown.Size = UDim2.fromOffset(140, 100)
pageDropdown.Position = UDim2.fromOffset(6, 25)

pageDropdown.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
pageDropdown.BorderSizePixel = 0

pageDropdown.Visible = false
pageDropdown.ZIndex = 20

pageDropdown.Parent = content

local playerPage = Instance.new("ScrollingFrame")

playerPage.Name = "PlayerPage"
playerPage.Size = UDim2.fromScale(1, 1)
playerPage.Position = UDim2.fromOffset(0, 0)

playerPage.BackgroundTransparency = 1
playerPage.BorderSizePixel = 0

playerPage.ScrollBarThickness = 3
playerPage.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)

playerPage.ScrollingDirection = Enum.ScrollingDirection.Y
playerPage.CanvasSize = UDim2.fromOffset(0, 0)

playerPage.Active = true
playerPage.Visible = false

playerPage.ZIndex = 1

playerPage.Parent = pages

local visualsPage = Instance.new("ScrollingFrame")

visualsPage.Name = "VisualsPage"
visualsPage.Size = UDim2.fromScale(1, 1)
visualsPage.Position = UDim2.fromOffset(0, 0)

visualsPage.BackgroundTransparency = 1
visualsPage.BorderSizePixel = 0

visualsPage.ScrollBarThickness = 3
visualsPage.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)

visualsPage.ScrollingDirection = Enum.ScrollingDirection.Y
visualsPage.CanvasSize = UDim2.fromOffset(0, 0)

visualsPage.Active = true
visualsPage.Visible = false

visualsPage.ZIndex = 1

visualsPage.Parent = pages

local serverPage = Instance.new("ScrollingFrame")

serverPage.Name = "ServerPage"
serverPage.Size = UDim2.fromScale(1, 1)
serverPage.Position = UDim2.fromOffset(0, 0)

serverPage.BackgroundTransparency = 1
serverPage.BorderSizePixel = 0

serverPage.ScrollBarThickness = 3
serverPage.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)

serverPage.ScrollingDirection = Enum.ScrollingDirection.Y
serverPage.CanvasSize = UDim2.fromOffset(0, 0)

serverPage.Active = true
serverPage.Visible = false

serverPage.ZIndex = 1

serverPage.Parent = pages

local musicPage = Instance.new("ScrollingFrame")

musicPage.Name = "MusicPage"
musicPage.Size = UDim2.fromScale(1, 1)
musicPage.Position = UDim2.fromOffset(0, 0)

musicPage.BackgroundTransparency = 1
musicPage.BorderSizePixel = 0

musicPage.ScrollBarThickness = 3
musicPage.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)

musicPage.ScrollingDirection = Enum.ScrollingDirection.Y
musicPage.CanvasSize = UDim2.fromOffset(0, 0)

musicPage.Active = true
musicPage.Visible = false

musicPage.ZIndex = 1

musicPage.Parent = pages

local pageFrames = {}

pageFrames.Player = playerPage
pageFrames.Visuals = visualsPage
pageFrames.Server = serverPage
pageFrames.Music = musicPage

local function createPageOption(name, text, position)
    local option = Instance.new("TextButton")

    option.Name = name .. "Option"
    option.Size = UDim2.new(1, 0, 0, 25)
    option.Position = UDim2.fromOffset(0, position)

    option.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    option.BackgroundTransparency = 0

    option.BorderSizePixel = 0

    option.Text = text
    option.TextColor3 = Color3.fromRGB(255, 255, 255)

    option.Font = Enum.Font.SourceSansBold
    option.TextSize = 14
    option.TextXAlignment = Enum.TextXAlignment.Left

    option.AutoButtonColor = false
    option.ZIndex = 21

    option.Parent = pageDropdown

    return option
end

local playerOption = createPageOption(
    "Player",
    "PLAYER",
    0
)

local visualsOption = createPageOption(
    "Visuals",
    "VISUALS",
    25
)

local serverOption = createPageOption(
    "Server",
    "SERVER",
    50
)

local musicOption = createPageOption(
    "Music",
    "MUSIC",
    75
)

local selectedPage = nil

local function setSelectorText(pageName, opened)
    local arrow = opened and "▲" or "▼"

    if pageName == "Player" then
        pageSelector.Text = "PLAYER  " .. arrow
    elseif pageName == "Visuals" then
        pageSelector.Text = "VISUALS  " .. arrow
    elseif pageName == "Server" then
        pageSelector.Text = "SERVER  " .. arrow
    elseif pageName == "Music" then
        pageSelector.Text = "MUSIC  " .. arrow
    end
end

local function selectPage(pageName)
    local page = pageFrames[pageName]

    if not page then
        return
    end

    for name, pageFrame in pairs(pageFrames) do
        pageFrame.Visible = name == pageName
    end

    selectedPage = pageName

    pageDropdown.Visible = false

    setSelectorText(pageName, false)
end

pageSelector.MouseButton1Click:Connect(function()
    pageDropdown.Visible = not pageDropdown.Visible

    setSelectorText(
        selectedPage,
        pageDropdown.Visible
    )
end)

playerOption.MouseButton1Click:Connect(function()
    selectPage("Player")
end)

visualsOption.MouseButton1Click:Connect(function()
    selectPage("Visuals")
end)

serverOption.MouseButton1Click:Connect(function()
    selectPage("Server")
end)

musicOption.MouseButton1Click:Connect(function()
    selectPage("Music")
end)

pageSelector.MouseEnter:Connect(function()
    pageSelector.TextColor3 = Color3.fromRGB(255, 0, 0)
end)

pageSelector.MouseLeave:Connect(function()
    pageSelector.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

local pageOptions = {
    playerOption,
    visualsOption,
    serverOption,
    musicOption
}

pageDropdown.Size = UDim2.fromOffset(
    140,
    #pageOptions * 25
)

for _, option in ipairs(pageOptions) do
    option.MouseEnter:Connect(function()
        option.BackgroundColor3 = Color3.fromRGB(22, 0, 0)
        option.TextColor3 = Color3.fromRGB(255, 0, 0)
    end)

    option.MouseLeave:Connect(function()
        option.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
        option.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)
end

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

local function createPlayerButton(name, text, xPosition, yPosition)
    local button = Instance.new("TextButton")

    button.Name = name
    button.Size = UDim2.fromOffset(140, 25)
    button.Position = UDim2.fromOffset(xPosition, yPosition)

    button.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

    button.BorderSizePixel = 1
    button.BorderColor3 = Color3.fromRGB(120, 0, 0)

    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 0, 0)

    button.Font = Enum.Font.SourceSans
    button.TextSize = 14

    button.AutoButtonColor = false

    button.Parent = playerPage

    return button
end

local FlyButton = createPlayerButton(
    "FlyButton",
    "Fly: OFF",
    8,
    130
)

local NoclipButton = createPlayerButton(
    "NoclipButton",
    "Noclip: OFF",
    160,
    130
)

local mobileFlyControls = Instance.new("Frame")

mobileFlyControls.Name = "MobileFlyControls"
mobileFlyControls.Size = UDim2.fromOffset(70, 150)
mobileFlyControls.Position = UDim2.new(1, -90, 1, -190)

mobileFlyControls.BackgroundTransparency = 1
mobileFlyControls.BorderSizePixel = 0

mobileFlyControls.Visible = false
mobileFlyControls.ZIndex = 100

mobileFlyControls.Parent = gui

local mobileFlyUpButton = Instance.new("TextButton")

mobileFlyUpButton.Name = "FlyUp"
mobileFlyUpButton.Size = UDim2.fromOffset(60, 60)
mobileFlyUpButton.Position = UDim2.fromOffset(5, 0)

mobileFlyUpButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
mobileFlyUpButton.BackgroundTransparency = 0.15

mobileFlyUpButton.BorderSizePixel = 2
mobileFlyUpButton.BorderColor3 = Color3.fromRGB(255, 0, 0)

mobileFlyUpButton.Text = "▲"
mobileFlyUpButton.TextColor3 = Color3.fromRGB(255, 255, 255)

mobileFlyUpButton.Font = Enum.Font.SourceSansBold
mobileFlyUpButton.TextSize = 26

mobileFlyUpButton.AutoButtonColor = false
mobileFlyUpButton.ZIndex = 101

mobileFlyUpButton.Parent = mobileFlyControls

local mobileFlyDownButton = Instance.new("TextButton")

mobileFlyDownButton.Name = "FlyDown"
mobileFlyDownButton.Size = UDim2.fromOffset(60, 60)
mobileFlyDownButton.Position = UDim2.fromOffset(5, 70)

mobileFlyDownButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
mobileFlyDownButton.BackgroundTransparency = 0.15

mobileFlyDownButton.BorderSizePixel = 2
mobileFlyDownButton.BorderColor3 = Color3.fromRGB(255, 0, 0)

mobileFlyDownButton.Text = "▼"
mobileFlyDownButton.TextColor3 = Color3.fromRGB(255, 255, 255)

mobileFlyDownButton.Font = Enum.Font.SourceSansBold
mobileFlyDownButton.TextSize = 26

mobileFlyDownButton.AutoButtonColor = false
mobileFlyDownButton.ZIndex = 101

mobileFlyDownButton.Parent = mobileFlyControls

local flying = false

local flyVelocity
local flyAttachment
local flyOrientation
local flyOrientationAttachment
local flyConnection

local flyUp = false
local flyDown = false

local mobileDevice = UserInputService.TouchEnabled

local function setMobileFlyControlsVisible(visible)
    if not mobileDevice then
        mobileFlyControls.Visible = false
        return
    end

    mobileFlyControls.Visible = visible
end

local function stopFly()
    flying = false
    flyUp = false
    flyDown = false

    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end

    if flyVelocity then
        flyVelocity:Destroy()
        flyVelocity = nil
    end

    if flyOrientation then
        flyOrientation:Destroy()
        flyOrientation = nil
    end

    if flyAttachment then
        flyAttachment:Destroy()
        flyAttachment = nil
    end

    if flyOrientationAttachment then
        flyOrientationAttachment:Destroy()
        flyOrientationAttachment = nil
    end

    setMobileFlyControlsVisible(false)

    local character = player.Character

    if character then
        local animate = character:FindFirstChild("Animate")

        if animate then
            animate.Disabled = false
        end

        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            humanoid.AutoRotate = true
        end
    end

    FlyButton.Text = "Fly: OFF"
    FlyButton.TextColor3 = Color3.fromRGB(255, 0, 0)
end

local function updateFly()
    if not flying or not flyVelocity then
        return
    end

    local character = player.Character

    if not character then
        stopFly()
        return
    end

    local root = character:FindFirstChild("HumanoidRootPart")

    if not root then
        return
    end

    local camera = workspace.CurrentCamera

    if not camera then
        return
    end

    local direction = Vector3.zero

    if mobileDevice then
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            direction += humanoid.MoveDirection
        end
    else
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            direction += camera.CFrame.LookVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            direction -= camera.CFrame.LookVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            direction -= camera.CFrame.RightVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            direction += camera.CFrame.RightVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            direction += Vector3.yAxis
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            direction -= Vector3.yAxis
        end
    end

    if flyUp then
        direction += Vector3.yAxis
    end

    if flyDown then
        direction -= Vector3.yAxis
    end

    if direction.Magnitude > 0 then
        direction = direction.Unit * 50
    end

    flyVelocity.VectorVelocity = direction

    if flyOrientation then
        local lookDirection = camera.CFrame.LookVector

        if lookDirection.Magnitude > 0 then
            flyOrientation.CFrame = CFrame.lookAt(
                root.Position,
                root.Position + lookDirection.Unit
            )
        end
    end
end

local function startFly()
    if flying then
        return
    end

    local character = player.Character

    if not character then
        return
    end

    local root = character:FindFirstChild("HumanoidRootPart")

    if not root then
        return
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid.AutoRotate = false
    end

    local animate = character:FindFirstChild("Animate")

    if animate then
        animate.Disabled = true
    end

    flyAttachment = Instance.new("Attachment")
    flyAttachment.Name = "c00lFlyAttachment"
    flyAttachment.Parent = root

    flyVelocity = Instance.new("LinearVelocity")
    flyVelocity.Name = "c00lFlyVelocity"
    flyVelocity.Attachment0 = flyAttachment
    flyVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
    flyVelocity.MaxForce = math.huge
    flyVelocity.VectorVelocity = Vector3.zero
    flyVelocity.Parent = root

    flyOrientationAttachment = Instance.new("Attachment")
    flyOrientationAttachment.Name = "c00lFlyOrientationAttachment"
    flyOrientationAttachment.Parent = root

    flyOrientation = Instance.new("AlignOrientation")
    flyOrientation.Name = "c00lFlyOrientation"
    flyOrientation.Attachment0 = flyOrientationAttachment
    flyOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
    flyOrientation.MaxTorque = math.huge
    flyOrientation.Responsiveness = 20
    flyOrientation.CFrame = root.CFrame
    flyOrientation.Parent = root

    flying = true

    FlyButton.Text = "Fly: ON"
    FlyButton.TextColor3 = Color3.fromRGB(0, 255, 0)

    setMobileFlyControlsVisible(true)

    flyConnection = RunService.RenderStepped:Connect(updateFly)
end

FlyButton.MouseButton1Click:Connect(function()
    if flying then
        stopFly()
    else
        startFly()
    end
end)

mobileFlyUpButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then

        flyUp = true
    end
end)

mobileFlyUpButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then

        flyUp = false
    end
end)

mobileFlyDownButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then

        flyDown = true
    end
end)

mobileFlyDownButton.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then

        flyDown = false
    end
end)

mobileFlyUpButton.MouseEnter:Connect(function()
    mobileFlyUpButton.BackgroundColor3 = Color3.fromRGB(22, 0, 0)
end)

mobileFlyUpButton.MouseLeave:Connect(function()
    mobileFlyUpButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
end)

mobileFlyDownButton.MouseEnter:Connect(function()
    mobileFlyDownButton.BackgroundColor3 = Color3.fromRGB(22, 0, 0)
end)

mobileFlyDownButton.MouseLeave:Connect(function()
    mobileFlyDownButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
end)

local noclip = false
local noclipConnection

local function stopNoclip()
    noclip = false

    if noclipConnection then
        noclipConnection:Disconnect()
        noclipConnection = nil
    end

    local character = player.Character

    if character then
        for _, object in ipairs(character:GetDescendants()) do
            if object:IsA("BasePart") then
                object.CanCollide = true
            end
        end
    end

    NoclipButton.Text = "Noclip: OFF"
    NoclipButton.TextColor3 = Color3.fromRGB(255, 0, 0)
end

local function updateNoclip()
    if not noclip then
        return
    end

    local character = player.Character

    if not character then
        return
    end

    for _, object in ipairs(character:GetDescendants()) do
        if object:IsA("BasePart") then
            object.CanCollide = false
        end
    end
end

local function startNoclip()
    if noclip then
        return
    end

    local character = player.Character

    if not character then
        return
    end

    noclip = true

    NoclipButton.Text = "Noclip: ON"
    NoclipButton.TextColor3 = Color3.fromRGB(0, 255, 0)

    noclipConnection = RunService.Stepped:Connect(updateNoclip)

    updateNoclip()
end

NoclipButton.MouseButton1Click:Connect(function()
    if noclip then
        stopNoclip()
    else
        startNoclip()
    end
end)

local musicSound = SoundService:FindFirstChild("c00lguiMusic")

if not musicSound then
    musicSound = Instance.new("Sound")
    musicSound.Name = "c00lguiMusic"
    musicSound.Volume = 0.5
    musicSound.Looped = true
    musicSound.Parent = SoundService
end

musicSound.Volume = 0.5
musicSound.PlaybackSpeed = 1

local musicTitle = Instance.new("TextLabel")

musicTitle.Name = "MusicTitle"
musicTitle.Size = UDim2.fromOffset(300, 25)
musicTitle.Position = UDim2.fromOffset(8, 8)

musicTitle.BackgroundTransparency = 1

musicTitle.Text = "MUSIC"
musicTitle.TextColor3 = Color3.fromRGB(255, 255, 255)

musicTitle.Font = Enum.Font.SourceSansBold
musicTitle.TextSize = 16
musicTitle.TextXAlignment = Enum.TextXAlignment.Left

musicTitle.Parent = musicPage

local musicIdBox = Instance.new("TextBox")

musicIdBox.Name = "MusicIdBox"
musicIdBox.Size = UDim2.fromOffset(210, 25)
musicIdBox.Position = UDim2.fromOffset(8, 38)

musicIdBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

musicIdBox.BorderSizePixel = 1
musicIdBox.BorderColor3 = Color3.fromRGB(120, 0, 0)

musicIdBox.Text = ""
musicIdBox.PlaceholderText = "Music ID"
musicIdBox.TextColor3 = Color3.fromRGB(255, 255, 255)
musicIdBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)

musicIdBox.Font = Enum.Font.SourceSans
musicIdBox.TextSize = 14

musicIdBox.ClearTextOnFocus = false

musicIdBox.Parent = musicPage

local musicPlayButton = Instance.new("TextButton")

musicPlayButton.Name = "MusicPlayButton"
musicPlayButton.Size = UDim2.fromOffset(75, 25)
musicPlayButton.Position = UDim2.fromOffset(225, 38)

musicPlayButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

musicPlayButton.BorderSizePixel = 1
musicPlayButton.BorderColor3 = Color3.fromRGB(120, 0, 0)

musicPlayButton.Text = "PLAY"
musicPlayButton.TextColor3 = Color3.fromRGB(255, 0, 0)

musicPlayButton.Font = Enum.Font.SourceSans
musicPlayButton.TextSize = 14

musicPlayButton.AutoButtonColor = false

musicPlayButton.Parent = musicPage

local musicStopButton = Instance.new("TextButton")

musicStopButton.Name = "MusicStopButton"
musicStopButton.Size = UDim2.fromOffset(75, 25)
musicStopButton.Position = UDim2.fromOffset(310, 38)

musicStopButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

musicStopButton.BorderSizePixel = 1
musicStopButton.BorderColor3 = Color3.fromRGB(120, 0, 0)

musicStopButton.Text = "STOP"
musicStopButton.TextColor3 = Color3.fromRGB(255, 0, 0)

musicStopButton.Font = Enum.Font.SourceSans
musicStopButton.TextSize = 14

musicStopButton.AutoButtonColor = false

musicStopButton.Parent = musicPage

local musicVolumeControl = Instance.new("Frame")

musicVolumeControl.Name = "MusicVolumeControl"
musicVolumeControl.Size = UDim2.fromOffset(377, 25)
musicVolumeControl.Position = UDim2.fromOffset(8, 72)

musicVolumeControl.BackgroundTransparency = 1
musicVolumeControl.BorderSizePixel = 0

musicVolumeControl.Parent = musicPage

local musicVolumeLabel = Instance.new("TextLabel")

musicVolumeLabel.Name = "Label"
musicVolumeLabel.Size = UDim2.fromOffset(100, 25)
musicVolumeLabel.Position = UDim2.fromOffset(0, 0)

musicVolumeLabel.BackgroundTransparency = 1

musicVolumeLabel.Text = "Volume"
musicVolumeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

musicVolumeLabel.Font = Enum.Font.SourceSans
musicVolumeLabel.TextSize = 14
musicVolumeLabel.TextXAlignment = Enum.TextXAlignment.Left

musicVolumeLabel.Parent = musicVolumeControl

local musicVolumeSlider = Instance.new("Frame")

musicVolumeSlider.Name = "Slider"
musicVolumeSlider.Size = UDim2.fromOffset(190, 4)
musicVolumeSlider.Position = UDim2.fromOffset(97, 11)

musicVolumeSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
musicVolumeSlider.BorderSizePixel = 0

musicVolumeSlider.Parent = musicVolumeControl

local musicVolumeFill = Instance.new("Frame")

musicVolumeFill.Name = "Fill"
musicVolumeFill.Size = UDim2.fromScale(0.5, 1)

musicVolumeFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
musicVolumeFill.BorderSizePixel = 0

musicVolumeFill.Parent = musicVolumeSlider

local musicVolumeKnob = Instance.new("Frame")

musicVolumeKnob.Name = "Knob"
musicVolumeKnob.Size = UDim2.fromOffset(10, 10)
musicVolumeKnob.AnchorPoint = Vector2.new(0.5, 0.5)
musicVolumeKnob.Position = UDim2.fromScale(0.5, 0.5)

musicVolumeKnob.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
musicVolumeKnob.BorderSizePixel = 0

musicVolumeKnob.Parent = musicVolumeSlider

local musicVolumeBox = Instance.new("TextBox")

musicVolumeBox.Name = "Value"
musicVolumeBox.Size = UDim2.fromOffset(55, 22)
musicVolumeBox.Position = UDim2.fromOffset(297, 0)

musicVolumeBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

musicVolumeBox.BorderSizePixel = 1
musicVolumeBox.BorderColor3 = Color3.fromRGB(120, 0, 0)

musicVolumeBox.Text = "0.5"
musicVolumeBox.TextColor3 = Color3.fromRGB(255, 255, 255)

musicVolumeBox.Font = Enum.Font.SourceSans
musicVolumeBox.TextSize = 14

musicVolumeBox.ClearTextOnFocus = false

musicVolumeBox.Parent = musicVolumeControl

local musicPitchControl = Instance.new("Frame")

musicPitchControl.Name = "MusicPitchControl"
musicPitchControl.Size = UDim2.fromOffset(377, 25)
musicPitchControl.Position = UDim2.fromOffset(8, 102)

musicPitchControl.BackgroundTransparency = 1
musicPitchControl.BorderSizePixel = 0

musicPitchControl.Parent = musicPage

local musicPitchLabel = Instance.new("TextLabel")

musicPitchLabel.Name = "Label"
musicPitchLabel.Size = UDim2.fromOffset(100, 25)
musicPitchLabel.Position = UDim2.fromOffset(0, 0)

musicPitchLabel.BackgroundTransparency = 1

musicPitchLabel.Text = "Pitch"
musicPitchLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

musicPitchLabel.Font = Enum.Font.SourceSans
musicPitchLabel.TextSize = 14
musicPitchLabel.TextXAlignment = Enum.TextXAlignment.Left

musicPitchLabel.Parent = musicPitchControl

local musicPitchSlider = Instance.new("Frame")

musicPitchSlider.Name = "Slider"
musicPitchSlider.Size = UDim2.fromOffset(190, 4)
musicPitchSlider.Position = UDim2.fromOffset(97, 11)

musicPitchSlider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
musicPitchSlider.BorderSizePixel = 0

musicPitchSlider.Parent = musicPitchControl

local musicPitchFill = Instance.new("Frame")

musicPitchFill.Name = "Fill"
musicPitchFill.Size = UDim2.fromScale(0.333333, 1)

musicPitchFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
musicPitchFill.BorderSizePixel = 0

musicPitchFill.Parent = musicPitchSlider

local musicPitchKnob = Instance.new("Frame")

musicPitchKnob.Name = "Knob"
musicPitchKnob.Size = UDim2.fromOffset(10, 10)
musicPitchKnob.AnchorPoint = Vector2.new(0.5, 0.5)
musicPitchKnob.Position = UDim2.fromScale(0.333333, 0.5)

musicPitchKnob.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
musicPitchKnob.BorderSizePixel = 0

musicPitchKnob.Parent = musicPitchSlider

local musicPitchBox = Instance.new("TextBox")

musicPitchBox.Name = "Value"
musicPitchBox.Size = UDim2.fromOffset(55, 22)
musicPitchBox.Position = UDim2.fromOffset(297, 0)

musicPitchBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

musicPitchBox.BorderSizePixel = 1
musicPitchBox.BorderColor3 = Color3.fromRGB(120, 0, 0)

musicPitchBox.Text = "1"
musicPitchBox.TextColor3 = Color3.fromRGB(255, 255, 255)

musicPitchBox.Font = Enum.Font.SourceSans
musicPitchBox.TextSize = 14

musicPitchBox.ClearTextOnFocus = false

musicPitchBox.Parent = musicPitchControl

local presetTitle = Instance.new("TextLabel")

presetTitle.Name = "PresetTitle"
presetTitle.Size = UDim2.fromOffset(300, 25)
presetTitle.Position = UDim2.fromOffset(8, 135)

presetTitle.BackgroundTransparency = 1

presetTitle.Text = "PRESET MUSIC"
presetTitle.TextColor3 = Color3.fromRGB(255, 255, 255)

presetTitle.Font = Enum.Font.SourceSansBold
presetTitle.TextSize = 14
presetTitle.TextXAlignment = Enum.TextXAlignment.Left

presetTitle.Parent = musicPage

local musicPresets = {
    {
        Name = "Electro Sp00ky",
        Id = "96965660515155"
    }
}

local function extractMusicId(text)
    local id = tostring(text):match("%d+")

    return id
end

local function playMusic(id)
    local musicId = extractMusicId(id)

    if not musicId then
        return
    end

    musicSound.SoundId = "rbxassetid://" .. musicId
    musicSound:Play()
end

local function stopMusic()
    musicSound:Stop()
end

local function setMusicVolume(value)
    value = math.clamp(value, 0, 1)

    value = math.floor(value * 100 + 0.5) / 100

    musicSound.Volume = value
    musicVolumeBox.Text = tostring(value)

    local percentage = value

    musicVolumeFill.Size = UDim2.fromScale(
        percentage,
        1
    )

    musicVolumeKnob.Position = UDim2.fromScale(
        percentage,
        0.5
    )
end

local function setMusicPitch(value)
    value = math.clamp(value, 0.5, 2)

    value = math.floor(value * 100 + 0.5) / 100

    musicSound.PlaybackSpeed = value
    musicPitchBox.Text = tostring(value)

    local percentage = (
        value - 0.5
    ) / (
        2 - 0.5
    )

    musicPitchFill.Size = UDim2.fromScale(
        percentage,
        1
    )

    musicPitchKnob.Position = UDim2.fromScale(
        percentage,
        0.5
    )
end

local function connectMusicSlider(
    slider,
    valueBox,
    minimumValue,
    maximumValue,
    setter
)
    local dragging = false

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

        value = math.floor(value * 100 + 0.5) / 100

        setter(value)
    end

    slider.InputBegan:Connect(function(input)
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

    valueBox.FocusLost:Connect(function()
        local value = tonumber(valueBox.Text)

        if value then
            setter(value)
        else
            valueBox.Text = tostring(
                minimumValue
            )
        end
    end)
end

connectMusicSlider(
    musicVolumeSlider,
    musicVolumeBox,
    0,
    1,
    setMusicVolume
)

connectMusicSlider(
    musicPitchSlider,
    musicPitchBox,
    0.5,
    2,
    setMusicPitch
)

local function createMusicPreset(name, id, yPosition)
    local button = Instance.new("TextButton")

    button.Name = name:gsub("%s+", "") .. "Button"
    button.Size = UDim2.fromOffset(377, 25)
    button.Position = UDim2.fromOffset(8, yPosition)

    button.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

    button.BorderSizePixel = 1
    button.BorderColor3 = Color3.fromRGB(120, 0, 0)

    button.Text = name
    button.TextColor3 = Color3.fromRGB(255, 0, 0)

    button.Font = Enum.Font.SourceSans
    button.TextSize = 14
    button.TextXAlignment = Enum.TextXAlignment.Left

    button.AutoButtonColor = false

    button.Parent = musicPage

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(22, 0, 0)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)

    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
        button.TextColor3 = Color3.fromRGB(255, 0, 0)
    end)

    button.MouseButton1Click:Connect(function()
        musicIdBox.Text = id
        playMusic(id)
    end)

    return button
end

local presetY = 165

for _, preset in ipairs(musicPresets) do
    createMusicPreset(
        preset.Name,
        preset.Id,
        presetY
    )

    presetY += 30
end

musicPlayButton.MouseEnter:Connect(function()
    musicPlayButton.BackgroundColor3 = Color3.fromRGB(22, 0, 0)
end)

musicPlayButton.MouseLeave:Connect(function()
    musicPlayButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
end)

musicStopButton.MouseEnter:Connect(function()
    musicStopButton.BackgroundColor3 = Color3.fromRGB(22, 0, 0)
end)

musicStopButton.MouseLeave:Connect(function()
    musicStopButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
end)

musicPlayButton.MouseButton1Click:Connect(function()
    playMusic(musicIdBox.Text)
end)

musicStopButton.MouseButton1Click:Connect(function()
    stopMusic()
end)

local function updateCanvasSize(scrollingFrame)
    local contentHeight = 0

    for _, object in ipairs(scrollingFrame:GetChildren()) do
        if object:IsA("GuiObject") then
            local bottom = (
                object.Position.Y.Offset
                + object.Size.Y.Offset
            )

            if bottom > contentHeight then
                contentHeight = bottom
            end
        end
    end

    scrollingFrame.CanvasSize = UDim2.fromOffset(
        0,
        contentHeight + 10
    )
end

updateCanvasSize(playerPage)
updateCanvasSize(visualsPage)
updateCanvasSize(serverPage)
updateCanvasSize(musicPage)

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

        pageDropdown.Visible = false

        if selectedPage then
            setSelectorText(selectedPage, false)
        end

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

    if flying then
        stopFly()
    end

    if noclip then
        stopNoclip()
    end

    applyCharacterSettings()
end)

setWalkSpeed(16)
setJumpPower(50)
setGravity(196.2)
setMusicVolume(0.5)
setMusicPitch(1)

if player.Character then
    setCharacterSize(1)
end

selectPage("Player")

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
