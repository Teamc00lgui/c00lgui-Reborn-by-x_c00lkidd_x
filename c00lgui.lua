-- =========================================================
-- c00lgui Reborn by x_c00lkidd_x
-- V1
-- =========================================================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local TextChatService = game:GetService("TextChatService")

local LocalPlayer = Players.LocalPlayer

local GUI_NAME = "c00lgui_Reborn_by_x_c00lkidd_x"

local Black = Color3.fromRGB(0, 0, 0)
local Red = Color3.fromRGB(255, 0, 0)
local White = Color3.fromRGB(255, 255, 255)

local Font = Enum.Font.SourceSans

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

local Gui = Instance.new("ScreenGui")
Gui.Name = GUI_NAME
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = GuiParent

-- =========================================================
-- MAIN FRAME
-- =========================================================

local Frame = Instance.new("Frame")
Frame.Parent = Gui
Frame.BackgroundColor3 = Black
Frame.BorderColor3 = Red
Frame.BorderSizePixel = 3
Frame.Name = "Frame"
Frame.Position = UDim2.new(0, 3, 0.3, 0)
Frame.Size = UDim2.new(0, 300, 0, 400)

-- =========================================================
-- PAGES CONTAINER
-- =========================================================

local Pages = Instance.new("Frame")
Pages.Parent = Frame
Pages.BackgroundColor3 = Black
Pages.BorderColor3 = Red
Pages.BorderSizePixel = 3
Pages.Name = "Pages"
Pages.Position = UDim2.new(0, 0, 0, 0)
Pages.Size = UDim2.new(1, 0, 1, 0)

-- =========================================================
-- CLOSE / OPEN
-- =========================================================

local CloseOpen = Instance.new("TextButton")
CloseOpen.Parent = Gui
CloseOpen.Active = true
CloseOpen.AutoButtonColor = true
CloseOpen.BackgroundColor3 = Black
CloseOpen.BorderColor3 = Red
CloseOpen.BorderSizePixel = 3
CloseOpen.Name = "Close/Open"
CloseOpen.Position = UDim2.new(0, 3, 0.3, 380)
CloseOpen.Selectable = true
CloseOpen.Size = UDim2.new(0, 300, 0, 20)
CloseOpen.ZIndex = 3
CloseOpen.Font = Font
CloseOpen.Text = "Close"
CloseOpen.TextColor3 = White
CloseOpen.TextSize = 18
CloseOpen.TextXAlignment = Enum.TextXAlignment.Center
CloseOpen.TextYAlignment = Enum.TextYAlignment.Center

CloseOpen.MouseButton1Click:Connect(function()
	if CloseOpen.Text == "Close" then
		Frame.Visible = false
		CloseOpen.Text = "Open"
	else
		Frame.Visible = true
		CloseOpen.Text = "Close"
	end
end)

-- =========================================================
-- PAGES
-- =========================================================

local Page1 = Instance.new("Frame")
Page1.Parent = Pages
Page1.BackgroundColor3 = Black
Page1.BorderColor3 = Red
Page1.BorderSizePixel = 3
Page1.Name = "Page1"
Page1.Position = UDim2.new(0, 0, 0, 83)
Page1.Size = UDim2.new(1, 0, 1, -106)
Page1.ZIndex = 2
Page1.Visible = true

local Page2 = Page1:Clone()
Page2.Parent = Pages
Page2.Name = "Page2"
Page2.Visible = false

local Page3 = Page1:Clone()
Page3.Parent = Pages
Page3.Name = "Page3"
Page3.Visible = false

local Page4 = Page1:Clone()
Page4.Parent = Pages
Page4.Name = "Page4"
Page4.Visible = false

local Page5 = Page1:Clone()
Page5.Parent = Pages
Page5.Name = "Page5"
Page5.Visible = false

-- =========================================================
-- SETTINGS
-- =========================================================

local Settings = Instance.new("Frame")
Settings.Parent = Frame
Settings.BackgroundColor3 = Black
Settings.BorderColor3 = Red
Settings.BorderSizePixel = 3
Settings.Name = "Settings"
Settings.Position = UDim2.new(1, 3, 0, 0)
Settings.Size = UDim2.new(1, 0, 1, 0)
Settings.ZIndex = 1
Settings.Visible = true

-- =========================================================
-- NAVIGATION
-- =========================================================

local Right = Instance.new("TextButton")
Right.Parent = Frame
Right.BackgroundColor3 = Black
Right.BorderColor3 = Red
Right.BorderSizePixel = 3
Right.Name = ">"
Right.Position = UDim2.new(0.5, 3, 0, 40)
Right.Size = UDim2.new(0.5, -3, 0, 40)
Right.ZIndex = 2
Right.Font = Font
Right.Text = ">"
Right.TextColor3 = White
Right.TextSize = 48

local Left = Instance.new("TextButton")
Left.Parent = Frame
Left.BackgroundColor3 = Black
Left.BorderColor3 = Red
Left.BorderSizePixel = 3
Left.Name = "<"
Left.Position = UDim2.new(0, 0, 0, 40)
Left.Size = UDim2.new(0.5, -3, 0, 40)
Left.ZIndex = 2
Left.Font = Font
Left.Text = "<"
Left.TextColor3 = White
Left.TextSize = 48

-- =========================================================
-- PAGE EDGE BUTTONS
-- =========================================================

local AddonRight = Instance.new("TextButton")
AddonRight.Parent = Page5
AddonRight.BackgroundColor3 = Black
AddonRight.BorderColor3 = Red
AddonRight.BorderSizePixel = 3
AddonRight.Name = "addonr"
AddonRight.Position = UDim2.new(0, 153, 0, -40)
AddonRight.Size = UDim2.new(0.49, 0, 0.125, 0)
AddonRight.Font = Font
AddonRight.Text = ">"
AddonRight.TextColor3 = White
AddonRight.TextSize = 48
AddonRight.ZIndex = 3

local AddonLeft = Instance.new("TextButton")
AddonLeft.Parent = Page1
AddonLeft.BackgroundColor3 = Black
AddonLeft.BorderColor3 = Red
AddonLeft.BorderSizePixel = 3
AddonLeft.Name = "addonl"
AddonLeft.Position = UDim2.new(0, 0, 0, -40)
AddonLeft.Size = UDim2.new(0.49, 0, 0.125, 0)
AddonLeft.Font = Font
AddonLeft.Text = "<"
AddonLeft.TextColor3 = White
AddonLeft.TextSize = 48
AddonLeft.ZIndex = 3

-- =========================================================
-- TITLE
-- =========================================================

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.BackgroundColor3 = Black
Title.BorderColor3 = Red
Title.BorderSizePixel = 3
Title.Name = "Title"
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.ZIndex = 2
Title.Font = Font
Title.Text = "c00lgui Reborn by x_c00lkidd_x"
Title.TextColor3 = White
Title.TextSize = 24

-- =========================================================
-- PAGE PANELS
-- =========================================================

local function CreatePanel(Parent, Name, RightSide)
	local Panel = Instance.new("Frame")
	Panel.Parent = Parent
	Panel.BackgroundColor3 = Black
	Panel.BorderColor3 = Red
	Panel.BorderSizePixel = 3
	Panel.Name = Name
	Panel.Position = RightSide
		and UDim2.new(0.5, 3, 0, 0)
		or UDim2.new(0, 0, 0, 0)
	Panel.Size = UDim2.new(0.5, -3, 1, 0)
	Panel.ZIndex = 2

	return Panel
end

local ServerPanel = CreatePanel(Page1, "Server", false)
local AdminPanel = CreatePanel(Page1, "Admin", true)

local ToolsPanel = CreatePanel(Page2, "Tools", false)
local WeaponsPanel = CreatePanel(Page2, "Weapons", true)

local LocalPanel = CreatePanel(Page3, "LocalPlayer", false)
local MiscPanel = CreatePanel(Page3, "Misc", true)

local MusicPanel = CreatePanel(Page4, "Music", false)
local VisualPanel = CreatePanel(Page4, "Visuals", true)

local EndPanel = CreatePanel(Page5, "End", false)
local GearPanel = CreatePanel(Page5, "Gear", true)

-- =========================================================
-- BUTTON HELPERS
-- =========================================================

local function CreateButton(Parent, Text, Position, Size, Callback)
	local Button = Instance.new("TextButton")
	Button.Parent = Parent
	Button.BackgroundColor3 = Black
	Button.BorderColor3 = Red
	Button.BorderSizePixel = 3
	Button.Position = Position
	Button.Size = Size
	Button.Font = Font
	Button.Text = Text
	Button.TextColor3 = White
	Button.TextSize = 18
	Button.AutoButtonColor = true

	if Callback then
		Button.MouseButton1Click:Connect(Callback)
	end

	return Button
end

local function CreateInput(Parent, Placeholder, Position)
	local Input = Instance.new("TextBox")
	Input.Parent = Parent
	Input.BackgroundColor3 = Black
	Input.BorderColor3 = Red
	Input.BorderSizePixel = 3
	Input.Position = Position
	Input.Size = UDim2.new(1, -6, 0, 30)
	Input.Font = Font
	Input.PlaceholderText = Placeholder
	Input.PlaceholderColor3 = White
	Input.Text = ""
	Input.TextColor3 = White
	Input.TextSize = 17
	Input.ClearTextOnFocus = false

	return Input
end

-- =========================================================
-- PAGE 1
-- =========================================================

CreateButton(
	ServerPanel,
	"REJOIN",
	UDim2.new(0, 3, 0, 3),
	UDim2.new(1, -6, 0, 34),
	function()
		TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end
)

CreateButton(
	ServerPanel,
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
	ServerPanel,
	"SERVER INFO",
	UDim2.new(0, 3, 0, 81),
	UDim2.new(1, -6, 0, 34),
	function(Button)
		Button.Text = tostring(#Players:GetPlayers()) .. " PLAYERS"

		task.delay(2, function()
			if Button then
				Button.Text = "SERVER INFO"
			end
		end)
	end
)

CreateButton(
	ServerPanel,
	"JOB ID",
	UDim2.new(0, 3, 0, 120),
	UDim2.new(1, -6, 0, 34),
	function(Button)
		Button.Text = string.sub(game.JobId, 1, 12)

		task.delay(2, function()
			if Button then
				Button.Text = "JOB ID"
			end
		end)
	end
)

CreateButton(
	AdminPanel,
	"ABOUT",
	UDim2.new(0, 3, 0, 3),
	UDim2.new(1, -6, 0, 34),
	function(Button)
		Button.Text = "V1"

		task.delay(2, function()
			if Button then
				Button.Text = "ABOUT"
			end
		end)
	end
)

CreateButton(
	AdminPanel,
	"CREATOR",
	UDim2.new(0, 3, 0, 42),
	UDim2.new(1, -6, 0, 34),
	function(Button)
		Button.Text = "x_c00lkidd_x"

		task.delay(2, function()
			if Button then
				Button.Text = "CREATOR"
			end
		end)
	end
)

-- =========================================================
-- PAGE 2
-- =========================================================

CreateButton(
	ToolsPanel,
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
	ToolsPanel,
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
	ToolsPanel,
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
			if Button then
				Button.Text = "TOOL COUNT"
			end
		end)
	end
)

CreateButton(
	WeaponsPanel,
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
	LocalPanel,
	"WALKSPEED",
	UDim2.new(0, 3, 0, 3)
)

CreateButton(
	LocalPanel,
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
	LocalPanel,
	"JUMPPOWER",
	UDim2.new(0, 3, 0, 78)
)

CreateButton(
	LocalPanel,
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
	LocalPanel,
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
	MiscPanel,
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
	MiscPanel,
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
	MusicPanel,
	"MUSIC ID",
	UDim2.new(0, 3, 0, 3)
)

CreateButton(
	MusicPanel,
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
	MusicPanel,
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
	VisualPanel,
	"BRIGHT",
	UDim2.new(0, 3, 0, 3),
	UDim2.new(1, -6, 0, 34),
	function()
		Lighting.Brightness = 5
	end
)

CreateButton(
	VisualPanel,
	"DAY",
	UDim2.new(0, 3, 0, 42),
	UDim2.new(1, -6, 0, 34),
	function()
		Lighting.ClockTime = 14
	end
)

CreateButton(
	VisualPanel,
	"NIGHT",
	UDim2.new(0, 3, 0, 81),
	UDim2.new(1, -6, 0, 34),
	function()
		Lighting.ClockTime = 0
	end
)

CreateButton(
	VisualPanel,
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
	VisualPanel,
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
	EndPanel,
	"TOGGLE",
	UDim2.new(0, 3, 0, 3),
	UDim2.new(1, -6, 0, 34),
	function()
		Frame.Visible = not Frame.Visible
	end
)

CreateButton(
	EndPanel,
	"RESET POSITION",
	UDim2.new(0, 3, 0, 42),
	UDim2.new(1, -6, 0, 34),
	function()
		Frame.Position = UDim2.new(0, 3, 0.3, 0)
		CloseOpen.Position = UDim2.new(0, 3, 0.3, 380)
	end
)

CreateButton(
	GearPanel,
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
			if Button then
				Button.Text = "BACKPACK"
			end
		end)
	end
)

-- =========================================================
-- PAGE SYSTEM
-- =========================================================

local PageList = {
	Page1,
	Page2,
	Page3,
	Page4,
	Page5
}

local CurrentPage = 1

local function UpdatePage()
	for Index, Page in ipairs(PageList) do
		Page.Visible = Index == CurrentPage
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

Right.MouseButton1Click:Connect(NextPage)
Left.MouseButton1Click:Connect(PreviousPage)

AddonRight.MouseButton1Click:Connect(NextPage)
AddonLeft.MouseButton1Click:Connect(PreviousPage)

UpdatePage()

-- =========================================================
-- DRAG
-- =========================================================

local Dragging = false
local DragStart
local StartPosition

Title.InputBegan:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1
		or Input.UserInputType == Enum.UserInputType.Touch then

		Dragging = true
		DragStart = Input.Position
		StartPosition = Frame.Position

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

	Frame.Position = UDim2.new(
		StartPosition.X.Scale,
		StartPosition.X.Offset + Delta.X,
		StartPosition.Y.Scale,
		StartPosition.Y.Offset + Delta.Y
	)

	CloseOpen.Position = UDim2.new(
		Frame.Position.X.Scale,
		Frame.Position.X.Offset,
		Frame.Position.Y.Scale,
		Frame.Position.Y.Offset + 380
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
		if Frame.Visible then
			Frame.Visible = false
			CloseOpen.Text = "Open"
		else
			Frame.Visible = true
			CloseOpen.Text = "Close"
		end
	end
end)

-- =========================================================
-- READY
-- =========================================================

print("[ c00lgui Reborn ] V1 loaded.")