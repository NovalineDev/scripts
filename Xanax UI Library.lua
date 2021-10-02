--[[
EXAMPLE:
local XanaxUILib = loadstring(game:HttpGet("https://pastebin.com/raw/XZz3Ytbu"))()
local Ui = XanaxUILib:CreateWindow("Example UI")
local Info = Ui:CreateSection("Info")
local ExampleSection = Ui:CreateSection("Example")

Info:CreateLabel("Made by yeetus#3635")
Info:CreateLabel("This is a UI Library example")
Info:CreateButton("Destroy UI", function() XanaxUILib.functions:DestroyGUI() end)

ExampleSection:CreateLabel("This is label")
ExampleSection:CreateButton("This is button", function() print("This is function") end)
ExampleSection:CreateToggle("This is toggle", "This is flag", function(Toggled) print("This is optional argument", Toggled) end)
ExampleSection:CreateSlider("This is walkspeed slider", "WalkSpeed", 16, 100, false, function(ws)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ws
end)
]]--

local XanaxUILib = {}

XanaxUILib.flags = {}
XanaxUILib.flags.toggles = {}
XanaxUILib.flags.sliders = {}
XanaxUILib.functions = {}
XanaxUILib.currentTab = nil

local inputService = game:GetService("UserInputService")
local ts = game:GetService("TweenService")
local RunService = game:GetService("RunService")

function XanaxUILib.functions:DestroyGUI()
	if game.CoreGui:FindFirstChild("XanaxLib") then game.CoreGui.XanaxLib:Destroy() end
end
XanaxUILib.functions:DestroyGUI() 
function XanaxUILib.functions:Tween(Object, TweenData, Data)
	if TweenData == "Default" then TweenData = {Time = 0.1, Style = "Linear", Direction = "InOut"} end
	ts:Create(Object, TweenInfo.new(TweenData.Time, Enum.EasingStyle[TweenData.Style], Enum.EasingDirection[TweenData.Direction]), Data):Play()
end

-- Drag function by Poly --
function XanaxUILib.functions:Drag(frame,hold)
    if not hold then hold = frame end
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    hold.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    inputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

function XanaxUILib.functions:ChangeSection(NewSection)
	if XanaxUILib.currentTab == NewSection then return end
	if XanaxUILib.currentTab == nil then
		XanaxUILib.currentTab = NewSection
		XanaxUILib.currentTab.Visible = true
		return		
	end
	XanaxUILib.currentTab.Visible = false
	XanaxUILib.currentTab = NewSection
	NewSection.Visible = true
end

function XanaxUILib:CreateWindow(WindowText)
	local XanaxLib = Instance.new("ScreenGui")
	local Main = Instance.new("ImageButton")
	local TabBtns = Instance.new("ImageButton")
	local Line1 = Instance.new("Frame")
	local TabBtnHolder = Instance.new("ScrollingFrame")
	local TabBtnLayout = Instance.new("UIListLayout")
	local Top = Instance.new("ImageButton")
	local Line2 = Instance.new("Frame")
	local UiTitle = Instance.new("TextLabel")
	local TabTxt = Instance.new("TextLabel")
	local TabNameStatus = Instance.new("TextLabel")
	
	XanaxLib.Name = "XanaxLib"
	XanaxLib.Parent = game:GetService("CoreGui")

	Main.Name = "Main"
	Main.Parent = XanaxLib
	Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Main.BackgroundTransparency = 1.000
	Main.Position = UDim2.new(0.28542304, 0, 0.224669605, 0)
	Main.Size = UDim2.new(0, 421, 0, 250)
	Main.Image = "rbxassetid://2790382281"
	Main.ImageColor3 = Color3.fromRGB(52, 52, 52)
	Main.ScaleType = Enum.ScaleType.Slice
	Main.SliceCenter = Rect.new(4, 4, 252, 252)
	
	TabBtns.Name = "TabBtns"
	TabBtns.Parent = Main
	TabBtns.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabBtns.BackgroundTransparency = 1.000
	TabBtns.Size = UDim2.new(0, 120, 0, 250)
	TabBtns.Image = "rbxassetid://2790382281"
	TabBtns.ImageColor3 = Color3.fromRGB(43, 43, 43)
	TabBtns.ScaleType = Enum.ScaleType.Slice
	TabBtns.SliceCenter = Rect.new(4, 4, 252, 252)
	
	Line1.Name = "Line1"
	Line1.Parent = TabBtns
	Line1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Line1.BorderSizePixel = 0
	Line1.Position = UDim2.new(0.975000024, 0, 0.119999997, 0)
	Line1.Size = UDim2.new(0, 4, 0, 220)
	
	TabBtnHolder.Name = "TabBtnHolder"
	TabBtnHolder.Parent = TabBtns
	TabBtnHolder.Active = true
	TabBtnHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabBtnHolder.BackgroundTransparency = 1.000
	TabBtnHolder.BorderSizePixel = 0
	TabBtnHolder.Position = UDim2.new(0, 0, 0.195999995, 0)
	TabBtnHolder.Size = UDim2.new(0, 117, 0, 201)
	TabBtnHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
	TabBtnHolder.ScrollBarThickness = 3
	TabBtnHolder.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
	TabBtnHolder.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left

	TabBtnLayout.Name = "TabBtnLayout"
	TabBtnLayout.Parent = TabBtnHolder
	TabBtnLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	TabBtnLayout.SortOrder = Enum.SortOrder.LayoutOrder
	
	Top.Name = "Top"
	Top.Parent = Main
	Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Top.BackgroundTransparency = 1.000
	Top.Size = UDim2.new(0, 421, 0, 30)
	Top.Image = "rbxassetid://2790382281"
	Top.ImageColor3 = Color3.fromRGB(43, 43, 43)
	Top.ScaleType = Enum.ScaleType.Slice
	Top.SliceCenter = Rect.new(4, 4, 252, 252)
	
	Line2.Name = "Line2"
	Line2.Parent = Top
	Line2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Line2.BorderSizePixel = 0
	Line2.Position = UDim2.new(0.277909726, 0, 0.866666675, 0)
	Line2.Size = UDim2.new(0, 304, 0, 4)
	
	UiTitle.Name = "UiTitle"
	UiTitle.Parent = Top
	UiTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UiTitle.BackgroundTransparency = 1.000
	UiTitle.Size = UDim2.new(0, 421, 0, 26)
	UiTitle.Font = Enum.Font.GothamSemibold
	UiTitle.Text = "  " .. WindowText
	UiTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	UiTitle.TextSize = 14.000
	UiTitle.TextXAlignment = Enum.TextXAlignment.Left
	
	TabTxt.Name = "TabTxt"
	TabTxt.Parent = Top
	TabTxt.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabTxt.BackgroundTransparency = 1.000
	TabTxt.Position = UDim2.new(0, 0, 0.866666675, 0)
	TabTxt.Size = UDim2.new(0, 117, 0, 17)
	TabTxt.Font = Enum.Font.GothamSemibold
	TabTxt.Text = "-Tabs-"
	TabTxt.TextColor3 = Color3.fromRGB(255, 255, 255)
	TabTxt.TextSize = 14.000
	
	TabNameStatus.Name = "TabNameStatus"
	TabNameStatus.Parent = Top
	TabNameStatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabNameStatus.BackgroundTransparency = 1.000
	TabNameStatus.Position = UDim2.new(0.947743475, 0, 0, 0)
	TabNameStatus.Size = UDim2.new(0, 22, 0, 26)
	TabNameStatus.Font = Enum.Font.GothamSemibold
	TabNameStatus.Text = "no text set  "
	TabNameStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
	TabNameStatus.TextSize = 14.000
	TabNameStatus.TextXAlignment = Enum.TextXAlignment.Right
	XanaxUILib.functions:Drag(Main, UiTitle)
	local Sections = {}
	function Sections:CreateSection(SectionName)
		local TabMain = Instance.new("Frame")
		local ObjectHolder = Instance.new("ScrollingFrame")
		local objplacing = Instance.new("UIListLayout")
		local padding = Instance.new("UIPadding")
		local TabBtn = Instance.new("TextButton")
		local BotomLien = Instance.new("Frame")
		local TopLien = Instance.new("Frame")

		TabMain.Name = "TabMain"
		TabMain.Parent = Main
		TabMain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabMain.BackgroundTransparency = 1.000
		TabMain.BorderSizePixel = 0
		TabMain.Position = UDim2.new(0.287410915, 0, 0.119999997, 0)
		TabMain.Size = UDim2.new(0, 300, 0, 220)
		TabMain.Visible = false

		ObjectHolder.Name = "ObjectHolder"
		ObjectHolder.Parent = TabMain
		ObjectHolder.Active = true
		ObjectHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ObjectHolder.BackgroundTransparency = 1.000
		ObjectHolder.BorderSizePixel = 0
		ObjectHolder.Size = UDim2.new(0, 300, 0, 220)
		ObjectHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
		ObjectHolder.ScrollBarThickness = 3
		
		objplacing.Name = "objplacing"
		objplacing.Parent = ObjectHolder
		objplacing.HorizontalAlignment = Enum.HorizontalAlignment.Center
		objplacing.SortOrder = Enum.SortOrder.LayoutOrder
		
		padding.Name = "padding"
		padding.Parent = ObjectHolder
		padding.PaddingTop = UDim.new(0.0299999993, 0)
		
		TabBtn.Name = "TabBtn"
		TabBtn.Parent = TabBtnHolder
		TabBtn.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
		TabBtn.BorderSizePixel = 0
		TabBtn.Position = UDim2.new(0.055555556, 0, 0, 0)
		TabBtn.Size = UDim2.new(0, 104, 0, 27)
		TabBtn.AutoButtonColor = false
		TabBtn.Font = Enum.Font.SourceSans
		TabBtn.Text = SectionName
		TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabBtn.TextSize = 16.000
		
		BotomLien.Name = "BotomLien"
		BotomLien.Parent = TabBtn
		BotomLien.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
		BotomLien.BorderSizePixel = 0
		BotomLien.Position = UDim2.new(0, 0, 1, 0)
		BotomLien.Size = UDim2.new(1, 0, 0, 1)
		
		TopLien.Name = "TopLien"
		TopLien.Parent = TabBtn
		TopLien.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
		TopLien.BorderSizePixel = 0
		TopLien.Size = UDim2.new(1, 0, 0, 1)
		if XanaxUILib.currentTab == nil then
			XanaxUILib.functions:ChangeSection(TabMain)
			TabNameStatus.Text = SectionName .. "  "
		end
		TabBtn.MouseButton1Click:Connect(function()
			XanaxUILib.functions:ChangeSection(TabMain)
			TabNameStatus.Text = SectionName .. "  "
		end)
		
		local ObjectTbl = {}
		function ObjectTbl:CreateButton(btnTxt, onclick)
			local Button = Instance.new("TextButton")
			local BTNBotomLien = Instance.new("Frame")
			local BTNTopLien = Instance.new("Frame")
			
			Button.Name = "Button"
			Button.Parent = ObjectHolder
			Button.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
			Button.BorderSizePixel = 0
			Button.Position = UDim2.new(0.166666672, 0, 0.122727275, 0)
			Button.Size = UDim2.new(0, 267, 0, 30)
			Button.AutoButtonColor = false
			Button.Font = Enum.Font.GothamSemibold
			Button.Text = "  " .. btnTxt
			Button.TextColor3 = Color3.fromRGB(255, 255, 255)
			Button.TextSize = 14.000
			Button.TextXAlignment = Enum.TextXAlignment.Left
			
			BTNBotomLien.Name = "BTNBotomLien"
			BTNBotomLien.Parent = Button
			BTNBotomLien.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
			BTNBotomLien.BorderSizePixel = 0
			BTNBotomLien.Position = UDim2.new(0, 0, 0.966666639, 0)
			BTNBotomLien.Size = UDim2.new(1, 0, 0, 1)
			
			BTNTopLien.Name = "BTNTopLien"
			BTNTopLien.Parent = Button
			BTNTopLien.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
			BTNTopLien.BorderSizePixel = 0
			BTNTopLien.Position = UDim2.new(0, 0, 1.49011612e-08, 0)
			BTNTopLien.Size = UDim2.new(1, 0, 0, 1)
			Button.MouseButton1Click:Connect(onclick)
		end
		function ObjectTbl:CreateToggle(toggleTxt, flag, func)
			XanaxUILib.flags.toggles[flag] = false
			local isFunctionToggle = false
			if func then
				isFunctionToggle = true
			end
			local Toggle = Instance.new("TextButton")
			local TOGGLEBotomLien = Instance.new("Frame")
			local TOGGLETopLien = Instance.new("Frame")
			local ToggleStatus = Instance.new("ImageButton")
			
			Toggle.Name = "Toggle"
			Toggle.Parent = ObjectHolder
			Toggle.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
			Toggle.BorderSizePixel = 0
			Toggle.Position = UDim2.new(0.166666672, 0, 0.122727275, 0)
			Toggle.Size = UDim2.new(0, 267, 0, 30)
			Toggle.AutoButtonColor = false
			Toggle.Font = Enum.Font.GothamSemibold
			Toggle.Text = "  " .. toggleTxt
			Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.TextSize = 14.000
			Toggle.TextXAlignment = Enum.TextXAlignment.Left
			
			TOGGLEBotomLien.Name = "TOGGLEBotomLien"
			TOGGLEBotomLien.Parent = Toggle
			TOGGLEBotomLien.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
			TOGGLEBotomLien.BorderSizePixel = 0
			TOGGLEBotomLien.Position = UDim2.new(0, 0, 0.966666639, 0)
			TOGGLEBotomLien.Size = UDim2.new(1, 0, 0, 1)
			
			TOGGLETopLien.Name = "TOGGLETopLien"
			TOGGLETopLien.Parent = Toggle
			TOGGLETopLien.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
			TOGGLETopLien.BorderSizePixel = 0
			TOGGLETopLien.Position = UDim2.new(0, 0, 1.49011612e-08, 0)
			TOGGLETopLien.Size = UDim2.new(1, 0, 0, 1)
			
			ToggleStatus.Name = "ToggleStatus"
			ToggleStatus.Parent = Toggle
			ToggleStatus.AnchorPoint = Vector2.new(0, 0.5)
			ToggleStatus.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			ToggleStatus.BackgroundTransparency = 1.000
			ToggleStatus.Position = UDim2.new(0.913999975, 0, 0.5, 0)
			ToggleStatus.Size = UDim2.new(0, 17, 0, 17)
			ToggleStatus.Image = "rbxassetid://2790371148"
			ToggleStatus.ImageColor3 = Color3.fromRGB(255, 20, 24)
			ToggleStatus.ScaleType = Enum.ScaleType.Slice
			ToggleStatus.SliceCenter = Rect.new(32, 32, 224, 224)
						
			local function togglefunc()
				XanaxUILib.flags.toggles[flag] = not XanaxUILib.flags.toggles[flag]
				if isFunctionToggle then func(XanaxUILib.flags.toggles[flag]) end
				XanaxUILib.functions:Tween(ToggleStatus, {Time = 0.1, Style = "Linear", Direction = "InOut"}, {ImageColor3 = XanaxUILib.flags.toggles[flag] and Color3.fromRGB(0, 255, 50) or Color3.fromRGB(255, 20, 24)})
			end
			
			Toggle.MouseButton1Click:Connect(togglefunc)
			ToggleStatus.MouseButton1Click:Connect(togglefunc)
		end
		function ObjectTbl:CreateLabel(txt)
			local Label = Instance.new("TextLabel")
			local LABELBOTTOMLIEN = Instance.new("Frame")
			local LABELTopLien = Instance.new("Frame")
			
			Label.Name = "Label"
			Label.Parent = ObjectHolder
			Label.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
			Label.BorderSizePixel = 0
			Label.Position = UDim2.new(0.0549999997, 0, 0.302727312, 0)
			Label.Size = UDim2.new(0, 267, 0, 23)
			Label.Font = Enum.Font.GothamSemibold
			Label.Text = txt
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextSize = 14.000
			
			LABELBOTTOMLIEN.Name = "LABELBOTTOMLIEN"
			LABELBOTTOMLIEN.Parent = Label
			LABELBOTTOMLIEN.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
			LABELBOTTOMLIEN.BorderSizePixel = 0
			LABELBOTTOMLIEN.Position = UDim2.new(0, 0, 0.962962925, 0)
			LABELBOTTOMLIEN.Size = UDim2.new(1, 0, 0, 1)
			
			LABELTopLien.Name = "LABELTopLien"
			LABELTopLien.Parent = Label
			LABELTopLien.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
			LABELTopLien.BorderSizePixel = 0
			LABELTopLien.Size = UDim2.new(1, 0, 0, 1)
		end
		function ObjectTbl:CreateSlider(SliderTxt, flag, min, max, precise, func)
		    default = false
    	    local isFunc = false
	        if func then     
	           isFunc = true 
	        end
	        XanaxUILib.flags.sliders[flag] = min
	        
	        local Slider = Instance.new("TextButton")
            local SLIDERBotomLien = Instance.new("Frame")
            local SLIDERTopLien = Instance.new("Frame")
            local sliderback = Instance.new("Frame")
            local sliderfiller = Instance.new("Frame")
            local sliderval = Instance.new("TextLabel")
            
            Slider.Name = "Slider"
            Slider.Parent = ObjectHolder
            Slider.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
            Slider.BorderSizePixel = 0
            Slider.Position = UDim2.new(0.166666672, 0, 0.122727275, 0)
            Slider.Size = UDim2.new(0, 267, 0, 30)
            Slider.AutoButtonColor = false
            Slider.Font = Enum.Font.GothamSemibold
            Slider.Text = "  " .. SliderTxt
            Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
            Slider.TextSize = 14.000
            Slider.TextXAlignment = Enum.TextXAlignment.Left
            
            SLIDERBotomLien.Name = "SLIDERBotomLien"
            SLIDERBotomLien.Parent = Slider
            SLIDERBotomLien.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
            SLIDERBotomLien.BorderSizePixel = 0
            SLIDERBotomLien.Position = UDim2.new(0, 0, 0.966666639, 0)
            SLIDERBotomLien.Size = UDim2.new(1, 0, 0, 1)
            
            SLIDERTopLien.Name = "SLIDERTopLien"
            SLIDERTopLien.Parent = Slider
            SLIDERTopLien.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
            SLIDERTopLien.BorderSizePixel = 0
            SLIDERTopLien.Position = UDim2.new(0, 0, 1.49011612e-08, 0)
            SLIDERTopLien.Size = UDim2.new(1, 0, 0, 1)
            
            sliderback.Name = "sliderback"
            sliderback.Parent = Slider
            sliderback.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
            sliderback.BorderSizePixel = 0
            sliderback.Position = UDim2.new(0.606741548, 0, 0.166666672, 0)
            sliderback.Size = UDim2.new(0, 100, 0, 20)
            
            sliderfiller.Name = "sliderfiller"
            sliderfiller.Parent = sliderback
            sliderfiller.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            sliderfiller.BorderSizePixel = 0
            sliderfiller.Size = UDim2.new(0, 50, 0, 20)
            
            sliderval.Name = "sliderval"
            sliderval.Parent = sliderback
            sliderval.AnchorPoint = Vector2.new(0.5, 0)
            sliderval.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            sliderval.BackgroundTransparency = 1.000
            sliderval.BorderSizePixel = 0
            sliderval.Position = UDim2.new(0.5, 0, 0, 0)
            sliderval.Size = UDim2.new(0, 0, 0, 20)
            sliderval.Font = Enum.Font.Code
            sliderval.Text = min .. " / " .. max
            sliderval.TextColor3 = Color3.fromRGB(255, 255, 255)
            sliderval.TextSize = 14.000

	        
	        local Connection;
            inputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    if(Connection) then
                        Connection:Disconnect();
                        Connection = nil;
                    end;
                end;
            end);
            Slider.MouseButton1Down:Connect(function()
                if(Connection) then
                    Connection:Disconnect();
                end;
                Connection = RunService.Heartbeat:Connect(function()
                    local mouse = inputService:GetMouseLocation();
                    local percent = math.clamp((mouse.X - Slider.AbsolutePosition.X) / (Slider.AbsoluteSize.X), 0, 1);
                    local Value = min + (max - min) * percent;
                    if not precise then
                        Value = math.floor(Value);
                    end;
                    Value = tonumber(string.format("%.2f", Value));
                    XanaxUILib.functions:Tween(sliderfiller, "Default", {Size = UDim2.new(percent, 0, 1, 0)})
                    sliderval.Text = tostring(Value) .. " / " .. max;
                    XanaxUILib.flags.sliders[flag] = Value;
                    if isFunc then func(Value) end
                end);
            end);
		end
		spawn(function()
		    ObjectHolder.CanvasSize = UDim2.new(0, 0, 0, objplacing.AbsoluteContentSize.Y + 18)
        end)
		return ObjectTbl
	end
	spawn(function()
	    TabBtnHolder.CanvasSize = UDim2.new(0, 0, 0, TabBtnLayout.AbsoluteContentSize.Y + 10)
	end)
	return Sections
end
return XanaxUILib
