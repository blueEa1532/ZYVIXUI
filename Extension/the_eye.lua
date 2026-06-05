--AN EXTENSION FOR ZYVIX UI




if not game:IsLoaded() then game.Loaded:Wait() end

local the_eye = script.Parent

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
local players = proxy.Players
local userinput_service = proxy.UserInputService


local local_player = players.LocalPlayer


local main_genv = getgenv and getgenv() or _G
if main_genv and main_genv._the_eye then
	return main_genv._the_eye
end

local window_frame = the_eye.window_frame
local main_container = window_frame.main_container

local content_frame = main_container.MainFrame

local analyze = content_frame.Analyze 

local universal_tween = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

local main_frame = content_frame.Main
local properties_frame = main_frame.Properties
local inner_property_frame = properties_frame.Inner

local connection_frame = main_frame.Connections
local console_frame_connection = connection_frame.Console

local elements_folder = main_frame.Elements

local can_put_elements = {}


local memory_manager = {}

do
	function memory_manager:GetAllCharacter()
		local characters = {}

		for _, plr in ipairs(players:GetPlayers()) do
			local target_character = plr.Character
			if not target_character then continue end

			table.insert(characters, target_character)
		end

		return characters
	end

	function memory_manager:StoreData(char)
		local hrp = char:FindFirstChild("HumanoidRootPart")
		if not hrp then return end

		self.memorys[char.Name] = {}
		self.memorys[char.Name].Positions = {}

		table.insert(self.memorys[char.Name].Positions, hrp.Position)

		local part = Instance.new("Part")
		part.Parent = workspace
		part.Anchored = true
		part.Size = Vector3.new(1, 1, 1)
		part.CanCollide = false
		part.Position = hrp.Position
	end

	function memory_manager:ScanAllPlayers()
		for _, character in ipairs(self:GetAllCharacter()) do
			self:StoreData(character)
		end
	end

end

local memory_class = {}
memory_class.__index = memory_class

do
	function memory_class:GetAllHrps()
		local hrps = {}

		for _, plr in ipairs(players:GetPlayers()) do
			local target_character = plr.Character
			if not target_character then continue end

			local target_hrp = target_character:FindFirstChild("HumanoidRootPart")
			if not target_hrp then continue end

			table.insert(hrps, target_hrp)
		end

		return hrps
	end
end

local loading = {}

function loading:_Init()
	self.loading_frame = content_frame.Loading
	self.load_content = self.loading_frame.Content
	self.inner_ring = self.load_content.InnerRing
	self.outer_ring = self.load_content.OuterRing

	self.console = self.load_content.Console
	self.template = self.console.Template

	task.defer(function()
		while task.wait() do
			self.inner_ring.Rotation -= 1
			self.outer_ring.Rotation += 1
		end
	end)
end

function loading:AddLog(str)
	str = (str and tostring(str)) or "Nil"
	local copy = self.template:Clone()
	copy.Visible = true
	copy.Parent = self.console
	copy.TextTransparency = 0

	copy.Text = str
	task.wait()
end

function loading:close()
	local close = tween_service:Create(self.loading_frame, universal_tween, {
		Size = UDim2.new(0, 0, 0.5, 0)
	})

	close.Completed:Once(function()
		self.loading_frame.Visible = false
	end)

	close:Play()
end

function loading:load(func)
	self.loading_frame.Size = UDim2.new(0, 0, 0.5, 0)
	self.loading_frame.Visible = true

	tween_service:Create(self.loading_frame, universal_tween, {Size = UDim2.new(0.5, 0, 0.5, 0)}):Play()

	content_frame.Injection.Visible = true
	content_frame["scan lines"].Visible = true

	local tween_info = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

	tween_service:Create(content_frame.Injection, tween_info, {ImageTransparency = 0}):Play()
	tween_service:Create(content_frame["scan lines"], tween_info, {ImageTransparency = 0.8}):Play()

	if func then
		func()
	end

	self:AddLog("completed")

	task.wait(1)

	self:close()
	main_frame.Visible = true
end

local other_property_class = table.create(8)
other_property_class.__index = other_property_class

do
	function other_property_class:SetValue(value)
		if not self.value_label then return end

		self.value_label.Text = value
	end

	function other_property_class:AddProperty(setting)
		local template = inner_property_frame.Template:Clone()
		template.Parent = inner_property_frame
		template.Visible = true

		local property_label = template.Property
		local value_label = template.Value

		self.property_label = property_label
		self.value_label = value_label

		property_label.Text = setting.PropertyLabel
		value_label.Text = setting.ValueLabel
	end
end

local part_info_class = table.create(8)
part_info_class.__index = part_info_class

do
	function part_info_class:Destroy()
		if not self.selection_box then return end
		
		for _, conn in ipairs(self.stored_conn) do
			conn = helper_functions:DisconnectConn(conn)
		end
		
		if self.selection_box then
			pcall(function() self.selection_box:Destroy() end)
		end

	end

	function part_info_class:_CreateSelectionBox(parent)
		if self.selection_box then return end
		
		local selection_box = content_frame.SelectionBox:Clone()
		
		self.subject = parent
		self.size = parent.Size.Magnitude * 2
				
		selection_box.Parent = parent
		selection_box.Enabled = true
		selection_box.Size = UDim2.new(self.size, 0, self.size, 0)
		
		local image = selection_box.SelectionBox
		helper_functions:_StoreConn(self.stored_conn, run_service.RenderStepped:Connect(function(dt)
			image.Rotation += 1
		end))
		
		self.selection_box = selection_box
	end
end

local window_class = table.create(8)
window_class.__index = window_class
setmetatable(window_class, { __index = can_put_elements} )

do
	function window_class:GetBase()
		return self.console
	end
	
	function window_class:SetVisiblity(value)
		if value == self.visible then return self end
		
		self.window.Visible = value
		self.visible = value
		
		return self
	end
		
	function window_class:_CreateWindow()
		if self.console then return end
		
		local dynamic_frame = main_frame.Dynamic
		local window_frame = dynamic_frame.Window:Clone()
		window_frame.Parent = dynamic_frame
		window_frame.Visible = true
		
		local console = window_frame.Console
		
		self.window = window_frame
		self.visible = true
		self.console = console
	end
end

local label_class = table.create(8)
label_class.__index = label_class

do
	function label_class:SetValue(str)
		self.label.Title.Text = str
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
		
		local label_frame = elements_folder:FindFirstChild("Label"):Clone()
		label_frame.Parent = parent
		label_frame.Visible = true
		
		label_frame.Destroying:Once(self._Destroy)
		
		local label_text = label_frame.Title
		label_text.Text = setting.Text
		
		self.label = label_frame
	end
end

local property_class = table.create(8)
property_class.__index = property_class

do
	function property_class:SetValue(str)
		self.property_frame.Value.Text = str
		return self
	end
	
	function property_class:_Destroy()
		if not self or self.Destroyed then return end
		self.Destroyed = true

		if self.property_frame then
			pcall(function()
				self.property_frame:Destroy()
			end)
		end

		self.property_frame = nil
	end
	
	function property_class:_CreateProperty(parent, setting)
		if self.property_frame then return end
		
		local property_frame = elements_folder:FindFirstChild("Property"):Clone()
		property_frame.Parent = parent
		property_frame.Visible = true
		
		property_frame.Destroying:Connect(self._Destroy)
		
		local property_label = property_frame.Property
		local value_label = property_frame.Value
				
		property_label.Text = tostring(setting.Property)
		value_label.Text = tostring(setting.Value)
		
		self.property_frame = property_frame
	end
end

local connection_class = table.create(8)
connection_class.__index = connection_class
do
	function connection_class:_StoreConn(conn)
		return helper_functions:_StoreConn(self.stored_conn, conn)
	end
	
	function connection_class:_Destroy()
		if not self or self.Destroyed then return end
		self.Destroyed = true

		for _, conn in ipairs(self.stored_conn) do
			if conn then
				conn = helper_functions:DisconnectConn(conn)
			end
		end

		if self.connection_frame then
			pcall(function()
				self.connection_frame:Destroy()
			end)
		end

		self.stored_conn = nil
		self.connection_frame = nil
	end
	
	function connection_class:_ConvertKeycodeToText(keycode)
		local raw = keycode.Name
		return raw
	end
	
	function connection_class:_CreateConn(setting)
		if self.connection_frame then return end
		
		self.value = setting.Keybind
		self.callback = setting.Callback
		
		local connection_frame = console_frame_connection.Connection:Clone()
		connection_frame.Parent = console_frame_connection
		connection_frame.Visible = true
		
		local keybind_name = connection_frame.KeybindName
		local desc_frame = connection_frame.Detail
		
		keybind_name.Text = self:_ConvertKeycodeToText(self.value)
		desc_frame.Text = setting.Description
		
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
		
		self.connection_frame = connection_frame
	end
end

local annoucement_class = table.create(8)
annoucement_class.__index = annoucement_class

do
	function annoucement_class:_Destroy()
		if not self or self.Destroyed then return end
		self.Destroyed = true

		if self.alert_frame then
			pcall(function()
				self.alert_frame:Destroy()
			end)
		end

		self.alert_frame = nil
	end
	
	function annoucement_class:Appear()
		tween_service:Create(self.alert_frame, universal_tween, {BackgroundTransparency = 0.9}):Play()
		tween_service:Create(self.alert_frame.Title, universal_tween, {TextTransparency = 0}):Play()
		
		for _, frames in ipairs(self.alert_frame:GetChildren()) do
			if not frames:IsA("ImageLabel") then continue end
			
			tween_service:Create(frames, universal_tween, {ImageTransparency = 0.8}):Play()
		end
		
		task.wait(0.5)
	end
	
	function annoucement_class:Close()
		tween_service:Create(self.alert_frame, universal_tween, {BackgroundTransparency = 1}):Play()
		tween_service:Create(self.alert_frame.Title, universal_tween, {TextTransparency = 1}):Play()

		for _, frames in ipairs(self.alert_frame:GetChildren()) do
			if not frames:IsA("ImageLabel") then continue end

			tween_service:Create(frames, universal_tween, {ImageTransparency = 1}):Play()
		end
		
		task.wait(0.5)
	end
	
	function annoucement_class:_CreateFrame(parent, setting)
		if self.alert_frame then return end
		
		local alert_frame = elements_folder:FindFirstChild("Annoucement"):Clone()
		alert_frame.Parent = parent
		alert_frame.Visible = true
		local title_label = alert_frame.Title
		title_label.Text = setting.Title
		
		task.defer(function()
			while task.wait() and self.alert_frame do
				alert_frame.InnerRing.Rotation += 1
				alert_frame.OuterRing.Rotation -= 1
			end
		end)
		
		self.alert_frame = alert_frame
		
		self:Appear()
		
		task.delay(setting.Duration, function()
			self:Close()
			self:_Destroy()
		end)
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
				local connection = conn
				if not connection then return end

				tbl[#tbl + 1] = connection
			end

			return conn
		end
		local connection = conn
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

end

local manager = {}

function manager:InjectElement(title, func)
	local converted = function(self, config)
		return func(self, config)
	end

	can_put_elements[title] = converted
end

function manager:load(func)
	loading:_Init()
	loading:load(func)
end

function manager:AddLogLoad(str)
	loading:AddLog(str)
end

function manager:ConstantMemoryScan()
	memory_manager.memorys = {}

	task.defer(function()
		while task.wait(1) do
			memory_manager:ScanAllPlayers()
		end
	end)

	players.PlayerRemoving:Connect(function(player)
		if memory_manager[player.Name] then
			memory_manager[player.Name] = nil
		end
	end)
end

manager:ConstantMemoryScan()

function manager:CreatePropertyWindow()
	local window_obj = setmetatable({}, window_class)
	window_obj:_CreateWindow()
	
	return window_obj
end

function manager:AddProperty(setting)
	setting = helper_functions:SetConfig({
		PropertyLabel = "HP",
		ValueLabel = "100",
	}, setting)
	
	local property_obj = setmetatable({}, other_property_class)
	property_obj:AddProperty(setting)

	return property_obj
end

function manager:GetBase()
	return main_frame
end

function manager:AddSelectionBox(parent)
	
	local part_info_obj = setmetatable({}, part_info_class)
	part_info_obj.stored_conn = table.create(1)
	
	part_info_obj:_CreateSelectionBox(parent)
	
	return part_info_obj
end


manager:InjectElement("Label", function(parent, setting)
	setting = helper_functions:SetConfig({
		Text = "Nil",
	}, setting)
	
	local label_obj = setmetatable({}, label_class)
	label_obj:_CreateLabel(parent:GetBase(), setting)
	
	label_obj._CreateLabel = nil
	
	return label_obj
end)

manager:InjectElement("Property", function(parent, setting)
	setting = helper_functions:SetConfig({
		Property = "HP",
		Value = "100",
	}, setting)

	local property_obj = setmetatable({}, property_class)
	property_obj:_CreateProperty(parent:GetBase(), setting)

	property_obj._CreateProperty = nil

	return property_obj
end)

function manager:Alert(parent, setting)
	setting = helper_functions:SetConfig({
		Title = "ALERT",
		Duration = 3,
		
	}, setting)

	local alert_obj = setmetatable({}, annoucement_class)
	alert_obj:_CreateFrame(parent:GetBase(), setting)

	alert_obj._CreateFrame = nil

	return alert_obj
end


function manager:Connection(setting)
	setting = helper_functions:SetConfig({
		Keybind = Enum.KeyCode.P,
		Description = "hello i am a keybind",
		Callback = function(self, value)
			print("value")
		end,
	}, setting)

	local connnection_obj = setmetatable({}, connection_class)
	connnection_obj.stored_conn = {}
	
	connnection_obj:_CreateConn(setting)

	connnection_obj._CreateConn = nil

	return connnection_obj
end


return manager