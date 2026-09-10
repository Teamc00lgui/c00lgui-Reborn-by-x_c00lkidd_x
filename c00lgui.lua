-- =========================================================
-- c00lgui Reborn by x_c00lkidd_x
-- =========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- =========================================================
-- CONFIGURATION
-- =========================================================

local GUI_NAME = "c00lgui"

local Theme = {
	Background = Color3.fromRGB(5, 5, 5),
	Panel = Color3.fromRGB(11, 11, 11),
	Panel2 = Color3.fromRGB(18, 18, 18),

	Red = Color3.fromRGB(255, 0, 0),
	DarkRed = Color3.fromRGB(120, 0, 0),
	SoftRed = Color3.fromRGB(35, 8, 8),

	White = Color3.fromRGB(245, 245, 245),
	Grey = Color3.fromRGB(125, 125, 125),

	Stroke = Color3.fromRGB(45, 45, 45),
	Bar = Color3.fromRGB(35, 35, 35)
}

local Animations = {
	Fast = TweenInfo.new(
		0.14,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	),

	Button = TweenInfo.new(
		0.18,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	),

	Normal = TweenInfo.new(
		0.24,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	),

	Smooth = TweenInfo.new(
		0.34,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	),

	TabOut = TweenInfo.new(
		0.20,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.In
	),

	TabIn = TweenInfo.new(
		0.30,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	),

	Slider = TweenInfo.new(
		0.10,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	),

	Open = TweenInfo.new(
		0.42,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	)
}

local DEFAULTS = {
	WalkSpeed = 16,
	JumpPower = 50,
	FieldOfView = 70
}

-- =========================================================
-- CLEANUP
-- =========================================================

local ExistingGui = PlayerGui:FindFirstChild(GUI_NAME)

if ExistingGui then
	ExistingGui:Destroy()
end

-- =========================================================
-- HELPERS
-- =========================================================

local Connections = {}

local function Connect(signal, callback)
	local connection = signal:Connect(callback)
	table.insert(Connections, connection)
	return connection
end

local function DisconnectAll()
	for _, connection in ipairs(Connections) do
		if connection and connection.Connected then
			connection:Disconnect()
		end
	end

	table.clear(Connections)
end

local function Tween(instance, info, properties)
	if not instance or not instance.Parent then
		return nil
	end

	local tween = TweenService:Create(instance, info, properties)
	tween:Play()

	return tween
end

local function Corner(instance, radius)
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, radius)
	corner.Parent = instance

	return corner
end

local function Stroke(instance, color, thickness)
	local stroke = Instance.new("UIStroke")
	stroke.Color = color
	stroke.Thickness = thickness
	stroke.Parent = instance

	return stroke
end

local function GetHumanoid()
	local character = Player.Character

	if not character then
		return nil
	end

	return character:FindFirstChildOfClass("Humanoid")
end

local function GetCamera()
	return workspace.CurrentCamera
end

-- =========================================================
-- SCREEN GUI
-- =========================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = GUI_NAME
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.IgnoreGuiInset = true
Gui.Parent = PlayerGui

-- =========================================================
-- MAIN WINDOW
-- =========================================================

local NormalSize = UDim2.fromOffset(620, 430)
local MinimizedSize = UDim2.fromOffset(620, 44)

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(620, 0)
Main.Position = UDim2.new(0.5, -310, 0.5, -215)
Main.BackgroundColor3 = Theme.Background
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Active = true
Main.Parent = Gui

Corner(Main, 14)

local MainStroke = Stroke(Main, Theme.Red, 2)
MainStroke.Transparency = 0.08

-- =========================================================
-- TITLE BAR
-- =========================================================

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 44)
TitleBar.BackgroundColor3 = Theme.Red
TitleBar.BorderSizePixel = 0
TitleBar.Active = true
TitleBar.Parent = Main

Corner(TitleBar, 14)

local TitleBottom = Instance.new("Frame")
TitleBottom.Name = "TitleBottom"
TitleBottom.Size = UDim2.new(1, 0, 0, 14)
TitleBottom.Position = UDim2.new(0, 0, 1, -14)
TitleBottom.BackgroundColor3 = Theme.Red
TitleBottom.BorderSizePixel = 0
TitleBottom.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -120, 1, 0)
Title.Position = UDim2.fromOffset(16, 0)
Title.BackgroundTransparency = 1
Title.Text = "c00lgui Reborn by x_c00lkidd_x"
Title.TextColor3 = Theme.White
Title.TextSize = 16
Title.Font = Enum.Font.Code
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

-- =========================================================
-- WINDOW BUTTONS
-- =========================================================

local Minimize = Instance.new("TextButton")
Minimize.Name = "Minimize"
Minimize.Size = UDim2.fromOffset(32, 30)
Minimize.Position = UDim2.new(1, -76, 0, 7)
Minimize.BackgroundColor3 = Theme.DarkRed
Minimize.BorderSizePixel = 0
Minimize.Text = "—"
Minimize.TextColor3 = Theme.White
Minimize.TextSize = 18
Minimize.Font = Enum.Font.GothamBold
Minimize.AutoButtonColor = false
Minimize.Parent = TitleBar

Corner(Minimize, 7)

local Close = Instance.new("TextButton")
Close.Name = "Close"
Close.Size = UDim2.fromOffset(32, 30)
Close.Position = UDim2.new(1, -38, 0, 7)
Close.BackgroundColor3 = Theme.DarkRed
Close.BorderSizePixel = 0
Close.Text = "×"
Close.TextColor3 = Theme.White
Close.TextSize = 21
Close.Font = Enum.Font.GothamBold
Close.AutoButtonColor = false
Close.Parent = TitleBar

Corner(Close, 7)

-- =========================================================
-- BODY
-- =========================================================

local Body = Instance.new("Frame")
Body.Name = "Body"
Body.Size = UDim2.new(1, 0, 1, -44)
Body.Position = UDim2.fromOffset(0, 44)
Body.BackgroundTransparency = 1
Body.BorderSizePixel = 0
Body.Parent = Main

-- =========================================================
-- SIDEBAR
-- =========================================================

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.fromOffset(135, 370)
Sidebar.Position = UDim2.fromOffset(10, 8)
Sidebar.BackgroundColor3 = Theme.Panel
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Body

Corner(Sidebar, 10)
Stroke(Sidebar, Theme.Stroke, 1)

local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.PaddingTop = UDim.new(0, 10)
SidebarPadding.PaddingLeft = UDim.new(0, 8)
SidebarPadding.PaddingRight = UDim.new(0, 8)
SidebarPadding.Parent = Sidebar

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Padding = UDim.new(0, 7)
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Parent = Sidebar

-- =========================================================
-- CONTENT
-- =========================================================

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -155, 1, -16)
Content.Position = UDim2.fromOffset(145, 8)
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.ClipsDescendants = true
Content.Parent = Body

-- =========================================================
-- PAGE SYSTEM
-- =========================================================

local Pages = {}
local Tabs = {}

local CurrentPage = nil
local CurrentTab = nil
local TabTransitionId = 0

local function CreatePage(name)
	local page = Instance.new("ScrollingFrame")
	page.Name = name
	page.Size = UDim2.fromScale(1, 1)
	page.Position = UDim2.fromScale(0, 0)
	page.BackgroundColor3 = Theme.Panel
	page.BorderSizePixel = 0
	page.ScrollBarThickness = 3
	page.ScrollBarImageColor3 = Theme.Red
	page.AutomaticCanvasSize = Enum.AutomaticSize.Y
	page.CanvasSize = UDim2.new()
	page.ScrollingDirection = Enum.ScrollingDirection.Y
	page.Visible = false
	page.ClipsDescendants = true
	page.Parent = Content

	Corner(page, 10)
	Stroke(page, Theme.Stroke, 1)

	local padding = Instance.new("UIPadding")
	padding.PaddingTop = UDim.new(0, 14)
	padding.PaddingBottom = UDim.new(0, 14)
	padding.PaddingLeft = UDim.new(0, 14)
	padding.PaddingRight = UDim.new(0, 14)
	padding.Parent = page

	local layout = Instance.new("UIListLayout")
	layout.Padding = UDim.new(0, 10)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	layout.Parent = page

	Pages[name] = page

	return page
end

-- =========================================================
-- PAGE ELEMENTS
-- =========================================================

local function AddHeader(page, text)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 0, 32)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = Theme.Red
	label.TextSize = 17
	label.Font = Enum.Font.Code
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = page

	return label
end

local function AddDescription(page, text)
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 0, 50)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = Theme.Grey
	label.TextSize = 13
	label.Font = Enum.Font.Code
	label.TextWrapped = true
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Top
	label.Parent = page

	return label
end

-- =========================================================
-- BUTTON
-- =========================================================

local function AddButton(page, text, callback)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(1, 0, 0, 40)
	button.BackgroundColor3 = Theme.Panel2
	button.BorderSizePixel = 0
	button.Text = text
	button.TextColor3 = Theme.White
	button.TextSize = 14
	button.Font = Enum.Font.Code
	button.AutoButtonColor = false
	button.Parent = page

	Corner(button, 8)

	local buttonStroke = Stroke(button, Theme.Stroke, 1)

	local normalSize = UDim2.new(1, 0, 0, 40)
	local pressedSize = UDim2.new(1, -4, 0, 38)

	Connect(button.MouseEnter, function()
		Tween(button, Animations.Button, {
			BackgroundColor3 = Theme.SoftRed
		})

		Tween(buttonStroke, Animations.Button, {
			Color = Theme.DarkRed,
			Thickness = 1.2
		})
	end)

	Connect(button.MouseLeave, function()
		Tween(button, Animations.Button, {
			BackgroundColor3 = Theme.Panel2,
			Size = normalSize
		})

		Tween(buttonStroke, Animations.Button, {
			Color = Theme.Stroke,
			Thickness = 1
		})
	end)

	Connect(button.MouseButton1Down, function()
		Tween(button, Animations.Fast, {
			Size = pressedSize
		})
	end)

	Connect(button.MouseButton1Up, function()
		Tween(button, Animations.Button, {
			Size = normalSize
		})
	end)

	Connect(button.MouseButton1Click, function()
		if callback then
			callback()
		end
	end)

	return button
end

-- =========================================================
-- SLIDER
-- =========================================================

local function AddSlider(page, title, minimum, maximum, default, callback)
	local container = Instance.new("Frame")
	container.Size = UDim2.new(1, 0, 0, 72)
	container.BackgroundColor3 = Theme.Panel2
	container.BorderSizePixel = 0
	container.Parent = page

	Corner(container, 8)

	local containerStroke = Stroke(container, Theme.Stroke, 1)

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, -75, 0, 27)
	label.Position = UDim2.fromOffset(10, 5)
	label.BackgroundTransparency = 1
	label.Text = title
	label.TextColor3 = Theme.White
	label.TextSize = 14
	label.Font = Enum.Font.Code
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = container

	local valueLabel = Instance.new("TextLabel")
	valueLabel.Size = UDim2.fromOffset(55, 27)
	valueLabel.Position = UDim2.new(1, -65, 0, 5)
	valueLabel.BackgroundTransparency = 1
	valueLabel.Text = tostring(default)
	valueLabel.TextColor3 = Theme.Red
	valueLabel.TextSize = 14
	valueLabel.Font = Enum.Font.Code
	valueLabel.TextXAlignment = Enum.TextXAlignment.Right
	valueLabel.Parent = container

	local bar = Instance.new("Frame")
	bar.Size = UDim2.new(1, -20, 0, 7)
	bar.Position = UDim2.fromOffset(10, 49)
	bar.BackgroundColor3 = Theme.Bar
	bar.BorderSizePixel = 0
	bar.Active = true
	bar.Parent = container

	Corner(bar, 20)

	local fill = Instance.new("Frame")
	fill.Size = UDim2.new(0, 0, 1, 0)
	fill.BackgroundColor3 = Theme.Red
	fill.BorderSizePixel = 0
	fill.Parent = bar

	Corner(fill, 20)

	local knob = Instance.new("Frame")
	knob.Size = UDim2.fromOffset(16, 16)
	knob.AnchorPoint = Vector2.new(0.5, 0.5)
	knob.Position = UDim2.fromScale(0, 0.5)
	knob.BackgroundColor3 = Theme.White
	knob.BorderSizePixel = 0
	knob.Active = true
	knob.Parent = bar

	Corner(knob, 20)

	local knobStroke = Stroke(knob, Theme.Red, 1)

	local dragging = false

	local function SetValue(value, instant)
		value = math.clamp(value, minimum, maximum)
		value = math.floor(value + 0.5)

		local alpha = 0

		if maximum ~= minimum then
			alpha = (value - minimum) / (maximum - minimum)
		end

		valueLabel.Text = tostring(value)

		local tweenInfo = instant
			and TweenInfo.new(0)
			or Animations.Slider

		Tween(fill, tweenInfo, {
			Size = UDim2.new(alpha, 0, 1, 0)
		})

		Tween(knob, tweenInfo, {
			Position = UDim2.new(alpha, 0, 0.5, 0)
		})

		if callback then
			callback(value)
		end
	end

	local function UpdateFromPosition(x)
		local width = bar.AbsoluteSize.X

		if width <= 0 then
			return
		end

		local alpha = math.clamp(
			(x - bar.AbsolutePosition.X) / width,
			0,
			1
		)

		local value = minimum + ((maximum - minimum) * alpha)

		SetValue(value, false)
	end

	Connect(bar.InputBegan, function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end

		dragging = true

		Tween(containerStroke, Animations.Fast, {
			Color = Theme.DarkRed,
			Thickness = 1.5
		})

		Tween(knob, Animations.Fast, {
			Size = UDim2.fromOffset(19, 19)
		})

		UpdateFromPosition(input.Position.X)
	end)

	Connect(UserInputService.InputChanged, function(input)
		if not dragging then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch then
			UpdateFromPosition(input.Position.X)
		end
	end)

	Connect(UserInputService.InputEnded, function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end

		if not dragging then
			return
		end

		dragging = false

		Tween(containerStroke, Animations.Normal, {
			Color = Theme.Stroke,
			Thickness = 1
		})

		Tween(knob, Animations.Normal, {
			Size = UDim2.fromOffset(16, 16)
		})
	end)

	Connect(container.MouseEnter, function()
		Tween(knobStroke, Animations.Button, {
			Color = Theme.Red
		})
	end)

	Connect(container.MouseLeave, function()
		if not dragging then
			Tween(knobStroke, Animations.Button, {
				Color = Theme.Red
			})
		end
	end)

	SetValue(default, true)

	return {
		Container = container,
		SetValue = SetValue
	}
end

-- =========================================================
-- CREATE PAGES
-- =========================================================

local PlayerPage = CreatePage("PLAYER")
local VisualsPage = CreatePage("VISUALS")
local SettingsPage = CreatePage("SETTINGS")
local AboutPage = CreatePage("ABOUT")

-- =========================================================
-- PLAYER PAGE
-- =========================================================

AddHeader(PlayerPage, "PLAYER")

AddDescription(
	PlayerPage,
	"Local character controls. Changes affect only your current client character."
)

local WalkSpeedSlider = AddSlider(
	PlayerPage,
	"WalkSpeed",
	0,
	200,
	DEFAULTS.WalkSpeed,
	function(value)
		local humanoid = GetHumanoid()

		if humanoid then
			humanoid.WalkSpeed = value
		end
	end
)

local JumpPowerSlider = AddSlider(
	PlayerPage,
	"JumpPower",
	0,
	250,
	DEFAULTS.JumpPower,
	function(value)
		local humanoid = GetHumanoid()

		if humanoid then
			humanoid.UseJumpPower = true
			humanoid.JumpPower = value
		end
	end
)

local FOVSlider = AddSlider(
	PlayerPage,
	"Field Of View",
	40,
	120,
	DEFAULTS.FieldOfView,
	function(value)
		local camera = GetCamera()

		if camera then
			camera.FieldOfView = value
		end
	end
)

AddButton(
	PlayerPage,
	"RESET PLAYER",
	function()
		WalkSpeedSlider.SetValue(DEFAULTS.WalkSpeed, false)
		JumpPowerSlider.SetValue(DEFAULTS.JumpPower, false)
		FOVSlider.SetValue(DEFAULTS.FieldOfView, false)
	end
)

AddButton(
	PlayerPage,
	"RESET CHARACTER",
	function()
		local humanoid = GetHumanoid()

		if humanoid then
			humanoid.Health = 0
		end
	end
)

-- =========================================================
-- VISUALS PAGE
-- =========================================================

AddHeader(VisualsPage, "VISUALS")

AddDescription(
	VisualsPage,
	"Client-side visual effects and camera controls."
)

AddButton(
	VisualsPage,
	"RED ACCENT",
	function()
		Tween(MainStroke, Animations.Normal, {
			Color = Theme.Red,
			Thickness = 2
		})
	end
)

AddButton(
	VisualsPage,
	"FLASH BORDER",
	function()
		Tween(MainStroke, Animations.Fast, {
			Color = Theme.White,
			Thickness = 4
		})

		task.delay(0.14, function()
			if MainStroke and MainStroke.Parent then
				Tween(MainStroke, Animations.Smooth, {
					Color = Theme.Red,
					Thickness = 2
				})
			end
		end)
	end
)

AddButton(
	VisualsPage,
	"RESET CAMERA",
	function()
		local camera = GetCamera()

		if camera then
			Tween(camera, Animations.Smooth, {
				FieldOfView = DEFAULTS.FieldOfView
			})
		end

		FOVSlider.SetValue(DEFAULTS.FieldOfView, false)
	end
)

-- =========================================================
-- SETTINGS PAGE
-- =========================================================

AddHeader(SettingsPage, "SETTINGS")

AddDescription(
	SettingsPage,
	"Interface controls, window behavior and keyboard shortcuts."
)

AddButton(
	SettingsPage,
	"RESET WINDOW POSITION",
	function()
		Tween(Main, Animations.Smooth, {
			Position = UDim2.new(0.5, -310, 0.5, -215)
		})
	end
)

AddButton(
	SettingsPage,
	"REDUCE BORDER",
	function()
		Tween(MainStroke, Animations.Normal, {
			Thickness = 1
		})
	end
)

AddButton(
	SettingsPage,
	"RESTORE BORDER",
	function()
		Tween(MainStroke, Animations.Normal, {
			Thickness = 2
		})
	end
)

AddButton(
	SettingsPage,
	"RESET ALL",
	function()
		WalkSpeedSlider.SetValue(DEFAULTS.WalkSpeed, false)
		JumpPowerSlider.SetValue(DEFAULTS.JumpPower, false)
		FOVSlider.SetValue(DEFAULTS.FieldOfView, false)

		Tween(MainStroke, Animations.Normal, {
			Color = Theme.Red,
			Thickness = 2
		})

		Tween(Main, Animations.Smooth, {
			Position = UDim2.new(0.5, -310, 0.5, -215)
		})
	end
)

-- =========================================================
-- WINDOW STATE
-- =========================================================

local Minimized = false
local WindowTween = nil
local Closing = false

local function StopWindowTween()
	if WindowTween then
		WindowTween:Cancel()
		WindowTween = nil
	end
end

local function SetMinimized(state)
	if Closing then
		return
	end

	Minimized = state
	StopWindowTween()

	if state then
		Body.Visible = false
		TitleBottom.Visible = false
		Minimize.Text = "+"

		WindowTween = Tween(
			Main,
			Animations.Smooth,
			{
				Size = MinimizedSize
			}
		)
	else
		Minimize.Text = "—"

		Body.Visible = false
		TitleBottom.Visible = false

		WindowTween = Tween(
			Main,
			Animations.Smooth,
			{
				Size = NormalSize
			}
		)

		task.delay(0.34, function()
			if not Main or not Main.Parent then
				return
			end

			if not Minimized and not Closing then
				Main.Size = NormalSize
				TitleBottom.Visible = true
				Body.Visible = true
			end
		end)
	end
end

local function CloseGui()
	if Closing then
		return
	end

	Closing = true

	StopWindowTween()

	Body.Visible = false
	TitleBottom.Visible = false

	Tween(Main, Animations.Smooth, {
		Size = UDim2.fromOffset(620, 0)
	})

	task.delay(0.38, function()
		if Gui and Gui.Parent then
			DisconnectAll()
			Gui:Destroy()
		end
	end)
end

-- =========================================================
-- ABOUT PAGE
-- =========================================================

AddHeader(AboutPage, "ABOUT")

AddDescription(
	AboutPage,
	"c00lgui Reborn\n\nA custom single-script Roblox interface inspired by classic GUI designs.\n\nClient-side controls remain subject to Roblox's normal client/server security model."
)

AddButton(
	AboutPage,
	"CLOSE GUI",
	CloseGui
)

-- =========================================================
-- TAB SYSTEM
-- =========================================================

local function UpdateTabVisuals(selectedName)
	for tabName, data in pairs(Tabs) do
		local selected = tabName == selectedName

		Tween(data.Button, Animations.Normal, {
			BackgroundColor3 = selected
				and Theme.DarkRed
				or Theme.Panel2,

			TextColor3 = selected
				and Theme.White
				or Theme.Grey
		})

		Tween(data.Indicator, Animations.Normal, {
			Size = selected
				and UDim2.new(0, 3, 0, 24)
				or UDim2.new(0, 0, 0, 24),

			BackgroundTransparency = selected and 0 or 1
		})
	end
end

local function SelectTab(name)
	local newPage = Pages[name]

	if not newPage then
		return
	end

	if CurrentPage == newPage then
		return
	end

	TabTransitionId += 1

	local transitionId = TabTransitionId
	local oldPage = CurrentPage

	UpdateTabVisuals(name)

	if oldPage then
		Tween(oldPage, Animations.TabOut, {
			Position = UDim2.new(-0.06, 0, 0, 0)
		})

		task.delay(0.20, function()
			if transitionId ~= TabTransitionId then
				return
			end

			if oldPage and oldPage.Parent then
				oldPage.Visible = false
				oldPage.Position = UDim2.fromScale(0, 0)
			end
		end)
	end

	newPage.Visible = true
	newPage.Position = UDim2.new(0.06, 0, 0, 0)

	task.defer(function()
		if transitionId ~= TabTransitionId then
			return
		end

		Tween(newPage, Animations.TabIn, {
			Position = UDim2.fromScale(0, 0)
		})
	end)

	CurrentPage = newPage
	CurrentTab = name
end

local function AddTab(name, order)
	local button = Instance.new("TextButton")
	button.Name = name
	button.LayoutOrder = order
	button.Size = UDim2.new(1, 0, 0, 40)
	button.BackgroundColor3 = Theme.Panel2
	button.BorderSizePixel = 0
	button.Text = name
	button.TextColor3 = Theme.Grey
	button.TextSize = 13
	button.Font = Enum.Font.Code
	button.TextXAlignment = Enum.TextXAlignment.Left
	button.AutoButtonColor = false
	button.ClipsDescendants = true
	button.Parent = Sidebar

	Corner(button, 8)

	local buttonStroke = Stroke(button, Theme.Stroke, 1)

	local indicator = Instance.new("Frame")
	indicator.Name = "Indicator"
	indicator.Size = UDim2.new(0, 0, 0, 24)
	indicator.Position = UDim2.new(0, 0, 0.5, -12)
	indicator.BackgroundColor3 = Theme.Red
	indicator.BorderSizePixel = 0
	indicator.BackgroundTransparency = 1
	indicator.Parent = button

	Corner(indicator, 3)

	local textPadding = Instance.new("UIPadding")
	textPadding.PaddingLeft = UDim.new(0, 12)
	textPadding.Parent = button

	local normalSize = UDim2.new(1, 0, 0, 40)
	local pressedSize = UDim2.new(1, -4, 0, 38)

	Connect(button.MouseEnter, function()
		if CurrentTab ~= name then
			Tween(button, Animations.Button, {
				BackgroundColor3 = Theme.SoftRed
			})

			Tween(buttonStroke, Animations.Button, {
				Color = Theme.DarkRed,
				Thickness = 1.2
			})
		end
	end)

	Connect(button.MouseLeave, function()
		if CurrentTab ~= name then
			Tween(button, Animations.Button, {
				BackgroundColor3 = Theme.Panel2,
				Size = normalSize
			})

			Tween(buttonStroke, Animations.Button, {
				Color = Theme.Stroke,
				Thickness = 1
			})
		end
	end)

	Connect(button.MouseButton1Down, function()
		Tween(button, Animations.Fast, {
			Size = pressedSize
		})
	end)

	Connect(button.MouseButton1Up, function()
		Tween(button, Animations.Button, {
			Size = normalSize
		})
	end)

	Connect(button.MouseButton1Click, function()
		SelectTab(name)
	end)

	Tabs[name] = {
		Button = button,
		Indicator = indicator,
	}
end

AddTab("PLAYER", 1)
AddTab("VISUALS", 2)
AddTab("SETTINGS", 3)
AddTab("ABOUT", 4)

-- =========================================================
-- INITIAL PAGE
-- =========================================================

SelectTab("PLAYER")

-- =========================================================
-- MINIMIZE BUTTON
-- =========================================================

Connect(Minimize.MouseButton1Click, function()
	SetMinimized(not Minimized)
end)

-- =========================================================
-- WINDOW BUTTON ANIMATIONS
-- =========================================================

for _, button in ipairs({Minimize, Close}) do
	Connect(button.MouseEnter, function()
		Tween(button, Animations.Button, {
			BackgroundColor3 = Color3.fromRGB(220, 0, 0)
		})
	end)

	Connect(button.MouseLeave, function()
		Tween(button, Animations.Button, {
			BackgroundColor3 = Theme.DarkRed,
			Size = UDim2.fromOffset(32, 30)
		})
	end)

	Connect(button.MouseButton1Down, function()
		Tween(button, Animations.Fast, {
			Size = UDim2.fromOffset(30, 28)
		})
	end)

	Connect(button.MouseButton1Up, function()
		Tween(button, Animations.Button, {
			Size = UDim2.fromOffset(32, 30)
		})
	end)
end

-- =========================================================
-- DRAG SYSTEM
-- =========================================================

local Dragging = false
local DragStart
local StartPosition

local function IsWindowButton(input)
	local target = input.Target

	if not target then
		return false
	end

	return target == Minimize
		or target == Close
		or target:IsDescendantOf(Minimize)
		or target:IsDescendantOf(Close)
end

Connect(TitleBar.InputBegan, function(input)
	if input.UserInputType ~= Enum.UserInputType.MouseButton1
		and input.UserInputType ~= Enum.UserInputType.Touch then
		return
	end

	if IsWindowButton(input) then
		return
	end

	if Minimized then
		return
	end

	Dragging = true
	DragStart = input.Position
	StartPosition = Main.Position
end)

Connect(UserInputService.InputChanged, function(input)
	if not Dragging then
		return
	end

	if input.UserInputType ~= Enum.UserInputType.MouseMovement
		and input.UserInputType ~= Enum.UserInputType.Touch then
		return
	end

	local delta = input.Position - DragStart

	Main.Position = UDim2.new(
		StartPosition.X.Scale,
		StartPosition.X.Offset + delta.X,
		StartPosition.Y.Scale,
		StartPosition.Y.Offset + delta.Y
	)
end)

Connect(UserInputService.InputEnded, function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then
		Dragging = false
	end
end)

-- =========================================================
-- KEYBOARD SHORTCUTS
-- =========================================================

Connect(UserInputService.InputBegan, function(input, gameProcessed)
	if gameProcessed then
		return
	end

	if input.KeyCode == Enum.KeyCode.RightShift then
		SetMinimized(not Minimized)
	end

	if input.KeyCode == Enum.KeyCode.Escape and not Minimized then
		SetMinimized(true)
	end
end)

-- =========================================================
-- CHARACTER RESPAWN HANDLING
-- =========================================================

Connect(Player.CharacterAdded, function(character)
	local humanoid = character:WaitForChild("Humanoid", 5)

	if not humanoid then
		return
	end

	task.wait()

	humanoid.WalkSpeed = DEFAULTS.WalkSpeed
	humanoid.UseJumpPower = true
	humanoid.JumpPower = DEFAULTS.JumpPower
end)

-- =========================================================
-- INITIAL STATE
-- =========================================================

TitleBottom.Visible = false
Body.Visible = false
Main.Size = UDim2.fromOffset(620, 0)

-- =========================================================
-- OPEN ANIMATION
-- =========================================================

WindowTween = Tween(Main, Animations.Open, {
	Size = NormalSize
})

task.delay(0.36, function()
	if not Main or not Main.Parent or Closing then
		return
	end

	TitleBottom.Visible = true
	Body.Visible = true
end)

task.delay(0.42, function()
	if not Main or not Main.Parent or Closing then
		return
	end

	Main.Size = NormalSize
	TitleBottom.Visible = true
	Body.Visible = true
	WindowTween = nil
end)
