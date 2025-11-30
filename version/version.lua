local addonInfo, privateVars = ...

---------- init namespace ---------

if not EnKai then EnKai = {} end
if not EnKai.version then EnKai.version = {} end

local lang      = privateVars.langTexts
local oFuncs	  = privateVars.oFuncs

---------- init local variables ---------

local InspectUnitDetail     = Inspect.Unit.Detail
local InspectAddonDetail    = Inspect.Addon.Detail
local InspectTimeServer     = Inspect.Time.Server

local stringFormat          = string.format
local stringFind            = string.find

local _playerStore = {}
local _playerUnit = nil

local blacklist = {"5.03v01.R"}

---------- local function block ---------

local function fctCheckVersion(myVersion, reportedVersion)

    if EnKai.tools.table.isMember(blacklist, reportedVersion) then return true end

    -- Split the version strings into arrays of numbers
    local myVersionArray = EnKai.strings.split(myVersion, '%.')
    local reportedVersionArray = EnKai.strings.split(reportedVersion, '%.')

    -- Ensure both version arrays have the same number of parts
    if #myVersionArray ~= #reportedVersionArray then return false end

    -- Compare each part of the version numbers
    for idx = 1, #myVersionArray, 1 do
        local myPart = tonumber(myVersionArray[idx])
        local reportedPart = tonumber(reportedVersionArray[idx])

        -- If either part is not a number, return true (no clue why)
        if myPart == nil or reportedPart == nil then
            return true
        end

        -- Compare the current parts
        if myPart > reportedPart then
            return true
        elseif myPart < reportedPart then
            return false
        end
    end

    -- If all parts are equal, return true
    return true
end

local function _fctLoadSettings() 

  if EnKaiSetup == nil then EnKaiSetup = {} end
  if EnKaiSetup.addonVersions == nil then EnKaiSetup.addonVersions = {} end
end

local function _fctAddonStartupEnd () 
  for k, v in pairs (EnKaiSetup.addonVersions) do
    if v.localVersion ~= nil then
      local detail = InspectAddonDetail(k)
      if detail == nil then
        EnKaiSetup.addonVersions[k].localVersion = nil
      end
    end
  end
end

local function _fctEventUnitAvailable(_, units)

  if _playerUnit == nil then _playerUnit = InspectUnitDetail('player') end
  if _playerUnit == nil or _playerUnit.availability == nil or _playerUnit.availability ~= "full" then
    _playerUnit = nil
    return
  end
  
  for k, v in pairs (units) do
    if k ~= _playerUnit.id and _playerStore[k] == nil then
      local details = InspectUnitDetail(k)
      if details ~= nil and details.availability ~= nil and details.availability == "full" and details.player==true then
        _playerStore[k] = true
        Command.Message.Send(details.name, "EnKai.version", "getVersions", function() end)
      end
    end
  end

end

local function _fctProcessMessage(_, from, type, channel, identifier, data)

  if identifier ~= "EnKai.version" then return end
  
  if data == "getVersions" then
  
    local reportTable = {}
    for k, v in pairs (EnKaiSetup.addonVersions) do reportTable[k] = v.latestVersion end
  
    local msgString = "info=" .. EnKai.tools.table.serialize (reportTable)    
    Command.Message.Send(from, "EnKai.version", msgString, function() end)
    
  elseif stringFind(data, "info=") == 1 then
  
    local tempString = EnKai.strings.right (data, "info=")
    local versionsFunc = loadstring("return {".. tempString .. "}")
    local versions = versionsFunc()
             
    if versions == nil then return end
    
    for k, v in pairs (versions) do
    
      if EnKaiSetup.addonVersions[k] == nil then
      
        EnKaiSetup.addonVersions[k] = {}
        EnKaiSetup.addonVersions[k].latestVersion = v
        
      elseif EnKaiSetup.addonVersions[k].localVersion ~= nil then
      
        if fctCheckVersion(EnKaiSetup.addonVersions[k].latestVersion, v) == false then
          -- the highest known version is smaller than the reported version
          Command.Console.Display("general", true, stringFormat(lang.addonUpdate, v, k), true)
          EnKaiSetup.addonVersions[k].latestVersion = v
                             
        elseif fctCheckVersion(EnKaiSetup.addonVersions[k].localVersion, v) == false then
        
          -- the local version is smaller than the reported version 
          
          local now = InspectTimeServer()
          
          if EnKaiSetup.addonVersions[k].lastUserInfo == nil or now - EnKaiSetup.addonVersions[k].lastUserInfo > 86400 then
            -- only report once a day
            EnKaiSetup.addonVersions[k].lastUserInfo = now
            Command.Console.Display("general", true, stringFormat(lang.addonUpdate, v, k), true)
          end
          
        end 
      end
    end   
  end

end

---------- library public function block ---------

function EnKai.version.init(addonName, addonVersion)	

	if EnKaiSetup.addonVersions [addonName] == nil then EnKaiSetup.addonVersions [addonName] = {} end

	EnKaiSetup.addonVersions [addonName].localVersion = addonVersion
	if EnKaiSetup.addonVersions [addonName].latestVersion == nil or fctCheckVersion (addonVersion, EnKaiSetup.addonVersions [addonName].latestVersion) == true then 
		 EnKaiSetup.addonVersions [addonName].latestVersion = addonVersion
	end 
	
end

-------------------- STARTUP EVENTS --------------------

Command.Message.Accept(nil, "EnKai.version")
Command.Event.Attach(Event.Unit.Availability.Full, _fctEventUnitAvailable, "EnKai.version.Unit.Availability.Full")
Command.Event.Attach(Event.Message.Receive, _fctProcessMessage, "EnKai.version.Message.Receive")
Command.Event.Attach(Event.Addon.SavedVariables.Load.End, _fctLoadSettings, "EnKai.version.SavedVariables.Load.End")
Command.Event.Attach(Event.Addon.Startup.End, _fctAddonStartupEnd, "EnKai.version.Startup.End")