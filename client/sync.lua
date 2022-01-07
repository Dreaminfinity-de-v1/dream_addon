function triggerSyncServerCallback(event, ...)

    local result = false
    local data = nil

    ESX.TriggerServerCallback(event, function(...)
        data = {...}
        result = true

    end, ...)

    local i = 0

    while result == false do
        i = i + 1
        Citizen.Wait(1)
        if i >= 15000 then
            print('[^1ERROR^7] TriggerSyncServerCallback("' .. event .. '", ...) - time out')
            break
        end
    end

    return data
end
