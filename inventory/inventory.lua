local addonInfo, privateVars = ...

---------- init namespace ---------

if not EnKai then EnKai = {} end
if not EnKai.inventory then EnKai.inventory = {} end

local data		= privateVars.data

---------- make global functions local ---------

local InspectItemList           	= Inspect.Item.List
local UtilityItemSlotInventory  	= Utility.Item.Slot.Inventory
local UtilityItemSlotQuest      	= Utility.Item.Slot.Quest
local UtilityItemSlotEquipment		= Utility.Item.Slot.Equipment
local UtilityItemSlotBank			= Utility.Item.Slot.Bank
local UtilityItemSlotVault			= Utility.Item.Slot.Vault
local InspectItemDetail				= Inspect.Item.Detail
local InspectSystemSecure			= Inspect.System.Secure
local InspectTimeFrame				= Inspect.Time.Frame
local CommandSystemWatchdogQuiet	= Command.System.Watchdog.Quiet

local stringFind	= string.find

local EnKaiUnitGetPlayerDetails		= EnKai.unit.getPlayerDetails

---------- init local variables ---------

local _invManager = false

---------- local function block ---------

local function _storeItem (slot, details)

	if not details then return end

	local inventory = EnKaiInv[EnKaiUnitGetPlayerDetails().name].inventory
	local itemCache = EnKaiInv[EnKaiUnitGetPlayerDetails().name].itemCache
	
	if not details.type then details.type = "t" .. details.id end
	if details.stack == nil then details.stack = 1 end

	local prevId = nil
	if inventory.bySlot[slot] ~= nil then prevId = inventory.bySlot[slot].id end
	
	inventory.bySlot[slot] = { id = details.id, stack = details.stack }
	itemCache[details.id] = { typeId = details.type, stack = details.stack, category = details.category, cooldown = details.cooldown, name = details.name, icon = details.icon, rarity = details.rarity, bind = details.bind, bound = details.bound }
				
	if not inventory.byType[details.type] then
		inventory.byType[details.type] = details.stack
	elseif prevId == details.id then -- just more of the same, details contains new total
		inventory.byType[details.type] = details.stack
	else
		inventory.byType[details.type] = inventory.byType[details.type] + details.stack
	end

	inventory.byID[details.id] = details.type

end

local function _removeItem (slot)

	local inventory = EnKaiInv[EnKaiUnitGetPlayerDetails().name].inventory
	local itemCache = EnKaiInv[EnKaiUnitGetPlayerDetails().name].itemCache
	
	local slotDetails = inventory.bySlot[slot]
	local cacheDetails = itemCache[slotDetails.id]
	
	if cacheDetails == nil then -- wie auch immer das passieren kann
		local details = InspectItemDetail(slotDetails.id)
		if not details then details = { id = slotDetails.id } end
				
		if not details.type then details.type = "t" .. details.id end
		if details.stack == nil then details.stack = 1 end
		cacheDetails = { typeId = details.type, stack = details.stack, category = details.category, cooldown = details.cooldown, name = details.name, icon = details.icon }

	end
	
	if not inventory.byType[cacheDetails.typeId] then
		inventory.byType[cacheDetails.typeId] = 0
	end
	
	inventory.byType[cacheDetails.typeId] = inventory.byType[cacheDetails.typeId] - slotDetails.stack
	if inventory.byType[cacheDetails.typeId] < 0 then inventory.byType[cacheDetails.typeId] = 0 end
	
	inventory.bySlot[slot] = nil
	itemCache[slotDetails.id] = nil
	inventory.byID[slotDetails.id] = nil
	
end

local function _processItems (list)

	local itemList = InspectItemDetail(list)
	
	for slot, v in pairs(itemList) do		
		if v.id ~= nil then
			_storeItem (slot, v)
		end
	end   

end

local function _fctGetInventory ()

	if InspectSystemSecure() == false then CommandSystemWatchdogQuiet() end

	if (not EnKaiInv[EnKaiUnitGetPlayerDetails().name]) or (not EnKaiInv[EnKaiUnitGetPlayerDetails().name].inventory) then
		EnKaiInv[EnKaiUnitGetPlayerDetails().name] = {}
	end
	
	EnKaiInv[EnKaiUnitGetPlayerDetails().name].inventory = { byID = {}, byType = {}, bySlot = {} }
	EnKaiInv[EnKaiUnitGetPlayerDetails().name].itemCache = {}

	local slots = { InspectItemList(UtilityItemSlotInventory()), 
					InspectItemList(UtilityItemSlotEquipment()), 
					InspectItemList(UtilityItemSlotBank()), 
					InspectItemList(UtilityItemSlotVault()), 
					InspectItemList(UtilityItemSlotQuest()) }


					for idx = 1, #slots, 1 do
	
		local lu = {}
		
		for slot, key in pairs(slots[idx]) do
		  if key ~= nil and key ~= false then lu[slot] = true end
		end
		
		_processItems (lu)
		
	end
	  
end

local function _fctProcessUpdate (_, updates)

	if EnKaiUnitGetPlayerDetails() == nil then return end

	if (not EnKaiInv[EnKaiUnitGetPlayerDetails().name]) or (not EnKaiInv[EnKaiUnitGetPlayerDetails().name].inventory) then _fctGetInventory() end

	local inventory = EnKaiInv[EnKaiUnitGetPlayerDetails().name].inventory
	local itemCache = EnKaiInv[EnKaiUnitGetPlayerDetails().name].itemCache

	local updatedKeys = {}

	for slot, key in pairs(updates) do
	
		if not EnKai.strings.startsWith(slot, 'sg') then

			if key == "nil" then key = false end

			if inventory.bySlot[slot] ~= nil then -- target slot is not empty
			
				if not inventory.bySlot[slot].id then -- content of slot not known => Error

				else
					if key ~= inventory.bySlot[slot].id then -- not just more of the same
						if updatedKeys[inventory.bySlot[slot].id] == nil then updatedKeys[inventory.bySlot[slot].id] = 0 end
												
						updatedKeys[inventory.bySlot[slot].id] = updatedKeys[inventory.bySlot[slot].id] - inventory.bySlot[slot].stack
						_removeItem (slot)
												
					end
				end
			end

			if key ~= false then
				local updateDetails = InspectItemDetail(key)
				
				if updateDetails ~= nil then
					if updateDetails.stack == nil then updateDetails.stack = 1 end
					local qty = 0
					
					if inventory.bySlot[slot] ~= nil and inventory.bySlot[slot].id == updateDetails.id then
						-- more of the same, get update qty
						qty = updateDetails.stack - inventory.bySlot[slot].stack
					end
					
					_storeItem(slot, updateDetails)
					if updatedKeys[inventory.bySlot[slot].id] == nil then updatedKeys[inventory.bySlot[slot].id] = 0 end
					
					if qty == 0 then qty = inventory.bySlot[slot].stack	end
					updatedKeys[inventory.bySlot[slot].id] = updatedKeys[inventory.bySlot[slot].id] + qty
					
				end
			end
			
		end
	end

	EnKai.eventHandlers["EnKai.InventoryManager"]["Update"](updatedKeys)

end

---------- deprecated function block ---------

function EnKai.inventory.querySlotByKey (key)

	return EnKai.inventory.querySlotByType (key)

end

function EnKai.inventory.queryByKey (key)

	return EnKai.inventory.queryQtyById (key)

end

---------- library public function block ---------

function EnKai.inventory.init (updateFlag)

	if not _invManager then
	
		if EnKai.internal.checkEvents ("EnKai.InventoryManager", true) == false then return nil end
		
		if not EnKaiInv then EnKaiInv = {} end
		
		Command.Event.Attach(Event.Item.Slot, _fctProcessUpdate, "EnKai.inventory.Item.Slot")
		Command.Event.Attach(Event.Item.Update, _fctProcessUpdate, "EnKai.inventory.Item.Update")
		
		EnKai.eventHandlers["EnKai.InventoryManager"]["Update"], EnKai.events["EnKai.InventoryManager"]["Update"] = Utility.Event.Create(addonInfo.identifier, "EnKai.InventoryManagerUpdate")

		_invManager = true
		
	end
		
	if updateFlag then EnKai.events.addInsecure(_fctGetInventory, InspectTimeFrame(), 20) end

end

function EnKai.inventory.updateDB ()

	if not _invManager then 
		EnKai.tools.error.display ("EnKai", "Inventory manager not initialzed", 1)
	else
		_fctGetInventory()
	end

end

function EnKai.inventory.findFreeBagSlot(bag)

	local startBag, endBag = 1, 8
	if bag then startBag, endBag = bag, bag end

	for idx = startBag, endBag, 1 do
		local bagSlot = UtilityItemSlotInventory(idx)
		
		if bagSlot then
			local bagInfo = InspectItemList(bagSlot)

			for slot, details in pairs (bagInfo) do
				if details == false then return slot end    
			end
		end
	end
	
	return nil

end

function EnKai.inventory.findFreeBankSlot(bag)

	local startBag, endBag = 1, 8
	if bag then startBag, endBag = bag, bag end

	for idx = startBag, endBag, 1 do
		local bagSlot = UtilityItemSlotBank(idx)
		
		if bagSlot then
			local bagInfo = InspectItemList(bagSlot)

			for slot, details in pairs (bagInfo) do
				if details == false then return slot end    
			end
		end
	end
	
	return nil

end

function EnKai.inventory.findFreeVaultSlot(bag)

	local startBag, endBag = 1, 2
	if bag then startBag, endBag = bag, bag end

	for idx = startBag, endBag, 1 do
		local bagSlot = UtilityItemSlotValut(idx)
		
		if bagSlot then
			local bagInfo = InspectItemList(bagSlot)

			for slot, details in pairs (bagInfo) do
				if details == false then return slot end    
			end
		end
	end
	
	return nil

end

function EnKai.inventory.getAllItems ()

	return EnKaiInv[EnKaiUnitGetPlayerDetails().name].itemCache
	
end

function EnKai.inventory.GetItemByKey (key)
	return EnKaiInv[EnKaiUnitGetPlayerDetails().name].itemCache[key]
end

function EnKai.inventory.querySlotById (id)

	if not _invManager then 
		EnKai.tools.error.display ("EnKai", "Inventory manager not initialzed", 1)
		return
	end
	
	local inventory = EnKaiInv[EnKaiUnitGetPlayerDetails().name].inventory

	for slot, v in pairs(inventory.bySlot) do
		if v.id ~= nil and EnKai.strings.startsWith(id, v.id) then return slot end
	end

	-- try with typeID if available
	
	if inventory.byID[id] ~= nil then
		return EnKai.inventory.querySlotByType (inventory.byID[id])
	end
	
	return nil

end

function EnKai.inventory.querySlotByType (typeId)

	if _invManager == false then 
		EnKai.tools.error.display ("EnKai", "Inventory manager not initialzed", 1)
		return
	end
	
	local inventory = EnKaiInv[EnKaiUnitGetPlayerDetails().name].inventory
	local itemCache = EnKaiInv[EnKaiUnitGetPlayerDetails().name].itemCache

	for slot, v in pairs(inventory.bySlot) do
		if itemCache[v.id] ~= nil and EnKai.strings.startsWith(typeId, itemCache[v.id].typeId) then return slot end
	end

	return nil

end

function EnKai.inventory.queryQtyById (key)

	if not _invManager then 
		EnKai.tools.error.display ("EnKai", "Inventory manager not initialzed", 1)
		return
	end
	
	if (not EnKaiInv[EnKaiUnitGetPlayerDetails().name]) or (not EnKaiInv[EnKaiUnitGetPlayerDetails().name].inventory) then _fctGetInventory() end
	
	if not stringFind(key, ',') then
		-- key is an id, get type			
		key = inventory.byID[key]
	end
	
	local inventory = EnKaiInv[EnKaiUnitGetPlayerDetails().name].inventory
	
	if inventory.byType[key] ~= nil then
		return inventory.byType[key]
	end
	
	return 0

end

function EnKai.inventory.queryByCategory (category)

	if not _invManager then 
		EnKai.tools.error.display ("EnKai", "Inventory manager not initialzed", 1)
		return
	end

	if EnKaiInv[EnKaiUnitGetPlayerDetails().name] == nil then _fctGetInventory() end
	
	local retValues = {}
	
	local itemCache = EnKaiInv[EnKaiUnitGetPlayerDetails().name].itemCache
	
	for id, details in pairs(itemCache) do
		if details.category == category then
			local err, details = pcall(InspectItemDetail, id)
			if err and details then
				retValues[id] = details
			else
				EnKai.tools.error.display ("EnKai", "Getting item information for " .. id .. " failed", 1)				
			end
		end
			
	end
	
	return retValues
	
end

function EnKai.inventory.getAvailableSlots()

	local availSlots = {}
	local allSlots = nil
	
	local slots = InspectItemList(UtilityItemSlotInventory())
	local initOk = false
	
	for slot, details in pairs (slots) do
		if not EnKai.strings.startsWith(slot, "sibg.") then initOk = true end 		
		if details == false then table.insert (availSlots, slot) end
	end
	
	if not initOk then return false end
	
	return availSlots

end

function EnKai.inventory.getQuestItems ()

	local slots = InspectItemList(UtilityItemSlotQuest())
	local lu = {}
	
	for slot, key in pairs(slots) do
		if key ~= nil then lu[slot] = true end
	end
	
	return InspectItemDetail(lu)		

end

 function EnKai.inventory.getQuestItemSlot (typeId)
 
 	local info = EnKai.inventory.getQuestItems ()
 	
 	for slot, details in pairs(info) do
 		if details.type == typeId then
 			return slot
 		end
 	end
 
 	return nil
 
 end 

function EnKai.inventory.getBagItems()

    if not _invManager then
        EnKai.tools.error.display("EnKai", "Inventory manager not initialized", 1)
        return
    end

    local inventory = EnKaiInv[EnKaiUnitGetPlayerDetails().name].inventory
    local itemCache = EnKaiInv[EnKaiUnitGetPlayerDetails().name].itemCache
    local allItems = {}

	for slot, details in pairs(inventory.bySlot) do
		if stringFind(slot, "si") and not stringFind(slot, "sibg") and details.id and itemCache[details.id] then
            allItems[slot] = {
                id = details.id,
                stack = details.stack,
                typeId = itemCache[details.id].typeId,
                category = itemCache[details.id].category,
                cooldown = itemCache[details.id].cooldown,
                name = itemCache[details.id].name,
                icon = itemCache[details.id].icon,
				rarity = itemCache[details.id].rarity,
				bind = itemCache[details.id].bind,
				bound = itemCache[details.id].bound,
            }
        end
    end

    return allItems
end

function EnKai.inventory.getBagSlots()

	if not _invManager then
        EnKai.tools.error.display("EnKai", "Inventory manager not initialized", 1)
        return
    end

    local inventory = EnKaiInv[EnKaiUnitGetPlayerDetails().name].inventory
    local itemCache = EnKaiInv[EnKaiUnitGetPlayerDetails().name].itemCache
    local allItems = {
		["sibg.001"] = {},
		["sibg.002"] = {},
		["sibg.003"] = {},
		["sibg.004"] = {},
		["sibg.005"] = {},
		["sibg.006"] = {},
		["sibg.007"] = {},
		["sibg.008"] = {}
	}

	for slot, details in pairs(inventory.bySlot) do
		
		if stringFind(slot, "sibg") then

            allItems[slot] = {
                id = details.id,
                stack = details.stack,
                typeId = itemCache[details.id].typeId,
                category = itemCache[details.id].category,
                cooldown = itemCache[details.id].cooldown,
                name = itemCache[details.id].name,
                icon = itemCache[details.id].icon,
				rarity = itemCache[details.id].rarity,
				bind = itemCache[details.id].bind,
				bound = itemCache[details.id].bound,
            }
        end
    end

    return allItems

end