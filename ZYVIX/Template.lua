local ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/blueEa1532/ZYVIXUI/refs/heads/main/ZYVIX/ZYVIXUI.lua"))()

local h4ck3r = ui:CreateWindow()

local tablist = h4ck3r:Tablist()

local tab2 = tablist:CreateTab("hei")

local function CreateSection(Parent, Title)
	local Region = Parent:Section()

	if Title then
		Region:Label({
			Text = Title,
		})
	end

	return Region
end


local function CreateGroup(Parent, Title)
	local Group = Parent:Group()

	if Title then
		Group:Label({
			Text = Title,
		})
	end

	return Group
end


local sec = CreateSection(tab2, "title")
local se2c = CreateSection(tab2, "example")

sec:Button({
	Label = "tesxr",
	Callback = function()
		print("Weopfkweopfkweopwf")
	end,
})

e = sec:Checkbox({
	Label = "hey",
	Value = true,
	Callback = function(self, value)
		print(value)
	end,
})

e:SetState(false)

sec:Divider()

e = sec:Dropdown({
	Label = "Dropdown",
	Items = {
		"hello",
		"option 2"
	},
	selected = 1,
	Callback = function(self, value)
		print("selected:", value)
	end,
})

e:SetItem("option 2")

sec:Label({Text = "hello"})

local fuck_you = 24

a = sec:InputBox({
	Label = "Jump",
	placeholder_text = "number",
	Value = "24",
	State = false,
	Callback = function(self, value)
		fuck_you = value
		print(fuck_you)
	end,
})

local group = CreateGroup(sec, "group 1")

qwef = group:Slider({
	Label = "speed",
	Minimum = 25,
	Maximum = 100,
	Value = 50,
	Decimal = ".0",
	Callback = function(self, value)
		print("yay", value)
	end,
})


group:Keybind({
	Label = "Fly Keybind",
	DefaultValue = Enum.KeyCode.F,
	Callback = function(self, value)
		print("just look around")
	end,
})

task.wait(10)
