DreamAddon = {}

AddEventHandler('dream_addon:getSharedObject', function(cb)
	cb(DreamAddon)
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end

    removeNPCs()
end)
