local NihonFpsCounter = Instance.new("ScreenGui")
local FpsCountFrame = Instance.new("Frame")
local FpsCount = Instance.new("TextLabel")

NihonFpsCounter.Name = "NihonFpsCounter"
NihonFpsCounter.Parent = game.CoreGui
NihonFpsCounter.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

FpsCountFrame.Name = "FpsCountFrame"
FpsCountFrame.Parent = NihonFpsCounter
FpsCountFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FpsCountFrame.Size = UDim2.new(0, 80, 0, 40)
FpsCountFrame.Style = Enum.FrameStyle.DropShadow

FpsCount.Name = "FpsCount"
FpsCount.Parent = FpsCountFrame
FpsCount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FpsCount.BackgroundTransparency = 1.000
FpsCount.Position = UDim2.new(-0.125, 0, -0.300000012, 0)
FpsCount.Size = UDim2.new(0, 80, 0, 40)
FpsCount.Font = Enum.Font.GothamBold
FpsCount.Text = "Fps : 30"
FpsCount.TextColor3 = Color3.fromRGB(255, 255, 255)
FpsCount.TextSize = 14.000

local function YTBZGMM_fake_script() 
	local script = Instance.new('LocalScript', FpsCount)

	local FPS = 0;
	game:GetService("RunService").Heartbeat:Connect(function(SPF)
		FPS = 1/SPF
		script.Parent.Text = string.format("Fps : %i", FPS)
	end)
end
coroutine.wrap(YTBZGMM_fake_script)()
