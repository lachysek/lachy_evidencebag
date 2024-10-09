local registeredStashes = {}
local ox_inventory = exports.ox_inventory


local function GenerateText(num)
	local str
	repeat str = {}
		for i = 1, num do str[i] = string.char(math.random(65, 90)) end
		str = table.concat(str)
	until str ~= 'POL' and str ~= 'EMS'
	return str
end

local function GenerateSerial(text)
	if text and text:len() > 3 then
		return text
	end
	return ('%s%s%s'):format(math.random(100000,999999), text == nil and GenerateText(3) or text, math.random(100000,999999))
end

RegisterServerEvent('lachy_evidencebag:openEvidencebag')
AddEventHandler('lachy_evidencebag:openEvidencebag', function(identifier)
	if not registeredStashes[identifier] then
        ox_inventory:RegisterStash('bag_'..identifier, 'Evidence bag', Config.EvidencebagStorage.slots, Config.EvidencebagStorage.weight, false)
        registeredStashes[identifier] = true
    end
end)

lib.callback.register('lachy_evidencebag:getNewIdentifier', function(source, slot)
	local newId = GenerateSerial()
	ox_inventory:SetMetadata(source, slot, {identifier = newId})
	ox_inventory:RegisterStash('bag_'..newId, 'Evidence bag', Config.EvidencebagStorage.slots, Config.EvidencebagStorage.weight, false)
	registeredStashes[newId] = true
	return newId
end)

CreateThread(function()
	while GetResourceState('ox_inventory') ~= 'started' do Wait(500) end
	local swapHook = ox_inventory:registerHook('swapItems', function(payload)
		local start, destination, move_type = payload.fromInventory, payload.toInventory, payload.toType
		local count_bagpacks = ox_inventory:GetItem(payload.source, 'evidencebag', nil, true)

		if string.find(destination, 'bag_') then
			TriggerClientEvent('ox_lib:notify', payload.source, {type = 'error', duration = 5000, title = Strings.error, description = Strings.bag_in_bag}) 
			return false
		end

		return true
	end, {
		print = false,
		itemFilter = {
			evidencebag = true,
		},
	})
end)