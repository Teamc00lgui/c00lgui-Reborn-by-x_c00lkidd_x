-- c00lgui Reborn by x_c00lkidd_x
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("c00lguiReborn") then
    CoreGui.c00lguiReborn:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "c00lguiReborn"
ScreenGui.ResetOnSpawn = false

pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 460, 0, 330)
MainFrame.Position = UDim2.new(0.5, -230, 0.5, -165)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(1, -30, 0, 30)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TitleLabel.BorderColor3 = Color3.fromRGB(255, 0, 0)
TitleLabel.BorderSizePixel = 1
TitleLabel.Text = "c00lgui Reborn by x_c00lkidd_x"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 16
TitleLabel.Font = Enum.Font.Bodoni
TitleLabel.Parent = MainFrame

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CloseBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.BorderSizePixel = 1
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.Bodoni
CloseBtn.TextSize = 16
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local TabBar = Instance.new("Frame")
TabBar.Name = "TabBar"
TabBar.Size = UDim2.new(1, -10, 0, 26)
TabBar.Position = UDim2.new(0, 5, 0, 35)
TabBar.BackgroundTransparency = 1
TabBar.Parent = MainFrame

local TabListLayout = Instance.new("UIListLayout")
TabListLayout.Parent = TabBar
TabListLayout.FillDirection = Enum.FillDirection.Horizontal
TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabListLayout.Padding = UDim.new(0, 4)

local ContentContainer = Instance.new("Frame")
ContentContainer.Name = "ContentContainer"
ContentContainer.Size = UDim2.new(1, -10, 1, -70)
ContentContainer.Position = UDim2.new(0, 5, 0, 65)
ContentContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ContentContainer.BorderColor3 = Color3.fromRGB(255, 0, 0)
ContentContainer.BorderSizePixel = 1
ContentContainer.Parent = MainFrame

local tabs = {}
local activeTab = nil

local function createTab(tabName)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = tabName .. "Tab"
    tabBtn.Size = UDim2.new(0, 105, 1, 0)
    tabBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    tabBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
    tabBtn.BorderSizePixel = 1
    tabBtn.Text = tabName
    tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabBtn.Font = Enum.Font.Bodoni
    tabBtn.TextSize = 14
    tabBtn.Parent = TabBar

    local tabFrame = Instance.new("ScrollingFrame")
    tabFrame.Name = tabName .. "Frame"
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.BorderSizePixel = 0
    tabFrame.Visible = false
    tabFrame.ScrollBarThickness = 5
    tabFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
    tabFrame.Parent = ContentContainer

    local gridLayout = Instance.new("UIGridLayout")
    gridLayout.Parent = tabFrame
    gridLayout.CellSize = UDim2.new(0, 140, 0, 28)
    gridLayout.CellPadding = UDim2.new(0, 5, 0, 5)
    gridLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local padding = Instance.new("UIPadding")
    padding.Parent = tabFrame
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingLeft = UDim.new(0, 5)

    local function activate()
        for name, data in pairs(tabs) do
            data.Frame.Visible = false
            data.Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            data.Button.TextColor3 = Color3.fromRGB(180, 180, 180)
        end
        tabFrame.Visible = true
        tabBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end

    tabBtn.MouseButton1Click:Connect(activate)

    tabs[tabName] = {
        Button = tabBtn,
        Frame = tabFrame,
        AddHeader = function(headerText)
            local headerLabel = Instance.new("TextLabel")
            headerLabel.Name = "Header_" .. headerText
            headerLabel.Size = UDim2.new(1, 0, 0, 28)
            headerLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            headerLabel.BorderColor3 = Color3.fromRGB(255, 0, 0)
            headerLabel.BorderSizePixel = 1
            headerLabel.Text = headerText
            headerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            headerLabel.Font = Enum.Font.SourceSansBold
            headerLabel.TextSize = 15
            headerLabel.Parent = tabFrame
        end,
        AddButton = function(btnText, callback)
            local scriptBtn = Instance.new("TextButton")
            scriptBtn.Name = btnText
            scriptBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            scriptBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
            scriptBtn.BorderSizePixel = 1
            scriptBtn.Text = btnText
            scriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            scriptBtn.Font = Enum.Font.Bodoni
            scriptBtn.TextSize = 14
            scriptBtn.Parent = tabFrame

            scriptBtn.MouseButton1Click:Connect(function()
                pcall(callback)
            end)
        end
    }

    if not activeTab then
        activeTab = tabName
        activate()
    end

    return tabs[tabName]
end

local weaponsTab = createTab("Weapons")
local gearTab = createTab("Gear/Tools")
local localTab = createTab("Local Player")

weaponsTab.AddHeader("Weapon Scripts")
weaponsTab.AddButton("Drage", function() print("Drage") end)
weaponsTab.AddButton("Dual Blades", function() print("Dual Blades") end)
weaponsTab.AddButton("Eyelaser", function() print("Eyelaser") end)
weaponsTab.AddButton("Knife", function() print("Knife") end)
weaponsTab.AddButton("Lance", function() print("Lance") end)
weaponsTab.AddButton("Lightsaber", function() print("Lightsaber") end)

gearTab.AddHeader("Gear/Tools")
gearTab.AddButton("Custom Gear", function() print("Custom Gear") end)
gearTab.AddButton("Stamper Tools", function() print("Stamper Tools") end)
gearTab.AddButton("Tool Stealer", function() print("Tool Stealer") end)

localTab.AddHeader("Player Mods")
localTab.AddButton("Speed 50", function()
    if game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
    end
end)
localTab.AddButton("Jump 100", function()
    if game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
    end
end)
