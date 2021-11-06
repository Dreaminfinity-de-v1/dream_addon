local clientCallbacks = {}

DreamAddon.RegisterClientCallback = function(name, cb)
	clientCallbacks[name] = cb
end

function triggerClientCallback(name, cb, ...)
	if clientCallbacks[name] then
		clientCallbacks[name](cb, ...)
	else
		print(('[dream_addon] [^3WARNING^7] Client callback "%s" does not exist. Make sure that the client sided file really is loading, an error in that file might cause it to not load.'):format(name))
	end
end

RegisterNetEvent('dream_addon:triggerClientCallback')
AddEventHandler('dream_addon:triggerClientCallback', function(name, otp, ...)
	triggerClientCallback(name, function(...)
		TriggerServerEvent('dream_addon:clientCallback', name, otp, ...)
	end, ...)
end)

