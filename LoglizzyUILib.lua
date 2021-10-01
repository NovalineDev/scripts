--[[
This was not made by me!! this is just a backup of https://raw.githubusercontent.com/loglizzy/lib/main/main.lua
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

local library = {}

function library:Window(title)
	local window = {}

	local ScreenGui = Instance.new("ScreenGui")
	local ImageLabel = Instance.new("ImageLabel")
	local Frame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Frame_2 = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local Frame_3 = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")
	local fiber_manual_record = Instance.new("ImageButton")
	local Sample = Instance.new("ImageLabel")
	local Frame_4 = Instance.new("Frame")
	local UIGradient = Instance.new("UIGradient")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local Frame_5 = Instance.new("Frame")

	ImageLabel.Parent = ScreenGui
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.BorderColor3 = Color3.fromRGB(27, 42, 53)
	ImageLabel.Position = UDim2.new(0.380452335, 0, 0.192307696, 0)
	ImageLabel.Size = UDim2.new(0, 284, 0, 346)
	ImageLabel.Image = "rbxassetid://222785823"
	ImageLabel.ImageColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.Parent = ScreenGui

	Frame.Parent = ImageLabel
	Frame.BackgroundColor3 = Color3.fromRGB(39, 39, 39)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.0329358876, 0, 0.0282927752, 0)
	Frame.Size = UDim2.new(0, 264, 0, 326)

	UICorner.Parent = Frame

	Frame_2.Parent = Frame
	Frame_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Frame_2.BorderSizePixel = 0
	Frame_2.Size = UDim2.new(0, 264, 0, 33)

	UICorner_2.Parent = Frame_2

	Frame_3.Parent = Frame_2
	Frame_3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Frame_3.BorderSizePixel = 0
	Frame_3.Position = UDim2.new(0.00304135401, 0, 0.361861706, 0)
	Frame_3.Size = UDim2.new(0, 263, 0, 21)

	TextLabel.Parent = Frame_2
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.Position = UDim2.new(0.174904943, 0, 0.212121218, 0)
	TextLabel.Size = UDim2.new(0, 169, 0, 18)
	TextLabel.Font = Enum.Font.GothamSemibold
	TextLabel.Text = title
	TextLabel.TextColor3 = Color3.fromRGB(176, 176, 176)
	TextLabel.TextSize = 13.000

	fiber_manual_record.Name = "fiber_manual_record"
	fiber_manual_record.Parent = Frame_2
	fiber_manual_record.BackgroundTransparency = 1.000
	fiber_manual_record.LayoutOrder = 17
	fiber_manual_record.Position = UDim2.new(0.89733845, 0, 0.181818187, 0)
	fiber_manual_record.Size = UDim2.new(0, 20, 0, 20)
	fiber_manual_record.ZIndex = 2
	fiber_manual_record.Image = "rbxassetid://3926305904"
	fiber_manual_record.ImageColor3 = Color3.fromRGB(255, 183, 0)
	fiber_manual_record.ImageRectOffset = Vector2.new(204, 484)
	fiber_manual_record.ImageRectSize = Vector2.new(36, 36)

	Sample.Name = "Sample"
	Sample.Parent = ScreenGui
	Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Sample.BackgroundTransparency = 1.000
	Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
	Sample.ImageTransparency = 0.600

	Frame_4.Parent = Frame
	Frame_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame_4.BorderSizePixel = 0
	Frame_4.Position = UDim2.new(0, 0, 0.0992724672, 0)
	Frame_4.Size = UDim2.new(0, 262, 0, 8)

	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(35, 35, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(39, 39, 39))}
	UIGradient.Rotation = 90
	UIGradient.Parent = Frame_4

	ScrollingFrame.Parent = Frame
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.BackgroundTransparency = 1.000
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Position = UDim2.new(0.0303030312, 0, 0.122699387, 0)
	ScrollingFrame.Selectable = false
	ScrollingFrame.Size = UDim2.new(0, 248, 0, 279)
	ScrollingFrame.ScrollBarThickness = 4

	UIListLayout.Parent = ScrollingFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	ScrollingFrame.ChildAdded:Connect(function()
		local ab = UIListLayout.AbsoluteContentSize
		ScrollingFrame.CanvasSize = UDim2.new(0,0,0,ab.Y)
	end)
	
	local UserInputService = game:GetService("UserInputService")

	local gui = Frame.Parent

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	function window:Toggle(text, callback)
		local Frame_5 = Instance.new("Frame")
		local TextLabel_2 = Instance.new("TextLabel")
		local checked = Instance.new("ImageButton")
		local Sample_2 = Instance.new("ImageLabel")
		local unchecked = Instance.new("ImageButton")
		local Sample_3 = Instance.new("ImageLabel")
		local Frame_6 = Instance.new("Frame")

		Frame_5.Parent = ScrollingFrame
		Frame_5.BackgroundColor3 = Color3.fromRGB(157, 144, 111)
		Frame_5.BackgroundTransparency = 1.000
		Frame_5.Size = UDim2.new(0, 239, 0, 30)

		TextLabel_2.Parent = Frame_5
		TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_2.BackgroundTransparency = 1.000
		TextLabel_2.Position = UDim2.new(0.0368297361, 0, 0.178787738, 0)
		TextLabel_2.Size = UDim2.new(0, 189, 0, 18)
		TextLabel_2.Font = Enum.Font.GothamSemibold
		TextLabel_2.Text = text
		TextLabel_2.TextColor3 = Color3.fromRGB(176, 176, 176)
		TextLabel_2.TextSize = 13.000
		TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

		checked.Name = "checked"
		checked.Parent = Frame_5
		checked.BackgroundTransparency = 1.000
		checked.Position = UDim2.new(0.916318059, 0, 0.13333334, 0)
		checked.Size = UDim2.new(0, 20, 0, 20)
		checked.ZIndex = 2
		checked.Image = "rbxassetid://3926309567"
		checked.ImageColor3 = Color3.fromRGB(189, 189, 189)
		checked.ImageRectOffset = Vector2.new(784, 420)
		checked.ImageRectSize = Vector2.new(48, 48)
		checked.ImageTransparency = 1.000

		Sample_2.Name = "Sample"
		Sample_2.Parent = ScreenGui
		Sample_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Sample_2.BackgroundTransparency = 1.000
		Sample_2.Image = "http://www.roblox.com/asset/?id=4560909609"
		Sample_2.ImageTransparency = 0.600

		unchecked.Name = "unchecked"
		unchecked.Parent = Frame_5
		unchecked.BackgroundTransparency = 1.000
		unchecked.Position = UDim2.new(0.916317999, 0, 0.13333334, 0)
		unchecked.Size = UDim2.new(0, 20, 0, 20)
		unchecked.ZIndex = 2
		unchecked.Image = "rbxassetid://3926309567"
		unchecked.ImageColor3 = Color3.fromRGB(189, 189, 189)
		unchecked.ImageRectOffset = Vector2.new(628, 420)
		unchecked.ImageRectSize = Vector2.new(48, 48)

		Sample_3.Name = "Sample"
		Sample_3.Parent = ScreenGui
		Sample_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Sample_3.BackgroundTransparency = 1.000
		Sample_3.Image = "http://www.roblox.com/asset/?id=4560909609"
		Sample_3.ImageTransparency = 0.600

		local ms = game.Players.LocalPlayer:GetMouse()
		local btn = fiber_manual_record


		btn.MouseButton1Click:Connect(function()
			local c = Sample:Clone()
			c.Parent = btn
			local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
			c.Position = UDim2.new(0, x, 0, y)
			local len, size = 0.35, nil
			if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
				size = (btn.AbsoluteSize.X * 1.5)
			else
				size = (btn.AbsoluteSize.Y * 1.5)
			end
			c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
			for i = 1, 10 do
				c.ImageTransparency = c.ImageTransparency + 0.05
				wait(len / 12)
			end
			c:Destroy()
		end)

		local frame = Frame_5
		local enabled = false

		function turn()
			enabled = not enabled
			callback(enabled)

			if enabled then
				while enabled and checked.ImageTransparency > 0 and wait() do
					checked.ImageTransparency = checked.ImageTransparency - 0.2
				end
			else
				while not enabled and checked.ImageTransparency < 1 and wait() do
					checked.ImageTransparency = checked.ImageTransparency + 0.2
				end
			end
		end

		checked.MouseButton1Click:Connect(turn)
		unchecked.MouseButton1Click:Connect(turn)

		local ms = game.Players.LocalPlayer:GetMouse()

		local btn = checked


		btn.MouseButton1Click:Connect(function()
			local c = Sample:Clone()
			c.Parent = btn
			local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
			c.Position = UDim2.new(0, x, 0, y)
			local len, size = 0.35, nil
			if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
				size = (btn.AbsoluteSize.X * 1.5)
			else
				size = (btn.AbsoluteSize.Y * 1.5)
			end
			c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
			for i = 1, 10 do
				c.ImageTransparency = c.ImageTransparency + 0.05
				wait(len / 12)
			end
			c:Destroy()
		end)

		local ms = game.Players.LocalPlayer:GetMouse()

		local btn = unchecked


		btn.MouseButton1Click:Connect(function()
			local c = Sample:Clone()
			c.Parent = btn
			local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
			c.Position = UDim2.new(0, x, 0, y)
			local len, size = 0.35, nil
			if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
				size = (btn.AbsoluteSize.X * 1.5)
			else
				size = (btn.AbsoluteSize.Y * 1.5)
			end
			c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out', 'Quad', len, true, nil)
			for i = 1, 10 do
				c.ImageTransparency = c.ImageTransparency + 0.05
				wait(len / 12)
			end
			c:Destroy()
		end)
	end

	function window:Slider(text, options, callback)
		local Frame_6 = Instance.new("Frame")
		local TextLabel_3 = Instance.new("TextLabel")
		local TextButton = Instance.new("TextButton")
		local Frame_7 = Instance.new("Frame")
		local UICorner_3 = Instance.new("UICorner")
		local bar = Instance.new("Frame")
		local UICorner_4 = Instance.new("UICorner")
		local UICorner_5 = Instance.new("UICorner")
		local amount = Instance.new("TextLabel")

		Frame_6.Parent = ScrollingFrame
		Frame_6.BackgroundColor3 = Color3.fromRGB(111, 102, 78)
		Frame_6.BackgroundTransparency = 1.000
		Frame_6.BorderColor3 = Color3.fromRGB(27, 42, 53)
		Frame_6.Position = UDim2.new(0, 0, 0.430107534, 0)
		Frame_6.Size = UDim2.new(0, 239, 0, 50)

		TextLabel_3.Parent = Frame_6
		TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel_3.BackgroundTransparency = 1.000
		TextLabel_3.Position = UDim2.new(0.0368297361, 0, 0.135309443, 0)
		TextLabel_3.Size = UDim2.new(0, 159, 0, 15)
		TextLabel_3.Font = Enum.Font.GothamSemibold
		TextLabel_3.Text = text
		TextLabel_3.TextColor3 = Color3.fromRGB(176, 176, 176)
		TextLabel_3.TextSize = 13.000
		TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

		TextButton.Parent = Frame_6
		TextButton.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
		TextButton.Position = UDim2.new(0.0227645803, 0, 0.559468389, 0)
		TextButton.Size = UDim2.new(0, 233, 0, 16)
		TextButton.AutoButtonColor = false
		TextButton.Font = Enum.Font.SourceSans
		TextButton.Text = ""
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextSize = 14.000

		Frame_7.Parent = TextButton
		Frame_7.BackgroundColor3 = Color3.fromRGB(71, 71, 71)
		Frame_7.Position = UDim2.new(0.0167364683, 0, 0.195085526, 0)
		Frame_7.Size = UDim2.new(0, 226, 0, 9)

		UICorner_3.Parent = Frame_7

		bar.Name = "bar"
		bar.Parent = Frame_7
		bar.BackgroundColor3 = Color3.fromRGB(135, 135, 135)
		bar.BorderColor3 = Color3.fromRGB(27, 42, 53)
		bar.BorderSizePixel = 0
		bar.Size = UDim2.new(0, 36, 0, 9)

		UICorner_4.Parent = bar

		UICorner_5.Parent = TextButton

		amount.Name = "amount"
		amount.Parent = Frame_6
		amount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		amount.BackgroundTransparency = 1.000
		amount.Position = UDim2.new(0.748126805, 0, 0.135309443, 0)
		amount.Size = UDim2.new(0, 56, 0, 15)
		amount.Font = Enum.Font.GothamSemibold
		amount.Text = "16"
		amount.TextColor3 = Color3.fromRGB(176, 176, 176)
		amount.TextSize = 14.000
		amount.TextXAlignment = Enum.TextXAlignment.Right

		local pr = TextButton
		local hold = false
		local bar = pr.Frame.bar
		local amt = pr.Parent.amount
		local max = options.max
		local default = options.def or options.default

		local plr = game.Players.LocalPlayer
		local ms = plr:GetMouse()
		local rlpos
		local rlsiz
		local ap = Vector2.new(pr.AbsolutePosition.X, pr.AbsolutePosition.Y)
		local as = Vector2.new(pr.AbsoluteSize.X, pr.AbsoluteSize.Y)

		amt.Text = tostring(default)
		bar.Size = UDim2.new(0, (226/max)*default, 0, 9)

		pr.MouseButton1Down:Connect(function()
			hold = true
		end)

		game:GetService('UserInputService').InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				hold = false
			end
		end)

		game:GetService('RunService').RenderStepped:Connect(function()
			if hold then
				ap = Vector2.new(pr.AbsolutePosition.X, pr.AbsolutePosition.Y)
				as = Vector2.new(pr.AbsoluteSize.X, pr.AbsoluteSize.Y)

				rlpos = (ms.X-ap.X)
				rlsiz = (ms.X-ap.X)
				local result = math.floor(max * (rlsiz / 226))
				if rlpos > 226 then
					result = max
				elseif rlpos < 0 then
					result = 0
				end

				if rlsiz <= 226 and rlsiz >= 0 then
					amt.Text = tostring(result)
					bar.Size = UDim2.new(0, rlsiz, 0, 9)
					bar.Visible = true
					callback(result)
				end
				if rlsiz <= 0 then
					amt.Text = tostring(0)
					bar.Size = UDim2.new(0, 0, 0, 9)
					bar.Visible = false
					callback(0)
				end
				if rlsiz >= 226 then
					amt.Text = tostring(max)
					bar.Size = UDim2.new(0, 226, 0, 9)
					bar.Visible = true
					callback(max)
				end
				
			end
		end)
	end

	pcall(function()
  		syn.protect_gui(ScreenGui) -- Synapse function makes the ui object undetectable for any non synapse script
	end)
	ScreenGui.Parent = CoreGui
	return window
end

return library
