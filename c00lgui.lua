-- c00lgui Reborn by x_c00lgui_x --

local blak = Color3.fromRGB(0, 0, 0)
local rede = Color3.fromRGB(255, 0, 0)
local tef = Enum.Font.SourceSans
local whit = Color3.fromRGB(255, 255, 255)

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

local existingGui = CoreGui:FindFirstChild("CoolGui")
if existingGui then
    existingGui:Destroy()
end

local cka = Instance.new("ScreenGui")
cka.Name = "CoolGui"
cka.ResetOnSpawn = false
cka.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
cka.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Parent = cka
frame.BackgroundColor3 = blak
frame.BorderColor3 = rede
frame.BorderSizePixel = 3
frame.Name = "Frame"
frame.Position = UDim2.new(0, 3, 0.3, 0)
frame.Size = UDim2.new(0, 300, 0, 400)

local pges = Instance.new("Frame")
pges.Parent = frame
pges.BackgroundColor3 = blak
pges.BorderColor3 = rede
pges.BorderSizePixel = 3
pges.Name = "Pages"
pges.Position = UDim2.new(0, 0, 0, 0)
pges.Size = UDim2.new(1, 0, 1, 0)

local cope = Instance.new("TextButton")
cope.Parent = cka
cope.Active = true
cope.AutoButtonColor = true
cope.BackgroundColor3 = blak
cope.BorderColor3 = rede
cope.BorderSizePixel = 3
cope.Name = "Close/Open"
cope.Position = UDim2.new(0, 3, 0.3, 380)
cope.Selectable = true
cope.Size = UDim2.new(0, 300, 0, 20)
cope.ZIndex = 3
cope.Font = tef
cope.TextSize = 18
cope.Text = "Close"
cope.TextColor3 = whit
cope.TextXAlignment = Enum.TextXAlignment.Center
cope.TextYAlignment = Enum.TextYAlignment.Center

cope.Activated:Connect(function()
    if cope.Text == "Close" then
        frame.Visible = false
        cope.Text = "Open"
    else
        frame.Visible = true
        cope.Text = "Close"
    end
end)

local page1 = Instance.new("Frame")
page1.Parent = pges
page1.BackgroundColor3 = blak
page1.BorderColor3 = rede
page1.BorderSizePixel = 3
page1.Name = "Page1"
page1.Position = UDim2.new(0, 0, 0, 83)
page1.Size = UDim2.new(1, 0, 1, -106)
page1.ZIndex = 2
page1.Visible = true

local page2 = Instance.new("Frame")
page2.Parent = pges
page2.BackgroundColor3 = blak
page2.BorderColor3 = rede
page2.BorderSizePixel = 3
page2.Name = "Page2"
page2.Position = UDim2.new(0, 0, 0, 83)
page2.Size = UDim2.new(1, 0, 1, -106)
page2.ZIndex = 2
page2.Visible = false

local page3 = Instance.new("Frame")
page3.Parent = pges
page3.BackgroundColor3 = blak
page3.BorderColor3 = rede
page3.BorderSizePixel = 3
page3.Name = "Page3"
page3.Position = UDim2.new(0, 0, 0, 83)
page3.Size = UDim2.new(1, 0, 1, -106)
page3.ZIndex = 2
page3.Visible = false

local page4 = Instance.new("Frame")
page4.Parent = pges
page4.BackgroundColor3 = blak
page4.BorderColor3 = rede
page4.BorderSizePixel = 3
page4.Name = "Page4"
page4.Position = UDim2.new(0, 0, 0, 83)
page4.Size = UDim2.new(1, 0, 1, -106)
page4.ZIndex = 2
page4.Visible = false

local page5 = Instance.new("Frame")
page5.Parent = pges
page5.BackgroundColor3 = blak
page5.BorderColor3 = rede
page5.BorderSizePixel = 3
page5.Name = "Page5"
page5.Position = UDim2.new(0, 0, 0, 83)
page5.Size = UDim2.new(1, 0, 1, -106)
page5.ZIndex = 2
page5.Visible = false

-- Settings --

local page = Instance.new("Frame")
page.Parent = frame
page.BackgroundColor3 = blak
page.BorderColor3 = rede
page.BorderSizePixel = 3
page.Name = "Settings"
page.Position = UDim2.new(1, 3, 0, 0)
page.Size = UDim2.new(1, 0, 1, 0)
page.ZIndex = 1
page.Visible = true

local settingsTitle = Instance.new("TextLabel")
settingsTitle.Parent = page
settingsTitle.BackgroundColor3 = blak
settingsTitle.BorderColor3 = rede
settingsTitle.BorderSizePixel = 3
settingsTitle.Name = "SettingsTitle"
settingsTitle.Position = UDim2.new(0, 0, 0, 0)
settingsTitle.Size = UDim2.new(1, 0, 0, 40)
settingsTitle.ZIndex = 2
settingsTitle.Font = tef
settingsTitle.TextSize = 24
settingsTitle.Text = "Settings"
settingsTitle.TextColor3 = whit
settingsTitle.TextXAlignment = Enum.TextXAlignment.Center
settingsTitle.TextYAlignment = Enum.TextYAlignment.Center

local settings = {
    ["Security of character"] = false,
    ["Windows transparency"] = true,
    ["Big jumps"] = false,
    ["HealthBar"] = false,
    ["Immortal"] = false
}

local settingButtons = {}

local function createSetting(name, index)
    local settingButton = Instance.new("TextButton")
    settingButton.Parent = page
    settingButton.BackgroundColor3 = blak
    settingButton.BorderColor3 = rede
    settingButton.BorderSizePixel = 3
    settingButton.Name = name
    settingButton.Position = UDim2.new(0, 0, 0, 40 + ((index - 1) * 45))
    settingButton.Size = UDim2.new(1, 0, 0, 40)
    settingButton.ZIndex = 2
    settingButton.Font = tef
    settingButton.TextSize = 16
    settingButton.Text = name
    settingButton.TextColor3 = whit
    settingButton.TextXAlignment = Enum.TextXAlignment.Left
    settingButton.TextYAlignment = Enum.TextYAlignment.Center

    local indicator = Instance.new("TextLabel")
    indicator.Parent = settingButton
    indicator.BackgroundColor3 = rede
    indicator.BorderColor3 = rede
    indicator.BorderSizePixel = 2
    indicator.Name = "Status"
    indicator.Position = UDim2.new(1, -35, 0, 10)
    indicator.Size = UDim2.new(0, 25, 0, 20)
    indicator.ZIndex = 3
    indicator.Font = tef
    indicator.TextSize = 14
    indicator.TextColor3 = whit
    indicator.TextXAlignment = Enum.TextXAlignment.Center
    indicator.TextYAlignment = Enum.TextYAlignment.Center

    local function updateIndicator()
        if settings[name] then
            indicator.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
            indicator.BorderColor3 = Color3.fromRGB(0, 170, 0)
            indicator.Text = "ON"
        else
            indicator.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
            indicator.BorderColor3 = Color3.fromRGB(120, 0, 0)
            indicator.Text = "OFF"
        end
    end

    updateIndicator()

    settingButton.Activated:Connect(function()
        settings[name] = not settings[name]
        updateIndicator()
    end)

    settingButtons[name] = {
        Button = settingButton,
        Indicator = indicator
    }
end

createSetting("Security of character", 1)
createSetting("Windows transparency", 2)
createSetting("Big jumps", 3)
createSetting("HealthBar", 4)
createSetting("Immortal", 5)

-- Settings end --

local right = Instance.new("TextButton")
right.Parent = frame
right.BackgroundColor3 = blak
right.BorderColor3 = rede
right.BorderSizePixel = 3
right.Name = ">"
right.Position = UDim2.new(0.5, 3, 0, 40)
right.Size = UDim2.new(0.5, -3, 0, 40)
right.ZIndex = 2
right.Font = tef
right.TextSize = 48
right.Text = ">"
right.TextColor3 = whit

local addonr = Instance.new("TextButton")
addonr.Parent = page5
addonr.BackgroundColor3 = blak
addonr.BorderColor3 = rede
addonr.BorderSizePixel = 3
addonr.Name = "addonr"
addonr.Position = UDim2.new(0, 153, 0, -40)
addonr.Size = UDim2.new(0.49, 0, 0.125, 0)
addonr.Font = tef
addonr.TextSize = 48
addonr.Text = ">"
addonr.TextColor3 = whit
addonr.ZIndex = 3

local left = Instance.new("TextButton")
left.Parent = frame
left.BackgroundColor3 = blak
left.BorderColor3 = rede
left.BorderSizePixel = 3
left.Name = "<"
left.Position = UDim2.new(0, 0, 0, 40)
left.Size = UDim2.new(0.5, -3, 0, 40)
left.ZIndex = 2
left.Font = tef
left.TextSize = 48
left.Text = "<"
left.TextColor3 = whit

local addonl = Instance.new("TextButton")
addonl.Parent = page1
addonl.BackgroundColor3 = blak
addonl.BorderColor3 = rede
addonl.BorderSizePixel = 3
addonl.Name = "addonl"
addonl.Position = UDim2.new(0, 0, 0, -40)
addonl.Size = UDim2.new(0.49, 0, 0.125, 0)
addonl.Font = tef
addonl.TextSize = 48
addonl.Text = "<"
addonl.TextColor3 = whit
addonl.ZIndex = 3

local title = Instance.new("TextLabel")
title.Parent = frame
title.Active = true
title.BackgroundColor3 = blak
title.BorderColor3 = rede
title.BorderSizePixel = 3
title.Name = "Title"
title.Position = UDim2.new(0, 0, 0, 0)
title.Size = UDim2.new(1, 0, 0, 40)
title.ZIndex = 2
title.Font = tef
title.TextSize = 24
title.Text = "c00lgui Reborn by x_c00lkidd_x"
title.TextColor3 = whit
title.TextXAlignment = Enum.TextXAlignment.Center
title.TextYAlignment = Enum.TextYAlignment.Center

-- Dragging --

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

    frame.Position = newPosition

    cope.Position = UDim2.new(
        newPosition.X.Scale,
        newPosition.X.Offset,
        newPosition.Y.Scale,
        newPosition.Y.Offset + frame.Size.Y.Offset - cope.Size.Y.Offset
    )
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = frame.Position
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

-- Dragging end --

-- inside pages --

local acg = Instance.new("Frame")
acg.Parent = page1
acg.BackgroundColor3 = blak
acg.BorderColor3 = rede
acg.BorderSizePixel = 3
acg.Name = "Admin Commands/Guis"
acg.Position = UDim2.new(0.5, 3, 0, 0)
acg.Size = UDim2.new(0.5, -3, 1, 0)
acg.ZIndex = 2

local sd = Instance.new("Frame")
sd.Parent = page1
sd.BackgroundColor3 = blak
sd.BorderColor3 = rede
sd.BorderSizePixel = 3
sd.Name = "Server Destruction"
sd.Position = UDim2.new(0, 0, 0, 0)
sd.Size = UDim2.new(0.5, -3, 1, 0)
sd.ZIndex = 2

local gt = Instance.new("Frame")
gt.Parent = page2
gt.BackgroundColor3 = blak
gt.BorderColor3 = rede
gt.BorderSizePixel = 3
gt.Name = "Gear/Tools"
gt.Position = UDim2.new(0.5, 3, 0, 0)
gt.Size = UDim2.new(0.5, -3, 1, 0)
gt.ZIndex = 2

local ws = Instance.new("Frame")
ws.Parent = page2
ws.BackgroundColor3 = blak
ws.BorderColor3 = rede
ws.BorderSizePixel = 3
ws.Name = "Weapon Scripts"
ws.Position = UDim2.new(0, 0, 0, 0)
ws.Size = UDim2.new(0.5, -3, 1, 0)
ws.ZIndex = 2

local localp = Instance.new("Frame")
localp.Parent = page3
localp.BackgroundColor3 = blak
localp.BorderColor3 = rede
localp.BorderSizePixel = 3
localp.Name = "LocalPlayer"
localp.Position = UDim2.new(0.5, 3, 0, 0)
localp.Size = UDim2.new(0.5, -3, 1, 0)
localp.ZIndex = 2

local misc = Instance.new("Frame")
misc.Parent = page3
misc.BackgroundColor3 = blak
misc.BorderColor3 = rede
misc.BorderSizePixel = 3
misc.Name = "Misc"
misc.Position = UDim2.new(0, 0, 0, 0)
misc.Size = UDim2.new(0.5, -3, 1, 0)
misc.ZIndex = 2

local pmi = Instance.new("Frame")
pmi.Parent = page4
pmi.BackgroundColor3 = blak
pmi.BorderColor3 = rede
pmi.BorderSizePixel = 3
pmi.Name = "Preset Music IDs"
pmi.Position = UDim2.new(0.5, 3, 0, 0)
pmi.Size = UDim2.new(0.5, -3, 1, 0)
pmi.ZIndex = 2

local psd = Instance.new("Frame")
psd.Parent = page4
psd.BackgroundColor3 = blak
psd.BorderColor3 = rede
psd.BorderSizePixel = 3
psd.Name = "Preset Skybox/Decal IDs"
psd.Position = UDim2.new(0, 0, 0, 0)
psd.Size = UDim2.new(0.5, -3, 1, 0)
psd.ZIndex = 2

local edn = Instance.new("Frame")
edn.Parent = page5
edn.BackgroundColor3 = blak
edn.BorderColor3 = rede
edn.BorderSizePixel = 3
edn.Name = "End"
edn.Position = UDim2.new(0.5, 3, 0, 0)
edn.Size = UDim2.new(0.5, -3, 1, 0)
edn.ZIndex = 2

local pgi = Instance.new("Frame")
pgi.Parent = page5
pgi.BackgroundColor3 = blak
pgi.BorderColor3 = rede
pgi.BorderSizePixel = 3
pgi.Name = "Preset Gear IDs"
pgi.Position = UDim2.new(0, 0, 0, 0)
pgi.Size = UDim2.new(0.5, -3, 1, 0)
pgi.ZIndex = 2

-- inside pages end --

-- Page navigation --

local CurrentPage = 1

local function FlipPage(Way)
    local NewPage = CurrentPage + Way

    if pges:FindFirstChild("Page" .. NewPage) then
        CurrentPage = NewPage

        for _, child in ipairs(pges:GetChildren()) do
            if child:IsA("Frame") and child.Name:match("^Page%d+$") then
                child.Visible = false
            end
        end

        pges:FindFirstChild("Page" .. NewPage).Visible = true
    end
end

right.Activated:Connect(function()
    FlipPage(1)
end)

left.Activated:Connect(function()
    FlipPage(-1)
end)

addonl.Activated:Connect(function()
    CurrentPage = 1
    FlipPage(0)
end)

addonr.Activated:Connect(function()
    CurrentPage = 5
    FlipPage(0)
end)

-- Page navigation end --
