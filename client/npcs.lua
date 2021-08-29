Citizen.CreateThread(function()

    for list, v in pairs(Config.NPCS) do
        RequestModel(GetHashKey(v.model))
        while not HasModelLoaded(GetHashKey(v.model)) do
            Wait(1)
        end
    
        RequestAnimDict("mini@strip_club@idles@bouncer@base")
        while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
            Wait(1)
        end

        for i,pos in pairs(v.pos) do
            local type = nil
            if pos.type ~= nil then
               type = pos.type
            elseif v.type ~= nil then
                type = v.type
            else
                type = Config.NPCsDefaultType
            end

            if pos.model ~= nil then
                model = GetHashKey(pos.model)
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Wait(1)
                end
            else
                model = GetHashKey(v.model)
            end

            ped =  CreatePed(type, model, pos.x, pos.y, pos.z, 3374176, false, true)
            SetEntityHeading(ped, pos.h)
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
            TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local pos = GetEntityCoords(GetPlayerPed(-1), true)
        Citizen.Wait(0)
        for list, v in pairs(Config.NPCS) do
            for i,pos in pairs(v.pos) do
                x = pos.x
                y = pos.y
                z = pos.z
                if(Vdist(pos.x, pos.y, pos.z, x, y, z) < 20.0)then
                    if pos.titel ~= nil then
                        titel = pos.titel
                    else
                        titel = v.titel
                    end

                    if pos.subtitel ~= nil then
                        subtitel = pos.subtitel
                    else
                        subtitel = v.subtitel
                    end

                    local add = 0
                    if pos.name ~= nil then
                        add = 0.15
                        DrawText3D(x,y,z+2.00, "~c~"..pos.name, 1.0, 1)
                    end
                    DrawText3D(x,y,z+2.15+add, "~g~"..titel, 1.2, 1)
                    DrawText3D(x,y,z+2.00+add, "~w~"..subtitel, 1.0, 1)
                end
            end
        end
    end
end)







function DrawText3D(x,y,z, text, scl, font) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen and dist < Config.DrawRange then
        SetTextScale(0.0*scale, 1.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end
