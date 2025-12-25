local addonInfo, privateVars = ...

---------- init namespace ---------

if not EnKai then EnKai = {} end
if not EnKai.stat then EnKai.stat = {} end

local lang        = privateVars.langTexts
local data        = privateVars.data

local inspectUnitDetails	= Inspect.Unit.Details

local lastFocus

local function cooldownBegin(self, cooldowns)

	local details = inspectUnitDetails("player")

	if details.focus == lastFocus then return end
	lastFocus = details.focus

	EnKai.eventHandlers["EnKai.Stat"]["Focus"](details.focus)		

end


function EnKai.stat.init()

	EnKai.eventHandlers["EnKai.Stat"]["Focus"], EnKai.events["EnKai.Stat"]["Focus"] = Utility.Event.Create(addonInfo.identifier, "EnKai.Stat.Focus")

	Command.Event.Attach(Event.Ability.New.Cooldown.Begin, cooldownBegin, "EnKai.stat.Ability.New.Cooldown.Begin")

end

--EnKai.events.addPeriodic(func, period, tries)



