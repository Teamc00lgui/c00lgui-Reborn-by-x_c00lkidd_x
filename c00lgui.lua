-- =========================================================
-- c00lgui Reborn by x_c00lkidd_x
-- =========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- =========================================================
-- CONTAINER
-- =========================================================

local TargetContainer = CoreGui

local success = pcall(function()
	local test = Instance.new("Folder")
	test.Parent = CoreGui
	test:Destroy()
end)

if not success then
	TargetContainer = PlayerGui
end

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
	White = Color3.fromRGB(245, 245, 245),
	Grey = Color3.fromRGB(125, 125, 125),
	Stroke = Color3.fromRGB(45, 45, 45)
}

local Animations = {
	-- General UI movement
	Fast = TweenInfo.new(
		0.18,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	),

	-- Buttons and small UI elements
	Button = TweenInfo.new(
		0.20,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	),

	-- Medium UI transitions
	Normal = TweenInfo.new(
		0.28,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	),

	-- Smooth larger transitions
	Smooth = TweenInfo.new(
		0.35,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	),

	-- Tab leaving animation
	TabOut = TweenInfo.new(
		0.24,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.InOut
	),

	-- Tab entering animation
	TabIn = TweenInfo.new(
		0.38,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	),

	-- Slider movement
	Slider = TweenInfo.new(
		0.16,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	),

	-- Window open animation
	Open = TweenInfo.new(
		0.42,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.Out
	)
}

-- =========================================================
-- CLEANUP
-- =========================================================

local OldGui = TargetContainer:FindFirstChild(GUI_NAME)
	or PlayerGui:FindFirstChild(GUI_NAME)

if OldGui then
	OldGui:Destroy()
end

-- =========================================================
-- HELPERS
-- =========================================================

local function Tween(instance, info, properties)
	return TweenService:Create(instance, info, properties)
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

-- =========================================================
-- SCREEN GUI
-- =========================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = GUI_NAME
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = TargetContainer

-- =========================================================
-- MAIN WINDOW
-- =========================================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(620, 430)
Main.Position = UDim2.new(0.5, -310, 0.5, -215)
Main.BackgroundColor3 = Theme.Background
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = Gui

Corner(Main, 14)

local MainStroke = Stroke(Main, Theme.Red, 2)
MainStroke.Transparency = 0.1

-- =========================================================
-- TITLE BAR
-- =========================================================

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 44)
TitleBar.BackgroundColor3 = Theme.Red
TitleBar.BorderSizePixel = 0
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
Title.Size = UDim2.new(1, -110, 1, 0)
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
-- PAGES
-- =========================================================

local Pages = {}
local Tabs = {}
local CurrentPage
local TabTransitionId = 0

local function CreatePage(name)
	local page = Instance.new("ScrollingFrame")
	page.Name = name
	page.Size = UDim2.new(1, 0, 1, 0)
	page.Position = UDim2.fromScale(0, 0)
	page.BackgroundColor3 = Theme.Panel
	page.BorderSizePixel = 0
	page.ScrollBarThickness = 3
	page.ScrollBarImageColor3 = Theme.Red
	page.AutomaticCanvasSize = Enum.AutomaticSize.Y
	page.CanvasSize = UDim2.new()
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

	button.MouseEnter:Connect(function()
		Tween(button, Animations.Button, {
			BackgroundColor3 = Color3.fromRGB(35, 8, 8)
		}):Play()

		Tween(buttonStroke, Animations.Button, {
			Color = Theme.Red,
			Thickness = 1.2
		}):Play()
	end)

	button.MouseLeave:Connect(function()
		Tween(button, Animations.Button, {
			BackgroundColor3 = Theme.Panel2,
			Size = normalSize
		}):Play()

		Tween(buttonStroke, Animations.Button, {
			Color = Theme.Stroke,
			Thickness = 1
		}):Play()
	end)

	button.MouseButton1Down:Connect(function()
		Tween(button, Animations.Fast, {
			Size = pressedSize
		}):Play()
	end)

	button.MouseButton1Up:Connect(function()
		Tween(button, Animations.Button, {
			Size = normalSize
		}):Play()
	end)

	button.MouseButton1Click:Connect(function()
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
	bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	bar.BorderSizePixel = 0
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
	knob.BackgroundColor3 = Theme.White
	knob.BorderSizePixel = 0
	knob.Parent = bar

	Corner(knob, 20)

	local dragging = false

	local function setValue(value, instant)
		value = math.clamp(value, minimum, maximum)
		value = math.floor(value + 0.5)

		local alpha = (value - minimum) / (maximum - minimum)

		valueLabel.Text = tostring(value)

		local tweenInfo = instant
			and TweenInfo.new(0)
			or Animations.Slider

		Tween(fill, tweenInfo, {
			Size = UDim2.new(alpha, 0, 1, 0)
		}):Play()

		Tween(knob, tweenInfo, {
			Position = UDim2.new(alpha, 0, 0.5, 0)
		}):Play()

		if callback then
			callback(value)
		end
	end

	local function updateFromMouse(x)
		local alpha = math.clamp(
			(x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X,
			0,
			1
		)

		setValue(
			minimum + ((maximum - minimum) * alpha),
			false
		)
	end

	bar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then

			dragging = true

			Tween(containerStroke, Animations.Fast, {
				Color = Theme.DarkRed
			}):Play()

			updateFromMouse(input.Position.X)
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if not dragging then
			return
		end

		if input.UserInputType == Enum.UserInputType.MouseMovement
			or input.UserInputType == Enum.UserInputType.Touch then

			updateFromMouse(input.Position.X)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then

			if dragging then
				Tween(containerStroke, Animations.Normal, {
					Color = Theme.Stroke
				}):Play()
			end

			dragging = false
		end
	end)

	setValue(default, true)

	return container
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
	"Local character controls. Changes are made through Roblox's normal client APIs."
)

AddSlider(
	PlayerPage,
	"WalkSpeed",
	0,
	200,
	16,
	function(value)
		local character = Player.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if humanoid then
			humanoid.WalkSpeed = value
		end
	end
)

AddSlider(
	PlayerPage,
	"JumpPower",
	0,
	250,
	50,
	function(value)
		local character = Player.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if humanoid then
			humanoid.UseJumpPower = true
			humanoid.JumpPower = value
		end
	end
)

AddSlider(
	PlayerPage,
	"Field Of View",
	40,
	120,
	70,
	function(value)
		local camera = workspace.CurrentCamera

		if camera then
			camera.FieldOfView = value
		end
	end
)

AddButton(
	PlayerPage,
	"RESET PLAYER",
	function()
		local character = Player.Character
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")

		if humanoid then
			humanoid.WalkSpeed = 16
			humanoid.UseJumpPower = true
			humanoid.JumpPower = 50
		end

		local camera = workspace.CurrentCamera

		if camera then
			Tween(camera, Animations.Smooth, {
				FieldOfView = 70
			}):Play()
		end
	end
)

-- =========================================================
-- VISUALS PAGE
-- =========================================================

AddHeader(VisualsPage, "VISUALS")

AddDescription(
	VisualsPage,
	"Client-side visual controls for the local experience."
)

AddButton(
	VisualsPage,
	"RED ACCENT",
	function()
		Tween(MainStroke, Animations.Normal, {
			Color = Theme.Red
		}):Play()
	end
)

AddButton(
	VisualsPage,
	"FLASH BORDER",
	function()
		Tween(MainStroke, Animations.Fast, {
			Color = Theme.White,
			Thickness = 4
		}):Play()

		task.delay(0.16, function()
			if MainStroke and MainStroke.Parent then
				Tween(MainStroke, Animations.Smooth, {
					Color = Theme.Red,
					Thickness = 2
				}):Play()
			end
		end)
	end
)

AddButton(
	VisualsPage,
	"RESET CAMERA",
	function()
		local camera = workspace.CurrentCamera

		if camera then
			Tween(camera, Animations.Smooth, {
				FieldOfView = 70
			}):Play()
		end
	end
)

-- =========================================================
-- SETTINGS PAGE
-- =========================================================

AddHeader(SettingsPage, "SETTINGS")

AddDescription(
	SettingsPage,
	"Interface and window controls."
)

AddButton(
	SettingsPage,
	"RESET WINDOW POSITION",
	function()
		Tween(Main, Animations.Smooth, {
			Position = UDim2.new(0.5, -310, 0.5, -215)
		}):Play()
	end
)

AddButton(
	SettingsPage,
	"REDUCE BORDER",
	function()
		Tween(MainStroke, Animations.Normal, {
			Thickness = 1
		}):Play()
	end
)

AddButton(
	SettingsPage,
	"RESTORE BORDER",
	function()
		Tween(MainStroke, Animations.Normal, {
			Thickness = 2
		}):Play()
	end
)

-- =========================================================
-- ABOUT PAGE
-- =========================================================

AddHeader(AboutPage, "ABOUT")

AddDescription(
	AboutPage,
	"c00lgui Reborn\n\nA custom single-script Roblox interface inspired by classic GUI designs.\n\nFE note: a normal LocalScript cannot bypass Roblox's client/server security model. Server-authoritative actions require server-side code."
)

AddButton(
	AboutPage,
	"CLOSE GUI",
	function()
		Tween(Main, Animations.Smooth, {
			Size = UDim2.fromOffset(620, 0)
		}):Play()

		task.delay(0.4, function()
			if Gui and Gui.Parent then
				Gui:Destroy()
			end
		end)
	end
)

-- =========================================================
-- TAB SYSTEM
-- =========================================================

local function UpdateTabVisuals(selectedName)
	for tabName, button in pairs(Tabs) do
		local selected = tabName == selectedName

		Tween(button, Animations.Normal, {
			BackgroundColor3 = selected
				and Theme.DarkRed
				or Theme.Panel2,

			TextColor3 = selected
				and Theme.White
				or Theme.Grey
		}):Play()
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

	-- =====================================================
	-- OLD PAGE
	-- =====================================================

	if oldPage then
		oldPage.Visible = true

		Tween(oldPage, Animations.TabOut, {
			Position = UDim2.new(-0.08, 0, 0, 0)
		}):Play()

		task.delay(0.24, function()
			if transitionId ~= TabTransitionId then
				return
			end

			if oldPage and oldPage.Parent then
				oldPage.Visible = false
				oldPage.Position = UDim2.fromScale(0, 0)
			end
		end)
	end

	-- =====================================================
	-- NEW PAGE
	-- =====================================================

	newPage.Visible = true
	newPage.Position = UDim2.new(0.08, 0, 0, 0)

	task.defer(function()
		if transitionId ~= TabTransitionId then
			return
		end

		Tween(newPage, Animations.TabIn, {
			Position = UDim2.fromScale(0, 0)
		}):Play()
	end)

	CurrentPage = newPage
end

local function AddTab(name)
	local button = Instance.new("TextButton")
	button.Name = name
	button.Size = UDim2.new(1, 0, 0, 40)
	button.BackgroundColor3 = Theme.Panel2
	button.BorderSizePixel = 0
	button.Text = name
	button.TextColor3 = Theme.Grey
	button.TextSize = 13
	button.Font = Enum.Font.Code
	button.AutoButtonColor = false
	button.Parent = Sidebar

	Corner(button, 8)

	local buttonStroke = Stroke(button, Theme.Stroke, 1)

	local normalSize = UDim2.new(1, 0, 0, 40)
	local pressedSize = UDim2.new(1, -4, 0, 38)

	button.MouseEnter:Connect(function()
		if CurrentPage ~= Pages[name] then
			Tween(button, Animations.Button, {
				BackgroundColor3 = Color3.fromRGB(30, 8, 8)
			}):Play()

			Tween(buttonStroke, Animations.Button, {
				Color = Theme.DarkRed,
				Thickness = 1.2
			}):Play()
		end
	end)

	button.MouseLeave:Connect(function()
		if CurrentPage ~= Pages[name] then
			Tween(button, Animations.Button, {
				BackgroundColor3 = Theme.Panel2,
				Size = normalSize
			}):Play()

			Tween(buttonStroke, Animations.Button, {
				Color = Theme.Stroke,
				Thickness = 1
			}):Play()
		end
	end)

	button.MouseButton1Down:Connect(function()
		Tween(button, Animations.Fast, {
			Size = pressedSize
		}):Play()
	end)

	button.MouseButton1Up:Connect(function()
		Tween(button, Animations.Button, {
			Size = normalSize
		}):Play()
	end)

	button.MouseButton1Click:Connect(function()
		SelectTab(name)
	end)

	Tabs[name] = button
end

AddTab("PLAYER")
AddTab("VISUALS")
AddTab("SETTINGS")
AddTab("ABOUT")

-- =========================================================
-- INITIAL PAGE
-- =========================================================

CurrentPage = nil
SelectTab("PLAYER")

-- =========================================================
-- MINIMIZE
-- =========================================================

local Minimized = false
local NormalSize = UDim2.fromOffset(620, 430)
local MinimizedSize = UDim2.fromOffset(620, 44)
local WindowTween

local function StopWindowTween()
	if WindowTween then
		WindowTween:Cancel()
		WindowTween = nil
	end
end

local function SetMinimized(state)
	Minimized = state

	StopWindowTween()

	if state then
		Body.Visible = false

		Minimize.Text = "+"

		WindowTween = Tween(
			Main,
			Animations.Smooth,
			{
				Size = MinimizedSize
			}
		)

		WindowTween:Play()

	else
		Minimize.Text = "—"
		Body.Visible = false

		WindowTween = Tween(
			Main,
			Animations.Smooth,
			{
				Size = NormalSize
			}
		)

		WindowTween:Play()

		task.delay(0.36, function()
			if not Main or not Main.Parent then
				return
			end

			if not Minimized then
				Main.Size = NormalSize
				Body.Visible = true
			end
		end)
	end
end

Minimize.MouseButton1Click:Connect(function()
	SetMinimized(not Minimized)
end)

-- =========================================================
-- CLOSE
-- =========================================================

Close.MouseButton1Click:Connect(function()
	StopWindowTween()

	Body.Visible = false

	local closeTween = Tween(
		Main,
		Animations.Smooth,
		{
			Size = UDim2.fromOffset(620, 0)
		}
	)

	closeTween:Play()

	task.delay(0.4, function()
		if Gui and Gui.Parent then
			Gui:Destroy()
		end
	end)
end)

-- =========================================================
-- WINDOW BUTTON ANIMATIONS
-- =========================================================

for _, button in ipairs({Minimize, Close}) do
	button.MouseEnter:Connect(function()
		Tween(button, Animations.Button, {
			BackgroundColor3 = Color3.fromRGB(220, 0, 0)
		}):Play()
	end)

	button.MouseLeave:Connect(function()
		Tween(button, Animations.Button, {
			BackgroundColor3 = Theme.DarkRed
		}):Play()
	end)

	button.MouseButton1Down:Connect(function()
		Tween(button, Animations.Fast, {
			Size = UDim2.fromOffset(30, 28)
		}):Play()
	end)

	button.MouseButton1Up:Connect(function()
		Tween(button, Animations.Button, {
			Size = UDim2.fromOffset(32, 30)
		}):Play()
	end)
end

-- =========================================================
-- DRAG SYSTEM
-- =========================================================

local dragging = false
local dragStart
local startPosition

TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		dragStart = input.Position
		startPosition = Main.Position
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

	Main.Position = UDim2.new(
		startPosition.X.Scale,
		startPosition.X.Offset + delta.X,
		startPosition.Y.Scale,
		startPosition.Y.Offset + delta.Y
	)
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
		or input.UserInputType == Enum.UserInputType.Touch then

		dragging = false
	end
end)

-- =========================================================
-- OPEN ANIMATION
-- =========================================================

Main.Size = UDim2.fromOffset(620, 0)

Tween(Main, Animations.Open, {
	Size = NormalSize
}):Play()
