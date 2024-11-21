local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local gui = Instance.new("ScreenGui")
gui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 300)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -10, 1, -10)
scrollFrame.Position = UDim2.new(0, 5, 0, 5)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 6
scrollFrame.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.Parent = scrollFrame
listLayout.Padding = UDim.new(0, 5)

local functions = {
    {name="", func=function() Character.Humanoid:ChangeState(Enum.HumanoidStateType.Flying) end},
    {name="", func=function() Character.Humanoid.WalkSpeed = 50 end},
    {name="", func=function() Character.Humanoid.JumpPower = 200 end},
    {name="", func=function() for _,v in pairs(Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end},
    {name="", func=function() Lighting.ClockTime = (Lighting.ClockTime == 14) and 0 or 14 end},
    {name="", func=function() LocalPlayer.Character.Humanoid.Health = 100 end},
    {name="", func=function() for _,v in pairs(workspace:GetDescendants()) do if v:IsA("VehicleSeat") then v.Disabled = false end end end},
    {name="", func=function() Character.Humanoid.UseJumpPower = not Character.Humanoid.UseJumpPower end},
    {name="", func=function() workspace.Gravity = workspace.Gravity == 196.2 and 0 or 196.2 end},
    {name="", func=function() Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, not Character.Humanoid:GetStateEnabled(Enum.HumanoidStateType.Seated)) end}
}

for i, func in ipairs(functions) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -10, 0, 30)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.Text = func.name
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Font = Enum.Font.SourceSans
    button.Parent = scrollFrame
    
    button.MouseButton1Click:Connect(function()
        func.func()
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        wait(0.1)
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end)
end

scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y)
