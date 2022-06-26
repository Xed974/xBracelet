ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('xBracelet:blips')
AddEventHandler('xBracelet:blips', function(pPos, name)
    local blipId = AddBlipForCoord(pPos.x, pPos.y, pPos.z)
    SetBlipSprite(blipId, Blips.Sprite)
    SetBlipScale(blipId, Blips.Scale)
    SetBlipColour(blipId, Blips.Colour)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(("Bracelet de: %s"):format(name))
    EndTextCommandSetBlipName(blipId)
    Wait(DeleteBlips)
    RemoveBlip(blipId)
end)

Citizen.CreateThread(function()
    while true do
        TriggerServerEvent('xBracelet:check', GetEntityCoords(PlayerPedId()), GetPlayerName(PlayerId()))
        Citizen.Wait(TimeForActualize)
    end
end)

--- Xed#1188