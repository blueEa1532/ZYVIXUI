--[[
v1.1.2
_______________.___.____   ____._______  ___
\____    /\__  |   |\   \ /   /|   \   \/  /
  /     /  /   |   | \   Y   / |   |\     / 
 /     /_  \____   |  \     /  |   |/     \ 
/_______ \ / ______|   \___/   |___/___/\  \
        \/ \/                            \_/
   BY BLUE BALL

ZYVIX UI

INSPIRED BY REGUI

CODE ADAPTED AND REWRITTEN FROM ###.lua
architectural design and research: https://docs.google.com/document/d/1ATcD0tQCq1naHzWkQE621iLwlaqEfRk5kuLNCgndFqg/edit?tab=t.0

THE STRUCTURE DESIGN OF THIS UI LIB IS SIMILAR BUT NOT SKIDDED FROM (regui). IT HAS BEEN FULLY REWRITTEN.

"It is never too late to be what you might have been." - George Eliot

Date of production: 5/7/2026
Date of completion: 5/29/2026
]]

if not game:IsLoaded() then game.Loaded:Wait() end

local proxy

proxy = setmetatable({}, {
	__index = function(self, service_name: string)
		local service = game:GetService(service_name)

		if cloneref then
			return cloneref(service)
		end

		return service
	end,
})

local tween_service = proxy.TweenService
local run_service = proxy.RunService
local content_provider = proxy.ContentProvider
local userinput_service = proxy.UserInputService
local players = proxy.Players


local main_genv = getgenv and getgenv() or _G
if main_genv and main_genv._ZYVIX then
	return main_genv._ZYVIX
end

local universal_tween = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

local ensure_funcs = {} do
	function ensure_funcs:IsValidConn(conn: RBXScriptSignal)
		if conn and typeof(conn) == "RBXScriptSignal" then
			return conn
		end
	end

	function ensure_funcs:IsValidUdm2(udm2: UDim2)
		if udm2 and typeof(udm2) == "UDim2" then
			return udm2
		end
	end

	function ensure_funcs:IsValidInstance(instance: Instance)
		if instance and typeof(instance) == "Instance" then
			return instance
		end
	end

	function ensure_funcs:IsValidFunction(func)
		if func and type(func) == "function" then
			return func
		end
	end
end

local ZYVIX = {
	window = table.create(8),
	compontments = table.create(8),
}

local container_base = table.create(8)

--// window creator service
local main_window_class = table.create(2)
main_window_class.__index = main_window_class
setmetatable(main_window_class, {__index = container_base})

do

	function main_window_class:SetTitle(text)
		self.title_text.Text = tostring(text) or "nil"
		return self
	end

	function main_window_class:SetVisiblity(bool: boolean)
		self.window_base.Visible = bool
		return self
	end

	function main_window_class:GetBase()
		return self.window_content
	end
	
	function main_window_class:GetContainer()
		return self.window_base
	end

	function main_window_class:SetPos(pos: UDim2)
		local udim2 = ensure_funcs:IsValidUdm2(pos)
		if not udim2 then return end

		if self.window_base then
			self.window_base.Position = udim2
		end
		return self
	end

	function main_window_class:_StoreConn(conn)
		return helper_functions:_StoreConn(self.stored_conn, conn)
	end


	function main_window_class:_CreateTween(parent, info, prop)
		local success, tween = pcall(function()
			return tween_service:Create(parent, info, prop)
		end)

		if success then
			return tween
		end

		return "not found"
	end

	function main_window_class:_AddTween(obj: Instance, tween_info: TweenInfo, property)
		tween_info = tween_info or TweenInfo.new(
			0.5,
			Enum.EasingStyle.Sine,
			Enum.EasingDirection.InOut
		)

		local tween = self:_CreateTween(obj, tween_info, property)

		return self:_StoreTween(tween)
	end

	function main_window_class:_Destroy()
		if not self or self.Destroyed then return end
		self.Destroyed = true

		for _, tween in ipairs(self.stored_tween) do
			pcall(function()
				tween:Cancel()
				tween = nil
			end)
		end

		for _, conn in ipairs(self.stored_conn) do
			if conn then
				conn = helper_functions:DisconnectConn(conn)
			end
		end

		if self.window_base then
			pcall(function()
				self.window_base:Destroy()
			end)
		end

		self.stored_conn = nil
		self.stored_tween = nil
		self.window_base = nil
		self.window_container = nil
	end

	function main_window_class:_StoreTween(tween)
		local target_tween = tween

		local tbl = self.stored_tween

		target_tween.Completed:Once(function()
			for i = 1, #tbl do
				if target_tween == tbl[i] then continue end

				tbl[i] = nil
				break
			end
		end)

		return target_tween
	end

	function main_window_class:_CreateWindowBase(parent, setting)
		if self.window_base then return end

		local pos = setting.Position
		local size = setting.Size

		local window_frame = Instance.new("Frame")

		window_frame.Name = "window_frame"
		window_frame.Parent = parent
		window_frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		window_frame.BackgroundTransparency = 1.000
		window_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		window_frame.BorderSizePixel = 0
		window_frame.AnchorPoint = Vector2.new(0.5, 0)
		window_frame.Position = pos
		window_frame.Size = size
		
		local image_label = Instance.new("ImageLabel")
		image_label.Parent = window_frame
		image_label.Name = "Eye"
		image_label.Size = UDim2.new(1,0,1,0)
		image_label.BackgroundTransparency = 1
		image_label.Image = "rbxassetid://98388929815173"
		image_label.ScaleType = Enum.ScaleType.Fit
		image_label.ZIndex = -2
		image_label.ImageTransparency = 0.5



		local UI_padding = Instance.new("UIPadding")
		UI_padding.Parent = window_frame
		UI_padding.PaddingBottom = UDim.new(0, 1)
		UI_padding.PaddingLeft = UDim.new(0, 1)
		UI_padding.PaddingRight = UDim.new(0, 1)
		UI_padding.PaddingTop = UDim.new(0, 1)

		self.window_base = window_frame
		self.window_pos_ex = window_frame.Position
		self.window_size_ex = window_frame.Size
		self.setting = setting
	end

	function main_window_class:_CreateWindowContainer()
		if self.window_container then return end
		if not self.window_base then return end

		local canvas_group = Instance.new("CanvasGroup")
		canvas_group.Name = "main_container"
		canvas_group.Size = UDim2.new(1, 0, 1, 0)
		canvas_group.Active = true
		canvas_group.AutomaticSize = Enum.AutomaticSize.Y
		canvas_group.BackgroundTransparency = 1
		canvas_group.SelectionImageObject = self.window_base
		canvas_group.Parent = self.window_base

		local UI_corner = Instance.new("UICorner")
		UI_corner.CornerRadius = UDim.new(0, 8)
		UI_corner.Parent = canvas_group

		local list_layout = Instance.new("UIListLayout")
		list_layout.Padding = UDim.new(0,0)
		list_layout.VerticalFlex = Enum.UIFlexAlignment.Fill
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.Parent = canvas_group

		local border_stroke = Instance.new("UIStroke")
		border_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		border_stroke.Thickness = 1
		border_stroke.Color = Color3.fromRGB(157, 157, 157)
		border_stroke.Parent = canvas_group

		local main_frame = Instance.new("Frame")
		main_frame.Name = "main_frame"
		main_frame.Parent = canvas_group
		main_frame.BackgroundColor3 = Color3.fromRGB(22, 21, 26)
		main_frame.BackgroundTransparency = 1.000
		main_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		main_frame.BorderSizePixel = 0
		main_frame.ClipsDescendants = true
		main_frame.Size = UDim2.new(1, 0, 1, 0)

		self.window_container = canvas_group
		self.window_main_frame = main_frame
	end

	function main_window_class:_CreateContentFrame()
		if self.window_content then return end
		if not self.window_base then return end
		if not self.window_container then return end
		if not self.window_main_frame then return end

		local content_frame = Instance.new("Frame")
		content_frame.Name = "content"
		content_frame.Parent = self.window_main_frame
		content_frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		content_frame.BackgroundTransparency = 0.300
		content_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		content_frame.BorderSizePixel = 0
		content_frame.Position = UDim2.new(0.001, 0, 0.096, 0)
		content_frame.Size = UDim2.new(1, 0, 0.9, 0)
		content_frame.ClipsDescendants = true

		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(13, 18, 24)), ColorSequenceKeypoint.new(0.49, Color3.fromRGB(13, 18, 24)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(13, 18, 24))}
		gradient.Parent = content_frame

		local padding = Instance.new("UIPadding")
		padding.Parent = content_frame
		padding.PaddingLeft = UDim.new(0, 7)
		padding.PaddingRight = UDim.new(0, 7)

		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = content_frame
		list_layout.FillDirection = Enum.FillDirection.Horizontal
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Center
		list_layout.Padding = UDim.new(0, 7)

		local stroke = Instance.new("UIStroke")
		stroke.Parent = content_frame
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Color = Color3.fromRGB(44, 85, 161)
		stroke.Thickness = 0.5

		self.window_content = content_frame
	end

	function main_window_class:_CreateTitlebar(setting)
		if self.title_bar then return end
		if not self.window_main_frame then return end
		if not self.window_base then return end
		if not self.window_container then return end


		local title_bar = Instance.new("Frame")
		title_bar.Name = "title_bar"
		title_bar.Parent = self.window_main_frame
		title_bar.BackgroundColor3 = Color3.fromRGB(16, 20, 26)
		title_bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		title_bar.BorderSizePixel = 0
		title_bar.ClipsDescendants = true
		title_bar.LayoutOrder = -1
		title_bar.Position = UDim2.new(0, 0, -0.002, 0)
		title_bar.Size = UDim2.new(1, 0, 0.1, 0)
		title_bar.ZIndex = 2

		local padding = Instance.new("UIPadding")
		padding.Parent = title_bar
		padding.PaddingLeft = UDim.new(0, 15)

		local management = Instance.new("Frame")
		management.Parent = title_bar
		management.Name = "management"
		management.AnchorPoint = Vector2.new(1, 0)
		management.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		management.BackgroundTransparency = 1.000
		management.BorderColor3 = Color3.fromRGB(0, 0, 0)
		management.BorderSizePixel = 0
		management.Position = UDim2.new(1, 0, 0, 0)
		management.Size = UDim2.new(0.2, 0, 1, 0)
		management.ZIndex = 2

		local drag_bar = Instance.new("TextButton")
		drag_bar.Name = "Drag"
		drag_bar.Parent = title_bar
		drag_bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		drag_bar.BackgroundTransparency = 1.000
		drag_bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		drag_bar.BorderSizePixel = 0
		drag_bar.LayoutOrder = 5
		drag_bar.AutomaticSize = Enum.AutomaticSize.Y
		drag_bar.Size = UDim2.new(1, 0, 1, 0)
		drag_bar.AutoButtonColor = false
		drag_bar.Font = Enum.Font.SourceSans
		drag_bar.TextColor3 = Color3.fromRGB(0, 0, 0)
		drag_bar.TextSize = 14.000
		drag_bar.TextTransparency = 1.000

		local title_text = Instance.new("TextButton")
		title_text.Parent = title_bar
		title_text.Name = "TitleText"
		title_text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		title_text.BackgroundTransparency = 1.000
		title_text.BorderColor3 = Color3.fromRGB(0, 0, 0)
		title_text.BorderSizePixel = 0
		title_text.LayoutOrder = 1
		title_text.Position = UDim2.new(0.043032866, 0, 0, 0)
		title_text.Size = UDim2.new(0.071, 0, 1.116, 0)
		title_text.AutoButtonColor = false
		title_text.Font = Enum.Font.GothamBold
		title_text.Text = tostring(setting.Title) or "ZYVIX"
		title_text.TextColor3 = Color3.fromRGB(53, 78, 106)
		title_text.TextSize = 21.000
		title_text.ZIndex = 2
		title_text.TextXAlignment = Enum.TextXAlignment.Left

		local icon = Instance.new('ImageLabel')
		icon.Parent = title_bar
		icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		icon.BackgroundTransparency = 1.000
		icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		icon.BorderSizePixel = 0
		icon.Position = UDim2.new(-0.017, 0, 0, 0)
		icon.Size = UDim2.new(0.054, 0, 0.982, 0)
		icon.ZIndex = 2
		icon.Image = tostring(setting.icon_id)

		local dragging, drag_input, input_pos, start_pos

		self:_StoreConn(drag_bar.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end

			dragging = true
			input_pos = input.Position
			start_pos = self.window_base.Position
		end))

		self:_StoreConn(drag_bar.InputEnded:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end

			dragging = nil
		end))

		self:_StoreConn(userinput_service.InputChanged:Connect(function(input)
			if not dragging then return end
			if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then
				return
			end

			local delta = input.Position - input_pos

			self.window_base.Position = UDim2.new(
				start_pos.X.Scale, 
				start_pos.X.Offset + delta.X,
				start_pos.Y.Scale, 
				start_pos.Y.Offset + delta.Y
			)
		end))

		self.title_bar = title_bar
		self.title_text = title_text
		self.management = management
	end

	function main_window_class:Collapse()
		--// this is supposed to only show the titlebar intact
		if self.collapsed then return end
		if not self.window_content then return end

		local collapse_tween = self:_AddTween(self.window_content, universal_tween, {Size = UDim2.new(1, 0, 0, 0)})
		collapse_tween:Play()
		collapse_tween.Completed:Wait()

		self.window_content.Visible = false
		self.collapsed = true
	end

	function main_window_class:Expand()
		if not self.collapsed then return end
		if not self.window_content then return end

		self.window_content.Visible = true

		local collapse_tween = self:_AddTween(self.window_content, universal_tween, {Size = UDim2.new(1, 0, 0.9, 0)})
		collapse_tween:Play()
		collapse_tween.Completed:Wait()

		self.collapsed = false
	end

	function main_window_class:ToggleCollapse()
		if self.collapsed then
			self:Expand()
		else
			self:Collapse()
		end
	end

	function main_window_class:_CreateManagementButtons()
		if self.close_btn then return end
		if not (self.title_bar and self.management) then return end
		if not self.window_main_frame then return end
		if not self.window_base then return end
		if not self.window_container then return end

		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = self.management
		list_layout.FillDirection = Enum.FillDirection.Horizontal
		list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Center
		list_layout.Padding = UDim.new(0, 7)

		local padding = Instance.new("UIPadding")
		padding.Parent = self.management
		padding.PaddingRight = UDim.new(0, 7)

		local close_frame = Instance.new("Frame")
		close_frame.Parent = self.management
		close_frame.Name = "CloseFrame"
		close_frame.AnchorPoint = Vector2.new(0, 0.5)
		close_frame.BackgroundColor3 = Color3.fromRGB(13, 19, 26)
		close_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		close_frame.BorderSizePixel = 0
		close_frame.LayoutOrder = 1
		close_frame.Size = UDim2.new(0.6, 0, 0.6, 0)
		close_frame.ZIndex = 3

		local ui_scaler = Instance.new("UIAspectRatioConstraint")
		ui_scaler.Parent = close_frame

		local corner_border = Instance.new("UICorner")
		corner_border.Parent = close_frame

		local stroke_border = Instance.new("UIStroke")
		stroke_border.Parent = close_frame
		stroke_border.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke_border.Color = Color3.fromRGB(62, 62, 62)

		local close_btn = Instance.new("ImageButton")
		close_btn.Name = "CloseBtn"
		close_btn.Parent = close_frame
		close_btn.AnchorPoint = Vector2.new(0.5, 0.5)
		close_btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		close_btn.BackgroundTransparency = 1.000
		close_btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
		close_btn.BorderSizePixel = 0
		close_btn.LayoutOrder = 2
		close_btn.Position = UDim2.new(0.5, 0, 0.5, 0)
		close_btn.Size = UDim2.new(0.75, 0, 0.75, 0)
		close_btn.Image = "rbxassetid://10137832201"
		close_btn.ImageTransparency = 0.500
		close_btn.ZIndex = 3

		local hide_btn_container = Instance.new("Frame")
		hide_btn_container.Parent = self.management
		hide_btn_container.Name = "HideFrame"
		hide_btn_container.AnchorPoint = Vector2.new(0, 0.5)
		hide_btn_container.BackgroundColor3 = Color3.fromRGB(13, 19, 26)
		hide_btn_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		hide_btn_container.BorderSizePixel = 0
		hide_btn_container.Size = UDim2.new(0.6, 0, 0.6, 0)
		hide_btn_container.ZIndex = 3

		ui_scaler:Clone().Parent = hide_btn_container
		corner_border:Clone().Parent = hide_btn_container
		stroke_border:Clone().Parent = hide_btn_container

		local hide_btn = Instance.new("ImageButton")
		hide_btn.Name = "CollapseBtn"
		hide_btn.Parent = hide_btn_container
		hide_btn.AnchorPoint = Vector2.new(0.5, 0.5)
		hide_btn.BackgroundColor3 = Color3.fromRGB(13, 19, 26)
		hide_btn.BackgroundTransparency = 1.000
		hide_btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
		hide_btn.BorderSizePixel = 0
		hide_btn.LayoutOrder = 2
		hide_btn.Position = UDim2.new(0.5, 0, 0.5, 0)
		hide_btn.Size = UDim2.new(0.75, 0, 0.75, 0)
		hide_btn.Image = "rbxassetid://10137941941"
		hide_btn.ImageTransparency = 0.500
		hide_btn.ZIndex = 3

		self:_StoreConn(hide_btn.MouseButton1Click:Connect(function()
			self:ToggleCollapse()
		end))
	end
end

local tab_creator_class = table.create(8)
tab_creator_class.__index =  tab_creator_class
setmetatable(tab_creator_class, {__index = container_base})


do
	function tab_creator_class:GetBase()
		return self.content_container
	end

	function tab_creator_class:Callback(callback)
		self.callback = callback
		return self
	end

	function tab_creator_class:_StoreConn(conn)
		return helper_functions:_StoreConn(self.stored_conn, conn)
	end

	function tab_creator_class:_CreateTab(parent: Instance, title: string, icon_id: string)
		if self.tab then return end

		parent = ensure_funcs:IsValidInstance(parent)
		if not parent then return end

		title = tostring(title) or "Nil"
		icon_id = tostring(icon_id) or "rbxassetid://73132811772878"

		local tab_container = Instance.new("Frame")
		tab_container.Name = tostring(title)
		tab_container.Parent = parent
		tab_container.AnchorPoint = Vector2.new(0.5, 0)
		tab_container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tab_container.BackgroundTransparency = 0.8
		tab_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tab_container.BorderSizePixel = 0
		tab_container.Position = UDim2.new(0.5, 0, -0.001, 0)
		tab_container.Size = UDim2.new(0.9, 0, 0.04, 0)

		local corner = Instance.new("UICorner")
		corner.Parent = tab_container

		local padding = Instance.new("UIPadding")
		padding.Parent = tab_container
		padding.PaddingLeft = UDim.new(0, 5)

		local stroke = Instance.new("UIStroke")
		stroke.Parent = tab_container
		stroke.Color = Color3.fromRGB(172, 172, 172)
		stroke.Thickness = 0.5
		stroke.Transparency = 0.5

		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(33, 80, 189)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(103, 252, 255))}
		gradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.50), NumberSequenceKeypoint.new(1.00, 0.50)}
		gradient.Parent = tab_container

		local main_button = Instance.new("TextButton")
		main_button.Parent = tab_container
		main_button.Name = "Button"
		main_button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		main_button.BackgroundTransparency = 1.000
		main_button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		main_button.BorderSizePixel = 0
		main_button.Size = UDim2.new(1, 0, 1, 0)
		main_button.Font = Enum.Font.SourceSans
		main_button.TextColor3 = Color3.fromRGB(0, 0, 0)
		main_button.TextSize = 14.000
		main_button.TextTransparency = 1.000


		local title_container = Instance.new("Frame")
		title_container.Parent = tab_container
		title_container.Name = "TextContainer"
		title_container.AnchorPoint = Vector2.new(1, 0.5)
		title_container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		title_container.BackgroundTransparency = 1.000
		title_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		title_container.BorderSizePixel = 0
		title_container.Position = UDim2.new(1, 0, 0.5, 0)
		title_container.Size = UDim2.new(1, -30, 1, 0)

		local text_label = Instance.new("TextLabel")
		text_label.Parent = title_container
		text_label.Name = "Title"
		text_label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		text_label.BackgroundTransparency = 1.000
		text_label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		text_label.BorderSizePixel = 0
		text_label.LayoutOrder = 2
		text_label.Size = UDim2.new(1, 0, 1, 0)
		text_label.Font = Enum.Font.SourceSansBold
		text_label.Text = title
		text_label.TextColor3 = Color3.fromRGB(255, 255, 255)
		text_label.TextSize = 20.000
		text_label.TextWrapped = true
		text_label.TextXAlignment = Enum.TextXAlignment.Left

		local icon = Instance.new("ImageLabel")
		icon.Parent = tab_container
		icon.Name = "Icon"
		icon.AnchorPoint = Vector2.new(0, 0.5)
		icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		icon.BackgroundTransparency = 1.000
		icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		icon.BorderSizePixel = 0
		icon.LayoutOrder = 1
		icon.Position = UDim2.new(0, 0, 0.5, 0)
		icon.Size = UDim2.new(1, 0, 0.7, 0)
		icon.Image = icon_id
		icon.ScaleType = Enum.ScaleType.Fit

		local sizing_ratio = Instance.new("UIAspectRatioConstraint")
		sizing_ratio.Parent = icon

		self:_StoreConn(main_button.MouseButton1Click:Connect(function()
			if self.callback and ensure_funcs:IsValidFunction(self.callback) then
				self.callback()
			end
		end))

		self.tab = tab_container
	end

	function tab_creator_class:_CreateComponentContent(parent)
		local content_container = Instance.new("Frame")
		content_container.Parent = parent
		content_container.Name = "content"
		content_container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		content_container.BackgroundTransparency = 1.000
		content_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		content_container.BorderSizePixel = 0
		content_container.Visible = false
		content_container.Size = UDim2.new(1, 0, 1, 0)

		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = content_container
		list_layout.Padding = UDim.new(0, 7)
		list_layout.FillDirection = Enum.FillDirection.Horizontal
		list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		list_layout.HorizontalFlex = Enum.UIFlexAlignment.Fill
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Top
		list_layout.VerticalFlex = Enum.UIFlexAlignment.Fill

		self.content_container = content_container
	end
end



local tab_list_class = table.create(8)
tab_list_class.__index = tab_list_class

do

	--// functionality

	function tab_list_class:GetBase()
		return self.tab_list
	end

	function tab_list_class:CreateTab(title, icon)
		if not self.tab_list then return end

		local tab_obj = setmetatable({}, tab_creator_class)
		tab_obj.stored_conn = table.create(6)

		tab_obj:_CreateTab(
			self.tab_list,
			title,
			icon
		)
		tab_obj:_CreateComponentContent(self.component_container)

		tab_obj._CreateTab = nil

		tab_obj.tab.LayoutOrder = #self.tabs + 1
		table.insert(self.tabs, tab_obj)


		local current_index = #self.tabs	

		if not self.active_tab_index then
			self:_SetActiveTab(current_index)
		end

		tab_obj:Callback(function()
			self:_SetActiveTab(current_index)
		end)

		return tab_obj
	end

	function tab_list_class:_SetActiveTab(index)
		local selected_tab = self.tabs[index]
		if not selected_tab then warn("err") return end

		if self.active_tab_index and self.active_tab_index ~= index then
			local active_tab = self.tabs[self.active_tab_index]
			active_tab.active_boolean = false

			local active_content = active_tab.tab

			tween_service:Create(active_content, TweenInfo.new(
				0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					BackgroundTransparency = 0.8
				}):Play()

			active_tab.content_container.Visible = false
		end

		selected_tab.active_boolean = true
		selected_tab.content_container.Visible = true
		local content = selected_tab.tab

		tween_service:Create(content, universal_tween, {
			BackgroundTransparency = 0.2
		}):Play()

		self.active_tab_index = index
	end

	--// creation section
	function tab_list_class:_CreateContainer(parent)
		if self.tab_container then return end
		local container_frame = Instance.new("Frame")
		container_frame.Parent = parent
		container_frame.Name = "Tablist"
		container_frame.BackgroundColor3 = Color3.fromRGB(129, 129, 129)
		container_frame.BackgroundTransparency = 0.300
		container_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		container_frame.BorderSizePixel = 0
		container_frame.ClipsDescendants = true
		container_frame.Position = UDim2.new(0, -7, 0, -9)
		container_frame.Size = UDim2.new(0.181089625, 0, 0.970223308, 0)

		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = container_frame

		local stroke = Instance.new("UIStroke")
		stroke.Parent = container_frame
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Color = Color3.fromRGB(48, 49, 54)

		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(47, 49, 54)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}
		gradient.Rotation = 90
		gradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.50), NumberSequenceKeypoint.new(1.00, 0.50)}
		gradient.Parent = container_frame

		self.tab_container = container_frame
	end

	function tab_list_class:_CreateContent()
		if self.tab_content then return end
		if not self.tab_container then return end

		local content_frame = Instance.new("Frame")
		content_frame.Name = "TabContent"
		content_frame.Parent = self.tab_container
		content_frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		content_frame.BackgroundTransparency = 1.000
		content_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		content_frame.BorderSizePixel = 0
		content_frame.Size = UDim2.new(1, 0, 1, 0)

		local scrolling_frame = Instance.new("ScrollingFrame")
		scrolling_frame.Parent = content_frame
		scrolling_frame.Name = "TabList"
		scrolling_frame.Active = true
		scrolling_frame.BackgroundColor3 = Color3.fromRGB(27, 28, 31)
		scrolling_frame.BackgroundTransparency = 1.000
		scrolling_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		scrolling_frame.BorderSizePixel = 0
		scrolling_frame.Position = UDim2.new(0, 0, 0.2, 0)
		scrolling_frame.Size = UDim2.new(1, 0, 0.65, 0)
		scrolling_frame.BottomImage = ""
		scrolling_frame.MidImage = ""
		scrolling_frame.ScrollBarThickness = 0
		scrolling_frame.TopImage = ""

		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = scrolling_frame
		list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.Padding = UDim.new(0, 8)

		local padding = Instance.new("UIPadding")
		padding.Parent = scrolling_frame
		padding.PaddingTop = UDim.new(0, 5)

		local top_section = Instance.new("Frame")
		top_section.Parent = content_frame
		top_section.Name = "top_section"
		top_section.AnchorPoint = Vector2.new(0.5, 0)
		top_section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		top_section.BackgroundTransparency = 1.000
		top_section.BorderColor3 = Color3.fromRGB(0, 0, 0)
		top_section.BorderSizePixel = 0
		top_section.Position = UDim2.new(0.5, 0, 0, 0)
		top_section.Size = UDim2.new(0.9, 0, 0.187, 0)

		list_layout:Clone().Parent = top_section
		padding:Clone().Parent = top_section

		self.tab_content = content_frame
		self.tab_list = scrolling_frame
		self.top_section = top_section
	end

	function tab_list_class:_InitContent(parent)
		if self.component_container then return end
		local component_container = Instance.new("Frame")
		component_container.Parent = parent
		component_container.Name = "components"
		component_container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		component_container.BackgroundTransparency = 1.000
		component_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		component_container.BorderSizePixel = 0
		component_container.LayoutOrder = 1
		component_container.Position = UDim2.new(0.190018162, 0, 0.004568398, 0)
		component_container.Size = UDim2.new(0.809981823, 0, 0.949999988, 0)

		self.component_container = component_container
	end
end

local section_class = table.create(8)
section_class.__index = section_class
setmetatable(section_class, { __index = container_base })

do

			--[[
		todo: 
		 when creating a tab, it'll create a page for that tab. function in tab_list_class
		create section creator 

		set up coreui function for the section creator 
		inject element
		]]

	function section_class:GetBase()
		return self.section_frame
	end

	function section_class:_CreateScrollingCanvas(parent, setting)
		if self.scrolling_content then return end

		local scrolling_frame = Instance.new("ScrollingFrame")
		scrolling_frame.Parent = parent
		scrolling_frame.Active = true
		scrolling_frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		scrolling_frame.BackgroundTransparency = 1.000
		scrolling_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		scrolling_frame.BorderSizePixel = 0
		scrolling_frame.ClipsDescendants = false
		scrolling_frame.Size = UDim2.new(1, 0, 1, 0)
		scrolling_frame.BottomImage = ""
		scrolling_frame.MidImage = ""
		scrolling_frame.TopImage = ""
		scrolling_frame.AutomaticSize = Enum.AutomaticSize.Y
		scrolling_frame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		scrolling_frame.CanvasSize = UDim2.new(0,0,0,0)

		self.scrolling_frame = scrolling_frame
	end

	function section_class:_CreateSection(setting)
		if self.section_frame then return end
		if not self.scrolling_frame then return end

		local section_container = Instance.new("Frame")
		section_container.Name = "section"
		section_container.Parent = self.scrolling_frame
		section_container.BackgroundColor3 = Color3.fromRGB(13, 19, 26)
		section_container.BackgroundTransparency = 0.500
		section_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		section_container.BorderSizePixel = 0
		section_container.Position = UDim2.new(0, 0, 0, 0)
		section_container.Size = UDim2.new(1, 0, 0.345, 0)
		section_container.AutomaticSize = Enum.AutomaticSize.Y

		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = section_container
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.Padding = UDim.new(0, 8)

		local padding = Instance.new("UIPadding")
		padding.Parent = section_container
		padding.PaddingBottom = UDim.new(0, 8)
		padding.PaddingLeft = UDim.new(0, 8)
		padding.PaddingRight = UDim.new(0, 8)
		padding.PaddingTop = UDim.new(0, 8)

		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = section_container

		local gradient = Instance.new("UIGradient")
		gradient.Parent = section_container
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(16, 24, 40)), ColorSequenceKeypoint.new(0.49, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(16, 24, 40))}
		gradient.Rotation = 90

		self.section_frame = section_container
	end
end

--[[
todo:
ELEMENT CREATOR

]]



local button_class = table.create(8)
button_class.__index = button_class

do
	function button_class:_StoreConn(conn)
		return helper_functions:_StoreConn(self.stored_conn, conn)
	end

	function button_class:_Destroy()
		if not self or self.Destroyed then return end
		self.Destroyed = true

		for _, conn in ipairs(self.stored_conn) do
			if conn then
				conn = helper_functions:DisconnectConn(conn)
			end
		end

		if self.button then
			pcall(function()
				self.button:Destroy()
			end)
		end

		self.stored_conn = nil
		self.button = nil
	end

	function button_class:_CreateButton(parent, setting)
		if self.button then return end

		local button_container = Instance.new("Frame")
		button_container.Parent = parent
		button_container.Name = "Button"
		button_container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		button_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		button_container.BorderSizePixel = 0
		button_container.Size = UDim2.new(0.5, 0, 0, 20)

		button_container.Destroying:Once(function()
			self:_Destroy()
		end)

		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = button_container
		corner_radius.CornerRadius = UDim.new(0, 6)

		local gradient = Instance.new("UIGradient")
		gradient.Parent = button_container
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(54, 103, 148)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(155, 207, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(54, 103, 148))}
		gradient.Rotation = 90

		local label = Instance.new("TextLabel")
		label.Parent = button_container
		label.BackgroundTransparency = 1
		label.Name = "Label"
		label.Text = setting.Label
		label.TextSize = 14
		label.TextColor3 = Color3.fromRGB(255,255,255)
		label.Size = UDim2.new(1,0,1,0)
		label.Position = UDim2.new(0.025, 0, 0, 0)
		label.Font = Enum.Font.MontserratMedium
		label.TextStrokeTransparency = 0.75
		label.TextXAlignment = Enum.TextXAlignment.Left


		local text_size_ratio = Instance.new("UITextSizeConstraint")
		text_size_ratio.Parent = label
		text_size_ratio.MinTextSize = 1
		text_size_ratio.MaxTextSize = 14

		local button = Instance.new("TextButton")
		button.Parent = button_container
		button.Name = "btn"
		button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		button.BackgroundTransparency = 1.000
		button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		button.BorderSizePixel = 0
		button.Size = UDim2.new(1, 0, 1, 0)
		button.ZIndex = 3
		button.Font = Enum.Font.SourceSans
		button.Text = ""
		button.TextColor3 = Color3.fromRGB(0, 0, 0)
		button.TextSize = 14.000

		self:_StoreConn(button.MouseEnter:Connect(function()
			if not self.button then return end

			tween_service:Create(
				self.button,
				universal_tween,
				{BackgroundColor3 = Color3.fromRGB(102, 194, 255)}
			)
		end))

		self:_StoreConn(button.MouseLeave:Connect(function()
			if not self.button then return end

			tween_service:Create(
				self.button,
				universal_tween,
				{BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
			)
		end))

		self:_StoreConn(button.MouseButton1Click:Connect(function()
			if not self.button then return end

			if setting.Callback then
				setting.Callback()
			end
		end))


		self.button = button
	end
end

--[[
todo list checkbox:
i wrote this when im was so tired hehe

first set up basic functions
make  setvalue function which will change the box's tick also call the callback function
if theres one to send a signal that the tick turned on or off
set self.value  too 

for user-interaction
make toggle function for tick
make external setvalue function


create builder functions:
create the container for the checkbox first
then create the tick and set parent to container

then set up coreui manager function folloiwng the format accordinly and inject element to the 


]]

local checkbox_class = table.create(8)
checkbox_class.__index = checkbox_class
setmetatable(checkbox_class, { __index = container_base })

do
	function checkbox_class:SetValue(boolean)
		self:_SetValue(boolean)
		return self
	end
	
	function checkbox_class:GetBase()
		return self.checkbox_container
	end

	function checkbox_class:Toggle()
		self:_SetValue(not self.value)
		return self
	end

	function checkbox_class:SetState(boolean)
		self:_ChangeState(boolean)
		return self
	end

	function checkbox_class:_StoreConn(conn)
		return helper_functions:_StoreConn(self.stored_conn, conn)
	end

	function checkbox_class:_Destroy()
		if not self or self.Destroyed then return end
		self.Destroyed = true

		for _, conn in ipairs(self.stored_conn) do
			if conn then
				conn = helper_functions:DisconnectConn(conn)
			end
		end

		if self.checkbox_container then
			pcall(function()
				self.checkbox_container:Destroy()
			end)
		end

		self.stored_conn = nil
		self.checkbox_tick = nil
		self.checkbox_container = nil
	end

	function checkbox_class:_ChangeState(value)
		if not self.checkbox_container then return end

		self.state = value
		self.checkbox_container.BackgroundTransparency = not self.state and 0.500 or 1.000

		if self.callback then
			self:callback(false)
		end

		self:_SetValue(false)
	end

	function checkbox_class:_SetValue(value)
		if self.value == value then return end
		if not self.checkbox_tick then return end
		local target_transparency = (value == true and 0 or 1)

		tween_service:Create(self.checkbox_tick, universal_tween, {BackgroundTransparency = target_transparency}):Play()

		if self.callback then
			self:callback(value)
		end

		self.value = value
	end

	function checkbox_class:_CreateCheckBoxContainer(parent, setting)
		if self.checkbox_container then return end
		self.value = setting.Value
		self.state = setting.State
		self.callback = setting.Callback

		local check_box_container = Instance.new("Frame")
		check_box_container.Parent = parent
		check_box_container.Name = "Checkbox"
		check_box_container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		check_box_container.BackgroundTransparency = not self.state and 0.500 or 1.000
		check_box_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		check_box_container.BorderSizePixel = 0
		check_box_container.AutomaticSize = Enum.AutomaticSize.X
		check_box_container.Size = UDim2.new(1, 0, 0, 20)
		check_box_container.ZIndex = 2

		check_box_container.Destroying:Connect(function()
			self:_Destroy()
		end)

		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = check_box_container
		list_layout.FillDirection = Enum.FillDirection.Horizontal
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Center
		list_layout.Padding = UDim.new(0, 7)

		local corner_radius = Instance.new("UICorner")
		corner_radius.CornerRadius = UDim.new(0, 2)
		corner_radius.Parent = check_box_container

		local gradient = Instance.new("UIGradient")
		gradient.Parent = check_box_container
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(0.49, Color3.fromRGB(16, 16, 16)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 0, 0))}

		local label = Instance.new("TextLabel")
		label.Parent = check_box_container
		label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		label.BackgroundTransparency = 1.000
		label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		label.BorderSizePixel = 0
		label.LayoutOrder = 1
		label.Size = UDim2.new(0.9, 0, 1, 0)
		label.Font = Enum.Font.MontserratMedium
		label.Text = setting.Label
		label.TextColor3 = Color3.fromRGB(255, 255, 255)
		label.TextScaled = true
		label.TextSize = 14.000
		label.TextWrapped = true
		label.TextXAlignment = Enum.TextXAlignment.Left

		local text_size_ratio = Instance.new("UITextSizeConstraint")
		text_size_ratio.Parent = label
		text_size_ratio.MinTextSize = 1
		text_size_ratio.MaxTextSize = 14

		self.checkbox_container = check_box_container
	end

	function checkbox_class:_CreateCheckboxTick()
		if self.checkbox_tick then return end
		if not self.checkbox_container then return end

		local tick_container = Instance.new("Frame")
		tick_container.Name = "box"
		tick_container.Parent = self.checkbox_container
		tick_container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		tick_container.BackgroundTransparency = 0.500
		tick_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tick_container.BorderSizePixel = 0
		tick_container.Size = UDim2.new(0, 20, 0, 20)

		local btn_frame = Instance.new("TextButton")
		btn_frame.Parent = tick_container
		btn_frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		btn_frame.BackgroundTransparency = 1.000
		btn_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		btn_frame.BorderSizePixel = 0
		btn_frame.ZIndex = 5
		btn_frame.Size = UDim2.new(1, 0, 1, 0)
		btn_frame.Font = Enum.Font.SourceSans
		btn_frame.Text = ""
		btn_frame.TextColor3 = Color3.fromRGB(0, 0, 0)
		btn_frame.TextSize = 14.000

		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(16, 24, 40)), ColorSequenceKeypoint.new(0.49, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(16, 24, 40))}
		gradient.Parent = tick_container

		local stroke = Instance.new("UIStroke")
		stroke.Parent = tick_container
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Color = Color3.fromRGB(85, 85, 85)
		stroke.Transparency = 0.5

		local glow = Instance.new("Frame")
		glow.Parent = tick_container
		glow.AnchorPoint = Vector2.new(0.5, 0.5)
		glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		glow.BackgroundTransparency = 1.000
		glow.BorderColor3 = Color3.fromRGB(0, 0, 0)
		glow.BorderSizePixel = 0
		glow.Position = UDim2.new(0.5, 0, 0.5, 0)
		glow.Size = UDim2.new(0.75, 0, 0.75, 0)

		local corner_radius = Instance.new("UICorner")
		corner_radius.CornerRadius = UDim.new(0, 2)
		corner_radius.Parent = glow

		local secondary_gradient = Instance.new("UIGradient")
		secondary_gradient.Parent = glow
		secondary_gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(54, 103, 148)), ColorSequenceKeypoint.new(0.49, Color3.fromRGB(119, 193, 232)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(54, 103, 148))}

		self:_StoreConn(btn_frame.MouseButton1Click:Connect(function()
			if not self.checkbox_tick or not self.state then return end

			self:Toggle()
		end))

		self.checkbox_tick = glow
		self.btn_frame = btn_frame
	end
end

--[[
Dropdown element i also made this when i was tieed:

To start, build the foundation by creating internal builder functions.

Create three self variables which will be: value, items, and callback.

After building the dropdown foundation, create a mouse click connection that tracks if the
display btn is clicked. It'll check if dropdown exists first before toggling the visiblity of the dropdown.
Also creating two self variables which are dropdown_container and hidden.

All helper functions:
GetItems
AddItem
Clear
Open | It'll flip the arrow up and set visiblity.
Hide | opposite of open
_Destroy
_ClearItemList
_ChangeItem | callback
_RefreshList | It will clear list first before iterating throughs items table and creating item frame



and all basic functions

For user-interaction:
SetItem
GetItem
]]

local dropdown_class = table.create(8)
dropdown_class.__index = dropdown_class

do
	function dropdown_class:GetItems()
		return self.items
	end

	function dropdown_class:SetItem(value)
		self:_ChangeItem(value)
		return self
	end

	function dropdown_class:_StoreConn(conn)
		return helper_functions:_StoreConn(conn)
	end

	function dropdown_class:_Clear()
		if not self.Itemlist then return end

		for _, v in ipairs(self.Itemlist:GetChildren()) do
			if not v:IsA("TextButton") then continue end

			v:Destroy()
		end
	end

	function dropdown_class:_Destroy()
		if not self or self.Destroyed then return end
		self.Destroyed = true

		for _, conn in ipairs(self.stored_conn) do
			if conn then
				conn = helper_functions:DisconnectConn(conn)
			end
		end

		if self.dropdown_container then
			pcall(function()
				self.dropdown_container:Destroy()
			end)
		end

		self.stored_conn = nil
		self.dropdown_container = nil
		self.Itemlist = nil
		self.arrow_icon = nil
		self.Itemlist_container = nil
		self.Itemlist = nil
	end


	function dropdown_class:Hide()
		if self.hidden then return end

		tween_service:Create(self.arrow_icon, universal_tween, {Rotation = 0}):Play()

		self.Itemlist.Visible = false
		self.hidden = true
	end

	function dropdown_class:Open()
		if not self.hidden then return end

		self:_RefreshList()

		tween_service:Create(self.arrow_icon, universal_tween, {Rotation = 180}):Play()

		self.Itemlist.Visible = true
		self.hidden = false
	end

	function dropdown_class:_ChangeItem(value)
		if not self.Itemlist_container then return end

		local str = (value and tostring(value)) or "NIL"

		self.Itemlist_container.value.Text = str
		self.value = str

		if self.callback then
			self:callback(value)
		end
	end

	function dropdown_class:_RefreshList()
		if not self.Itemlist then return end

		self:_Clear()

		for i, str in ipairs(self.items) do
			local item_container = Instance.new("TextButton")
			item_container.Parent = self.Itemlist
			item_container.Name = tostring(str)
			item_container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			item_container.BackgroundTransparency = 1.000
			item_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
			item_container.BorderSizePixel = 0
			item_container.Size = UDim2.new(1, 0, 0, 20)
			item_container.Font = Enum.Font.MontserratMedium
			item_container.Text = ""
			item_container.TextColor3 = Color3.fromRGB(255, 255, 255)
			item_container.TextSize = 14.000

			local stroke = Instance.new("UIStroke")
			stroke.Parent = item_container
			stroke.Color = Color3.fromRGB(0,0,0)

			local icon = Instance.new("ImageLabel")
			icon.Parent = item_container
			icon.AnchorPoint = Vector2.new(1, 0)
			icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			icon.BorderSizePixel = 0
			icon.Position = UDim2.new(1, 0, 0, 0)
			icon.Size = UDim2.new(1, 0, 1, 0)
			icon.Image = self.image_order[i] or "rbxasset://textures/ui/GuiImagePlaceholder.png"

			local ratio = Instance.new("UIAspectRatioConstraint")
			ratio.Parent = icon

			local item_label = Instance.new("TextLabel")
			item_label.Name = "ItemLabel"
			item_label.Parent = item_container
			item_label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			item_label.BackgroundTransparency = 1.000
			item_label.BorderColor3 = Color3.fromRGB(0, 0, 0)
			item_label.BorderSizePixel = 0
			item_label.Size = UDim2.new(0.9, 0, 1, 0)
			item_label.Font = Enum.Font.MontserratMedium
			item_label.Text = tostring(str)
			item_label.TextColor3 = Color3.fromRGB(255, 255, 255)
			item_label.TextSize = 14.000

			self:_StoreConn(item_container.MouseButton1Click:Once(function()
				self:Hide()
				self:_ChangeItem(str)
			end))
		end
	end

	function dropdown_class:_CreateDropDownContainer(parent, setting)
		if self.dropdown_container then return end
		self.callback = setting.Callback
		self.items = setting["Items"]
		self.value = type(setting.selected) == "number" and self.items[setting.selected] or setting.selected
		self.image_order = setting["image"]

		local dropdown_container = Instance.new("Frame")
		dropdown_container.Parent = parent
		dropdown_container.Name = "Dropdown"
		dropdown_container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		dropdown_container.BackgroundTransparency = 1.000
		dropdown_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		dropdown_container.BorderSizePixel = 0
		dropdown_container.ZIndex = 4
		dropdown_container.Size = UDim2.new(0.7, 0, 0, 20)

		dropdown_container.Destroying:Once(function()
			self:_Destroy()
		end)

		local btn = Instance.new("TextButton")
		btn.Parent = dropdown_container
		btn.Name = "btn"
		btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		btn.BackgroundTransparency = 1.000
		btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
		btn.BorderSizePixel = 0
		btn.Size = UDim2.new(1, 0, 1, 0)
		btn.ZIndex = 3
		btn.Font = Enum.Font.SourceSans
		btn.Text = ""
		btn.TextColor3 = Color3.fromRGB(0, 0, 0)
		btn.TextSize = 14.000

		local label = Instance.new("TextLabel")
		label.Parent = dropdown_container
		label.Name = "Label"
		label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		label.BackgroundTransparency = 1.000
		label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		label.BorderSizePixel = 0
		label.Position = UDim2.new(0.7, 5, 0, 0)
		label.Size = UDim2.new(0.3, 0, 1, 0)
		label.Font = Enum.Font.MontserratMedium
		label.Text = setting.Label
		label.TextColor3 = Color3.fromRGB(255, 255, 255)
		label.TextSize = 14.000
		label.TextXAlignment = Enum.TextXAlignment.Left

		local text_size_ratio = Instance.new("UITextSizeConstraint")
		text_size_ratio.Parent = label
		text_size_ratio.MinTextSize = 1
		text_size_ratio.MaxTextSize = 14

		self:_StoreConn(btn.MouseButton1Click:Connect(function()
			if not self.Itemlist then return end

			if self.hidden then
				self:Open()
			else
				self:Hide()
			end
		end))

		self.dropdown_container = dropdown_container
		self.hidden = true
	end

	function dropdown_class:_CreateDropdownItemList()
		if self.Itemlist then return end
		if not self.dropdown_container then return end

		local itemlist_container = Instance.new("Frame")
		itemlist_container.Parent = self.dropdown_container
		itemlist_container.Name = "container"
		itemlist_container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		itemlist_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		itemlist_container.BorderSizePixel = 0
		itemlist_container.Size = UDim2.new(0.7, 0, 1, 0)

		local gradient = Instance.new("UIGradient")
		gradient.Parent = itemlist_container
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 14, 24)), ColorSequenceKeypoint.new(0.49, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 14, 24))}

		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = itemlist_container
		corner_radius.CornerRadius = UDim.new(0, 4)

		local arrow_icon = Instance.new("ImageLabel")
		arrow_icon.Parent = itemlist_container
		arrow_icon.AnchorPoint = Vector2.new(1, 0)
		arrow_icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		arrow_icon.BackgroundTransparency = 1.000
		arrow_icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		arrow_icon.BorderSizePixel = 0
		arrow_icon.Position = UDim2.new(1, 0, 0, 0)
		arrow_icon.Size = UDim2.new(1, 0, 1, 0)
		arrow_icon.Image = "rbxassetid://11552476728"

		local ratio = Instance.new("UIAspectRatioConstraint")
		ratio.Parent = arrow_icon

		local value = Instance.new("TextLabel")
		value.Name = "value"
		value.Parent = itemlist_container
		value.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		value.BackgroundTransparency = 1.000
		value.BorderColor3 = Color3.fromRGB(0, 0, 0)
		value.BorderSizePixel = 0
		value.Size = UDim2.new(0.9, 0, 1, 0)
		value.Font = Enum.Font.Gotham
		value.Text = tostring(self.value)
		value.TextColor3 = Color3.fromRGB(255, 255, 255)
		value.TextScaled = true
		value.TextSize = 14.000
		value.TextWrapped = true

		local text_size_ratio = Instance.new("UITextSizeConstraint")
		text_size_ratio.Parent = value
		text_size_ratio.MinTextSize = 1
		text_size_ratio.MaxTextSize = 14

		local item_list = Instance.new("Frame")
		item_list.Name = "ItemList"
		item_list.Parent = itemlist_container
		item_list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		item_list.BorderColor3 = Color3.fromRGB(0, 0, 0)
		item_list.AutomaticSize = Enum.AutomaticSize.Y
		item_list.BorderSizePixel = 0
		item_list.Visible = false
		item_list.Position = UDim2.new(0, 0, 0.8, 0)
		item_list.Size = UDim2.new(1, 0, 0, 0)


		corner_radius:Clone().Parent = item_list
		gradient:Clone().Parent = item_list

		local list_layout = Instance.new("UIListLayout")
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.Parent = item_list

		local padding_2 = Instance.new("UIPadding")
		padding_2.Parent = item_list
		padding_2.PaddingTop = UDim.new(0, 10)

		self.arrow_icon = arrow_icon
		self.Itemlist_container = itemlist_container
		self.Itemlist = item_list
	end
end

local divider_class = table.create(8)
divider_class.__index = divider_class

do
	function divider_class:_CreateDivider(parent)
		if self.divider then return end

		local divider = Instance.new("Frame")
		divider.Parent = parent
		divider.Name = "Divider"
		divider.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
		divider.BorderSizePixel = 0
		divider.Position = UDim2.new(0, 0, 0.966, 0)
		divider.Size = UDim2.new(1, 0, 0, 8)

		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = divider
		corner_radius.CornerRadius = UDim.new(1, 0)

		self.divider = divider
	end
end

local input_text_class = table.create(8)
input_text_class.__index = input_text_class

do

	function input_text_class:SetState(boolean)
		self:_ChangeState(boolean)
		return self
	end

	function input_text_class:_StoreConn(conn)
		return helper_functions:_StoreConn(self.stored_conn, conn)
	end

	function input_text_class:_Destroy()
		if not self or self.Destroyed then return end
		self.Destroyed = true

		for _, conn in ipairs(self.stored_conn) do
			if conn then
				conn = helper_functions:DisconnectConn(conn)
			end
		end

		if self.input_box_container then
			pcall(function()
				self.input_box_container:Destroy()
			end)
		end

		self.stored_conn = nil
		self.input_box_container = nil
	end

	function input_text_class:SetValue(value)
		self:_ChangeValue(value)
		return self
	end

	function input_text_class:_ChangeState(value)
		if not self.input_box_container then return end

		self.state = value
		self.input_box_container.BackgroundTransparency = not self.state and 0.500 or 1.000

		self:_ChangeValue(self.initial_value)
	end

	function input_text_class:_ChangeValue(value)
		if not self.inputbox then return end

		self.inputbox.Text = value
		self.value = value
	end

	function input_text_class:_CreateInputContainer(parent, setting)
		if self.input_box_container then return end

		self.placeholder_text = setting.placeholder_text

		self.value = setting.Value
		self.initial_value = self.value

		self.callback = setting.Callback
		self.label = setting.Label
		self.state = setting.State

		local inputbox_container = Instance.new("Frame")
		inputbox_container.Parent = parent
		inputbox_container.Name = "InputBox"
		inputbox_container.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		inputbox_container.BackgroundTransparency = not self.state and 0.500 or 1.000
		inputbox_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		inputbox_container.BorderSizePixel = 0
		inputbox_container.Position = UDim2.new(0.013, 0, 0.628, 0)
		inputbox_container.Size = UDim2.new(0.7, 0, 0, 20)
		inputbox_container.ZIndex = 2

		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = inputbox_container
		corner_radius.CornerRadius = UDim.new(0, 2)

		inputbox_container.Destroying:Once(function()
			self:_Destroy()
		end)

		local stroke = Instance.new("UIStroke")
		stroke.Parent = inputbox_container
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Thickness = 0.5
		stroke.Color = Color3.fromRGB(24, 44, 48)

		self.input_box_container = inputbox_container
	end

	function input_text_class:_CreateInputBox()
		if self.inputbox_frame then return end
		if not self.input_box_container then return end

		local inputbox_frame = Instance.new("Frame")
		inputbox_frame.Parent = self.input_box_container
		inputbox_frame.Name = "Input"
		inputbox_frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		inputbox_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		inputbox_frame.BorderSizePixel = 0
		inputbox_frame.Size = UDim2.new(0.7, 0, 1, 0)

		local label = Instance.new("TextLabel")
		label.Parent = inputbox_frame
		label.Name = "Label"
		label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		label.BackgroundTransparency = 1.000
		label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		label.BorderSizePixel = 0
		label.Position = UDim2.new(1, 5, 0, 0)
		label.Size = UDim2.new(0.3, 0, 1, 0)
		label.Font = Enum.Font.MontserratMedium
		label.Text = self.label
		label.TextColor3 = Color3.fromRGB(255, 255, 255)
		label.TextSize = 14.000
		label.TextXAlignment = Enum.TextXAlignment.Left

		local text_size_ratio = Instance.new("UITextSizeConstraint")
		text_size_ratio.Parent = label
		text_size_ratio.MinTextSize = 1
		text_size_ratio.MaxTextSize = 14

		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = inputbox_frame
		corner_radius.CornerRadius = UDim.new(0, 4)

		local gradient = Instance.new("UIGradient")
		gradient.Parent = inputbox_frame
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(10, 14, 24)), ColorSequenceKeypoint.new(0.49, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 14, 24))}

		local inputbox = Instance.new("TextBox")
		inputbox.Parent = inputbox_frame
		inputbox.AnchorPoint = Vector2.new(0.5, 0.5)
		inputbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		inputbox.BackgroundTransparency = 1.000
		inputbox.BorderColor3 = Color3.fromRGB(0, 0, 0)
		inputbox.BorderSizePixel = 0
		inputbox.Position = UDim2.new(0.5, 0, 0.5, 0)
		inputbox.Size = UDim2.new(1, 0, 1, 0)
		inputbox.Font = Enum.Font.MontserratMedium
		inputbox.PlaceholderText = self.placeholder_text
		inputbox.Text = self.value
		inputbox.TextColor3 = Color3.fromRGB(255, 255, 255)
		inputbox.TextSize = 14.000

		self:_StoreConn(inputbox:GetPropertyChangedSignal("Text"):Connect(function()
			if not self.state then
				self:_ChangeValue(self.initial_value)
				return
			end

			self.value = inputbox.Text

			if self.callback then
				self:callback(self.value)
			end
		end))

		self.inputbox = inputbox
		self.inputbox_frame = inputbox_frame
	end
end

local label_class = table.create(8)
label_class.__index = label_class

do	
	function label_class:SetText(value)
		self.label.Title.Text = value
		return self
	end

	function label_class:_Destroy()
		if not self or self.Destroyed then return end
		self.Destroyed = true

		if self.label then
			pcall(function()
				self.label:Destroy()
			end)
		end

		self.label = nil
	end

	function label_class:_CreateLabel(parent, setting)
		if self.label then return end

		local label = Instance.new("Frame")
		label.Parent = parent
		label.Name = "Label"
		label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		label.BackgroundTransparency = 1.000
		label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		label.BorderSizePixel = 0
		label.Size = UDim2.new(0.5, 0, 0, 20)

		label.Destroying:Once(function()
			self:_Destroy()
		end)

		local title = Instance.new("TextLabel")
		title.Parent = label
		title.Name = "Title"
		title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		title.BackgroundTransparency = 1.000
		title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		title.BorderSizePixel = 0
		title.Size = UDim2.new(1, 0, 1, 0)
		title.Font = setting.Font
		title.Text = setting.Text
		title.TextColor3 = Color3.fromRGB(206, 206, 206)
		title.TextSize = setting.TextSize
		title.TextXAlignment = setting.TextXAlignment
		title.TextYAlignment = setting.TextYAlignment

		self.label = label
	end
end


--[[
Slider element:
It's a bit more complicated

1: create the ui creators func
2: find a way how to make it move




]]

local slider_class = table.create(8)
slider_class.__index = slider_class

do
	function slider_class:SetValue(value)
		self:_ChangeValue(value)
		return self
	end

	function slider_class:_StoreConn(conn)
		return helper_functions:_StoreConn(self.stored_conn, conn)
	end

	function slider_class:_Destroy()
		if not self or self.Destroyed then return end
		self.Destroyed = true

		for _, conn in ipairs(self.stored_conn) do
			if conn then
				conn = helper_functions:DisconnectConn(conn)
			end
		end

		if self.slider_container then
			pcall(function()
				self.slider_container:Destroy()
			end)
		end

		self.stored_conn = nil
		self.slider_container = nil
		self.bar = nil
		self.box = nil
	end


	function slider_class:_CreateSliderContainer(parent, setting)
		if self.slider_container then return end

		self.max = setting.Maximum
		self.min = setting.Minimum
		self.title = setting.Label
		self.callback = setting.Callback
		self.value = setting.Value
		self.format = setting.Decimal

		local slider_container = Instance.new("Frame")
		slider_container.Parent = parent
		slider_container.Name = "Slider"
		slider_container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		slider_container.BackgroundTransparency = 1.000
		slider_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		slider_container.BorderSizePixel = 0
		slider_container.Size = UDim2.new(1, 0, 0, 20)

		self.slider_container = slider_container
	end

	function slider_class:_Update(input_obj)
		local mouse_x = input_obj.Position.X
		local percentage, value = self:_GetMouseValue(mouse_x)

		local format = tonumber(self.format:match("%.(%d+)"))

		local shift = 10 ^ format

		value = math.floor(value * shift + 0.5) / shift

		self.value = value
		self.counter_frame.Label.Text = self.value .. " " .. self.title

		if self.callback then
			self:callback(self.value)
		end

		self.bar.Size = UDim2.new(percentage, 0, 1, 0)
	end

	function slider_class:_GetMouseValue(mouseX)
		local input_position_x = mouseX
		local minimum_value = self.min or 0
		local maximum_value = self.max or 100

		local box_width = self.box.AbsoluteSize.X
		local box_edge = self.box.AbsolutePosition.X
		local handle_width = self.handle_frame.AbsoluteSize.X

		local min_pos = handle_width * 0.5
		local max_pos = box_width - handle_width

		local relative_x = mouseX - box_edge
		relative_x = math.clamp(relative_x, min_pos, max_pos)

		local clamped = math.clamp(relative_x / box_width, 0, 1)

		local alpha = helper_functions:InverseLerp(min_pos, max_pos, relative_x)
		local value = helper_functions:Lerp(minimum_value, maximum_value, alpha)

		return clamped, value
	end

	function slider_class:_GetSliderOffset(value, minimum_value, maximum_value)
		local alpha = helper_functions:InverseLerp(minimum_value, maximum_value, value)

		return alpha
	end

	function slider_class:_ChangeValue(value)
		if not self.counter_frame then return end
		if not self.bar then return end

		self.value = value
		self.bar.Size = UDim2.new(slider_class:_GetSliderOffset(self.value, self.min, self.max), 0, 1, 0)

		self.counter_frame.Label.Text = self.value .. " " .. self.title

		if self.callback then
			self:callback(self.value)
		end
	end

	function slider_class:_CreateSliderBar()
		if not self.slider_container then return end

		local box = Instance.new("TextButton")
		box.Parent = self.slider_container
		box.Name = "Box"
		box.AnchorPoint = Vector2.new(0, 0.5)
		box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		box.Text = ""
		box.BorderColor3 = Color3.fromRGB(0, 0, 0)
		box.BorderSizePixel = 0
		box.Position = UDim2.new(0, 0, 0.5, 0)
		box.Size = UDim2.new(0.8, 0, 0.5, 0)
		box.AutoButtonColor = false


		local gradient = Instance.new("UIGradient")
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(16, 24, 40)), ColorSequenceKeypoint.new(0.49, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(16, 24, 40))}
		gradient.Parent = box

		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = box
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder

		local padding = Instance.new("UIPadding")
		padding.Parent = box
		padding.PaddingBottom = UDim.new(0, 2)
		padding.PaddingLeft = UDim.new(0, 4)
		padding.PaddingRight = UDim.new(0, 4)
		padding.PaddingTop = UDim.new(0, 2)

		local bar = Instance.new("Frame")
		bar.Parent = box
		bar.Name = "Bar"
		bar.AnchorPoint = Vector2.new(0, 0.5)
		bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		bar.BorderSizePixel = 0
		bar.Position = UDim2.new(0, 0, 0.5, 0)
		bar.Size = UDim2.new(slider_class:_GetSliderOffset(self.value, self.min, self.max), 0, 1, 0)


		local gradient_2 = Instance.new("UIGradient")
		gradient_2.Parent = bar
		gradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(54, 103, 148)), ColorSequenceKeypoint.new(0.48, Color3.fromRGB(155, 207, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(54, 103, 148))}
		gradient_2.Rotation = 90

		local handle_frame = Instance.new("Frame")
		handle_frame.Parent = bar
		handle_frame.Name = "Handle"
		handle_frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		handle_frame.BackgroundTransparency = 0.500
		handle_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		handle_frame.BorderSizePixel = 0
		handle_frame.AnchorPoint = Vector2.new(0, 0.5)
		handle_frame.Position = UDim2.new(1, 0, 0.5, 0)
		handle_frame.Size = UDim2.new(0, 15, 0, 21)

		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = handle_frame

		local gradient = Instance.new("UIGradient")
		gradient.Parent = handle_frame
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 35, 59)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(13, 13, 13)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(24, 35, 59))}

		local stroke = Instance.new("UIStroke")
		stroke.Parent = handle_frame
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Color = Color3.fromRGB(27, 27, 27)

		self:_StoreConn(box.InputBegan:Connect(function(input_obj)
			if input_obj.UserInputType ~= Enum.UserInputType.MouseButton1 then return end

			self.dragging = true
			self:_Update(input_obj)
		end))

		self:_StoreConn(userinput_service.InputEnded:Connect(function(input_obj)
			if input_obj.UserInputType ~= Enum.UserInputType.MouseButton1 then return end

			self.dragging = false
		end))

		self:_StoreConn(userinput_service.InputChanged:Connect(function(input_obj)
			if not self.dragging or input_obj.UserInputType ~= Enum.UserInputType.MouseMovement then return end

			self:_Update(input_obj)
		end))

		self.box = box
		self.bar = bar

		self.handle_frame = handle_frame
	end

	function slider_class:_CreateSliderCounter()
		if not self.slider_container then return end

		local counter_frame = Instance.new("Frame")
		counter_frame.Parent = self.slider_container
		counter_frame.Name = "Counter"
		counter_frame.AnchorPoint = Vector2.new(0.5, 0)
		counter_frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		counter_frame.BackgroundTransparency = 0.300
		counter_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		counter_frame.BorderSizePixel = 0
		counter_frame.Position = UDim2.new(0.9, 5, 0, 0)
		counter_frame.Size = UDim2.new(0.2, 0, 1, 0)

		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = counter_frame

		local gradient_3 = Instance.new("UIGradient")
		gradient_3.Parent = counter_frame
		gradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 35, 59)), ColorSequenceKeypoint.new(0.50, Color3.fromRGB(13, 13, 13)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(24, 35, 59))}

		local stroke = Instance.new("UIStroke")
		stroke.Parent = counter_frame

		gradient_3:Clone().Parent = stroke

		local Label = Instance.new("TextLabel")
		Label.Parent = counter_frame
		Label.Name = "Label"
		Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Label.BackgroundTransparency = 1.000
		Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Label.BorderSizePixel = 0
		Label.TextScaled = true
		Label.Size = UDim2.new(1, 0, 1, 0)
		Label.Font = Enum.Font.MontserratMedium
		Label.Text = self.value .. " " .. self.title
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.TextSize = 14.000

		local text_size_ratio = Instance.new("UITextSizeConstraint")
		text_size_ratio.Parent = Label
		text_size_ratio.MinTextSize = 1
		text_size_ratio.MaxTextSize = 14

		self.counter_frame = counter_frame
	end
end

local keybind_class = table.create(8)
keybind_class.__index = keybind_class

do
	function keybind_class:_StoreConn(conn)
		return helper_functions:_StoreConn(self.stored_conn, conn)
	end

	function keybind_class:_Destroy()
		if not self or self.Destroyed then return end
		self.Destroyed = true

		for _, conn in ipairs(self.stored_conn) do
			if conn then
				conn = helper_functions:DisconnectConn(conn)
			end
		end

		if self.slider_container then
			pcall(function()
				self.slider_container:Destroy()
			end)
		end

		self.stored_conn = nil
		self.keybind_container = nil
	end

	function keybind_class:_ConvertKeycodeToText(keycode)
		local raw = keycode.Name
		return raw
	end

	function keybind_class:_CreateKeybind(parent, setting)
		if self.keybind_container then return end

		self.value = setting.DefaultValue
		self.callback = setting.Callback

		local keybind_container = Instance.new("Frame")
		keybind_container.Parent = parent
		keybind_container.Name = "Keybind"
		keybind_container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		keybind_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		keybind_container.BorderSizePixel = 0
		keybind_container.Position = UDim2.new(0, 0, 0.831, 0)
		keybind_container.Size = UDim2.new(0.4, 0, 0, 30)

		keybind_container.Destroying:Connect(function()
			self:_Destroy()
		end)

		local gradient = Instance.new("UIGradient")
		gradient.Parent = keybind_container
		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(16, 24, 40)), ColorSequenceKeypoint.new(0.49, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(16, 24, 40))}


		local label = Instance.new("TextLabel")
		label.Parent = keybind_container
		label.Name = "Label"
		label.AnchorPoint = Vector2.new(0, 0.5)
		label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		label.BackgroundTransparency = 1.000
		label.BorderColor3 = Color3.fromRGB(0, 0, 0)
		label.BorderSizePixel = 0
		label.Position = UDim2.new(1, 10, 0.5, 0)
		label.Size = UDim2.new(0.300000012, 0, 1, 0)
		label.Font = Enum.Font.GothamMedium
		label.Text = setting.Label
		label.TextColor3 = Color3.fromRGB(255, 255, 255)
		label.TextSize = 16.000
		label.TextXAlignment = Enum.TextXAlignment.Left

		local text_size_ratio = Instance.new("UITextSizeConstraint")
		text_size_ratio.Parent = label
		text_size_ratio.MinTextSize = 1
		text_size_ratio.MaxTextSize = 14

		local input_box = Instance.new("TextButton")
		input_box.Parent = keybind_container
		input_box.Name = "Input"
		input_box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		input_box.BackgroundTransparency = 1
		input_box.BorderColor3 = Color3.fromRGB(0, 0, 0)
		input_box.BorderSizePixel = 0
		input_box.Size = UDim2.new(1, 0, 1, 0)
		input_box.Font = Enum.Font.MontserratMedium
		input_box.Text = self:_ConvertKeycodeToText(self.value)
		input_box.TextColor3 = Color3.fromRGB(255, 255, 255)
		input_box.TextSize = 14.000
		input_box.ZIndex = 3

		text_size_ratio:Clone().Parent = text_size_ratio

		local stroke = Instance.new("UIStroke")
		stroke.Parent = input_box
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Color = Color3.fromRGB(38, 50, 70)

		self:_StoreConn(input_box.MouseButton1Click:Connect(function()
			if self.active then return end

			self.new_value = nil
			self.active = true

			while self.active do
				input_box.Text = "..."
				task.wait(0.5)
			end
		end))

		self:_StoreConn(userinput_service.InputBegan:Connect(function(input, processed)
			if processed or input.UserInputType ~= Enum.UserInputType.Keyboard then return end

			if self.active then
				self.new_value = input.KeyCode
				self.active = false


				self.value = self.new_value
				input_box.Text = self:_ConvertKeycodeToText(self.value)
			end

			if self.callback and input.KeyCode == self.value then
				self:callback(self.value)
			end
		end))

		self.keybind_container = keybind_container
	end
end

local group_class = table.create(8)
group_class.__index = group_class
setmetatable(group_class, { __index = container_base })


do 
	function group_class:GetBase()
		return self.group_container
	end

	function group_class:_CreateGroupContent(parent, setting)
		if self.group_container then return end

		local group_container = Instance.new("Frame")
		group_container.Parent = parent
		group_container.Name = "Group"
		group_container.Size = UDim2.new(1, 0, 0, 0)
		group_container.AutomaticSize = Enum.AutomaticSize.Y
		group_container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		group_container.BackgroundTransparency = 0.400
		group_container.BorderColor3 = Color3.fromRGB(0, 0, 0)
		group_container.BorderSizePixel = 0

		local corner_radius = Instance.new("UICorner")
		local padding = Instance.new("UIPadding")
		local list_layout = Instance.new("UIListLayout")
		local gradient = Instance.new("UIGradient")
		local stroke = Instance.new("UIStroke")

		gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(16, 24, 40)), ColorSequenceKeypoint.new(0.49, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(16, 24, 40))}
		gradient.Parent = group_container

		corner_radius.Parent = group_container

		padding.Parent = group_container
		padding.PaddingBottom = UDim.new(0, 8)
		padding.PaddingLeft = UDim.new(0, 8)
		padding.PaddingRight = UDim.new(0, 8)
		padding.PaddingTop = UDim.new(0, 8)

		list_layout.Parent = group_container
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.Padding = UDim.new(0, 8)

		stroke.Parent = group_container
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Transparency = 0.5
		stroke.Color = Color3.fromRGB(35, 35, 35)

		self.group_container = group_container
	end
end

--[[

inject setting icon to an element

upon clicking on it, it will show a popup which is contain_based
elements can now add things inside the box

supported elements:

checkbox

]]

local pop_up_class = table.create(8)
pop_up_class.__index = pop_up_class
setmetatable(pop_up_class, { __index = container_base })

do
	
	function pop_up_class:GetBase()
		return self.content
	end
	
	function pop_up_class:_StoreConn(conn)
		return helper_functions:_StoreConn(self.stored_conn, conn)
	end
	
	function pop_up_class:_Destroy()
		if not self or self.Destroyed then return end
		self.Destroyed = true

		for _, conn in ipairs(self.stored_conn) do
			if conn then
				conn = helper_functions:DisconnectConn(conn)
			end
		end

		if self.popup_window then
			pcall(function()
				self.popup_window:Destroy()
			end)
		end

		self.stored_conn = nil
		self.title_bar = nil
		self.popup_window = nil
	end

	function pop_up_class:_CreatePopup(parent, setting)
		if self.popup_window then return end
		
		self.title = setting.Title 
		
		local popup_window = Instance.new("Frame")
		popup_window.Name = "popup_window"
		popup_window.Parent = parent
		popup_window.AnchorPoint = Vector2.new(0.5, 0.5)
		popup_window.BackgroundColor3 = Color3.fromRGB(21, 46, 54)
		popup_window.BackgroundTransparency = 0.350
		popup_window.BorderColor3 = Color3.fromRGB(0, 0, 0)
		popup_window.BorderSizePixel = 0
		popup_window.Active = true
		popup_window.ClipsDescendants = true
		popup_window.Position = UDim2.new(0.5, 0, 0.5, 0)
		popup_window.Size = UDim2.new(0.5, 0, 0.5, 0)
		popup_window.ZIndex = 3
		
		local corner_radius = Instance.new("UICorner")
		corner_radius.Parent = popup_window
		
		local stroke = Instance.new("UIStroke")
		stroke.Parent = popup_window
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		stroke.Color = Color3.fromRGB(255, 255, 255)
		
		local gradient = Instance.new("UIGradient")
		gradient.Parent = stroke
		gradient.Transparency = NumberSequence.new{
			NumberSequenceKeypoint.new(0.00, 0.00), 
			NumberSequenceKeypoint.new(0.51, 1.00), 
			NumberSequenceKeypoint.new(1.00, 0.00)
		}
		gradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0, Color3.fromRGB(68, 126, 139)), 
			ColorSequenceKeypoint.new(1, Color3.fromRGB(68, 126, 139))
		}
		gradient.Rotation = 60
		
		self.popup_window = popup_window
	end
	
	function pop_up_class:_CreateTitleBar()
		if self.title_bar then return end
		if not self.popup_window then return end

		local title_bar = Instance.new("Frame")
		title_bar.Name = "TitleBar"
		title_bar.Parent = self.popup_window
		title_bar.BackgroundColor3 = Color3.fromRGB(16, 20, 26)
		title_bar.BackgroundTransparency = 1.000
		title_bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
		title_bar.BorderSizePixel = 0
		title_bar.ClipsDescendants = true
		title_bar.LayoutOrder = -1
		title_bar.Position = UDim2.new(0, 0, -0.002, 0)
		title_bar.Size = UDim2.new(1, 0, 0.185, 0)
		title_bar.ZIndex = 2

		local padding = Instance.new("UIPadding")
		padding.Parent = title_bar
		padding.PaddingLeft = UDim.new(0, 15)

		local management_frame = Instance.new("Frame")
		management_frame.Parent = title_bar
		management_frame.AnchorPoint = Vector2.new(1, 0)
		management_frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		management_frame.BackgroundTransparency = 1.000
		management_frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		management_frame.BorderSizePixel = 0
		management_frame.Position = UDim2.new(1, 0, 0, 0)
		management_frame.Size = UDim2.new(0.2, 0, 1, 0)

		local list_layout = Instance.new("UIListLayout")
		list_layout.Parent = management_frame
		list_layout.FillDirection = Enum.FillDirection.Horizontal
		list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
		list_layout.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout.VerticalAlignment = Enum.VerticalAlignment.Center
		list_layout.Padding = UDim.new(0, 7)

		local padding_2 = Instance.new("UIPadding")
		padding_2.Parent = management_frame
		padding_2.PaddingRight = UDim.new(0, 7)

		local close_btn = Instance.new("Frame")
		close_btn.Name = "CloseBtn"
		close_btn.Parent = management_frame
		close_btn.AnchorPoint = Vector2.new(0, 0.5)
		close_btn.BackgroundColor3 = Color3.fromRGB(13, 19, 26)
		close_btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
		close_btn.BorderSizePixel = 0
		close_btn.LayoutOrder = 1
		close_btn.Size = UDim2.new(0.6, 0, 0.6, 0)

		local close_btn_img = Instance.new("ImageButton")
		close_btn_img.Name = "CloseBtn"
		close_btn_img.Parent = close_btn
		close_btn_img.AnchorPoint = Vector2.new(0.5, 0.5)
		close_btn_img.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		close_btn_img.BackgroundTransparency = 1.000
		close_btn_img.BorderColor3 = Color3.fromRGB(0, 0, 0)
		close_btn_img.BorderSizePixel = 0
		close_btn_img.LayoutOrder = 2
		close_btn_img.Position = UDim2.new(0.5, 0, 0.5, 0)
		close_btn_img.Size = UDim2.new(0.75, 0, 0.75, 0)
		close_btn_img.Image = "rbxassetid://10137832201"
		close_btn_img.ImageTransparency = 0.500
		close_btn_img.ZIndex = 5

		local aspect_ratio = Instance.new("UIAspectRatioConstraint")
		aspect_ratio.Parent = close_btn

		local corner = Instance.new("UICorner")
		corner.Parent = close_btn

		local content = Instance.new("Frame")
		content.Name = "Content"
		content.Parent = self.popup_window
		content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		content.BackgroundTransparency = 1.000
		content.BorderColor3 = Color3.fromRGB(0, 0, 0)
		content.BorderSizePixel = 0
		content.Position = UDim2.new(0, 0, 0.2, 0)
		content.Size = UDim2.new(1, 0, 0.8, 0)

		local padding_3 = Instance.new("UIPadding")
		padding_3.Parent = content
		padding_3.PaddingLeft = UDim.new(0, 7)
		padding_3.PaddingRight = UDim.new(0, 7)

		local list_layout_2 = Instance.new("UIListLayout")
		list_layout_2.Parent = content
		list_layout_2.FillDirection = Enum.FillDirection.Vertical
		list_layout_2.SortOrder = Enum.SortOrder.LayoutOrder
		list_layout_2.VerticalAlignment = Enum.VerticalAlignment.Top
		list_layout_2.Padding = UDim.new(0, 7)
		
		local title = Instance.new("TextLabel")
		title.Parent = title_bar
		title.Name = "Title"
		title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		title.BackgroundTransparency = 1.000
		title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		title.BorderSizePixel = 0
		title.Size = UDim2.new(1, 0, 1, 0)
		title.Font = Enum.Font.MontserratMedium
		title.Text = self.title
		title.TextColor3 = Color3.fromRGB(206, 206, 206)
		title.TextSize = 14
		title.TextXAlignment = Enum.TextXAlignment.Left
		title.TextYAlignment = Enum.TextYAlignment.Center
		
		self:_StoreConn(close_btn_img.MouseButton1Click:Once(function() 
			self:_Destroy()
		end))

		self.title_bar = title_bar
		self.content = content
	end
end

local settings_class = table.create(8)
settings_class.__index = settings_class

do
	function settings_class:_InjectIcon(parent, setting)
		if self.setting_icon then return end
		
		self.callback = setting.Callback
		
		local setting_icon = Instance.new("ImageButton")
		setting_icon.Parent = parent
		setting_icon.Name = "Setting"
		setting_icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		setting_icon.BackgroundTransparency = 1.000
		setting_icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
		setting_icon.BorderSizePixel = 0
		setting_icon.Size = UDim2.new(1, 0, 1, 0)
		setting_icon.Image = "rbxassetid://1402032193"
		
		local ratio = Instance.new("UIAspectRatioConstraint")
		ratio.Parent = setting_icon
		
		setting_icon.MouseButton1Click:Connect(function()
			self:callback()
		end)
		
		self.setting_icon = setting_icon
	end
end

core_ui_manager = {} do
	function core_ui_manager:Init()
		local success, coreUI = pcall(function()
			return not run_service:IsStudio() and ((gethui and gethui()) or 
				get_hidden_gui and get_hidden_gui or
				helper_functions:cloneRef(game:GetService("CoreGui")).RobloxGui) or players.LocalPlayer.PlayerGui
		end)

		if success then
			local safe_gui = Instance.new("ScreenGui")
			safe_gui.Parent = coreUI
			safe_gui.Name = "ZYVIX"
			safe_gui.ResetOnSpawn = false
			safe_gui.IgnoreGuiInset = true
			safe_gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			self.safe_gui = safe_gui
		else
			print("Critical error: no suitable parent found")
		end
	end
	core_ui_manager:Init()

	function core_ui_manager:coreCreateWindow(setting)
		local window_obj = setmetatable({}, main_window_class)

		--// set up tbls for the class
		window_obj.stored_tween = {}
		window_obj.stored_conn = {}
		window_obj.collapsed = setting.Collapsed

		window_obj:_CreateWindowBase(self.safe_gui, setting)
		window_obj:_CreateWindowContainer()
		window_obj:_CreateContentFrame()
		window_obj:_CreateTitlebar(setting)

		if setting.management_btns then
			window_obj:_CreateManagementButtons()
		end

		if setting.Collapsed then
			window_obj:Collapse()
		end

		return window_obj
	end

	function core_ui_manager:coreCreateTablist(parent)
		local tablist_obj = setmetatable({}, tab_list_class)

		tablist_obj.tabs = table.create(12)	

		tablist_obj:_CreateContainer(parent)
		tablist_obj:_InitContent(parent)
		tablist_obj:_CreateContent()

		return tablist_obj
	end

	function core_ui_manager:coreCreateSection(parent, setting)
		local section_obj = setmetatable({}, section_class)

		section_obj:_CreateScrollingCanvas(parent, setting)
		section_obj:_CreateSection(setting)

		return section_obj
	end

	function core_ui_manager:coreCreateButton(parent, setting)
		local button_obj = setmetatable({}, button_class)
		button_obj.stored_conn = {}

		button_obj:_CreateButton(parent, setting)

		return button_obj
	end

	function core_ui_manager:coreCreateCheckbox(parent, setting)
		local checkbox_obj = setmetatable({}, checkbox_class)
		checkbox_obj.stored_conn = {}

		checkbox_obj:_CreateCheckBoxContainer(parent, setting)
		checkbox_obj:_CreateCheckboxTick()

		checkbox_obj.checkbox_tick.BackgroundTransparency = (setting.Value and 0 or 1)

		return checkbox_obj
	end

	function core_ui_manager:coreCreateDropdown(parent, setting)
		local dropdown_obj = setmetatable({}, dropdown_class)
		dropdown_obj.stored_conn = {}

		dropdown_obj:_CreateDropDownContainer(parent, setting)
		dropdown_obj:_CreateDropdownItemList()

		return dropdown_obj
	end

	function core_ui_manager:coreCreateDivider(parent)
		local divider_obj = setmetatable({}, divider_class)

		divider_obj:_CreateDivider(parent)

		return divider_obj
	end

	function core_ui_manager:coreCreateInputBox(parent, setting)
		local inputbox_obj = setmetatable({}, input_text_class)
		inputbox_obj.stored_conn = {}

		inputbox_obj:_CreateInputContainer(parent, setting)
		inputbox_obj:_CreateInputBox()

		return inputbox_obj
	end

	function core_ui_manager:coreCreateLabel(parent, setting)
		local label_obj = setmetatable({}, label_class)

		label_obj:_CreateLabel(parent, setting)

		return label_obj
	end

	function core_ui_manager:coreCreateSlider(parent, setting)
		local slider_obj = setmetatable({}, slider_class)
		slider_obj.stored_conn = {}

		slider_obj:_CreateSliderContainer(parent, setting)
		slider_obj:_CreateSliderBar()
		slider_obj:_CreateSliderCounter()

		return slider_obj
	end

	function core_ui_manager:coreCreateKeybind(parent, setting)
		local keybind_obj = setmetatable({}, keybind_class)
		keybind_obj.stored_conn = {}

		keybind_obj:_CreateKeybind(parent, setting)

		return keybind_obj
	end

	function core_ui_manager:coreCreateGroup(parent, setting)
		local group_obj = setmetatable({}, group_class)

		group_obj:_CreateGroupContent(parent, setting)

		return group_obj
	end
	
	function core_ui_manager:coreCreatePopup(parent, setting)
		local pop_up_obj = setmetatable({}, pop_up_class)
		pop_up_obj.stored_conn = {}
		
		pop_up_obj:_CreatePopup(parent, setting)
		pop_up_obj:_CreateTitleBar()
		
		return pop_up_obj
	end
	function core_ui_manager:coreInjectSetting(parent, setting)
		local setting_obj = setmetatable({}, settings_class)

		setting_obj:_InjectIcon(parent, setting)

		return setting_obj
	end
end

helper_functions = {} do
	function helper_functions:SetConfig(default, setting)
		setting = setting or {}

		for i, v in next, default do
			if not setting[i] then
				setting[i] = v
			end
		end

		return setting
	end

	function helper_functions:_StoreConn(tbl, conn)
		if type(conn) == "table" then
			for i, conn in next, tbl do
				local connection = ensure_funcs:IsValidConn(conn)
				if not connection then return end

				tbl[#tbl + 1] = connection
			end

			return conn
		end
		local connection = ensure_funcs:IsValidConn(conn)
		if not connection then return end

		tbl[#tbl + 1] = connection
		return connection
	end

	function helper_functions:DisconnectConn(conn: RBXScriptConnection?)
		if conn then
			conn:Disconnect()
		end
		return nil
	end

	function helper_functions:DestroyElement()

	end

	function helper_functions:InverseLerp(min, max, value)
		if min == max then return 0 end

		return (value - min) / (max - min)
	end

	function helper_functions:Lerp(start_val, end_val, alpha)
		return start_val + (end_val - start_val) * alpha
	end
end

--[[
	Main API
]]

function ZYVIX:InjectElement(title, func)
	self.compontments[title] = func

	local converted = function(self, config)
		return func(self, config)
	end

	container_base[title] = converted
end

function ZYVIX:CreateWindow(setting)
	setting = helper_functions:SetConfig({
		Title = "ZYVIX",
		Position = UDim2.new(0.5, 0, 0.5, -200),
		Size = UDim2.new(0, 800, 0, 450),
		icon_id = "rbxassetid://74606228102976",
		management_btns = true,
		Collapsed = false,
	}, setting)

	local object = core_ui_manager:coreCreateWindow(setting)

	object._CreateWindowBase = nil
	object._CreateWindowContainer = nil
	object._CreateContentFrame = nil
	object._CreateTitleBar = nil
	object._CreateManagementButtons = nil

	return object
end

ZYVIX:InjectElement("Tablist", function(parent)
	local tab_list_main = core_ui_manager:coreCreateTablist(parent:GetBase())

	tab_list_main._CreateContainer = nil
	tab_list_main._CreateContent = nil

	return tab_list_main
end)

ZYVIX:InjectElement("Section", function(parent, setting)
	local section_main = core_ui_manager:coreCreateSection(parent:GetBase(), setting)

	section_main._CreateScrollingCanvas = nil
	section_main._CreateSection = nil

	return section_main
end)

ZYVIX:InjectElement("Group", function(parent, setting)
	local group_main = core_ui_manager:coreCreateGroup(parent:GetBase(), setting)

	group_main._CreateGroupContent = nil

	return group_main
end)

ZYVIX:InjectElement("Button", function(parent, setting)
	setting = helper_functions:SetConfig({
		Label = "nil",
		Callback = function()
			print("Button pressed!")
		end,
	}, setting)

	local button_obj = core_ui_manager:coreCreateButton(parent:GetBase(), setting)

	button_obj._CreateButton = nil
	button_obj._StoreConn = nil

	return button_obj
end)

ZYVIX:InjectElement("Checkbox", function(parent, setting)
	setting = helper_functions:SetConfig({
		Label = "nil",
		Value = false,
		State = true, -- optional
		Callback = function(self, value)
			print("Checkbox pressed!", value)
		end,
	}, setting)

	local checkbox_obj = core_ui_manager:coreCreateCheckbox(parent:GetBase(), setting)

	checkbox_obj._CreateCheckBoxContainer = nil
	checkbox_obj._CreateCheckboxTick = nil

	return checkbox_obj
end)

ZYVIX:InjectElement("Dropdown", function(parent, setting)
	setting = helper_functions:SetConfig({
		Label = "Dropdown",
		Items = {
			"test",
			"option 2"
		},
		image = {
			[1] = "rbxassetid://8508980536",
			[2] = "rbxassetid://6319951718"
		},
		selected = 1,
		Callback = function(self, value)
			print("selected:", value)
		end,
	}, setting)

	local dropdown_obj = core_ui_manager:coreCreateDropdown(parent:GetBase(), setting)

	dropdown_obj._CreateDropDownContainer = nil
	dropdown_obj._CreateDropdownItemList = nil

	return dropdown_obj
end)

ZYVIX:InjectElement("Divider", function(parent)
	local divider_obj = core_ui_manager:coreCreateDivider(parent:GetBase())

	divider_obj._CreateDivider = nil

	return divider_obj
end)

ZYVIX:InjectElement("InputBox", function(parent, setting)
	setting = helper_functions:SetConfig({
		Label = "Speed",
		placeholder_text = "number",
		Value = "2",
		State = true,
		Callback = function(self, value)
			print(value)
		end,
	}, setting)

	local inputbox_obj = core_ui_manager:coreCreateInputBox(parent:GetBase(), setting)

	inputbox_obj._CreateInputContainer = nil
	inputbox_obj._CreateInputBox = nil

	return inputbox_obj
end)

ZYVIX:InjectElement("Label", function(parent, setting)
	setting = helper_functions:SetConfig({
		Font = Enum.Font.MontserratMedium,
		Text = "Section2",
		TextSize = 14.000,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,

	}, setting)

	local label_obj = core_ui_manager:coreCreateLabel(parent:GetBase(), setting)

	label_obj._CreateLabel = nil

	return label_obj
end)

ZYVIX:InjectElement("Slider", function(parent, setting)
	setting = helper_functions:SetConfig({
		Label = "speed",
		Minimum = 0,
		Maximum = 100,
		Value = 25,
		Decimal = ".0",
		Callback = function(self, value)
			print(value)
		end,
	}, setting)

	local slider_obj = core_ui_manager:coreCreateSlider(parent:GetBase(), setting)

	slider_obj._CreateSliderContainer = nil
	slider_obj._CreateSliderBar = nil
	slider_obj._CreateSliderCounter = nil

	return slider_obj
end)

ZYVIX:InjectElement("Keybind", function(parent, setting)
	setting = helper_functions:SetConfig({
		Label = "Fly Keybind",
		DefaultValue = Enum.KeyCode.F,
		Callback = function(self, value)
			print("WSIgrjorgrw")
		end,
	}, setting)

	local keybind_obj = core_ui_manager:coreCreateKeybind(parent:GetBase(), setting)

	keybind_obj._CreateKeybind = nil

	return keybind_obj
end)

ZYVIX:InjectElement("MiniWindow", function(parent, setting)
	setting = helper_functions:SetConfig({
		Title = "nil"
	}, setting)	
	
	local pop_up_obj = core_ui_manager:coreCreatePopup(parent:GetContainer(), setting)

	pop_up_obj._CreatePopup = nil
	pop_up_obj._CreateTitleBar = nil

	return pop_up_obj
end)

ZYVIX:InjectElement("InjectSetting", function(parent, setting)
	setting = helper_functions:SetConfig({
		Callback = function()
			print("touched")
		end,
	}, setting)	

	local setting_obj = core_ui_manager:coreInjectSetting(parent:GetBase(), setting)

	setting_obj._InjectIcon = nil

	return setting_obj
end)



return ZYVIX

--[[
todo list

after everything, try abusing inputs and identify bugs and flaws 
]]
