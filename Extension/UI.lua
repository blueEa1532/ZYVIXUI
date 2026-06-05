--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERR 
]=]

-- Instances: 167 | Scripts: 0 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.eye
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["IgnoreGuiInset"] = true;
G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets;
G2L["1"]["Name"] = [[eye]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.eye.window_frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[window_frame]];
G2L["2"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container
G2L["3"] = Instance.new("CanvasGroup", G2L["2"]);
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["AutomaticSize"] = Enum.AutomaticSize.Y;
G2L["3"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Name"] = [[main_container]];
G2L["3"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.UIStroke
G2L["4"] = Instance.new("UIStroke", G2L["3"]);
G2L["4"]["Thickness"] = 2;
G2L["4"]["Color"] = Color3.fromRGB(131, 233, 255);
G2L["4"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.eye.window_frame.main_container.UICorner
G2L["5"] = Instance.new("UICorner", G2L["3"]);



-- StarterGui.eye.window_frame.main_container.UIListLayout
G2L["6"] = Instance.new("UIListLayout", G2L["3"]);
G2L["6"]["VerticalFlex"] = Enum.UIFlexAlignment.Fill;
G2L["6"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.eye.window_frame.main_container.MainFrame
G2L["7"] = Instance.new("Frame", G2L["3"]);
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Name"] = [[MainFrame]];
G2L["7"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Injection
G2L["8"] = Instance.new("ImageLabel", G2L["7"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["ImageTransparency"] = 1;
G2L["8"]["Image"] = [[rbxassetid://1066498967]];
G2L["8"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["8"]["Visible"] = false;
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["BackgroundTransparency"] = 1;
G2L["8"]["Name"] = [[Injection]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze
G2L["9"] = Instance.new("Frame", G2L["7"]);
G2L["9"]["Visible"] = false;
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["9"]["Size"] = UDim2.new(0.25, 0, 1, 0);
G2L["9"]["Position"] = UDim2.new(1, 0, 0, 0);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Name"] = [[Analyze]];
G2L["9"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info
G2L["a"] = Instance.new("Frame", G2L["9"]);
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["Size"] = UDim2.new(1, 0, 0, 150);
G2L["a"]["Position"] = UDim2.new(0.1, 0, 0.05, 0);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Name"] = [[Info]];
G2L["a"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo
G2L["b"] = Instance.new("Frame", G2L["a"]);
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(68, 206, 255);
G2L["b"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["b"]["Size"] = UDim2.new(1, 0, 0.9, 0);
G2L["b"]["Position"] = UDim2.new(1, 0, 0, 0);
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["Name"] = [[MainInfo]];
G2L["b"]["BackgroundTransparency"] = 0.7;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.UIStroke
G2L["c"] = Instance.new("UIStroke", G2L["b"]);
G2L["c"]["Color"] = Color3.fromRGB(133, 225, 235);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.UICorner
G2L["d"] = Instance.new("UICorner", G2L["b"]);



-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.info
G2L["e"] = Instance.new("Frame", G2L["b"]);
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["e"]["Position"] = UDim2.new(0.1, 0, 0, 0);
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Name"] = [[info]];
G2L["e"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.info.UIListLayout
G2L["f"] = Instance.new("UIListLayout", G2L["e"]);
G2L["f"]["Padding"] = UDim.new(0, 25);
G2L["f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.info.UIPadding
G2L["10"] = Instance.new("UIPadding", G2L["e"]);
G2L["10"]["PaddingTop"] = UDim.new(0, 8);
G2L["10"]["PaddingRight"] = UDim.new(0, 8);
G2L["10"]["PaddingLeft"] = UDim.new(0, 8);
G2L["10"]["PaddingBottom"] = UDim.new(0, 8);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.info.Instance
G2L["11"] = Instance.new("Frame", G2L["e"]);
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["Size"] = UDim2.new(0.5, 0, 0, 20);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Name"] = [[Instance]];
G2L["11"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.info.Instance.Title
G2L["12"] = Instance.new("TextLabel", G2L["11"]);
G2L["12"]["TextStrokeTransparency"] = 0;
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["TextSize"] = 20;
G2L["12"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["12"]["TextStrokeColor3"] = Color3.fromRGB(100, 168, 255);
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["12"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal);
G2L["12"]["TextColor3"] = Color3.fromRGB(93, 242, 255);
G2L["12"]["BackgroundTransparency"] = 1;
G2L["12"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["Text"] = [[INSTANCE OF: NIL]];
G2L["12"]["Name"] = [[Title]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.info.Instance.Title.UITextSizeConstraint
G2L["13"] = Instance.new("UITextSizeConstraint", G2L["12"]);
G2L["13"]["MaxTextSize"] = 20;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.info.Type
G2L["14"] = Instance.new("Frame", G2L["e"]);
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["14"]["Size"] = UDim2.new(0.5, 0, 0, 20);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Name"] = [[Type]];
G2L["14"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.info.Type.Title
G2L["15"] = Instance.new("TextLabel", G2L["14"]);
G2L["15"]["TextStrokeTransparency"] = 0;
G2L["15"]["BorderSizePixel"] = 0;
G2L["15"]["TextSize"] = 20;
G2L["15"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["15"]["TextStrokeColor3"] = Color3.fromRGB(100, 168, 255);
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal);
G2L["15"]["TextColor3"] = Color3.fromRGB(93, 242, 255);
G2L["15"]["BackgroundTransparency"] = 1;
G2L["15"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["Text"] = [[TYPE: NIL]];
G2L["15"]["Name"] = [[Title]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.info.Type.Title.UITextSizeConstraint
G2L["16"] = Instance.new("UITextSizeConstraint", G2L["15"]);
G2L["16"]["MaxTextSize"] = 20;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.info.Status
G2L["17"] = Instance.new("Frame", G2L["e"]);
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["17"]["Size"] = UDim2.new(0.5, 0, 0, 20);
G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["Name"] = [[Status]];
G2L["17"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.info.Status.Title
G2L["18"] = Instance.new("TextLabel", G2L["17"]);
G2L["18"]["TextStrokeTransparency"] = 0;
G2L["18"]["BorderSizePixel"] = 0;
G2L["18"]["TextSize"] = 20;
G2L["18"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["18"]["TextStrokeColor3"] = Color3.fromRGB(100, 168, 255);
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["18"]["FontFace"] = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal);
G2L["18"]["TextColor3"] = Color3.fromRGB(93, 242, 255);
G2L["18"]["BackgroundTransparency"] = 1;
G2L["18"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["18"]["Text"] = [[STATUS: NIL]];
G2L["18"]["Name"] = [[Title]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.info.Status.Title.UITextSizeConstraint
G2L["19"] = Instance.new("UITextSizeConstraint", G2L["18"]);
G2L["19"]["MaxTextSize"] = 20;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.Divider
G2L["1a"] = Instance.new("Frame", G2L["b"]);
G2L["1a"]["BorderSizePixel"] = 0;
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(133, 225, 235);
G2L["1a"]["Size"] = UDim2.new(0.003, 0, 1, 0);
G2L["1a"]["Position"] = UDim2.new(0.1, 0, 0, 0);
G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["Name"] = [[Divider]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.tab
G2L["1b"] = Instance.new("ImageLabel", G2L["b"]);
G2L["1b"]["ZIndex"] = 10;
G2L["1b"]["BorderSizePixel"] = 0;
G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1b"]["ImageTransparency"] = 0.5;
G2L["1b"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["1b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1b"]["Image"] = [[rbxassetid://16336479573]];
G2L["1b"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1b"]["BackgroundTransparency"] = 1;
G2L["1b"]["Name"] = [[tab]];
G2L["1b"]["Position"] = UDim2.new(0.5, 0, 0, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.tab
G2L["1c"] = Instance.new("ImageLabel", G2L["b"]);
G2L["1c"]["ZIndex"] = 10;
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["ImageTransparency"] = 0.5;
G2L["1c"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["1c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1c"]["Image"] = [[rbxassetid://16336479573]];
G2L["1c"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["BackgroundTransparency"] = 1;
G2L["1c"]["Name"] = [[tab]];
G2L["1c"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.tab
G2L["1d"] = Instance.new("ImageLabel", G2L["b"]);
G2L["1d"]["ZIndex"] = 10;
G2L["1d"]["BorderSizePixel"] = 0;
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1d"]["ImageTransparency"] = 0.8;
G2L["1d"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["1d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1d"]["Image"] = [[rbxassetid://16336479573]];
G2L["1d"]["Size"] = UDim2.new(0, 10, 1, 0);
G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["BackgroundTransparency"] = 1;
G2L["1d"]["Name"] = [[tab]];
G2L["1d"]["Position"] = UDim2.new(0, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.MainInfo.tab
G2L["1e"] = Instance.new("ImageLabel", G2L["b"]);
G2L["1e"]["ZIndex"] = 10;
G2L["1e"]["BorderSizePixel"] = 0;
G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1e"]["ImageTransparency"] = 0.8;
G2L["1e"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["1e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1e"]["Image"] = [[rbxassetid://16336479573]];
G2L["1e"]["Size"] = UDim2.new(0, 10, 1, 0);
G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1e"]["BackgroundTransparency"] = 1;
G2L["1e"]["Name"] = [[tab]];
G2L["1e"]["Position"] = UDim2.new(1, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Info.Glow
G2L["1f"] = Instance.new("ImageLabel", G2L["a"]);
G2L["1f"]["ZIndex"] = -10;
G2L["1f"]["BorderSizePixel"] = 0;
G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1f"]["ImageTransparency"] = 0.5;
G2L["1f"]["ImageColor3"] = Color3.fromRGB(38, 175, 217);
G2L["1f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1f"]["Image"] = [[rbxassetid://5538771868]];
G2L["1f"]["Size"] = UDim2.new(1.6, 0, 2, 0);
G2L["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1f"]["BackgroundTransparency"] = 1;
G2L["1f"]["Name"] = [[Glow]];
G2L["1f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties
G2L["20"] = Instance.new("Frame", G2L["9"]);
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["AnchorPoint"] = Vector2.new(1, 1);
G2L["20"]["Size"] = UDim2.new(0.8, 0, 0.02824, 150);
G2L["20"]["Position"] = UDim2.new(0.95, 0, 0.97824, 0);
G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["Name"] = [[Properties]];
G2L["20"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Inner
G2L["21"] = Instance.new("Frame", G2L["20"]);
G2L["21"]["BorderSizePixel"] = 0;
G2L["21"]["BackgroundColor3"] = Color3.fromRGB(25, 195, 232);
G2L["21"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["21"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["21"]["Name"] = [[Inner]];
G2L["21"]["BackgroundTransparency"] = 0.9;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Inner.UICorner
G2L["22"] = Instance.new("UICorner", G2L["21"]);



-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Inner.UIStroke
G2L["23"] = Instance.new("UIStroke", G2L["21"]);
G2L["23"]["Thickness"] = 1.5;
G2L["23"]["Color"] = Color3.fromRGB(164, 246, 255);
G2L["23"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["23"]["LineJoinMode"] = Enum.LineJoinMode.Bevel;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Inner.PropertyContainer
G2L["24"] = Instance.new("Frame", G2L["21"]);
G2L["24"]["BorderSizePixel"] = 0;
G2L["24"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["24"]["Size"] = UDim2.new(0.5, 0, 0, 30);
G2L["24"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["24"]["Name"] = [[PropertyContainer]];
G2L["24"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Inner.PropertyContainer.UIStroke
G2L["25"] = Instance.new("UIStroke", G2L["24"]);
G2L["25"]["Thickness"] = 1.5;
G2L["25"]["Color"] = Color3.fromRGB(164, 246, 255);
G2L["25"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Inner.PropertyContainer.Property
G2L["26"] = Instance.new("TextLabel", G2L["24"]);
G2L["26"]["BorderSizePixel"] = 0;
G2L["26"]["TextSize"] = 25;
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(164, 246, 255);
G2L["26"]["FontFace"] = Font.new([[rbxassetid://11598289817]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["26"]["TextColor3"] = Color3.fromRGB(164, 246, 255);
G2L["26"]["BackgroundTransparency"] = 1;
G2L["26"]["Size"] = UDim2.new(0.5, 0, 1, 0);
G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["Text"] = [[HP]];
G2L["26"]["Name"] = [[Property]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Inner.PropertyContainer.Property.UITextSizeConstraint
G2L["27"] = Instance.new("UITextSizeConstraint", G2L["26"]);
G2L["27"]["MaxTextSize"] = 25;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Inner.PropertyContainer.Value
G2L["28"] = Instance.new("TextLabel", G2L["24"]);
G2L["28"]["BorderSizePixel"] = 0;
G2L["28"]["TextSize"] = 25;
G2L["28"]["BackgroundColor3"] = Color3.fromRGB(164, 246, 255);
G2L["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Light, Enum.FontStyle.Normal);
G2L["28"]["TextColor3"] = Color3.fromRGB(164, 246, 255);
G2L["28"]["BackgroundTransparency"] = 1;
G2L["28"]["Size"] = UDim2.new(0.5, 0, 1, 0);
G2L["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["28"]["Text"] = [[100]];
G2L["28"]["Name"] = [[Value]];
G2L["28"]["Position"] = UDim2.new(0.5, 0, 0, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Inner.PropertyContainer.Value.UITextSizeConstraint
G2L["29"] = Instance.new("UITextSizeConstraint", G2L["28"]);
G2L["29"]["MaxTextSize"] = 25;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Inner.PropertyContainer.Glow
G2L["2a"] = Instance.new("ImageLabel", G2L["24"]);
G2L["2a"]["ZIndex"] = 0;
G2L["2a"]["BorderSizePixel"] = 0;
G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2a"]["ImageTransparency"] = 0.7;
G2L["2a"]["ImageColor3"] = Color3.fromRGB(25, 195, 232);
G2L["2a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2a"]["Image"] = [[rbxassetid://129224956712931]];
G2L["2a"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2a"]["BackgroundTransparency"] = 1;
G2L["2a"]["Name"] = [[Glow]];
G2L["2a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Inner.UIPadding
G2L["2b"] = Instance.new("UIPadding", G2L["21"]);
G2L["2b"]["PaddingTop"] = UDim.new(0, 8);
G2L["2b"]["PaddingRight"] = UDim.new(0, 8);
G2L["2b"]["PaddingLeft"] = UDim.new(0, 8);
G2L["2b"]["PaddingBottom"] = UDim.new(0, 8);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Inner.UIListLayout
G2L["2c"] = Instance.new("UIListLayout", G2L["21"]);
G2L["2c"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
G2L["2c"]["Wraps"] = true;
G2L["2c"]["Padding"] = UDim.new(0, 10);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Glow
G2L["2d"] = Instance.new("ImageLabel", G2L["20"]);
G2L["2d"]["ZIndex"] = -10;
G2L["2d"]["BorderSizePixel"] = 0;
G2L["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2d"]["ImageTransparency"] = 0.5;
G2L["2d"]["ImageColor3"] = Color3.fromRGB(38, 175, 217);
G2L["2d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2d"]["Image"] = [[rbxassetid://5538771868]];
G2L["2d"]["Size"] = UDim2.new(1.6, 0, 2, 0);
G2L["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2d"]["BackgroundTransparency"] = 1;
G2L["2d"]["Name"] = [[Glow]];
G2L["2d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.Glow
G2L["2e"] = Instance.new("ImageLabel", G2L["20"]);
G2L["2e"]["ZIndex"] = 0;
G2L["2e"]["BorderSizePixel"] = 0;
G2L["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2e"]["ImageTransparency"] = 0.7;
G2L["2e"]["ImageColor3"] = Color3.fromRGB(25, 195, 232);
G2L["2e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2e"]["Image"] = [[rbxassetid://129224956712931]];
G2L["2e"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2e"]["BackgroundTransparency"] = 1;
G2L["2e"]["Name"] = [[Glow]];
G2L["2e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.tab
G2L["2f"] = Instance.new("ImageLabel", G2L["20"]);
G2L["2f"]["ZIndex"] = 10;
G2L["2f"]["BorderSizePixel"] = 0;
G2L["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2f"]["ImageTransparency"] = 0.5;
G2L["2f"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["2f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2f"]["Image"] = [[rbxassetid://16336479573]];
G2L["2f"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2f"]["BackgroundTransparency"] = 1;
G2L["2f"]["Name"] = [[tab]];
G2L["2f"]["Position"] = UDim2.new(0.5, 0, 0, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Properties.tab
G2L["30"] = Instance.new("ImageLabel", G2L["20"]);
G2L["30"]["ZIndex"] = 10;
G2L["30"]["BorderSizePixel"] = 0;
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["ImageTransparency"] = 0.5;
G2L["30"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["30"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["30"]["Image"] = [[rbxassetid://16336479573]];
G2L["30"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["BackgroundTransparency"] = 1;
G2L["30"]["Name"] = [[tab]];
G2L["30"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Mission
G2L["31"] = Instance.new("Frame", G2L["9"]);
G2L["31"]["BorderSizePixel"] = 0;
G2L["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["31"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["31"]["Size"] = UDim2.new(0.8, 0, 0, 50);
G2L["31"]["Position"] = UDim2.new(0.95, 0, 0.3, 0);
G2L["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["31"]["Name"] = [[Mission]];
G2L["31"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Mission.TextLabel
G2L["32"] = Instance.new("TextLabel", G2L["31"]);
G2L["32"]["TextWrapped"] = true;
G2L["32"]["BorderSizePixel"] = 0;
G2L["32"]["TextSize"] = 25;
G2L["32"]["TextStrokeColor3"] = Color3.fromRGB(164, 246, 255);
G2L["32"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["32"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["32"]["FontFace"] = Font.new([[rbxasset://fonts/families/PressStart2P.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["32"]["TextColor3"] = Color3.fromRGB(164, 246, 255);
G2L["32"]["BackgroundTransparency"] = 1;
G2L["32"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["32"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["32"]["Text"] = [[mission.playername=obey(host)]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Mission.TextLabel.UITextSizeConstraint
G2L["33"] = Instance.new("UITextSizeConstraint", G2L["32"]);
G2L["33"]["MaxTextSize"] = 25;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Mission.TextLabel.Glow
G2L["34"] = Instance.new("ImageLabel", G2L["32"]);
G2L["34"]["ZIndex"] = 0;
G2L["34"]["BorderSizePixel"] = 0;
G2L["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["34"]["ImageTransparency"] = 0.7;
G2L["34"]["ImageColor3"] = Color3.fromRGB(25, 195, 232);
G2L["34"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["34"]["Image"] = [[rbxassetid://129224956712931]];
G2L["34"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["34"]["BackgroundTransparency"] = 1;
G2L["34"]["Name"] = [[Glow]];
G2L["34"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory
G2L["35"] = Instance.new("Frame", G2L["9"]);
G2L["35"]["BorderSizePixel"] = 0;
G2L["35"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["35"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["35"]["Size"] = UDim2.new(0.8, 0, 0, 140);
G2L["35"]["Position"] = UDim2.new(0.95, 0, 0.425, 0);
G2L["35"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["35"]["Name"] = [[Memory]];
G2L["35"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory.Container
G2L["36"] = Instance.new("Frame", G2L["35"]);
G2L["36"]["BorderSizePixel"] = 0;
G2L["36"]["BackgroundColor3"] = Color3.fromRGB(68, 206, 255);
G2L["36"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["36"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["36"]["Position"] = UDim2.new(1, 0, 0, 0);
G2L["36"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["36"]["Name"] = [[Container]];
G2L["36"]["BackgroundTransparency"] = 0.7;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory.Container.UIStroke
G2L["37"] = Instance.new("UIStroke", G2L["36"]);
G2L["37"]["Thickness"] = 2;
G2L["37"]["Color"] = Color3.fromRGB(133, 225, 235);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory.Container.UICorner
G2L["38"] = Instance.new("UICorner", G2L["36"]);



-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory.Container.tab
G2L["39"] = Instance.new("ImageLabel", G2L["36"]);
G2L["39"]["ZIndex"] = 10;
G2L["39"]["BorderSizePixel"] = 0;
G2L["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["39"]["ImageTransparency"] = 0.8;
G2L["39"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["39"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["39"]["Image"] = [[rbxassetid://16336479573]];
G2L["39"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["39"]["BackgroundTransparency"] = 1;
G2L["39"]["Name"] = [[tab]];
G2L["39"]["Position"] = UDim2.new(0.5, 0, 0, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory.Container.tab
G2L["3a"] = Instance.new("ImageLabel", G2L["36"]);
G2L["3a"]["ZIndex"] = 10;
G2L["3a"]["BorderSizePixel"] = 0;
G2L["3a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3a"]["ImageTransparency"] = 0.8;
G2L["3a"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["3a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3a"]["Image"] = [[rbxassetid://16336479573]];
G2L["3a"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3a"]["BackgroundTransparency"] = 1;
G2L["3a"]["Name"] = [[tab]];
G2L["3a"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory.Container.Glow
G2L["3b"] = Instance.new("ImageLabel", G2L["36"]);
G2L["3b"]["ZIndex"] = -10;
G2L["3b"]["BorderSizePixel"] = 0;
G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3b"]["ImageTransparency"] = 0.5;
G2L["3b"]["ImageColor3"] = Color3.fromRGB(38, 175, 217);
G2L["3b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3b"]["Image"] = [[rbxassetid://5538771868]];
G2L["3b"]["Size"] = UDim2.new(1.6, 0, 2, 0);
G2L["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3b"]["BackgroundTransparency"] = 1;
G2L["3b"]["Name"] = [[Glow]];
G2L["3b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory.Container.Glow
G2L["3c"] = Instance.new("ImageLabel", G2L["36"]);
G2L["3c"]["ZIndex"] = 0;
G2L["3c"]["BorderSizePixel"] = 0;
G2L["3c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3c"]["ImageTransparency"] = 0.7;
G2L["3c"]["ImageColor3"] = Color3.fromRGB(25, 195, 232);
G2L["3c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3c"]["Image"] = [[rbxassetid://129224956712931]];
G2L["3c"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3c"]["BackgroundTransparency"] = 1;
G2L["3c"]["Name"] = [[Glow]];
G2L["3c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory.Container.tab
G2L["3d"] = Instance.new("ImageLabel", G2L["36"]);
G2L["3d"]["ZIndex"] = 10;
G2L["3d"]["BorderSizePixel"] = 0;
G2L["3d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3d"]["ImageTransparency"] = 0.8;
G2L["3d"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["3d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3d"]["Image"] = [[rbxassetid://16336479573]];
G2L["3d"]["Size"] = UDim2.new(0, 10, 1, 0);
G2L["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3d"]["BackgroundTransparency"] = 1;
G2L["3d"]["Name"] = [[tab]];
G2L["3d"]["Position"] = UDim2.new(0, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory.Container.tab
G2L["3e"] = Instance.new("ImageLabel", G2L["36"]);
G2L["3e"]["ZIndex"] = 10;
G2L["3e"]["BorderSizePixel"] = 0;
G2L["3e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3e"]["ImageTransparency"] = 0.8;
G2L["3e"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["3e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3e"]["Image"] = [[rbxassetid://16336479573]];
G2L["3e"]["Size"] = UDim2.new(0, 10, 1, 0);
G2L["3e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3e"]["BackgroundTransparency"] = 1;
G2L["3e"]["Name"] = [[tab]];
G2L["3e"]["Position"] = UDim2.new(1, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory.Container.Wrench
G2L["3f"] = Instance.new("Frame", G2L["36"]);
G2L["3f"]["BorderSizePixel"] = 0;
G2L["3f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3f"]["Size"] = UDim2.new(0, 85, 0, 85);
G2L["3f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["3f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3f"]["Name"] = [[Wrench]];
G2L["3f"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory.Container.Wrench.UICorner
G2L["40"] = Instance.new("UICorner", G2L["3f"]);
G2L["40"]["CornerRadius"] = UDim.new(1, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory.Container.Wrench.UIStroke
G2L["41"] = Instance.new("UIStroke", G2L["3f"]);
G2L["41"]["Thickness"] = 2;
G2L["41"]["Color"] = Color3.fromRGB(133, 225, 235);


-- StarterGui.eye.window_frame.main_container.MainFrame.Analyze.Memory.Container.Wrench.ImageLabel
G2L["42"] = Instance.new("ImageLabel", G2L["3f"]);
G2L["42"]["BorderSizePixel"] = 0;
G2L["42"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["42"]["ImageColor3"] = Color3.fromRGB(133, 225, 235);
G2L["42"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["42"]["Image"] = [[rbxassetid://6594776225]];
G2L["42"]["Size"] = UDim2.new(0.7, 0, 0.7, 0);
G2L["42"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["42"]["BackgroundTransparency"] = 1;
G2L["42"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading
G2L["43"] = Instance.new("Frame", G2L["7"]);
G2L["43"]["Visible"] = false;
G2L["43"]["BorderSizePixel"] = 0;
G2L["43"]["BackgroundColor3"] = Color3.fromRGB(6, 51, 91);
G2L["43"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["43"]["Size"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["43"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["43"]["Name"] = [[Loading]];
G2L["43"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.UIStroke
G2L["44"] = Instance.new("UIStroke", G2L["43"]);
G2L["44"]["Color"] = Color3.fromRGB(133, 225, 235);


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.UICorner
G2L["45"] = Instance.new("UICorner", G2L["43"]);



-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.tab
G2L["46"] = Instance.new("ImageLabel", G2L["43"]);
G2L["46"]["ZIndex"] = 10;
G2L["46"]["BorderSizePixel"] = 0;
G2L["46"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["46"]["ImageTransparency"] = 0.8;
G2L["46"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["46"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["46"]["Image"] = [[rbxassetid://16336479573]];
G2L["46"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["46"]["BackgroundTransparency"] = 1;
G2L["46"]["Name"] = [[tab]];
G2L["46"]["Position"] = UDim2.new(0.5, 0, 0, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.tab
G2L["47"] = Instance.new("ImageLabel", G2L["43"]);
G2L["47"]["ZIndex"] = 10;
G2L["47"]["BorderSizePixel"] = 0;
G2L["47"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["47"]["ImageTransparency"] = 0.8;
G2L["47"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["47"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["47"]["Image"] = [[rbxassetid://16336479573]];
G2L["47"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["47"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["47"]["BackgroundTransparency"] = 1;
G2L["47"]["Name"] = [[tab]];
G2L["47"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.tab
G2L["48"] = Instance.new("ImageLabel", G2L["43"]);
G2L["48"]["ZIndex"] = 10;
G2L["48"]["BorderSizePixel"] = 0;
G2L["48"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["48"]["ImageTransparency"] = 0.8;
G2L["48"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["48"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["48"]["Image"] = [[rbxassetid://16336479573]];
G2L["48"]["Size"] = UDim2.new(0, 10, 1, 0);
G2L["48"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["48"]["BackgroundTransparency"] = 1;
G2L["48"]["Name"] = [[tab]];
G2L["48"]["Position"] = UDim2.new(0, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.tab
G2L["49"] = Instance.new("ImageLabel", G2L["43"]);
G2L["49"]["ZIndex"] = 10;
G2L["49"]["BorderSizePixel"] = 0;
G2L["49"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["49"]["ImageTransparency"] = 0.8;
G2L["49"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["49"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["49"]["Image"] = [[rbxassetid://16336479573]];
G2L["49"]["Size"] = UDim2.new(0, 10, 1, 0);
G2L["49"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["49"]["BackgroundTransparency"] = 1;
G2L["49"]["Name"] = [[tab]];
G2L["49"]["Position"] = UDim2.new(1, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Glow
G2L["4a"] = Instance.new("ImageLabel", G2L["43"]);
G2L["4a"]["ZIndex"] = 0;
G2L["4a"]["BorderSizePixel"] = 0;
G2L["4a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4a"]["ImageTransparency"] = 0.7;
G2L["4a"]["ImageColor3"] = Color3.fromRGB(21, 171, 201);
G2L["4a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["4a"]["Image"] = [[rbxassetid://129224956712931]];
G2L["4a"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["4a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4a"]["BackgroundTransparency"] = 1;
G2L["4a"]["Name"] = [[Glow]];
G2L["4a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content
G2L["4b"] = Instance.new("Frame", G2L["43"]);
G2L["4b"]["BorderSizePixel"] = 0;
G2L["4b"]["BackgroundColor3"] = Color3.fromRGB(6, 51, 91);
G2L["4b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["4b"]["ClipsDescendants"] = true;
G2L["4b"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["4b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["4b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4b"]["Name"] = [[Content]];
G2L["4b"]["BackgroundTransparency"] = 0.7;


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Title
G2L["4c"] = Instance.new("Frame", G2L["4b"]);
G2L["4c"]["BorderSizePixel"] = 0;
G2L["4c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4c"]["Size"] = UDim2.new(1, 0, 0, 70);
G2L["4c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4c"]["Name"] = [[Title]];
G2L["4c"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Title.Title
G2L["4d"] = Instance.new("TextLabel", G2L["4c"]);
G2L["4d"]["BorderSizePixel"] = 0;
G2L["4d"]["TextSize"] = 30;
G2L["4d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["4d"]["TextStrokeColor3"] = Color3.fromRGB(100, 168, 255);
G2L["4d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4d"]["FontFace"] = Font.new([[rbxassetid://12187362578]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["4d"]["TextColor3"] = Color3.fromRGB(93, 242, 255);
G2L["4d"]["BackgroundTransparency"] = 1;
G2L["4d"]["Size"] = UDim2.new(1, 0, 0.5, 0);
G2L["4d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4d"]["Text"] = [[CLASS OBJECT: PLAYER NAME]];
G2L["4d"]["LayoutOrder"] = 1;
G2L["4d"]["Name"] = [[Title]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Title.Title.UITextSizeConstraint
G2L["4e"] = Instance.new("UITextSizeConstraint", G2L["4d"]);
G2L["4e"]["MaxTextSize"] = 30;


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Title.UIListLayout
G2L["4f"] = Instance.new("UIListLayout", G2L["4c"]);
G2L["4f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Title.EXEC
G2L["50"] = Instance.new("TextLabel", G2L["4c"]);
G2L["50"]["BorderSizePixel"] = 0;
G2L["50"]["TextSize"] = 30;
G2L["50"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["50"]["TextStrokeColor3"] = Color3.fromRGB(100, 168, 255);
G2L["50"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["50"]["FontFace"] = Font.new([[rbxassetid://12187362578]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["50"]["TextColor3"] = Color3.fromRGB(93, 242, 255);
G2L["50"]["BackgroundTransparency"] = 1;
G2L["50"]["Size"] = UDim2.new(1, 0, 0.5, 0);
G2L["50"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["50"]["Text"] = [[EXECUTOR: executor name]];
G2L["50"]["LayoutOrder"] = 2;
G2L["50"]["Name"] = [[EXEC]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Title.EXEC.UITextSizeConstraint
G2L["51"] = Instance.new("UITextSizeConstraint", G2L["50"]);
G2L["51"]["MaxTextSize"] = 30;


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Title.UIPadding
G2L["52"] = Instance.new("UIPadding", G2L["4c"]);
G2L["52"]["PaddingTop"] = UDim.new(0, 8);
G2L["52"]["PaddingRight"] = UDim.new(0, 8);
G2L["52"]["PaddingLeft"] = UDim.new(0, 8);
G2L["52"]["PaddingBottom"] = UDim.new(0, 8);


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Console
G2L["53"] = Instance.new("ScrollingFrame", G2L["4b"]);
G2L["53"]["Active"] = true;
G2L["53"]["BorderSizePixel"] = 0;
-- [ERROR] cannot convert TopImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["53"]["TopImage"] = [[]];
G2L["53"]["Name"] = [[Console]];
G2L["53"]["BackgroundColor3"] = Color3.fromRGB(55, 177, 196);
G2L["53"]["MidImage"] = [[]];
-- [ERROR] cannot convert MidImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
-- [ERROR] cannot convert BottomImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["53"]["BottomImage"] = [[]];
G2L["53"]["Size"] = UDim2.new(1, 0, 0.7, 0);
G2L["53"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["53"]["Position"] = UDim2.new(0, 0, 0.3, 0);
G2L["53"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["53"]["BackgroundTransparency"] = 0.8;


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Console.UIStroke
G2L["54"] = Instance.new("UIStroke", G2L["53"]);
G2L["54"]["Color"] = Color3.fromRGB(92, 156, 162);


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Console.UICorner
G2L["55"] = Instance.new("UICorner", G2L["53"]);



-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Console.Template
G2L["56"] = Instance.new("TextLabel", G2L["53"]);
G2L["56"]["BorderSizePixel"] = 0;
G2L["56"]["TextSize"] = 14;
G2L["56"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["56"]["TextTransparency"] = 1;
G2L["56"]["TextStrokeColor3"] = Color3.fromRGB(100, 168, 255);
G2L["56"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["56"]["FontFace"] = Font.new([[rbxassetid://12187362578]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["56"]["TextColor3"] = Color3.fromRGB(93, 242, 255);
G2L["56"]["BackgroundTransparency"] = 1;
G2L["56"]["Size"] = UDim2.new(1, 0, 0, 20);
G2L["56"]["Visible"] = false;
G2L["56"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["56"]["Text"] = [[CLASS OBJECT: PLAYER NAME]];
G2L["56"]["LayoutOrder"] = 1;
G2L["56"]["Name"] = [[Template]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Console.Template.UITextSizeConstraint
G2L["57"] = Instance.new("UITextSizeConstraint", G2L["56"]);
G2L["57"]["MaxTextSize"] = 14;


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Console.UIListLayout
G2L["58"] = Instance.new("UIListLayout", G2L["53"]);
G2L["58"]["Padding"] = UDim.new(0, 3);
G2L["58"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.Console.UIPadding
G2L["59"] = Instance.new("UIPadding", G2L["53"]);
G2L["59"]["PaddingTop"] = UDim.new(0, 8);
G2L["59"]["PaddingRight"] = UDim.new(0, 8);
G2L["59"]["PaddingLeft"] = UDim.new(0, 8);
G2L["59"]["PaddingBottom"] = UDim.new(0, 8);


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.OuterRing
G2L["5a"] = Instance.new("ImageLabel", G2L["4b"]);
G2L["5a"]["ZIndex"] = 10;
G2L["5a"]["BorderSizePixel"] = 0;
G2L["5a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5a"]["ImageTransparency"] = 0.8;
G2L["5a"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["5a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5a"]["Image"] = [[rbxassetid://9766083125]];
G2L["5a"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["5a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5a"]["BackgroundTransparency"] = 1;
G2L["5a"]["Name"] = [[OuterRing]];
G2L["5a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.OuterRing.UIAspectRatioConstraint
G2L["5b"] = Instance.new("UIAspectRatioConstraint", G2L["5a"]);



-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.InnerRing
G2L["5c"] = Instance.new("ImageLabel", G2L["4b"]);
G2L["5c"]["ZIndex"] = 10;
G2L["5c"]["BorderSizePixel"] = 0;
G2L["5c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5c"]["ImageTransparency"] = 0.8;
G2L["5c"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["5c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5c"]["Image"] = [[rbxassetid://11591014163]];
G2L["5c"]["Size"] = UDim2.new(0.8, 0, 0.8, 0);
G2L["5c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5c"]["BackgroundTransparency"] = 1;
G2L["5c"]["Name"] = [[InnerRing]];
G2L["5c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Loading.Content.InnerRing.UIAspectRatioConstraint
G2L["5d"] = Instance.new("UIAspectRatioConstraint", G2L["5c"]);



-- StarterGui.eye.window_frame.main_container.MainFrame.scan lines
G2L["5e"] = Instance.new("ImageLabel", G2L["7"]);
G2L["5e"]["BorderSizePixel"] = 0;
G2L["5e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5e"]["ImageTransparency"] = 1;
G2L["5e"]["ImageColor3"] = Color3.fromRGB(93, 255, 255);
G2L["5e"]["Image"] = [[rbxassetid://74839619501069]];
G2L["5e"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["5e"]["Visible"] = false;
G2L["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5e"]["BackgroundTransparency"] = 1;
G2L["5e"]["Name"] = [[scan lines]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Main
G2L["5f"] = Instance.new("Frame", G2L["7"]);
G2L["5f"]["BorderSizePixel"] = 0;
G2L["5f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5f"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["5f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["5f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5f"]["Visible"] = false;

G2L["5f"]["Name"] = [[Main]];
G2L["5f"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties
G2L["60"] = Instance.new("Frame", G2L["5f"]);
G2L["60"]["BorderSizePixel"] = 0;
G2L["60"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["60"]["AnchorPoint"] = Vector2.new(0, 1);
G2L["60"]["Size"] = UDim2.new(0.2, 0, 0.02824, 100);
G2L["60"]["Position"] = UDim2.new(0.05, 0, 0.97824, 0);
G2L["60"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["60"]["Name"] = [[Properties]];
G2L["60"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.Inner
G2L["61"] = Instance.new("Frame", G2L["60"]);
G2L["61"]["BorderSizePixel"] = 0;
G2L["61"]["BackgroundColor3"] = Color3.fromRGB(25, 195, 232);
G2L["61"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["61"]["Name"] = [[Inner]];
G2L["61"]["BackgroundTransparency"] = 0.9;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.Inner.UICorner
G2L["62"] = Instance.new("UICorner", G2L["61"]);



-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.Inner.UIStroke
G2L["63"] = Instance.new("UIStroke", G2L["61"]);
G2L["63"]["Thickness"] = 1.5;
G2L["63"]["Color"] = Color3.fromRGB(164, 246, 255);
G2L["63"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["63"]["LineJoinMode"] = Enum.LineJoinMode.Bevel;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.Inner.Template
G2L["64"] = Instance.new("Frame", G2L["61"]);
G2L["64"]["BorderSizePixel"] = 0;
G2L["64"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["64"]["Size"] = UDim2.new(0.5, 0, 0, 30);
G2L["64"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["64"]["Name"] = [[Template]];
G2L["64"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.Inner.Template.UIStroke
G2L["65"] = Instance.new("UIStroke", G2L["64"]);
G2L["65"]["Thickness"] = 1.5;
G2L["65"]["Color"] = Color3.fromRGB(164, 246, 255);
G2L["65"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.Inner.Template.Property
G2L["66"] = Instance.new("TextLabel", G2L["64"]);
G2L["66"]["TextWrapped"] = true;
G2L["66"]["BorderSizePixel"] = 0;
G2L["66"]["TextSize"] = 25;
G2L["66"]["TextScaled"] = true;
G2L["66"]["BackgroundColor3"] = Color3.fromRGB(164, 246, 255);
G2L["66"]["FontFace"] = Font.new([[rbxassetid://11598289817]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["66"]["TextColor3"] = Color3.fromRGB(164, 246, 255);
G2L["66"]["BackgroundTransparency"] = 1;
G2L["66"]["RichText"] = true;
G2L["66"]["Size"] = UDim2.new(0.5, 0, 1, 0);
G2L["66"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["66"]["Text"] = [[HP]];
G2L["66"]["Name"] = [[Property]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.Inner.Template.Value
G2L["67"] = Instance.new("TextLabel", G2L["64"]);
G2L["67"]["TextWrapped"] = true;
G2L["67"]["BorderSizePixel"] = 0;
G2L["67"]["TextSize"] = 25;
G2L["67"]["TextScaled"] = true;
G2L["67"]["BackgroundColor3"] = Color3.fromRGB(164, 246, 255);
G2L["67"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Light, Enum.FontStyle.Normal);
G2L["67"]["TextColor3"] = Color3.fromRGB(164, 246, 255);
G2L["67"]["BackgroundTransparency"] = 1;
G2L["67"]["RichText"] = true;
G2L["67"]["Size"] = UDim2.new(0.5, 0, 1, 0);
G2L["67"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["67"]["Text"] = [[100]];
G2L["67"]["Name"] = [[Value]];
G2L["67"]["Position"] = UDim2.new(0.5, 0, 0, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.Inner.Template.Glow
G2L["68"] = Instance.new("ImageLabel", G2L["64"]);
G2L["68"]["ZIndex"] = 0;
G2L["68"]["BorderSizePixel"] = 0;
G2L["68"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["68"]["ImageTransparency"] = 0.7;
G2L["68"]["ImageColor3"] = Color3.fromRGB(25, 195, 232);
G2L["68"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["68"]["Image"] = [[rbxassetid://129224956712931]];
G2L["68"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["68"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["68"]["BackgroundTransparency"] = 1;
G2L["68"]["Name"] = [[Glow]];
G2L["68"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.Inner.UIPadding
G2L["69"] = Instance.new("UIPadding", G2L["61"]);
G2L["69"]["PaddingTop"] = UDim.new(0, 8);
G2L["69"]["PaddingRight"] = UDim.new(0, 8);
G2L["69"]["PaddingLeft"] = UDim.new(0, 8);
G2L["69"]["PaddingBottom"] = UDim.new(0, 8);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.Inner.UIListLayout
G2L["6a"] = Instance.new("UIListLayout", G2L["61"]);
G2L["6a"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
G2L["6a"]["Wraps"] = true;
G2L["6a"]["Padding"] = UDim.new(0, 10);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.Glow
G2L["6b"] = Instance.new("ImageLabel", G2L["60"]);
G2L["6b"]["ZIndex"] = -10;
G2L["6b"]["BorderSizePixel"] = 0;
G2L["6b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6b"]["ImageTransparency"] = 0.5;
G2L["6b"]["ImageColor3"] = Color3.fromRGB(38, 175, 217);
G2L["6b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["6b"]["Image"] = [[rbxassetid://5538771868]];
G2L["6b"]["Size"] = UDim2.new(1.6, 0, 2, 0);
G2L["6b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6b"]["BackgroundTransparency"] = 1;
G2L["6b"]["Name"] = [[Glow]];
G2L["6b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.Glow
G2L["6c"] = Instance.new("ImageLabel", G2L["60"]);
G2L["6c"]["ZIndex"] = 0;
G2L["6c"]["BorderSizePixel"] = 0;
G2L["6c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6c"]["ImageTransparency"] = 0.7;
G2L["6c"]["ImageColor3"] = Color3.fromRGB(25, 195, 232);
G2L["6c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["6c"]["Image"] = [[rbxassetid://129224956712931]];
G2L["6c"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["6c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6c"]["BackgroundTransparency"] = 1;
G2L["6c"]["Name"] = [[Glow]];
G2L["6c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.tab
G2L["6d"] = Instance.new("ImageLabel", G2L["60"]);
G2L["6d"]["ZIndex"] = 10;
G2L["6d"]["BorderSizePixel"] = 0;
G2L["6d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6d"]["ImageTransparency"] = 0.5;
G2L["6d"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["6d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["6d"]["Image"] = [[rbxassetid://16336479573]];
G2L["6d"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["6d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6d"]["BackgroundTransparency"] = 1;
G2L["6d"]["Name"] = [[tab]];
G2L["6d"]["Position"] = UDim2.new(0.5, 0, 0, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Properties.tab
G2L["6e"] = Instance.new("ImageLabel", G2L["60"]);
G2L["6e"]["ZIndex"] = 10;
G2L["6e"]["BorderSizePixel"] = 0;
G2L["6e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6e"]["ImageTransparency"] = 0.5;
G2L["6e"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["6e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["6e"]["Image"] = [[rbxassetid://16336479573]];
G2L["6e"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["6e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6e"]["BackgroundTransparency"] = 1;
G2L["6e"]["Name"] = [[tab]];
G2L["6e"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Watermark
G2L["6f"] = Instance.new("TextLabel", G2L["5f"]);
G2L["6f"]["BorderSizePixel"] = 0;
G2L["6f"]["TextSize"] = 14;
G2L["6f"]["TextYAlignment"] = Enum.TextYAlignment.Bottom;
G2L["6f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6f"]["FontFace"] = Font.new([[rbxasset://fonts/families/Michroma.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["6f"]["TextColor3"] = Color3.fromRGB(164, 246, 255);
G2L["6f"]["BackgroundTransparency"] = 1;
G2L["6f"]["AnchorPoint"] = Vector2.new(0.5, 1);
G2L["6f"]["Size"] = UDim2.new(0.1, 0, 0, 20);
G2L["6f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6f"]["Text"] = [[ZYVIX]];
G2L["6f"]["Name"] = [[Watermark]];
G2L["6f"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Watermark.UITextSizeConstraint
G2L["70"] = Instance.new("UITextSizeConstraint", G2L["6f"]);
G2L["70"]["MaxTextSize"] = 14;
 

-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Watermark.Glow
G2L["71"] = Instance.new("ImageLabel", G2L["6f"]);
G2L["71"]["ZIndex"] = -10;
G2L["71"]["BorderSizePixel"] = 0;
G2L["71"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["71"]["ImageTransparency"] = 0.8;
G2L["71"]["ImageColor3"] = Color3.fromRGB(38, 175, 217);
G2L["71"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["71"]["Image"] = [[rbxassetid://5538771868]];
G2L["71"]["Size"] = UDim2.new(1.6, 0, 2, 0);
G2L["71"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["71"]["BackgroundTransparency"] = 1;
G2L["71"]["Name"] = [[Glow]];
G2L["71"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Dynamic
G2L["72"] = Instance.new("Frame", G2L["5f"]);
G2L["72"]["BorderSizePixel"] = 0;
G2L["72"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["72"]["AnchorPoint"] = Vector2.new(1, 0);
G2L["72"]["Size"] = UDim2.new(0.25, 0, 1, 0);
G2L["72"]["Position"] = UDim2.new(1, 0, 0, 0);
G2L["72"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["72"]["Name"] = [[Dynamic]];
G2L["72"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Dynamic.UIListLayout
G2L["73"] = Instance.new("UIListLayout", G2L["72"]);
G2L["73"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["73"]["VerticalFlex"] = Enum.UIFlexAlignment.Fill;
G2L["73"]["Padding"] = UDim.new(0, 12);
G2L["73"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Dynamic.Window
G2L["74"] = Instance.new("Frame", G2L["72"]);
G2L["74"]["Visible"] = false;
G2L["74"]["BorderSizePixel"] = 0;
G2L["74"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["74"]["AnchorPoint"] = Vector2.new(0, 1);
G2L["74"]["Size"] = UDim2.new(0.8, 0, 0.02824, 100);
G2L["74"]["Position"] = UDim2.new(0.05, 0, 0.97824, 0);
G2L["74"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["74"]["Name"] = [[Window]];
G2L["74"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Dynamic.Window.Glow
G2L["75"] = Instance.new("ImageLabel", G2L["74"]);
G2L["75"]["ZIndex"] = 0;
G2L["75"]["BorderSizePixel"] = 0;
G2L["75"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["75"]["ImageTransparency"] = 0.7;
G2L["75"]["ImageColor3"] = Color3.fromRGB(25, 195, 232);
G2L["75"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["75"]["Image"] = [[rbxassetid://129224956712931]];
G2L["75"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["75"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["75"]["BackgroundTransparency"] = 1;
G2L["75"]["Name"] = [[Glow]];
G2L["75"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Dynamic.Window.tab
G2L["76"] = Instance.new("ImageLabel", G2L["74"]);
G2L["76"]["ZIndex"] = 10;
G2L["76"]["BorderSizePixel"] = 0;
G2L["76"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["76"]["ImageTransparency"] = 0.5;
G2L["76"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["76"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["76"]["Image"] = [[rbxassetid://16336479573]];
G2L["76"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["76"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["76"]["BackgroundTransparency"] = 1;
G2L["76"]["Name"] = [[tab]];
G2L["76"]["Position"] = UDim2.new(0.5, 0, 0, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Dynamic.Window.tab
G2L["77"] = Instance.new("ImageLabel", G2L["74"]);
G2L["77"]["ZIndex"] = 10;
G2L["77"]["BorderSizePixel"] = 0;
G2L["77"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["77"]["ImageTransparency"] = 0.5;
G2L["77"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["77"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["77"]["Image"] = [[rbxassetid://16336479573]];
G2L["77"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["77"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["77"]["BackgroundTransparency"] = 1;
G2L["77"]["Name"] = [[tab]];
G2L["77"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Dynamic.Window.Console
G2L["78"] = Instance.new("ScrollingFrame", G2L["74"]);
G2L["78"]["Active"] = true;
G2L["78"]["BorderSizePixel"] = 0;
-- [ERROR] cannot convert TopImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["78"]["TopImage"] = [[]];
G2L["78"]["Name"] = [[Console]];
G2L["78"]["BackgroundColor3"] = Color3.fromRGB(55, 177, 196);
G2L["78"]["MidImage"] = [[]];
-- [ERROR] cannot convert MidImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
-- [ERROR] cannot convert BottomImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["78"]["BottomImage"] = [[]];
G2L["78"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["78"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["78"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["78"]["BackgroundTransparency"] = 0.8;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Dynamic.Window.Console.UICorner
G2L["79"] = Instance.new("UICorner", G2L["78"]);



-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Dynamic.Window.Console.UIListLayout
G2L["7a"] = Instance.new("UIListLayout", G2L["78"]);
G2L["7a"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
G2L["7a"]["Wraps"] = true;
G2L["7a"]["Padding"] = UDim.new(0, 10);
G2L["7a"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Dynamic.Window.Console.UIPadding
G2L["7b"] = Instance.new("UIPadding", G2L["78"]);
G2L["7b"]["PaddingTop"] = UDim.new(0, 8);
G2L["7b"]["PaddingRight"] = UDim.new(0, 8);
G2L["7b"]["PaddingLeft"] = UDim.new(0, 8);
G2L["7b"]["PaddingBottom"] = UDim.new(0, 8);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Dynamic.Window.Console.UIStroke
G2L["7c"] = Instance.new("UIStroke", G2L["78"]);
G2L["7c"]["Thickness"] = 1.5;
G2L["7c"]["Color"] = Color3.fromRGB(164, 246, 255);
G2L["7c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["7c"]["LineJoinMode"] = Enum.LineJoinMode.Bevel;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Dynamic.Window.Glow
G2L["7d"] = Instance.new("ImageLabel", G2L["74"]);
G2L["7d"]["ZIndex"] = -10;
G2L["7d"]["BorderSizePixel"] = 0;
G2L["7d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["7d"]["ImageTransparency"] = 0.5;
G2L["7d"]["ImageColor3"] = Color3.fromRGB(38, 175, 217);
G2L["7d"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["7d"]["Image"] = [[rbxassetid://5538771868]];
G2L["7d"]["Size"] = UDim2.new(1.6, 0, 2, 0);
G2L["7d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7d"]["BackgroundTransparency"] = 1;
G2L["7d"]["Name"] = [[Glow]];
G2L["7d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Dynamic.UIPadding
G2L["7e"] = Instance.new("UIPadding", G2L["72"]);
G2L["7e"]["PaddingTop"] = UDim.new(0, 12);
G2L["7e"]["PaddingRight"] = UDim.new(0, 8);
G2L["7e"]["PaddingLeft"] = UDim.new(0, 8);
G2L["7e"]["PaddingBottom"] = UDim.new(0, 8);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements
G2L["7f"] = Instance.new("Folder", G2L["5f"]);
G2L["7f"]["Name"] = [[Elements]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Property
G2L["80"] = Instance.new("Frame", G2L["7f"]);
G2L["80"]["Visible"] = false;
G2L["80"]["BorderSizePixel"] = 0;
G2L["80"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["80"]["Size"] = UDim2.new(0.5, 0, 0, 30);
G2L["80"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["80"]["Name"] = [[Property]];
G2L["80"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Property.UIStroke
G2L["81"] = Instance.new("UIStroke", G2L["80"]);
G2L["81"]["Thickness"] = 1.5;
G2L["81"]["Color"] = Color3.fromRGB(164, 246, 255);
G2L["81"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Property.Property
G2L["82"] = Instance.new("TextLabel", G2L["80"]);
G2L["82"]["TextWrapped"] = true;
G2L["82"]["BorderSizePixel"] = 0;
G2L["82"]["TextSize"] = 25;
G2L["82"]["TextScaled"] = true;
G2L["82"]["BackgroundColor3"] = Color3.fromRGB(164, 246, 255);
G2L["82"]["FontFace"] = Font.new([[rbxassetid://11598289817]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["82"]["TextColor3"] = Color3.fromRGB(164, 246, 255);
G2L["82"]["BackgroundTransparency"] = 1;
G2L["82"]["Size"] = UDim2.new(0.5, 0, 1, 0);
G2L["82"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["82"]["Text"] = [[HP]];
G2L["82"]["Name"] = [[Property]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Property.Property.UITextSizeConstraint
G2L["83"] = Instance.new("UITextSizeConstraint", G2L["82"]);
G2L["83"]["MaxTextSize"] = 25;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Property.Value
G2L["84"] = Instance.new("TextLabel", G2L["80"]);
G2L["84"]["TextWrapped"] = true;
G2L["84"]["BorderSizePixel"] = 0;
G2L["84"]["TextSize"] = 25;
G2L["84"]["TextScaled"] = true;
G2L["84"]["BackgroundColor3"] = Color3.fromRGB(164, 246, 255);
G2L["84"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Light, Enum.FontStyle.Normal);
G2L["84"]["TextColor3"] = Color3.fromRGB(164, 246, 255);
G2L["84"]["BackgroundTransparency"] = 1;
G2L["84"]["Size"] = UDim2.new(0.5, 0, 1, 0);
G2L["84"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["84"]["Text"] = [[100]];
G2L["84"]["Name"] = [[Value]];
G2L["84"]["Position"] = UDim2.new(0.5, 0, 0, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Property.Value.UITextSizeConstraint
G2L["85"] = Instance.new("UITextSizeConstraint", G2L["84"]);
G2L["85"]["MaxTextSize"] = 25;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Property.Glow
G2L["86"] = Instance.new("ImageLabel", G2L["80"]);
G2L["86"]["ZIndex"] = 0;
G2L["86"]["BorderSizePixel"] = 0;
G2L["86"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["86"]["ImageTransparency"] = 0.7;
G2L["86"]["ImageColor3"] = Color3.fromRGB(25, 195, 232);
G2L["86"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["86"]["Image"] = [[rbxassetid://129224956712931]];
G2L["86"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["86"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["86"]["BackgroundTransparency"] = 1;
G2L["86"]["Name"] = [[Glow]];
G2L["86"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Label
G2L["87"] = Instance.new("Frame", G2L["7f"]);
G2L["87"]["Visible"] = false;
G2L["87"]["BorderSizePixel"] = 0;
G2L["87"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["87"]["Size"] = UDim2.new(1, 0, 0.01, 0);
G2L["87"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["87"]["Name"] = [[Label]];
G2L["87"]["LayoutOrder"] = -1;
G2L["87"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Label.Title
G2L["88"] = Instance.new("TextLabel", G2L["87"]);
G2L["88"]["BorderSizePixel"] = 0;
G2L["88"]["TextSize"] = 14;
G2L["88"]["TextStrokeColor3"] = Color3.fromRGB(100, 168, 255);
G2L["88"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["88"]["FontFace"] = Font.new([[rbxassetid://12187362578]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["88"]["TextColor3"] = Color3.fromRGB(93, 242, 255);
G2L["88"]["BackgroundTransparency"] = 1;
G2L["88"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["88"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["88"]["Text"] = [[CLASS OBJECT: PLAYER NAME]];
G2L["88"]["LayoutOrder"] = 1;
G2L["88"]["Name"] = [[Title]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Label.Title.UITextSizeConstraint
G2L["89"] = Instance.new("UITextSizeConstraint", G2L["88"]);
G2L["89"]["MaxTextSize"] = 16;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Label.UIPadding
G2L["8a"] = Instance.new("UIPadding", G2L["87"]);
G2L["8a"]["PaddingTop"] = UDim.new(0, 8);
G2L["8a"]["PaddingRight"] = UDim.new(0, 8);
G2L["8a"]["PaddingLeft"] = UDim.new(0, 8);
G2L["8a"]["PaddingBottom"] = UDim.new(0, 8);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Annoucement
G2L["8b"] = Instance.new("Frame", G2L["7f"]);
G2L["8b"]["Visible"] = false;
G2L["8b"]["BorderSizePixel"] = 0;
G2L["8b"]["BackgroundColor3"] = Color3.fromRGB(80, 218, 255);
G2L["8b"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["8b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8b"]["Name"] = [[Annoucement]];
G2L["8b"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Annoucement.InnerRing
G2L["8c"] = Instance.new("ImageLabel", G2L["8b"]);
G2L["8c"]["ZIndex"] = 10;
G2L["8c"]["BorderSizePixel"] = 0;
G2L["8c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8c"]["ImageTransparency"] = 1;
G2L["8c"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["8c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["8c"]["Image"] = [[rbxassetid://11591014163]];
G2L["8c"]["Size"] = UDim2.new(0.8, 0, 0.8, 0);
G2L["8c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8c"]["BackgroundTransparency"] = 1;
G2L["8c"]["Name"] = [[InnerRing]];
G2L["8c"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Annoucement.InnerRing.UIAspectRatioConstraint
G2L["8d"] = Instance.new("UIAspectRatioConstraint", G2L["8c"]);



-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Annoucement.OuterRing
G2L["8e"] = Instance.new("ImageLabel", G2L["8b"]);
G2L["8e"]["ZIndex"] = 10;
G2L["8e"]["BorderSizePixel"] = 0;
G2L["8e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8e"]["ImageTransparency"] = 1;
G2L["8e"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["8e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["8e"]["Image"] = [[rbxassetid://9766083125]];
G2L["8e"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["8e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8e"]["BackgroundTransparency"] = 1;
G2L["8e"]["Name"] = [[OuterRing]];
G2L["8e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Annoucement.OuterRing.UIAspectRatioConstraint
G2L["8f"] = Instance.new("UIAspectRatioConstraint", G2L["8e"]);



-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Annoucement.OuterRing.Glow
G2L["90"] = Instance.new("ImageLabel", G2L["8e"]);
G2L["90"]["ZIndex"] = 0;
G2L["90"]["BorderSizePixel"] = 0;
G2L["90"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["90"]["ImageTransparency"] = 0.7;
G2L["90"]["ImageColor3"] = Color3.fromRGB(21, 171, 201);
G2L["90"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["90"]["Image"] = [[rbxassetid://129224956712931]];
G2L["90"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["90"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["90"]["BackgroundTransparency"] = 1;
G2L["90"]["Name"] = [[Glow]];
G2L["90"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Annoucement.Title
G2L["91"] = Instance.new("TextLabel", G2L["8b"]);
G2L["91"]["BorderSizePixel"] = 0;
G2L["91"]["TextSize"] = 35;
G2L["91"]["TextTransparency"] = 1;
G2L["91"]["TextStrokeColor3"] = Color3.fromRGB(100, 168, 255);
G2L["91"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["91"]["FontFace"] = Font.new([[rbxassetid://12187362578]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["91"]["TextColor3"] = Color3.fromRGB(93, 242, 255);
G2L["91"]["BackgroundTransparency"] = 1;
G2L["91"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["91"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["91"]["Text"] = [[CLASS OBJECT: PLAYER NAME]];
G2L["91"]["LayoutOrder"] = 1;
G2L["91"]["Name"] = [[Title]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Elements.Annoucement.Title.UITextSizeConstraint
G2L["92"] = Instance.new("UITextSizeConstraint", G2L["91"]);
G2L["92"]["MaxTextSize"] = 35;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections
G2L["93"] = Instance.new("Frame", G2L["5f"]);
G2L["93"]["BorderSizePixel"] = 0;
G2L["93"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["93"]["Size"] = UDim2.new(0.13391, 0, 0.5, 0);
G2L["93"]["Position"] = UDim2.new(0.05, 0, 0.02, 0);
G2L["93"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["93"]["Name"] = [[Connections]];
G2L["93"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console
G2L["94"] = Instance.new("ScrollingFrame", G2L["93"]);
G2L["94"]["Active"] = true;
G2L["94"]["BorderSizePixel"] = 0;
G2L["94"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
-- [ERROR] cannot convert TopImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["94"]["TopImage"] = [[]];
G2L["94"]["Name"] = [[Console]];
G2L["94"]["BackgroundColor3"] = Color3.fromRGB(6, 51, 91);
G2L["94"]["MidImage"] = [[]];
-- [ERROR] cannot convert MidImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
-- [ERROR] cannot convert BottomImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
G2L["94"]["BottomImage"] = [[]];
G2L["94"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
G2L["94"]["ClipsDescendants"] = false;
G2L["94"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["94"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["94"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["94"]["BackgroundTransparency"] = 0.7;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console.UICorner
G2L["95"] = Instance.new("UICorner", G2L["94"]);



-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console.UIListLayout
G2L["96"] = Instance.new("UIListLayout", G2L["94"]);
G2L["96"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["96"]["HorizontalFlex"] = Enum.UIFlexAlignment.Fill;
G2L["96"]["Wraps"] = true;
G2L["96"]["Padding"] = UDim.new(0, 10);
G2L["96"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console.UIPadding
G2L["97"] = Instance.new("UIPadding", G2L["94"]);
G2L["97"]["PaddingTop"] = UDim.new(0, 8);
G2L["97"]["PaddingRight"] = UDim.new(0, 8);
G2L["97"]["PaddingLeft"] = UDim.new(0, 8);
G2L["97"]["PaddingBottom"] = UDim.new(0, 8);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console.UIStroke
G2L["98"] = Instance.new("UIStroke", G2L["94"]);
G2L["98"]["Thickness"] = 1.5;
G2L["98"]["Color"] = Color3.fromRGB(164, 246, 255);
G2L["98"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
G2L["98"]["LineJoinMode"] = Enum.LineJoinMode.Bevel;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console.Title
G2L["99"] = Instance.new("Frame", G2L["94"]);
G2L["99"]["BorderSizePixel"] = 0;
G2L["99"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["99"]["Size"] = UDim2.new(1, 0, 0.05, 0);
G2L["99"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["99"]["Name"] = [[Title]];
G2L["99"]["LayoutOrder"] = -1;
G2L["99"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console.Title.Title
G2L["9a"] = Instance.new("TextLabel", G2L["99"]);
G2L["9a"]["TextWrapped"] = true;
G2L["9a"]["BorderSizePixel"] = 0;
G2L["9a"]["TextSize"] = 14;
G2L["9a"]["TextStrokeColor3"] = Color3.fromRGB(100, 168, 255);
G2L["9a"]["TextScaled"] = true;
G2L["9a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9a"]["FontFace"] = Font.new([[rbxassetid://12187362578]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["9a"]["TextColor3"] = Color3.fromRGB(93, 242, 255);
G2L["9a"]["BackgroundTransparency"] = 1;
G2L["9a"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["9a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9a"]["Text"] = [[CONNECTIONS]];
G2L["9a"]["LayoutOrder"] = 1;
G2L["9a"]["Name"] = [[Title]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console.Connection
G2L["9b"] = Instance.new("Frame", G2L["94"]);
G2L["9b"]["Visible"] = false;
G2L["9b"]["BorderSizePixel"] = 0;
G2L["9b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9b"]["Size"] = UDim2.new(1, 0, 0.2, 0);
G2L["9b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9b"]["Name"] = [[Connection]];
G2L["9b"]["BackgroundTransparency"] = 1;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console.Connection.UIStroke
G2L["9c"] = Instance.new("UIStroke", G2L["9b"]);
G2L["9c"]["Thickness"] = 1.5;
G2L["9c"]["Color"] = Color3.fromRGB(164, 246, 255);
G2L["9c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console.Connection.KeybindName
G2L["9d"] = Instance.new("TextLabel", G2L["9b"]);
G2L["9d"]["TextWrapped"] = true;
G2L["9d"]["BorderSizePixel"] = 0;
G2L["9d"]["TextSize"] = 25;
G2L["9d"]["TextScaled"] = true;
G2L["9d"]["BackgroundColor3"] = Color3.fromRGB(96, 145, 149);
G2L["9d"]["FontFace"] = Font.new([[rbxassetid://11598289817]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["9d"]["TextColor3"] = Color3.fromRGB(164, 246, 255);
G2L["9d"]["BackgroundTransparency"] = 0.8;
G2L["9d"]["Size"] = UDim2.new(1, 0, 0.3, 0);
G2L["9d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9d"]["Text"] = [[L]];
G2L["9d"]["Name"] = [[KeybindName]];


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console.Connection.KeybindName.UITextSizeConstraint
G2L["9e"] = Instance.new("UITextSizeConstraint", G2L["9d"]);
G2L["9e"]["MaxTextSize"] = 25;


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console.Connection.Detail
G2L["9f"] = Instance.new("TextLabel", G2L["9b"]);
G2L["9f"]["TextWrapped"] = true;
G2L["9f"]["BorderSizePixel"] = 0;
G2L["9f"]["TextSize"] = 14;
G2L["9f"]["TextScaled"] = true;
G2L["9f"]["BackgroundColor3"] = Color3.fromRGB(164, 246, 255);
G2L["9f"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Light, Enum.FontStyle.Normal);
G2L["9f"]["TextColor3"] = Color3.fromRGB(164, 246, 255);
G2L["9f"]["BackgroundTransparency"] = 1;
G2L["9f"]["RichText"] = true;
G2L["9f"]["AnchorPoint"] = Vector2.new(0, 1);
G2L["9f"]["Size"] = UDim2.new(1, 0, 0.7, 0);
G2L["9f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9f"]["Text"] = [[fwefwfewofjewofwjeofwekfowekfwoekfwkfwekfowekfowekfwewef]];
G2L["9f"]["Name"] = [[Detail]];
G2L["9f"]["Position"] = UDim2.new(0, 0, 1, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console.Connection.Detail.UIPadding
G2L["a0"] = Instance.new("UIPadding", G2L["9f"]);
G2L["a0"]["PaddingRight"] = UDim.new(0, 2);
G2L["a0"]["PaddingLeft"] = UDim.new(0, 2);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Console.Connection.Glow
G2L["a1"] = Instance.new("ImageLabel", G2L["9b"]);
G2L["a1"]["ZIndex"] = 0;
G2L["a1"]["BorderSizePixel"] = 0;
G2L["a1"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a1"]["ImageTransparency"] = 0.7;
G2L["a1"]["ImageColor3"] = Color3.fromRGB(25, 195, 232);
G2L["a1"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["a1"]["Image"] = [[rbxassetid://129224956712931]];
G2L["a1"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["a1"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a1"]["BackgroundTransparency"] = 1;
G2L["a1"]["Name"] = [[Glow]];
G2L["a1"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Glow
G2L["a2"] = Instance.new("ImageLabel", G2L["93"]);
G2L["a2"]["ZIndex"] = 0;
G2L["a2"]["BorderSizePixel"] = 0;
G2L["a2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a2"]["ImageTransparency"] = 0.7;
G2L["a2"]["ImageColor3"] = Color3.fromRGB(25, 195, 232);
G2L["a2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["a2"]["Image"] = [[rbxassetid://129224956712931]];
G2L["a2"]["Size"] = UDim2.new(1.5, 0, 1.5, 0);
G2L["a2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a2"]["BackgroundTransparency"] = 1;
G2L["a2"]["Name"] = [[Glow]];
G2L["a2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.Glow
G2L["a3"] = Instance.new("ImageLabel", G2L["93"]);
G2L["a3"]["ZIndex"] = -10;
G2L["a3"]["BorderSizePixel"] = 0;
G2L["a3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a3"]["ImageTransparency"] = 0.5;
G2L["a3"]["ImageColor3"] = Color3.fromRGB(38, 175, 217);
G2L["a3"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["a3"]["Image"] = [[rbxassetid://5538771868]];
G2L["a3"]["Size"] = UDim2.new(1.6, 0, 2, 0);
G2L["a3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a3"]["BackgroundTransparency"] = 1;
G2L["a3"]["Name"] = [[Glow]];
G2L["a3"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.tab
G2L["a4"] = Instance.new("ImageLabel", G2L["93"]);
G2L["a4"]["ZIndex"] = 10;
G2L["a4"]["BorderSizePixel"] = 0;
G2L["a4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a4"]["ImageTransparency"] = 0.5;
G2L["a4"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["a4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["a4"]["Image"] = [[rbxassetid://16336479573]];
G2L["a4"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["a4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a4"]["BackgroundTransparency"] = 1;
G2L["a4"]["Name"] = [[tab]];
G2L["a4"]["Position"] = UDim2.new(0.5, 0, 0, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.Main.Connections.tab
G2L["a5"] = Instance.new("ImageLabel", G2L["93"]);
G2L["a5"]["ZIndex"] = 10;
G2L["a5"]["BorderSizePixel"] = 0;
G2L["a5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a5"]["ImageTransparency"] = 0.5;
G2L["a5"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["a5"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["a5"]["Image"] = [[rbxassetid://16336479573]];
G2L["a5"]["Size"] = UDim2.new(1.3, 0, 0, 10);
G2L["a5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a5"]["BackgroundTransparency"] = 1;
G2L["a5"]["Name"] = [[tab]];
G2L["a5"]["Position"] = UDim2.new(0.5, 0, 1, 0);


-- StarterGui.eye.window_frame.main_container.MainFrame.SelectionBox
G2L["a6"] = Instance.new("BillboardGui", G2L["7"]);
G2L["a6"]["ResetOnSpawn"] = false;
G2L["a6"]["LightInfluence"] = 1;
G2L["a6"]["Active"] = true;
G2L["a6"]["Size"] = UDim2.new(24, 0, 24, 0);
G2L["a6"]["Enabled"] = false;
G2L["a6"]["AlwaysOnTop"] = true;
G2L["a6"]["Name"] = [[SelectionBox]];
G2L["a6"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.eye.window_frame.main_container.MainFrame.SelectionBox.SelectionBox
G2L["a7"] = Instance.new("ImageLabel", G2L["a6"]);
G2L["a7"]["BorderSizePixel"] = 0;
G2L["a7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a7"]["ImageColor3"] = Color3.fromRGB(164, 246, 255);
G2L["a7"]["Image"] = [[rbxassetid://123274843586064]];
G2L["a7"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["a7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a7"]["BackgroundTransparency"] = 1;
G2L["a7"]["Name"] = [[SelectionBox]];



return G2L["1"], require;
