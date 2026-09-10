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
MainFrame.Size = UDim2.new(0, 450, 0, 320)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TitleLabel.BorderColor3 = Color3.fromRGB(255, 0, 0)
TitleLabel.BorderSizePixel = 1
TitleLabel.Text = "c00lgui Reborn by x_c00lkidd_x"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 14
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.Parent = MainFrame

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -30, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CloseBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.BorderSizePixel = 1
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 14
CloseBtn.Parent = MainFrame

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local TabBar = Instance.new("Frame")
TabBar.Name = "TabBar"
TabBar.Size = UDim2.new(1, -10, 0, 28)
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
ContentContainer.Size = UDim2.new(1, -10, 1, -73)
ContentContainer.Position = UDim2.new(0, 5, 0, 68)
ContentContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ContentContainer.BorderColor3 = Color3.fromRGB(255, 0, 0)
ContentContainer.BorderSizePixel = 1
ContentContainer.Parent = MainFrame

local tabs = {}
local activeTab = nil

local function createTab(tabName)
    local tabBtn = Instance.new("TextButton")
    tabBtn.Name = tabName .. "Tab"
    tabBtn.Size = UDim2.new(0, 100, 1, 0)
    tabBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    tabBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
    tabBtn.BorderSizePixel = 1
    tabBtn.Text = tabName
    tabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    tabBtn.Font = Enum.Font.SourceSansBold
    tabBtn.TextSize = 13
    tabBtn.Parent = TabBar

    local tabFrame = Instance.new("ScrollingFrame")
    tabFrame.Name = tabName .. "Frame"
    tabFrame.Size = UDim2.new(1, 0, 1, 0)
    tabFrame.BackgroundTransparency = 1
    tabFrame.BorderSizePixel = 0
    tabFrame.Visible = false
    tabFrame.ScrollBarThickness = 4
    tabFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 0, 0)
    tabFrame.Parent = ContentContainer

    local gridLayout = Instance.new("UIGridLayout")
    gridLayout.Parent = tabFrame
    gridLayout.CellSize = UDim2.new(0, 138, 0, 30)
    gridLayout.CellPadding = UDim2.new(0, 6, 0, 6)
    gridLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local padding = Instance.new("UIPadding")
    padding.Parent = tabFrame
    padding.PaddingTop = UDim.new(0, 6)
    padding.PaddingLeft = UDim.new(0, 6)

    local function activate()
        for name, data in pairs(tabs) do
            data.Frame.Visible = false
            data.Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            data.Button.TextColor3 = Color3.fromRGB(200, 200, 200)
        end
        tabFrame.Visible = true
        tabBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
        tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    end

    tabBtn.MouseButton1Click:Connect(activate)

    tabs[tabName] = {
        Button = tabBtn,
        Frame = tabFrame,
        AddButton = function(btnText, callback)
            local scriptBtn = Instance.new("TextButton")
            scriptBtn.Name = btnText
            scriptBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            scriptBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
            scriptBtn.BorderSizePixel = 1
            scriptBtn.Text = btnText
            scriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            scriptBtn.Font = Enum.Font.SourceSans
            scriptBtn.TextSize = 13
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

weaponsTab.AddButton("Drage", function() print("Executando Drage...") end)
weaponsTab.AddButton("Dual Blades", function() print("Executando Dual Blades...") end)
weaponsTab.AddButton("Eyelaser", function() print("Executando Eyelaser...") end)
weaponsTab.AddButton("Knife", function() print("Executando Knife...") end)
weaponsTab.AddButton("Lightsaber", function() print("Executando Lightsaber...") end)
weaponsTab.AddButton("God Laser", function() print("Executando God Laser...") end)

gearTab.AddButton("Custom Gear", function() print("Executando Custom Gear...") end)
gearTab.AddButton("Tool Stealer", function() print("Executando Tool Stealer...") end)
gearTab.AddButton("Stamper Tools", function() print("Executando Stamper Tools...") end)

localTab.AddButton("Speed 50", function()
    if game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
    end
end)
localTab.AddButton("JumpPower 100", function()
    if game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
    end
end)
