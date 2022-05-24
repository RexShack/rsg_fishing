local sharedItems = exports['qbr-core']:GetItems()

-- use fishingrod
exports['qbr-core']:CreateUseableItem("fishingrod", function(source, item)
    local src = tonumber(source)
	TriggerClientEvent("rsg_fishing:client:StartFishing", src, item.name)
end)

-- give fishing reward
RegisterServerEvent('rsg_fishing:server:fishcaught')
AddEventHandler('rsg_fishing:server:fishcaught', function()
    local src = source
    local Player = exports['qbr-core']:GetPlayer(src)
	local randomNumber = math.random(1,4)
	if randomNumber == 1 then
		Player.Functions.AddItem('smallfish', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, sharedItems['smallfish'], "add")
		TriggerClientEvent('rsg_notify:client:notifiy', src, 'you caught a small fish', 5000)
	elseif randomNumber == 2 then
		Player.Functions.AddItem('mediumfish', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, sharedItems['mediumfish'], "add")
		TriggerClientEvent('rsg_notify:client:notifiy', src, 'you caught a medium fish', 5000)
	elseif randomNumber == 3 then
		Player.Functions.AddItem('largefish', 1)
		TriggerClientEvent('inventory:client:ItemBox', src, sharedItems['largefish'], "add")
		TriggerClientEvent('rsg_notify:client:notifiy', src, 'you caught a large fish', 5000)
	else
		TriggerClientEvent('rsg_notify:client:notifiy', src, 'these fish are not biting today!', 5000)
	end
end)