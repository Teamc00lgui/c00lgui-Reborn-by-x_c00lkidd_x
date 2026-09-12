local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Lighting = game:GetService("Lighting")

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

local function createPage(name)
    local page = Instance.new("ScrollingFrame")

    page.Name = name .. "Page"
    page.Size = UDim2.fromScale(1, 1)
    page.Position = UDim2.fromOffset(0, 0)

    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0

    page.ScrollBarThickness = 3
    page.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)

    page.ScrollingDirection = Enum.ScrollingDirection.Y
    page.CanvasSize = UDim2.fromOffset(0, 0)

    page.Active = true
    page.Visible = false

    page.ZIndex = 1

    page.Parent = pages

    return page
end

local playerPage = createPage("Player")
local visualsPage = createPage("Visuals")
local trollPage = createPage("Troll")
local musicPage = createPage("Music")
local executorPage = createPage("Executor")

local pageFrames = {
    Player = playerPage,
    Visuals = visualsPage,
    Troll = trollPage,
    Music = musicPage,
    Executor = executorPage
}

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

local trollOption = createPageOption(
    "Troll",
    "TROLL",
    50
)

local musicOption = createPageOption(
    "Music",
    "MUSIC",
    75
)

local executorOption = createPageOption(
    "Executor",
    "EXECUTOR",
    100
)

local pageOptions = {
    playerOption,
    visualsOption,
    trollOption,
    musicOption,
    executorOption
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

local selectedPage = nil

local function setSelectorText(pageName, opened)
    local arrow = opened and "▲" or "▼"

    if pageName == "Player" then
        pageSelector.Text = "PLAYER  " .. arrow
    elseif pageName == "Visuals" then
        pageSelector.Text = "VISUALS  " .. arrow
    elseif pageName == "Troll" then
        pageSelector.Text = "TROLL  " .. arrow
    elseif pageName == "Music" then
        pageSelector.Text = "MUSIC  " .. arrow
    elseif pageName == "Executor" then
        pageSelector.Text = "EXECUTOR  " .. arrow
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

trollOption.MouseButton1Click:Connect(function()
    selectPage("Troll")
end)

musicOption.MouseButton1Click:Connect(function()
    selectPage("Music")
end)

executorOption.MouseButton1Click:Connect(function()
    selectPage("Executor")
end)

pageSelector.MouseEnter:Connect(function()
    pageSelector.TextColor3 = Color3.fromRGB(255, 0, 0)
end)

pageSelector.MouseLeave:Connect(function()
    pageSelector.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

local function createSliderControl(
    parent,
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

    label.Parent = parent

    local slider = Instance.new("Frame")

    slider.Name = name .. "Slider"
    slider.Size = UDim2.fromOffset(190, 4)
    slider.Position = UDim2.fromOffset(105, yPosition + 11)

    slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    slider.BorderSizePixel = 0

    slider.Parent = parent

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

    valueBox.Parent = parent

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
    playerPage,
    "WalkSpeed",
    "WalkSpeed",
    8,
    16,
    0,
    500
)

local jumpPowerControl = createSliderControl(
    playerPage,
    "JumpPower",
    "JumpPower",
    38,
    50,
    0,
    300
)

local gravityControl = createSliderControl(
    playerPage,
    "Gravity",
    "Gravity",
    68,
    196.2,
    0,
    500
)

local characterSizeControl = createSliderControl(
    playerPage,
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

local InfiniteJumpButton = createPlayerButton(
    "InfiniteJumpButton",
    "Infinite Jump: OFF",
    8,
    160
)

local ClickTeleportButton = createPlayerButton(
    "ClickTeleportButton",
    "Click Teleport: OFF",
    160,
    160
)

local ForceFieldButton = createPlayerButton(
    "ForceFieldButton",
    "ForceField: OFF",
    8,
    190
)

local GodButton = createPlayerButton(
    "GodButton",
    "God: OFF",
    160,
    190
)

local forceFieldEnabled = false
local godEnabled = false
local godConnection
local originalMaxHealth

local function removeForceField()
    local character = player.Character

    if not character then
        return
    end

    local forceField = character:FindFirstChild("c00lForceField")

    if forceField then
        forceField:Destroy()
    end
end

local function stopForceField()
    forceFieldEnabled = false

    removeForceField()

    ForceFieldButton.Text = "ForceField: OFF"
    ForceFieldButton.TextColor3 = Color3.fromRGB(255, 0, 0)
end

local function startForceField()
    forceFieldEnabled = true

    local character = player.Character

    if character then
        local forceField = character:FindFirstChild("c00lForceField")

        if not forceField then
            forceField = Instance.new("ForceField")
            forceField.Name = "c00lForceField"
            forceField.Parent = character
        end
    end

    ForceFieldButton.Text = "ForceField: ON"
    ForceFieldButton.TextColor3 = Color3.fromRGB(0, 255, 0)
end

local godHealth = 1e9

local function stopGod()
    godEnabled = false

    if godConnection then
        godConnection:Disconnect()
        godConnection = nil
    end

    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if humanoid and originalMaxHealth then
        humanoid.MaxHealth = originalMaxHealth
        humanoid.Health = math.min(
            humanoid.Health,
            humanoid.MaxHealth
        )
    end

    originalMaxHealth = nil

    GodButton.Text = "God: OFF"
    GodButton.TextColor3 = Color3.fromRGB(255, 0, 0)
end

local function startGod()
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    if not humanoid then
        return
    end

    godEnabled = true
    originalMaxHealth = humanoid.MaxHealth

    humanoid.MaxHealth = godHealth
    humanoid.Health = godHealth

    godConnection = humanoid.HealthChanged:Connect(function()
        if not godEnabled then
            return
        end

        if humanoid.Health < godHealth then
            humanoid.Health = godHealth
        end
    end)

    GodButton.Text = "God: ON"
    GodButton.TextColor3 = Color3.fromRGB(0, 255, 0)
end

ForceFieldButton.MouseButton1Click:Connect(function()
    if forceFieldEnabled then
        stopForceField()
    else
        startForceField()
    end
end)

GodButton.MouseButton1Click:Connect(function()
    if godEnabled then
        stopGod()
    else
        startGod()
    end
end)

local clickTeleport = false

local function stopClickTeleport()
    clickTeleport = false

    ClickTeleportButton.Text = "Click Teleport: OFF"
    ClickTeleportButton.TextColor3 = Color3.fromRGB(255, 0, 0)
end

local function startClickTeleport()
    clickTeleport = true

    ClickTeleportButton.Text = "Click Teleport: ON"
    ClickTeleportButton.TextColor3 = Color3.fromRGB(0, 255, 0)
end

ClickTeleportButton.MouseButton1Click:Connect(function()
    if clickTeleport then
        stopClickTeleport()
    else
        startClickTeleport()
    end
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not clickTeleport then
        return
    end

    if gameProcessed then
        return
    end

    if input.UserInputType ~= Enum.UserInputType.MouseButton1
        and input.UserInputType ~= Enum.UserInputType.Touch then
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

    local camera = workspace.CurrentCamera

    if not camera then
        return
    end

    local position = input.Position

    local ray = camera:ScreenPointToRay(
        position.X,
        position.Y
    )

    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {
        character
    }

    local result = workspace:Raycast(
        ray.Origin,
        ray.Direction * 1000,
        raycastParams
    )

    if not result then
        return
    end

    root.CFrame = CFrame.new(
        result.Position + Vector3.new(0, 3, 0)
    )
end)

local infiniteJump = false

local function stopInfiniteJump()
    infiniteJump = false

    InfiniteJumpButton.Text = "Infinite Jump: OFF"
    InfiniteJumpButton.TextColor3 = Color3.fromRGB(255, 0, 0)
end

local function startInfiniteJump()
    infiniteJump = true

    InfiniteJumpButton.Text = "Infinite Jump: ON"
    InfiniteJumpButton.TextColor3 = Color3.fromRGB(0, 255, 0)
end

InfiniteJumpButton.MouseButton1Click:Connect(function()
    if infiniteJump then
        stopInfiniteJump()
    else
        startInfiniteJump()
    end
end)

UserInputService.JumpRequest:Connect(function()
    if not infiniteJump then
        return
    end

    local character = player.Character

    if not character then
        return
    end

    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

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
local flyAnimationConnection

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

local function stopAllAnimations(character)
    local humanoid = character:FindFirstChildOfClass("Humanoid")

    if not humanoid then
        return
    end

    local animator = humanoid:FindFirstChildOfClass("Animator")

    if animator then
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            track:Stop(0)
        end
    end
end

local function disableFlyAnimationStates(humanoid)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
end

local function enableFlyAnimationStates(humanoid)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
end

local function stopFly()
    flying = false
    flyUp = false
    flyDown = false

    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end

    if flyAnimationConnection then
        flyAnimationConnection:Disconnect()
        flyAnimationConnection = nil
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
            enableFlyAnimationStates(humanoid)
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
    local lookDirection = camera.CFrame.LookVector
    local rightDirection = camera.CFrame.RightVector

if mobileDevice then
    local PlayerModule = player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")
    local controls = require(PlayerModule):GetControls()
    local moveVector = controls:GetMoveVector()

    local cameraLook = Vector3.new(
        lookDirection.X,
        0,
        lookDirection.Z
    )

    local cameraRight = Vector3.new(
        rightDirection.X,
        0,
        rightDirection.Z
    )

    if cameraLook.Magnitude > 0 then
        cameraLook = cameraLook.Unit
    end

    if cameraRight.Magnitude > 0 then
        cameraRight = cameraRight.Unit
    end

    direction =
        cameraRight * moveVector.X
        - cameraLook * moveVector.Z
end
    else
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            direction += lookDirection
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            direction -= lookDirection
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            direction -= rightDirection
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            direction += rightDirection
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            direction += Vector3.yAxis
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            direction -= Vector3.yAxis
        end

        if direction.Magnitude > 0 then
            direction = direction.Unit * 50
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

if flyOrientation and not mobileDevice and lookDirection.Magnitude > 0 then
    flyOrientation.CFrame = CFrame.lookAt(
        root.Position,
        root.Position + lookDirection.Unit
    )
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
    humanoid.AutoRotate = mobileDevice

    disableFlyAnimationStates(humanoid)
end

    local animate = character:FindFirstChild("Animate")

    if animate then
        animate.Disabled = true
    end

    stopAllAnimations(character)

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

flyAnimationConnection = RunService.RenderStepped:Connect(function()
    if not flying then
        return
    end

    local currentCharacter = player.Character

    if currentCharacter then
        stopAllAnimations(currentCharacter)
    end
end)

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

local chaosTexture = "rbxassetid://116754971513830"

local visualsDecalName = "c00lVisualDecal"
local visualsFireName = "c00lVisualFire"
local visualsParticlesName = "c00lVisualParticles"
local visualsSkyName = "c00lVisualSky"

local function createVisualButton(name, text, xPosition, yPosition, width)
    local button = Instance.new("TextButton")

    button.Name = name
    button.Size = UDim2.fromOffset(width or 377, 25)
    button.Position = UDim2.fromOffset(xPosition, yPosition)

    button.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

    button.BorderSizePixel = 1
    button.BorderColor3 = Color3.fromRGB(120, 0, 0)

    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 0, 0)

    button.Font = Enum.Font.SourceSans
    button.TextSize = 14
    button.TextXAlignment = Enum.TextXAlignment.Left

    button.AutoButtonColor = false

    button.Parent = visualsPage

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(22, 0, 0)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
    end)

    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
        button.TextColor3 = Color3.fromRGB(255, 0, 0)
    end)

    return button
end

local visualsTitle = Instance.new("TextLabel")

visualsTitle.Name = "VisualsTitle"
visualsTitle.Size = UDim2.fromOffset(300, 25)
visualsTitle.Position = UDim2.fromOffset(8, 8)

visualsTitle.BackgroundTransparency = 1

visualsTitle.Text = "VISUALS"
visualsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)

visualsTitle.Font = Enum.Font.SourceSansBold
visualsTitle.TextSize = 16
visualsTitle.TextXAlignment = Enum.TextXAlignment.Left

visualsTitle.Parent = visualsPage

local spamDecalButton = createVisualButton(
    "SpamDecalButton",
    "Spam Decal",
    8,
    38
)

local fireButton = createVisualButton(
    "FireButton",
    "Fire",
    8,
    68,
    183
)

local particlesButton = createVisualButton(
    "ParticlesButton",
    "Particles",
    202,
    68,
    183
)

local skyButton = createVisualButton(
    "SkyButton",
    "Sky / Skybox",
    8,
    98
)

local removeDecalsButton = createVisualButton(
    "RemoveDecalsButton",
    "Remove Decals",
    8,
    128
)

local removeFireButton = createVisualButton(
    "RemoveFireButton",
    "Remove Fire",
    8,
    158
)

local removeParticlesButton = createVisualButton(
    "RemoveParticlesButton",
    "Remove Particles",
    8,
    188
)

local removeSkyButton = createVisualButton(
    "RemoveSkyButton",
    "Remove Sky",
    8,
    218
)

local function createSpamDecals()
    local faces = {
        Enum.NormalId.Front,
        Enum.NormalId.Back,
        Enum.NormalId.Left,
        Enum.NormalId.Right,
        Enum.NormalId.Top,
        Enum.NormalId.Bottom
    }

    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") then
            for _, face in ipairs(faces) do
                local decalName = visualsDecalName .. face.Name

                if not object:FindFirstChild(decalName) then
                    local decal = Instance.new("Decal")

                    decal.Name = decalName
                    decal.Texture = chaosTexture
                    decal.Face = face

                    decal.Parent = object
                end
            end
        end
    end
end

local function removeSpamDecals()
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("Decal")
            and object.Name:sub(1, #visualsDecalName) == visualsDecalName then

            object:Destroy()
        end
    end
end

local function createFire()
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") then
            if not object:FindFirstChild(visualsFireName) then
                local fire = Instance.new("Fire")

                fire.Name = visualsFireName
                fire.Heat = 8

                local character = object:FindFirstAncestorOfClass("Model")
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")

                if humanoid then
                    fire.Size = 5
                else
                    fire.Size = math.max(
                        object.Size.X,
                        object.Size.Y,
                        object.Size.Z
                    ) * 0.5
                end

                fire.Parent = object
            end
        end
    end
end

local function removeFire()
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("Fire")
            and object.Name == visualsFireName then

            object:Destroy()
        end
    end
end

local function createParticles()
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("BasePart") then
            if not object:FindFirstChild(visualsParticlesName) then
                local particles = Instance.new("ParticleEmitter")

                particles.Name = visualsParticlesName
                particles.Texture = chaosTexture
                particles.Rate = 8
                particles.Lifetime = NumberRange.new(2, 4)
                particles.Speed = NumberRange.new(1, 3)
                particles.SpreadAngle = Vector2.new(360, 360)
                particles.Rotation = NumberRange.new(0, 360)
                particles.RotSpeed = NumberRange.new(-90, 90)
                particles.Size = NumberSequence.new(1)

                particles.Parent = object
            end
        end
    end
end

local function removeParticles()
    for _, object in ipairs(workspace:GetDescendants()) do
        if object:IsA("ParticleEmitter")
            and object.Name == visualsParticlesName then

            object:Destroy()
        end
    end
end

local function createSky()
    local existingSky = Lighting:FindFirstChild(visualsSkyName)

    if existingSky then
        existingSky:Destroy()
    end

    local sky = Instance.new("Sky")

    sky.Name = visualsSkyName

    sky.SkyboxBk = chaosTexture
    sky.SkyboxDn = chaosTexture
    sky.SkyboxFt = chaosTexture
    sky.SkyboxLf = chaosTexture
    sky.SkyboxRt = chaosTexture
    sky.SkyboxUp = chaosTexture

    sky.Parent = Lighting
end

local function removeSky()
    local sky = Lighting:FindFirstChild(visualsSkyName)

    if sky then
        sky:Destroy()
    end
end

spamDecalButton.MouseButton1Click:Connect(function()
    createSpamDecals()
end)

fireButton.MouseButton1Click:Connect(function()
    createFire()
end)

particlesButton.MouseButton1Click:Connect(function()
    createParticles()
end)

skyButton.MouseButton1Click:Connect(function()
    createSky()
end)

removeDecalsButton.MouseButton1Click:Connect(function()
    removeSpamDecals()
end)

removeFireButton.MouseButton1Click:Connect(function()
    removeFire()
end)

removeParticlesButton.MouseButton1Click:Connect(function()
    removeParticles()
end)

removeSkyButton.MouseButton1Click:Connect(function()
    removeSky()
end)

local TrollTitle = Instance.new("TextLabel")

TrollTitle.Name = "TrollTitle"
TrollTitle.Size = UDim2.fromOffset(377, 25)
TrollTitle.Position = UDim2.fromOffset(8, 8)

TrollTitle.BackgroundTransparency = 1
TrollTitle.BorderSizePixel = 0

TrollTitle.Text = "TROLL"
TrollTitle.TextColor3 = Color3.fromRGB(255, 255, 255)

TrollTitle.Font = Enum.Font.SourceSansBold
TrollTitle.TextSize = 16
TrollTitle.TextXAlignment = Enum.TextXAlignment.Left

TrollTitle.Parent = trollPage

local SpinButton = Instance.new("TextButton")

SpinButton.Name = "SpinButton"
SpinButton.Size = UDim2.fromOffset(377, 25)
SpinButton.Position = UDim2.fromOffset(8, 38)

SpinButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

SpinButton.BorderSizePixel = 1
SpinButton.BorderColor3 = Color3.fromRGB(120, 0, 0)

SpinButton.Text = "Spin: OFF"
SpinButton.TextColor3 = Color3.fromRGB(255, 0, 0)

SpinButton.Font = Enum.Font.SourceSans
SpinButton.TextSize = 14

SpinButton.AutoButtonColor = false

SpinButton.Parent = trollPage

local TeleportTitle = Instance.new("TextLabel")

TeleportTitle.Name = "TeleportTitle"
TeleportTitle.Size = UDim2.fromOffset(377, 25)
TeleportTitle.Position = UDim2.fromOffset(8, 73)

TeleportTitle.BackgroundTransparency = 1
TeleportTitle.BorderSizePixel = 0

TeleportTitle.Text = "TELEPORT"
TeleportTitle.TextColor3 = Color3.fromRGB(255, 255, 255)

TeleportTitle.Font = Enum.Font.SourceSansBold
TeleportTitle.TextSize = 14
TeleportTitle.TextXAlignment = Enum.TextXAlignment.Left

TeleportTitle.Parent = trollPage

local teleportList = Instance.new("Frame")

teleportList.Name = "TeleportList"
teleportList.Size = UDim2.fromOffset(377, 0)
teleportList.Position = UDim2.fromOffset(8, 98)

teleportList.BackgroundTransparency = 1
teleportList.BorderSizePixel = 0

teleportList.Parent = trollPage

local spinning = false
local spinSpeed = 1000
local spinConnection

local function stopSpin()
    spinning = false

    if spinConnection then
        spinConnection:Disconnect()
        spinConnection = nil
    end

    local character = player.Character

    if character then
        local root = character:FindFirstChild("HumanoidRootPart")

        if root then
            root.AssemblyAngularVelocity = Vector3.zero
        end
    end

    if flying and flyOrientation then
        flyOrientation.MaxTorque = math.huge
    end

    SpinButton.Text = "Spin: OFF"
    SpinButton.TextColor3 = Color3.fromRGB(255, 0, 0)
end

local function startSpin()
    local character = player.Character

    if not character then
        return
    end

    local root = character:FindFirstChild("HumanoidRootPart")

    if not root then
        return
    end

    spinning = true

    if flying and flyOrientation then
        flyOrientation.MaxTorque = 0
    end

    SpinButton.Text = "Spin: ON"
    SpinButton.TextColor3 = Color3.fromRGB(0, 255, 0)

    spinConnection = RunService.Heartbeat:Connect(function()
        if not spinning then
            return
        end

        local currentCharacter = player.Character

        if not currentCharacter then
            return
        end

        local currentRoot = currentCharacter:FindFirstChild("HumanoidRootPart")

        if not currentRoot then
            return
        end

        currentRoot.AssemblyAngularVelocity = Vector3.new(
            0,
            spinSpeed,
            0
        )
    end)
end

SpinButton.MouseButton1Click:Connect(function()
    if spinning then
        stopSpin()
    else
        startSpin()
    end
end)

local function teleportToPlayer(targetPlayer)
    if not targetPlayer or targetPlayer == player then
        return
    end

    local character = player.Character
    local targetCharacter = targetPlayer.Character

    if not character or not targetCharacter then
        return
    end

    local root = character:FindFirstChild("HumanoidRootPart")
    local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")

    if not root or not targetRoot then
        return
    end

    root.CFrame = targetRoot.CFrame + Vector3.new(0, 3, 0)
end

local function refreshTeleportList()
    for _, object in ipairs(teleportList:GetChildren()) do
        object:Destroy()
    end

    local yPosition = 0

    for _, targetPlayer in ipairs(Players:GetPlayers()) do
        if targetPlayer ~= player then
            local button = Instance.new("TextButton")

            button.Name = targetPlayer.Name
            button.Size = UDim2.fromOffset(377, 25)
            button.Position = UDim2.fromOffset(0, yPosition)

            button.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

            button.BorderSizePixel = 1
            button.BorderColor3 = Color3.fromRGB(120, 0, 0)

            button.Text = targetPlayer.DisplayName .. "  @" .. targetPlayer.Name
            button.TextColor3 = Color3.fromRGB(255, 255, 255)

            button.Font = Enum.Font.SourceSans
            button.TextSize = 14
            button.TextXAlignment = Enum.TextXAlignment.Left

            button.AutoButtonColor = false

            button.Parent = teleportList

            button.MouseEnter:Connect(function()
                button.BackgroundColor3 = Color3.fromRGB(22, 0, 0)
                button.TextColor3 = Color3.fromRGB(255, 0, 0)
            end)

            button.MouseLeave:Connect(function()
                button.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
                button.TextColor3 = Color3.fromRGB(255, 255, 255)
            end)

            button.MouseButton1Click:Connect(function()
                teleportToPlayer(targetPlayer)
            end)

            yPosition += 30
        end
    end

teleportList.Size = UDim2.fromOffset(377, yPosition)

trollPage.CanvasSize = UDim2.fromOffset(
    0,
    teleportList.Position.Y.Offset
    + teleportList.Size.Y.Offset
    + 10
)
end

Players.PlayerAdded:Connect(function()
    refreshTeleportList()
end)

Players.PlayerRemoving:Connect(function()
    refreshTeleportList()
end)

refreshTeleportList()

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

    musicVolumeFill.Size = UDim2.fromScale(
        value,
        1
    )

    musicVolumeKnob.Position = UDim2.fromScale(
        value,
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
            setter(minimumValue)
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

local executorTitle = Instance.new("TextLabel")

executorTitle.Name = "ExecutorTitle"
executorTitle.Size = UDim2.fromOffset(300, 25)
executorTitle.Position = UDim2.fromOffset(8, 8)

executorTitle.BackgroundTransparency = 1

executorTitle.Text = "EXECUTOR"
executorTitle.TextColor3 = Color3.fromRGB(255, 255, 255)

executorTitle.Font = Enum.Font.SourceSansBold
executorTitle.TextSize = 16
executorTitle.TextXAlignment = Enum.TextXAlignment.Left

executorTitle.Parent = executorPage

local executorEditor = Instance.new("TextBox")

executorEditor.Name = "ScriptEditor"
executorEditor.Size = UDim2.fromOffset(377, 120)
executorEditor.Position = UDim2.fromOffset(8, 38)

executorEditor.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

executorEditor.BorderSizePixel = 1
executorEditor.BorderColor3 = Color3.fromRGB(120, 0, 0)

executorEditor.Text = ""
executorEditor.PlaceholderText = "-- Write your Luau script here"
executorEditor.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)

executorEditor.TextColor3 = Color3.fromRGB(255, 255, 255)

executorEditor.Font = Enum.Font.Code
executorEditor.TextSize = 14

executorEditor.TextXAlignment = Enum.TextXAlignment.Left
executorEditor.TextYAlignment = Enum.TextYAlignment.Top

executorEditor.MultiLine = true
executorEditor.ClearTextOnFocus = false

executorEditor.Parent = executorPage

local executeButton = Instance.new("TextButton")

executeButton.Name = "ExecuteButton"
executeButton.Size = UDim2.fromOffset(183, 25)
executeButton.Position = UDim2.fromOffset(8, 166)

executeButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

executeButton.BorderSizePixel = 1
executeButton.BorderColor3 = Color3.fromRGB(120, 0, 0)

executeButton.Text = "EXECUTE"
executeButton.TextColor3 = Color3.fromRGB(255, 0, 0)

executeButton.Font = Enum.Font.SourceSans
executeButton.TextSize = 14

executeButton.AutoButtonColor = false

executeButton.Parent = executorPage

local clearButton = Instance.new("TextButton")

clearButton.Name = "ClearButton"
clearButton.Size = UDim2.fromOffset(183, 25)
clearButton.Position = UDim2.fromOffset(202, 166)

clearButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

clearButton.BorderSizePixel = 1
clearButton.BorderColor3 = Color3.fromRGB(120, 0, 0)

clearButton.Text = "CLEAR"
clearButton.TextColor3 = Color3.fromRGB(255, 0, 0)

clearButton.Font = Enum.Font.SourceSans
clearButton.TextSize = 14

clearButton.AutoButtonColor = false

clearButton.Parent = executorPage

local outputTitle = Instance.new("TextLabel")

outputTitle.Name = "OutputTitle"
outputTitle.Size = UDim2.fromOffset(300, 25)
outputTitle.Position = UDim2.fromOffset(8, 201)

outputTitle.BackgroundTransparency = 1

outputTitle.Text = "OUTPUT"
outputTitle.TextColor3 = Color3.fromRGB(255, 255, 255)

outputTitle.Font = Enum.Font.SourceSansBold
outputTitle.TextSize = 14
outputTitle.TextXAlignment = Enum.TextXAlignment.Left

outputTitle.Parent = executorPage

local outputBox = Instance.new("TextLabel")

outputBox.Name = "Output"
outputBox.Size = UDim2.fromOffset(377, 70)
outputBox.Position = UDim2.fromOffset(8, 226)

outputBox.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

outputBox.BorderSizePixel = 1
outputBox.BorderColor3 = Color3.fromRGB(120, 0, 0)

outputBox.Text = "Ready."

outputBox.TextColor3 = Color3.fromRGB(0, 255, 0)

outputBox.Font = Enum.Font.Code
outputBox.TextSize = 13

outputBox.TextXAlignment = Enum.TextXAlignment.Left
outputBox.TextYAlignment = Enum.TextYAlignment.Top

outputBox.Parent = executorPage

local function setExecutorOutput(text)
    outputBox.Text = tostring(text)
end

local function executeScript()
    local source = executorEditor.Text

    if source == "" or source:match("^%s*$") then
        setExecutorOutput("No script provided.")
        return
    end

    local loadFunction = loadstring

    if type(loadFunction) ~= "function" then
        setExecutorOutput("Execution unavailable.")
        return
    end

    setExecutorOutput("Executing...")

    local success, result = pcall(function()
        local compiled, compileError = loadFunction(source)

        if not compiled then
            error(compileError)
        end

        return compiled()
    end)

    if success then
        if result ~= nil then
            setExecutorOutput("Execution completed.\n" .. tostring(result))
        else
            setExecutorOutput("Execution completed.")
        end
    else
        setExecutorOutput("Execution failed:\n" .. tostring(result))
    end
end

executeButton.MouseEnter:Connect(function()
    executeButton.BackgroundColor3 = Color3.fromRGB(22, 0, 0)
    executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

executeButton.MouseLeave:Connect(function()
    executeButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    executeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
end)

clearButton.MouseEnter:Connect(function()
    clearButton.BackgroundColor3 = Color3.fromRGB(22, 0, 0)
    clearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

clearButton.MouseLeave:Connect(function()
    clearButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    clearButton.TextColor3 = Color3.fromRGB(255, 0, 0)
end)

executeButton.MouseButton1Click:Connect(function()
    executeScript()
end)

clearButton.MouseButton1Click:Connect(function()
    executorEditor.Text = ""
    setExecutorOutput("Ready.")
end)

local infiniteYieldButton = Instance.new("TextButton")

infiniteYieldButton.Name = "InfiniteYieldButton"
infiniteYieldButton.Size = UDim2.fromOffset(377, 25)
infiniteYieldButton.Position = UDim2.fromOffset(8, 306)

infiniteYieldButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)

infiniteYieldButton.BorderSizePixel = 1
infiniteYieldButton.BorderColor3 = Color3.fromRGB(120, 0, 0)

infiniteYieldButton.Text = "LOAD INFINITE YIELD"
infiniteYieldButton.TextColor3 = Color3.fromRGB(255, 0, 0)

infiniteYieldButton.Font = Enum.Font.SourceSans
infiniteYieldButton.TextSize = 14

infiniteYieldButton.AutoButtonColor = false

infiniteYieldButton.Parent = executorPage

infiniteYieldButton.MouseEnter:Connect(function()
    infiniteYieldButton.BackgroundColor3 = Color3.fromRGB(22, 0, 0)
    infiniteYieldButton.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

infiniteYieldButton.MouseLeave:Connect(function()
    infiniteYieldButton.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    infiniteYieldButton.TextColor3 = Color3.fromRGB(255, 0, 0)
end)

infiniteYieldButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
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
updateCanvasSize(trollPage)
updateCanvasSize(musicPage)
updateCanvasSize(executorPage)

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

    if infiniteJump then
        stopInfiniteJump()
    end

    if clickTeleport then
        stopClickTeleport()
    end

    if forceFieldEnabled then
        stopForceField()
    end

    if godEnabled then
        stopGod()
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
