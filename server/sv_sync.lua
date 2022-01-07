-- os.date("*t") -> return Local time as table
-- os.date(unixtime) -> return Time as table

-- os.time(table) -> return Unixtime as int

function triggerSyncClientCallback(event, id, ...)

    local result = false
    local data = nil

    DreamAddon.TriggerClientCallback(event, id, function(...)
        data = {...}
        result = true

    end, ...)

    local time = os.time(os.date("*t")) + 15

    while result == false do
        Citizen.Wait(0)
        if time <= os.time(os.date("*t")) then
            print('[^1ERROR^7] TriggerSyncClientCallback("' .. event .. '", ' .. id .. ', ...) - timed out')
            break
        end
    end

    return data
end
