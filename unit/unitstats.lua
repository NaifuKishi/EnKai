local addonInfo, privateVars = ...

---------- init namespace ---------

if not EnKai then EnKai = {} end
if not EnKai.stat then EnKai.stat = {} end

local lang        = privateVars.langTexts
local data        = privateVars.data

local inspectUnitDetail	= Inspect.Unit.Detail

local lastFocus

local function checkFocus()

	local details = inspectUnitDetail("player")

	if details.focus == lastFocus then return end
	lastFocus = details.focus

	EnKai.eventHandlers["EnKai.Stat"]["Focus"](details.focus)		

end

local function cooldownBegin(self, cooldowns) checkFocus() end

local function regularUpdateFocus(self) 

	if lastFocus ~= 100 then checkFocus() end

end

function EnKai.stat.init()

	if EnKai.internal.checkEvents ("EnKai.Stat", true) == false then return nil end

end

function EnKai.stat.subscribe (stat)

	if stat == "focus" then
		EnKai.events.addInsecure(regularUpdateFocus, 10)
		EnKai.eventHandlers["EnKai.Stat"]["Focus"], EnKai.events["EnKai.Stat"]["Focus"] = Utility.Event.Create(addonInfo.identifier, "EnKai.Stat.Focus")
		Command.Event.Attach(Event.Ability.New.Cooldown.Begin, cooldownBegin, "EnKai.stat.Ability.New.Cooldown.Begin")
	end

end

--EnKai.events.addPeriodic(func, period, tries)



