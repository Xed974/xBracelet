ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('xBracelet:check')
AddEventHandler('xBracelet:check', function(pPos, name)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()

    if (not xPlayer) then return end
    if (xPlayer.getInventoryItem("bracelet").count) > 0 then
        for i = 1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if (xPlayer.getJob().name) == JobPolice then TriggerClientEvent('xBracelet:blips', xPlayers[i], pPos, name) end
        end 
    end
end)

ESX.RegisterUsableItem('pince', function(source)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local xPlayers = ESX.GetPlayers()
    local name = xPlayer.getName()
    local casse = math.random(1, 2)

    if (not xPlayer) then return end
    if (xPlayer.getInventoryItem("bracelet").count) > 0 then
        xPlayer.removeInventoryItem("bracelet", 1)
        if casse == 1 then
            xPlayer.removeInventoryItem("pince", 1)
            TriggerClientEvent('esx:showNotification', source, 'Merde, la pince s\'est cassée !')
        end
        for i = 1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if (xPlayer.getJob().name) == JobPolice then TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Central", "Information", ("Signal perdu du bracelet de : ~r~%s~s~"):format(name), "CHAR_CHAT_CALL", 2) end
        end 
    else
        ESX.ShowNotification("Vous n\'avez pas de ~r~bracelet sur vous~s~.")
    end
end)

--- Xed#1188