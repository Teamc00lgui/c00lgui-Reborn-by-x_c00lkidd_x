-- =========================================================
-- c00lgui Reborn by x_c00lkidd_x
-- V1
-- =========================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer

-- =========================================================
-- COLORS / FONT
-- =========================================================

local blak = Color3.new(0, 0, 0)
local rede = Color3.new(255 / 255, 0 / 255, 0 / 255)
local tef = Enum.Font.SourceSans
local whit = Color3.new(255 / 255, 255 / 255, 255 / 255)

local GUI_NAME = "c00lgui_Reborn_by_x_c00lkidd_x"

-- =========================================================
-- DUPLICATE GUARD
-- =========================================================

local ExistingGui

pcall(function()
	ExistingGui = game:GetService("CoreGui"):FindFirstChild(GUI_NAME)
end)

if not ExistingGui then
	ExistingGui = LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild(GUI_NAME)
end

if ExistingGui then
	ExistingGui:Destroy()
end

-- =========================================================
-- GUI
-- =========================================================

local GuiParent

pcall(function()
	GuiParent = game:GetService("CoreGui")
end)

if not GuiParent then
	GuiParent = LocalPlayer:WaitForChild("PlayerGui")
end

local cka = Instance.new("ScreenGui")
cka.Name = GUI_NAME
cka.ResetOnSpawn = false
cka.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
cka.Parent = GuiParent

-- =========================================================
-- MAIN FRAME
-- =========================================================

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

-- =========================================================
-- CLOSE / OPEN
-- =========================================================

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
cope.Text = "Close"
cope.TextColor3 = whit
cope.TextSize = 18
cope.TextXAlignment = Enum.TextXAlignment.Center
cope.TextYAlignment = Enum.TextYAlignment.Center

cope.MouseButton1Click:Connect(function()
	if cope.Text == "Close" then
		frame.Visible = false
		cope.Text = "Open"
	else
		frame.Visible = true
		cope.Text = "Close"
	end
end)

-- =========================================================
-- PAGES
-- =========================================================

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

-- =========================================================
-- SETTINGS
-- =========================================================

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

-- =========================================================
-- NAVIGATION
-- =========================================================

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
right.Text = ">"
right.TextColor3 = whit
right.TextSize = 48

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
left.Text = "<"
left.TextColor3 = whit
left.TextSize = 48

-- =========================================================
-- PAGE EDGE BUTTONS
-- =========================================================

local addonr = Instance.new("TextButton")
addonr.Parent = page5
addonr.BackgroundColor3 = blak
addonr.BorderColor3 = rede
addonr.BorderSizePixel = 3
addonr.Name = "addonr"
addonr.Position = UDim2.new(0, 153, 0, -40)
addonr.Size = UDim2.new(0.49, 0, 0.125, 0)
addonr.Font = tef
addonr.Text = ">"
addonr.TextColor3 = whit
addonr.TextSize = 48
addonr.ZIndex = 3

local addonl = Instance.new("TextButton")
addonl.Parent = page1
addonl.BackgroundColor3 = blak
addonl.BorderColor3 = rede
addonl.BorderSizePixel = 3
addonl.Name = "addonl"
addonl.Position = UDim2.new(0, 0, 0, -40)
addonl.Size = UDim2.new(0.49, 0, 0.125, 0)
addonl.Font = tef
addonl.Text = "<"
addonl.TextColor3 = whit
addonl.TextSize = 48
addonl.ZIndex = 3

-- =========================================================
-- TITLE
-- =========================================================

local title = Instance.new("TextLabel")
title.Parent = frame
title.BackgroundColor3 = blak
title.BorderColor3 = rede
title.BorderSizePixel = 3
title.Name = "Title"
title.Position = UDim2.new(0, 0, 0, 0)
title.Size = UDim2.new(1, 0, 0, 40)
title.ZIndex = 2
title.Font = tef
title.Text = "c00lgui Reborn Rc7 by v3rx"
title.TextColor3 = whit
title.TextSize = 24

-- =========================================================
-- ORIGINAL PANEL STRUCTURE
-- =========================================================

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

-- =========================================================
-- BUTTON HELPERS
-- =========================================================

local function CreateButton(Parent, Text, Position, Size, Callback)
	local Button = Instance.new("TextButton")

	Button.Parent = Parent
	Button.BackgroundColor3 = blak
	Button.BorderColor3 = rede
	Button.BorderSizePixel = 3
	Button.Position = Position
	Button.Size = Size
	Button.Font = tef
	Button.Text = Text
	Button.TextColor3 = whit
	Button.TextSize = 18
	Button.AutoButtonColor = true

	if Callback then
		Button.MouseButton1Click:Connect(function()
			Callback(Button)
		end)
	end

	return Button
end

local function CreateInput(Parent, Placeholder, Position)
	local Input = Instance.new("TextBox")

	Input.Parent = Parent
	Input.BackgroundColor3 = blak
	Input.BorderColor3 = rede
	Input.BorderSizePixel = 3
	Input.Position = Position
	Input.Size = UDim2.new(1, -6, 0, 30)
	Input.Font = tef
	Input.PlaceholderText = Placeholder
	Input.PlaceholderColor3 = whit
	Input.Text = ""
	Input.TextColor3 = whit
	Input.TextSize = 17
	Input.ClearTextOnFocus = false

	return Input
end

-- =========================================================
-- PAGE 1
-- =========================================================

CreateButton(
	sd,
	"REJOIN",
	UDim2.new(0, 3, 0, 3),
	UDim2.new(1, -6, 0, 34),
	function()
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end
)

CreateButton(
	sd,
	"RESET",
	UDim2.new(0, 3, 0, 42),
	UDim2.new(1, -6, 0, 34),
	function()
		local Character = LocalPlayer.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

		if Humanoid then
			Humanoid.Health = 0
		end
	end
)

CreateButton(
	sd,
	"SERVER INFO",
	UDim2.new(0, 3, 0, 81),
	UDim2.new(1, -6, 0, 34),
	function(Button)
		Button.Text = tostring(#Players:GetPlayers()) .. " PLAYERS"

		task.delay(2, function()
			if Button.Parent then
				Button.Text = "SERVER INFO"
			end
		end)
	end
)

CreateButton(
	sd,
	"JOB ID",
	UDim2.new(0, 3, 0, 120),
	UDim2.new(1, -6, 0, 34),
	function(Button)
		Button.Text = string.sub(game.JobId, 1, 12)

		task.delay(2, function()
			if Button.Parent then
				Button.Text = "JOB ID"
			end
		end)
	end
)

CreateButton(
	acg,
	"ABOUT",
	UDim2.new(0, 3, 0, 3),
	UDim2.new(1, -6, 0, 34),
	function(Button)
		Button.Text = "V1"

		task.delay(2, function()
			if Button.Parent then
				Button.Text = "ABOUT"
			end
		end)
	end
)

CreateButton(
	acg,
	"CREATOR",
	UDim2.new(0, 3, 0, 42),
	UDim2.new(1, -6, 0, 34),
	function(Button)
		Button.Text = "x_c00lkidd_x"

		task.delay(2, function()
			if Button.Parent then
				Button.Text = "CREATOR"
			end
		end)
	end
)

-- =========================================================
-- PAGE 2
-- =========================================================

CreateButton(
	ws,
	"REMOVE TOOLS",
	UDim2.new(0, 3, 0, 3),
	UDim2.new(1, -6, 0, 34),
	function()
		for _, Item in ipairs(LocalPlayer.Backpack:GetChildren()) do
			if Item:IsA("Tool") then
				Item:Destroy()
			end
		end

		local Character = LocalPlayer.Character

		if Character then
			for _, Item in ipairs(Character:GetChildren()) do
				if Item:IsA("Tool") then
					Item:Destroy()
				end
			end
		end
	end
)

CreateButton(
	ws,
	"DROP TOOL",
	UDim2.new(0, 3, 0, 42),
	UDim2.new(1, -6, 0, 34),
	function()
		local Character = LocalPlayer.Character

		if not Character then
			return
		end

		for _, Item in ipairs(Character:GetChildren()) do
			if Item:IsA("Tool") then
				Item.Parent = workspace
				break
			end
		end
	end
)

CreateButton(
	ws,
	"TOOL COUNT",
	UDim2.new(0, 3, 0, 81),
	UDim2.new(1, -6, 0, 34),
	function(Button)
		local Count = 0

		for _, Item in ipairs(LocalPlayer.Backpack:GetChildren()) do
			if Item:IsA("Tool") then
				Count += 1
			end
		end

		Button.Text = "TOOLS: " .. Count

		task.delay(2, function()
			if Button.Parent then
				Button.Text = "TOOL COUNT"
			end
		end)
	end
)

CreateButton(
	gt,
	"UNEQUIP",
	UDim2.new(0, 3, 0, 3),
	UDim2.new(1, -6, 0, 34),
	function()
		local Character = LocalPlayer.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

		if Humanoid then
			Humanoid:UnequipTools()
		end
	end
)

-- =========================================================
-- PAGE 3
-- =========================================================

local SpeedInput = CreateInput(
	localp,
	"WALKSPEED",
	UDim2.new(0, 3, 0, 3)
)

CreateButton(
	localp,
	"SET SPEED",
	UDim2.new(0, 3, 0, 39),
	UDim2.new(1, -6, 0, 34),
	function()
		local Value = tonumber(SpeedInput.Text)
		local Character = LocalPlayer.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

		if Humanoid and Value then
			Humanoid.WalkSpeed = Value
		end
	end
)

local JumpInput = CreateInput(
	localp,
	"JUMPPOWER",
	UDim2.new(0, 3, 0, 78)
)

CreateButton(
	localp,
	"SET JUMP",
	UDim2.new(0, 3, 0, 114),
	UDim2.new(1, -6, 0, 34),
	function()
		local Value = tonumber(JumpInput.Text)
		local Character = LocalPlayer.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

		if Humanoid and Value then
			Humanoid.UseJumpPower = true
			Humanoid.JumpPower = Value
		end
	end
)

CreateButton(
	localp,
	"NORMAL",
	UDim2.new(0, 3, 0, 153),
	UDim2.new(1, -6, 0, 34),
	function()
		local Character = LocalPlayer.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

		if Humanoid then
			Humanoid.WalkSpeed = 16
			Humanoid.UseJumpPower = true
			Humanoid.JumpPower = 50
		end
	end
)

CreateButton(
	misc,
	"SIT",
	UDim2.new(0, 3, 0, 3),
	UDim2.new(1, -6, 0, 34),
	function()
		local Character = LocalPlayer.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

		if Humanoid then
			Humanoid.Sit = true
		end
	end
)

CreateButton(
	misc,
	"JUMP",
	UDim2.new(0, 3, 0, 42),
	UDim2.new(1, -6, 0, 34),
	function()
		local Character = LocalPlayer.Character
		local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")

		if Humanoid then
			Humanoid.Jump = true
		end
	end
)

-- =========================================================
-- PAGE 4
-- =========================================================

local MusicInput = CreateInput(
	pmi,
	"MUSIC ID",
	UDim2.new(0, 3, 0, 3)
)

CreateButton(
	pmi,
	"PLAY",
	UDim2.new(0, 3, 0, 39),
	UDim2.new(1, -6, 0, 34),
	function()
		local Id = tonumber(MusicInput.Text)

		if not Id then
			return
		end

		local Sound = workspace:FindFirstChild("c00lguiMusic")

		if not Sound then
			Sound = Instance.new("Sound")
			Sound.Name = "c00lguiMusic"
			Sound.Parent = workspace
		end

		Sound.SoundId = "rbxassetid://" .. Id
		Sound.Volume = 1
		Sound.Looped = true
		Sound:Play()
	end
)

CreateButton(
	pmi,
	"STOP",
	UDim2.new(0, 3, 0, 78),
	UDim2.new(1, -6, 0, 34),
	function()
		local Sound = workspace:FindFirstChild("c00lguiMusic")

		if Sound and Sound:IsA("Sound") then
			Sound:Stop()
		end
	end
)

CreateButton(
	psd,
	"BRIGHT",
	UDim2.new(0, 3, 0, 3),
	UDim2.new(1, -6, 0, 34),
	function()
		Lighting.Brightness = 5
	end
)

CreateButton(
	psd,
	"DAY",
	UDim2.new(0, 3, 0, 42),
	UDim2.new(1, -6, 0, 34),
	function()
		Lighting.ClockTime = 14
	end
)

CreateButton(
	psd,
	"NIGHT",
	UDim2.new(0, 3, 0, 81),
	UDim2.new(1, -6, 0, 34),
	function()
		Lighting.ClockTime = 0
	end
)

CreateButton(
	psd,
	"FOV 120",
	UDim2.new(0, 3, 0, 120),
	UDim2.new(1, -6, 0, 34),
	function()
		local Camera = workspace.CurrentCamera

		if Camera then
			Camera.FieldOfView = 120
		end
	end
)

CreateButton(
	psd,
	"FOV NORMAL",
	UDim2.new(0, 3, 0, 159),
	UDim2.new(1, -6, 0, 34),
	function()
		local Camera = workspace.CurrentCamera

		if Camera then
			Camera.FieldOfView = 70
		end
	end
)

-- =========================================================
-- PAGE 5
-- =========================================================

CreateButton(
	edn,
	"TOGGLE",
	UDim2.new(0, 3, 0, 3),
	UDim2.new(1, -6, 0, 34),
	function()
		frame.Visible = not frame.Visible
	end
)

CreateButton(
	edn,
	"RESET POSITION",
	UDim2.new(0, 3, 0, 42),
	UDim2.new(1, -6, 0, 34),
	function()
		frame.Position = UDim2.new(0, 3, 0.3, 0)
		cope.Position = UDim2.new(0, 3, 0.3, 380)
	end
)

CreateButton(
	pgi,
	"BACKPACK",
	UDim2.new(0, 3, 0, 3),
	UDim2.new(1, -6, 0, 34),
	function(Button)
		local Count = 0

		for _, Item in ipairs(LocalPlayer.Backpack:GetChildren()) do
			if Item:IsA("Tool") then
				Count += 1
			end
		end

		Button.Text = "TOOLS " .. Count

		task.delay(2, function()
			if Button.Parent then
				Button.Text = "BACKPACK"
			end
		end)
	end
)

-- =========================================================
-- PAGE SYSTEM
-- =========================================================

local PageList = {
	page1,
	page2,
	page3,
	page4,
	page5
}

local CurrentPage = 1

local function UpdatePage()
	for Index, CurrentPageObject in ipairs(PageList) do
		CurrentPageObject.Visible = Index == CurrentPage
	end
end

local function NextPage()
	CurrentPage += 1

	if CurrentPage > #PageList then
		CurrentPage = 1
	end

	UpdatePage()
end

local function PreviousPage()
	CurrentPage -= 1

	if CurrentPage < 1 then
		CurrentPage = #PageList
	end

	UpdatePage()
end

right.MouseButton1Click:Connect(NextPage)
left.MouseButton1Click:Connect(PreviousPage)

addonr.MouseButton1Click:Connect(NextPage)
addonl.MouseButton1Click:Connect(PreviousPage)

UpdatePage()

-- =========================================================
-- DRAG
-- =========================================================

local Dragging = false
local DragStart
local StartPosition

title.InputBegan:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1
		or Input.UserInputType == Enum.UserInputType.Touch then

		Dragging = true
		DragStart = Input.Position
		StartPosition = frame.Position

		Input.Changed:Connect(function()
			if Input.UserInputState == Enum.UserInputState.End then
				Dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(Input)
	if not Dragging then
		return
	end

	if Input.UserInputType ~= Enum.UserInputType.MouseMovement
		and Input.UserInputType ~= Enum.UserInputType.Touch then
		return
	end

	local Delta = Input.Position - DragStart

	frame.Position = UDim2.new(
		StartPosition.X.Scale,
		StartPosition.X.Offset + Delta.X,
		StartPosition.Y.Scale,
		StartPosition.Y.Offset + Delta.Y
	)

	cope.Position = UDim2.new(
		frame.Position.X.Scale,
		frame.Position.X.Offset,
		frame.Position.Y.Scale,
		frame.Position.Y.Offset + 380
	)
end)

-- =========================================================
-- KEYBOARD
-- =========================================================

UserInputService.InputBegan:Connect(function(Input, GameProcessed)
	if GameProcessed then
		return
	end

	if Input.KeyCode == Enum.KeyCode.RightShift then
		if frame.Visible then
			frame.Visible = false
			cope.Text = "Open"
		else
			frame.Visible = true
			cope.Text = "Close"
		end
	end
end)

-- =========================================================
-- READY
-- =========================================================

print("[ c00lgui Reborn ] V1 loaded.")
