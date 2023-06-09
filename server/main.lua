----------------------------------------------------------------------------------
-- ESX = nil
-- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
----------------------------------------------------------------------------------
RegisterServerEvent("ms_shop:buyItem")
AddEventHandler("ms_shop:buyItem", function(ItemValue, ItemPrice, ItemLabel)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local v = 0

    for i = 1, #xPlayer.inventory, 1 do
        local item = xPlayer.inventory[i]
        if item.name == ItemValue then
            v = item.count
        end
    end

    if xPlayer.getMoney() - ItemPrice >= 0 then
        xPlayer.addInventoryItem(ItemValue, 1)
        xPlayer.removeMoney(ItemPrice)
        TriggerClientEvent('esx:showNotification', _source, Translation[Config.Locale]["bought"])
    else
        TriggerClientEvent('esx:showNotification', source, Translation[Config.Locale]["no_money"])
    end

end)
----------------------------------------------------------------------------------