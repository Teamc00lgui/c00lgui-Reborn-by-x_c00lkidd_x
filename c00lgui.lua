-- c00lgui Reborn by x_c00lkidd_x

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

local BLACK = Color3.fromRGB(0, 0, 0)
local RED = Color3.fromRGB(255, 0, 0)
local WHITE = Color3.fromRGB(255, 255, 255)
local DARK_RED = Color3.fromRGB(170, 0, 0)

local GUI_NAME = "CoolGui"
local TITLE = "c00lgui Reborn by x_c00lkidd_x"

local function getGuiParent()
    local ok, hidden = pcall(function()
        if typeof(gethui) == "function" then
            return gethui()
        end
    end)

    if ok and hidden then
        return hidden
    end

    local coreGui = game:GetService("CoreGui")
    local success = pcall(function()
        local _ = coreGui.Name
    end)

    if success then
        return coreGui
    end

    return LocalPlayer:WaitForChild("PlayerGui")
end

local guiParent = getGuiParent()

local oldGui = guiParent:FindFirstChild(GUI_NAME)
if oldGui then
    oldGui:Destroy()
end

local function create(className, parent, properties)
    local object = Instance.new(className)
    object.Parent = parent

    for property, value in pairs(properties or {}) do
        pcall(function()
            object[property] = value
        end)
    end

    return object
end

local function button(parent, name, text, position, size, callback)
    local object = create("TextButton", parent, {
        Name = name,
        Position = position,
        Size = size,
        BackgroundColor3 = BLACK,
        BorderColor3 = RED,
        BorderSizePixel = 3,
        Font = Enum.Font.SourceSans,
        TextSize = 14,
        Text = text,
        TextColor3 = WHITE,
        AutoButtonColor = true,
        ZIndex = 2,
    })

    object.MouseButton1Click:Connect(function()
        local ok, err = pcall(callback)
        if not ok then
            warn("[c00lgui] " .. tostring(err))
        end
    end)

    return object
end

local function label(parent, name, text, position, size)
    return create("TextLabel", parent, {
        Name = name,
        Position = position,
        Size = size,
        BackgroundColor3 = BLACK,
        BorderColor3 = RED,
        BorderSizePixel = 3,
        Font = Enum.Font.SourceSans,
        TextSize = 14,
        Text = text,
        TextColor3 = WHITE,
        TextWrapped = true,
        ZIndex = 2,
    })
end

local gui = create("ScreenGui", guiParent, {
    Name = GUI_NAME,
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    IgnoreGuiInset = true,
})

local frame = create("Frame", gui, {
    Name = "Frame",
    Position = UDim2.new(0, 3, 0.3, 0),
    Size = UDim2.new(0, 300, 0, 400),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
    Active = true,
})

local pages = create("Frame", frame, {
    Name = "Pages",
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
})

local closeOpen = create("TextButton", gui, {
    Name = "Close/Open",
    Position = UDim2.new(0, 3, 0.3, 380),
    Size = UDim2.new(0, 300, 0, 20),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
    Font = Enum.Font.SourceSans,
    TextSize = 18,
    Text = "Close",
    TextColor3 = WHITE,
    TextXAlignment = Enum.TextXAlignment.Center,
    TextYAlignment = Enum.TextYAlignment.Center,
    ZIndex = 3,
})

closeOpen.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
    closeOpen.Text = frame.Visible and "Close" or "Open"
end)

local title = create("TextLabel", frame, {
    Name = "Title",
    Position = UDim2.new(0, 0, 0, 0),
    Size = UDim2.new(1, 0, 0, 40),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
    Font = Enum.Font.SourceSans,
    TextSize = 24,
    Text = TITLE,
    TextColor3 = WHITE,
    ZIndex = 4,
})

local pageList = {}
for index = 1, 5 do
    pageList[index] = create("Frame", pages, {
        Name = "Page" .. index,
        Position = UDim2.new(0, 0, 0, 83),
        Size = UDim2.new(1, 0, 1, -106),
        BackgroundColor3 = BLACK,
        BorderColor3 = RED,
        BorderSizePixel = 3,
        ZIndex = 2,
        Visible = index == 1,
    })
end

local settings = create("Frame", frame, {
    Name = "Settings",
    Position = UDim2.new(1, 3, 0, 0),
    Size = UDim2.new(1, 0, 1, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
    ZIndex = 1,
    Visible = false,
})

local left = create("TextButton", frame, {
    Name = "<",
    Position = UDim2.new(0, 0, 0, 40),
    Size = UDim2.new(0.5, -3, 0, 40),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
    Font = Enum.Font.SourceSans,
    TextSize = 48,
    Text = "<",
    TextColor3 = WHITE,
    ZIndex = 3,
})

local right = create("TextButton", frame, {
    Name = ">",
    Position = UDim2.new(0.5, 3, 0, 40),
    Size = UDim2.new(0.5, -3, 0, 40),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
    Font = Enum.Font.SourceSans,
    TextSize = 48,
    Text = ">",
    TextColor3 = WHITE,
    ZIndex = 3,
})

local addonLeft = create("TextButton", pageList[1], {
    Name = "addonl",
    Position = UDim2.new(0, 0, 0, -40),
    Size = UDim2.new(0.49, 0, 0.125, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
    Font = Enum.Font.SourceSans,
    TextSize = 48,
    Text = "<",
    TextColor3 = WHITE,
    ZIndex = 3,
})

local addonRight = create("TextButton", pageList[5], {
    Name = "addonr",
    Position = UDim2.new(0, 153, 0, -40),
    Size = UDim2.new(0.49, 0, 0.125, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
    Font = Enum.Font.SourceSans,
    TextSize = 48,
    Text = ">",
    TextColor3 = WHITE,
    ZIndex = 3,
})

local currentPage = 1

local function showPage(index)
    currentPage = math.clamp(index, 1, 5)

    for i, page in ipairs(pageList) do
        page.Visible = i == currentPage
    end
end

local function nextPage()
    showPage(currentPage >= 5 and 1 or currentPage + 1)
end

local function previousPage()
    showPage(currentPage <= 1 and 5 or currentPage - 1)
end

left.MouseButton1Click:Connect(previousPage)
right.MouseButton1Click:Connect(nextPage)
addonLeft.MouseButton1Click:Connect(previousPage)
addonRight.MouseButton1Click:Connect(nextPage)

-- =========================================================
-- Original panel structure
-- =========================================================

local acg = create("Frame", pageList[1], {
    Name = "Admin Commands/Guis",
    Position = UDim2.new(0.5, 3, 0, 0),
    Size = UDim2.new(0.5, -3, 1, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
})

local sd = create("Frame", pageList[1], {
    Name = "Server Destruction",
    Position = UDim2.new(0, 0, 0, 0),
    Size = UDim2.new(0.5, -3, 1, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
})

local gt = create("Frame", pageList[2], {
    Name = "Gear/Tools",
    Position = UDim2.new(0.5, 3, 0, 0),
    Size = UDim2.new(0.5, -3, 1, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
})

local ws = create("Frame", pageList[2], {
    Name = "Weapon Scripts",
    Position = UDim2.new(0, 0, 0, 0),
    Size = UDim2.new(0.5, -3, 1, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
})

local localp = create("Frame", pageList[3], {
    Name = "LocalPlayer",
    Position = UDim2.new(0.5, 3, 0, 0),
    Size = UDim2.new(0.5, -3, 1, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
})

local misc = create("Frame", pageList[3], {
    Name = "Misc",
    Position = UDim2.new(0, 0, 0, 0),
    Size = UDim2.new(0.5, -3, 1, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
})

local pmi = create("Frame", pageList[4], {
    Name = "Preset Music IDs",
    Position = UDim2.new(0.5, 3, 0, 0),
    Size = UDim2.new(0.5, -3, 1, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
})

local psd = create("Frame", pageList[4], {
    Name = "Preset Skybox/Decal IDs",
    Position = UDim2.new(0, 0, 0, 0),
    Size = UDim2.new(0.5, -3, 1, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
})

local edn = create("Frame", pageList[5], {
    Name = "End",
    Position = UDim2.new(0.5, 3, 0, 0),
    Size = UDim2.new(0.5, -3, 1, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
})

local pgi = create("Frame", pageList[5], {
    Name = "Preset Gear IDs",
    Position = UDim2.new(0, 0, 0, 0),
    Size = UDim2.new(0.5, -3, 1, 0),
    BackgroundColor3 = BLACK,
    BorderColor3 = RED,
    BorderSizePixel = 3,
})

-- =========================================================
-- LocalPlayer
-- =========================================================

local function getCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

local function getHumanoid()
    return getCharacter():FindFirstChildOfClass("Humanoid")
end

local function setWalkSpeed(value)
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.WalkSpeed = value
    end
end

local function setJumpPower(value)
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.UseJumpPower = true
        humanoid.JumpPower = value
    end
end

local function resetMovement()
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.WalkSpeed = 16
        humanoid.UseJumpPower = true
        humanoid.JumpPower = 50
        humanoid.AutoRotate = true
    end
end

button(localp, "WalkSpeed", "WALKSPEED 50", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, 30), function()
    setWalkSpeed(50)
end)

button(localp, "WalkSpeedDefault", "WALKSPEED 16", UDim2.new(0, 0, 0, 33), UDim2.new(1, 0, 0, 30), function()
    setWalkSpeed(16)
end)

button(localp, "JumpPower", "JUMPPOWER 100", UDim2.new(0, 0, 0, 66), UDim2.new(1, 0, 0, 30), function()
    setJumpPower(100)
end)

button(localp, "JumpDefault", "JUMPPOWER 50", UDim2.new(0, 0, 0, 99), UDim2.new(1, 0, 0, 30), function()
    setJumpPower(50)
end)

button(localp, "Jump", "JUMP", UDim2.new(0, 0, 0, 132), UDim2.new(1, 0, 0, 30), function()
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.Jump = true
    end
end)

button(localp, "Sit", "SIT", UDim2.new(0, 0, 0, 165), UDim2.new(1, 0, 0, 30), function()
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.Sit = true
    end
end)

button(localp, "ResetMovement", "NORMAL", UDim2.new(0, 0, 0, 198), UDim2.new(1, 0, 0, 30), resetMovement)

-- =========================================================
-- Misc
-- =========================================================

local music = SoundService:FindFirstChild("c00lgui_Music")
if not music then
    music = Instance.new("Sound")
    music.Name = "c00lgui_Music"
    music.Volume = 0.5
    music.Looped = true
    music.Parent = SoundService
end

local function playMusic(id)
    local numericId = tostring(id):match("%d+")
    if not numericId then
        return
    end

    music.SoundId = "rbxassetid://" .. numericId
    music:Play()
end

button(misc, "PlayMusic", "PLAY MUSIC 1843529636", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, 30), function()
    playMusic("1843529636")
end)

button(misc, "StopMusic", "STOP MUSIC", UDim2.new(0, 0, 0, 33), UDim2.new(1, 0, 0, 30), function()
    music:Stop()
end)

button(misc, "Bright", "BRIGHT", UDim2.new(0, 0, 0, 66), UDim2.new(1, 0, 0, 30), function()
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
end)

button(misc, "Day", "DAY", UDim2.new(0, 0, 0, 99), UDim2.new(1, 0, 0, 30), function()
    Lighting.ClockTime = 14
end)

button(misc, "Night", "NIGHT", UDim2.new(0, 0, 0, 132), UDim2.new(1, 0, 0, 30), function()
    Lighting.ClockTime = 0
end)

button(misc, "FOV120", "FOV 120", UDim2.new(0, 0, 0, 165), UDim2.new(1, 0, 0, 30), function()
    Workspace.CurrentCamera.FieldOfView = 120
end)

button(misc, "FOVNormal", "FOV NORMAL", UDim2.new(0, 0, 0, 198), UDim2.new(1, 0, 0, 30), function()
    Workspace.CurrentCamera.FieldOfView = 70
end)

-- =========================================================
-- Gear / Tools
-- =========================================================

local function getBackpack()
    return LocalPlayer:FindFirstChildOfClass("Backpack")
end

button(gt, "Unequip", "UNEQUIP", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, 30), function()
    local humanoid = getHumanoid()
    if humanoid then
        humanoid:UnequipTools()
    end
end)

button(gt, "ToolCount", "TOOL COUNT", UDim2.new(0, 0, 0, 33), UDim2.new(1, 0, 0, 30), function()
    local backpack = getBackpack()
    local count = 0

    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            if item:IsA("Tool") then
                count += 1
            end
        end
    end

    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "c00lgui",
            Text = "Tools: " .. count,
            Duration = 3,
        })
    end)
end)

button(gt, "RemoveTools", "REMOVE TOOLS", UDim2.new(0, 0, 0, 66), UDim2.new(1, 0, 0, 30), function()
    local backpack = getBackpack()
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            if item:IsA("Tool") then
                item:Destroy()
            end
        end
    end
end)

button(gt, "Backpack", "BACKPACK", UDim2.new(0, 0, 0, 99), UDim2.new(1, 0, 0, 30), function()
    local backpack = getBackpack()
    if backpack then
        local tools = {}

        for _, item in ipairs(backpack:GetChildren()) do
            if item:IsA("Tool") then
                table.insert(tools, item.Name)
            end
        end

        local text = #tools > 0 and table.concat(tools, ", ") or "Empty"

        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "Backpack",
                Text = text,
                Duration = 4,
            })
        end)
    end
end)

-- =========================================================
-- Admin Commands / Guis
-- =========================================================

button(acg, "iOrb", "i0rb", UDim2.new(0, 0, 0, 33), UDim2.new(0.5, 0, 0, 30), function()
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "c00lgui",
            Text = "Local client is ready.",
            Duration = 3,
        })
    end)
end)

button(acg, "PlayerInfo", "PLAYER INFO", UDim2.new(0, 0, 0, 66), UDim2.new(1, 0, 0, 30), function()
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Player",
            Text = LocalPlayer.Name .. " | " .. LocalPlayer.UserId,
            Duration = 4,
        })
    end)
end)

-- =========================================================
-- Server Destruction
-- =========================================================
-- The original source contains routines intended to crash, lag,
-- kick, ban, or otherwise abuse other clients. Those routines are
-- intentionally not recreated here.

label(sd, "Notice", "LOCAL CLIENT TOOLS", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, 30))

button(sd, "ResetCharacter", "RESET", UDim2.new(0, 0, 0, 33), UDim2.new(1, 0, 0, 30), function()
    local humanoid = getHumanoid()
    if humanoid then
        humanoid.Health = 0
    end
end)

button(sd, "Rejoin", "REJOIN", UDim2.new(0, 0, 0, 66), UDim2.new(1, 0, 0, 30), function()
    local TeleportService = game:GetService("TeleportService")
    TeleportService:Teleport(game.PlaceId, LocalPlayer)
end)

-- =========================================================
-- Weapon Scripts
-- =========================================================

label(ws, "WeaponInfo", "CLIENT-SAFE ACTIONS", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, 30))

button(ws, "UnequipWeapons", "UNEQUIP", UDim2.new(0, 0, 0, 33), UDim2.new(1, 0, 0, 30), function()
    local humanoid = getHumanoid()
    if humanoid then
        humanoid:UnequipTools()
    end
end)

button(ws, "ResetTools", "REFRESH TOOL VIEW", UDim2.new(0, 0, 0, 66), UDim2.new(1, 0, 0, 30), function()
    local backpack = getBackpack()
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            if item:IsA("Tool") then
                item.Enabled = true
            end
        end
    end
end)

-- =========================================================
-- Preset Music IDs
-- =========================================================

label(pmi, "Music1", "1843529636", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, 30))
button(pmi, "Music1Play", "PLAY", UDim2.new(0, 0, 0, 33), UDim2.new(1, 0, 0, 30), function()
    playMusic("1843529636")
end)

label(pmi, "Music2", "0", UDim2.new(0, 0, 0, 66), UDim2.new(1, 0, 0, 30))
button(pmi, "Music2Stop", "STOP", UDim2.new(0, 0, 0, 99), UDim2.new(1, 0, 0, 30), function()
    music:Stop()
end)

-- =========================================================
-- Preset Skybox / Decal IDs
-- =========================================================

button(psd, "SkyboxClear", "CLEAR LOCAL SKY", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, 30), function()
    for _, object in ipairs(Lighting:GetChildren()) do
        if object:IsA("Sky") then
            object:Destroy()
        end
    end
end)

button(psd, "SkyboxDefault", "DEFAULT SKY", UDim2.new(0, 0, 0, 33), UDim2.new(1, 0, 0, 30), function()
    local sky = Lighting:FindFirstChildOfClass("Sky")
    if sky then
        sky:Destroy()
    end

    local newSky = Instance.new("Sky")
    newSky.Parent = Lighting
end)

-- =========================================================
-- Preset Gear IDs
-- =========================================================

label(pgi, "GearNotice", "GEAR IDS REQUIRE SERVER AUTHORIZATION", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, 55))

button(pgi, "GearInfo", "TOOL COUNT", UDim2.new(0, 0, 0, 58), UDim2.new(1, 0, 0, 30), function()
    local backpack = getBackpack()
    local count = 0

    if backpack then
        for _, object in ipairs(backpack:GetChildren()) do
            if object:IsA("Tool") then
                count += 1
            end
        end
    end

    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Preset Gear IDs",
            Text = tostring(count) .. " local tools",
            Duration = 3,
        })
    end)
end)

-- =========================================================
-- End
-- =========================================================

button(edn, "About", "ABOUT", UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 0, 30), function()
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "c00lgui Reborn",
            Text = "by x_c00lkidd_x",
            Duration = 4,
        })
    end)
end)

button(edn, "Creator", "CREATOR", UDim2.new(0, 0, 0, 33), UDim2.new(1, 0, 0, 30), function()
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Creator",
            Text = "x_c00lkidd_x",
            Duration = 4,
        })
    end)
end)

button(edn, "Close", "CLOSE", UDim2.new(0, 0, 0, 66), UDim2.new(1, 0, 0, 30), function()
    gui:Destroy()
end)

-- =========================================================
-- Dragging
-- =========================================================

local dragging = false
local dragStart
local startPosition

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if not dragging then
        return
    end

    if input.UserInputType ~= Enum.UserInputType.MouseMovement
        and input.UserInputType ~= Enum.UserInputType.Touch then
        return
    end

    local delta = input.Position - dragStart

    frame.Position = UDim2.new(
        startPosition.X.Scale,
        startPosition.X.Offset + delta.X,
        startPosition.Y.Scale,
        startPosition.Y.Offset + delta.Y
    )

    closeOpen.Position = UDim2.new(
        frame.Position.X.Scale,
        frame.Position.X.Offset,
        frame.Position.Y.Scale,
        frame.Position.Y.Offset + 380
    )
end)

-- =========================================================
-- Keyboard toggle
-- =========================================================

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then
        return
    end

    if input.KeyCode == Enum.KeyCode.RightShift then
        frame.Visible = not frame.Visible
        closeOpen.Text = frame.Visible and "Close" or "Open"
    end
end)

-- =========================================================
-- Character safety
-- =========================================================

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)

    local humanoid = getHumanoid()
    if humanoid then
        humanoid.WalkSpeed = 16
        humanoid.UseJumpPower = true
        humanoid.JumpPower = 50
    end
end)

print("[c00lgui] c00lgui Reborn by x_c00lkidd_x loaded.")
