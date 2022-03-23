ESX.RegisterServerCallback('dream_addon:isAceAllowed', function(src, cb, permission)
    if type(permission) == 'table' then
        local permissions = {}
        local allAllowed = false
        local hasOnePermission = false
        
        if #permission > 0 then 
            allAllowed = true
        end

        for i,v in ipairs(permission) do
            permissions[v] = IsPlayerAceAllowed(src, v)
            if permissions[v] == false then
                allAllowed = false
            else
                hasOnePermission = true
            end
        end
        cb(allAllowed, hasOnePermission, permissions)
    else
        cb(IsPlayerAceAllowed(src, permission))
    end
end)
