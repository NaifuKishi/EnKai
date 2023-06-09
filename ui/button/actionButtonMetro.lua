local addonInfo, privateVars = ...

---------- init namespace ---------

if not EnKai then EnKai = {} end

if not privateVars.uiFunctions then privateVars.uiFunctions = {} end

local uiFunctions   = privateVars.uiFunctions
local internal   = privateVars.internal
local oFuncs	  = privateVars.oFuncs

---------- addon internal function block ---------

local function _uiActionButtonMetro(name, parent)

	--if EnKai.internal.checkEvents (name, true) == false then return nil end 

	local button = EnKai.uiCreateFrame ('nkCanvas', name, parent)	
	local texture = EnKai.uiCreateFrame ('nkTexture', name .. '.texture', button)
	local tint = EnKai.uiCreateFrame ('nkFrame', name .. '.tint', button)
	
	local properties = {}
	local value1, value2, value3, value4

	function button:SetValue(property, value)
		properties[property] = value
	end
	
	function button:GetValue(property)
		return properties[property]
	end
	
	local scale = 1
	local dragable = false
	local tintColor = { 1, 0, 0, .2 }
	
	local path = {{xProportional = 0, yProportional = 0}, {xProportional = 0, yProportional = 1}, {xProportional = 1, yProportional = 1}, 
                {xProportional = 1, yProportional = 0}, {xProportional = 0, yProportional = 0}}
	local stroke = EnKai.tools.table.copy (EnKai.art.GetThemeColor('elementMainColor'))
	stroke.thickness = 1
	
	local fill = EnKai.tools.table.copy (EnKai.art.GetThemeColor("elementSubColor2"))	
	fill.type = "solid"

	button:SetShape(path, fill, stroke)
	button:SetWidth(48)
	button:SetHeight(48)
		
	texture:SetPoint("CENTER", button, "CENTER")
	texture:SetWidth(42)
	texture:SetHeight(42)
	texture:SetLayer(1)
	
	tint:SetPoint("TOPLEFT", texture, "TOPLEFT")
	tint:SetPoint("BOTTOMRIGHT", texture, "BOTTOMRIGHT")
	tint:SetLayer(3)
	tint:SetBackgroundColor(tintColor[1], tintColor[2], tintColor[3], tintColor[4])
	tint:SetVisible(false)
	
	function button:SetContent(newValue1, newValue2, newValue3, newValue4)
		value1, value2, value3, value4 = newValue1, newValue2, newValue3, newValue4
	end
	
	function button:GetContent() return value1, value2, value3, value4 end
	
	function button:SetScale(newScale)
		scale = newScale
		
		button:SetWidth(48 * newScale)
		button:SetHeight(48 * newScale)
		
		texture:SetWidth(42 * newScale)
		texture:SetHeight(42 * newScale)
	end
	
  	function button:ClearTexture() texture:SetVisible(false) end
  
	function button:SetTexture(addonName, path)
		texture:SetTextureAsync (addonName, path)
		texture:SetVisible(true)
	end

	function button:GetTexture()
		return texture:GetTexture()
	end

	function button:SetDragable(flag)
		dragable = flag
	end

	function button:SetMacro(newMacro)
		button:SetSecureMode('restricted')
		button:EventMacroSet(Event.UI.Input.Mouse.Left.Click, newMacro)
	end

	function button:SetActiveState(flag)
		if flag == true then tint:SetVisible(false) else tint:SetVisible(true) end
	end

	function button:SetColor(r, g, b, a)
		fill.r = r
		fill.g = g
		fill.b = b
		fill.a = a
		button:SetShape(path, fill, stroke)
	end	

	function button:SetBackgroundColor(r, g, b, a)
		stroke.r = r
		stroke.g = g
		stroke.b = b
		stroke.a = a
		button:SetShape(path, fill, stroke)
	end

	function button:SetTintColor(r, g, b, a) tint:SetBackgroundColor(r, g, b, a) end
	function button:ShowTint(flag) tint:SetVisible(flag) end

	local oSetPoint = button.SetPoint

	function button:SetPoint(from, object, to, x, y)

		if x ~= nil and y ~= nil then			
			oSetPoint(self, from, object, to, x, y)
		else
			oSetPoint(self, from, object, to)
		end
	end	

	button:EventAttach(Event.UI.Input.Mouse.Right.Down, function (self)
		
		if dragable == false then
			EnKai.eventHandlers[name]["RightClicked"]()
			return
		end
		
		if oFuncs.oInspectSystemSecure() == true then return end
		
		self.rightDown = true
		local mouse = Inspect.Mouse()
		
		self.originalXDiff = mouse.x - self:GetLeft()
		self.originalYDiff = mouse.y - self:GetTop()
		
		local left, top, right, bottom = button:GetBounds()
		
		button:ClearAll()
		button:SetPoint("TOPLEFT", UIParent, "TOPLEFT", left, top)
		button:SetWidth(right-left)
		button:SetHeight(bottom-top)

	end, name .. "button.Right.Down")

	button:EventAttach( Event.UI.Input.Mouse.Cursor.Move, function (self, _, x, y)	
		if self.rightDown ~= true then return end
		button:SetPoint("TOPLEFT", UIParent, "TOPLEFT", x - self.originalXDiff, y - self.originalYDiff)
	end, name .. "button.Cursor.Move")

	button:EventAttach( Event.UI.Input.Mouse.Right.Up, function (self)	
		self.rightDown = false
		EnKai.eventHandlers[name]["Moved"](button:GetLeft(), button:GetTop())
	end, name .. "button.Right.Up")

	button:EventAttach(Event.UI.Input.Mouse.Left.Click, function ()
		if dragable == true then return end
		EnKai.eventHandlers[name]["Clicked"]()
	end, name .. ".UI.Input.Mouse.Left.Click")

	button:EventAttach( Event.UI.Input.Mouse.Cursor.In, function ()	
		EnKai.eventHandlers[name]["MouseIn"]()
	end, name .. "button.Cursor.In")

	button:EventAttach( Event.UI.Input.Mouse.Cursor.Out, function ()	
		EnKai.eventHandlers[name]["MouseOut"]()
	end, name .. "button.Cursor.Out")

	EnKai.eventHandlers[name]["Clicked"], EnKai.events[name]["Clicked"] = Utility.Event.Create(addonInfo.identifier, name .. "Clicked")
	EnKai.eventHandlers[name]["RightClicked"], EnKai.events[name]["RightClicked"] = Utility.Event.Create(addonInfo.identifier, name .. "RightClicked")
	EnKai.eventHandlers[name]["Moved"], EnKai.events[name]["Moved"] = Utility.Event.Create(addonInfo.identifier, name .. "Moved")
	EnKai.eventHandlers[name]["MouseIn"], EnKai.events[name]["MouseIn"] = Utility.Event.Create(addonInfo.identifier, name .. "MouseIn")
	EnKai.eventHandlers[name]["MouseOut"], EnKai.events[name]["MouseOut"] = Utility.Event.Create(addonInfo.identifier, name .. "MouseOut")
		
	return button
	
end

uiFunctions.NKACTIONBUTTONMETRO = _uiActionButtonMetro