----------------------------------------------------------------------------------
-- ESX = nil

-- Citizen.CreateThread(function()
    -- while ESX == nil do
        -- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        -- Citizen.Wait(0)
    -- end
-- end)
----------------------------------------------------------------------------------
_menuPool = NativeUI.CreatePool()
local isNearShop = false
----------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())

        isNearShop = false

        for k, v in pairs(Config.Locations) do
            local distance = Vdist(playerCoords, v[1], v[2], v[3])

            if distance < 1.5 then
                isNearShop = true
            end
        end

        Citizen.Wait(350)
    end
end)
----------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do

        _menuPool:ProcessMenus()

        if isNearShop then
            showInfobar(Translation[Config.Locale]["press_menu"])
            

            if IsControlJustReleased(0, 38) then
                playAnim('mp_common', 'givetake1_a', Config.Animation.Time)
                openShopMenu()
            end
        elseif _menuPool:IsAnyMenuOpen() then
            _menuPool:CloseAllMenus()
        end

        Citizen.Wait(1)
    end
end)
----------------------------------------------------------------------------------
function openShopMenu()
    local shopMenu = NativeUI.CreateMenu(Translation[Config.Locale]["menu_title"], Translation[Config.Locale]["menu_subtitle"])
    _menuPool:Add(shopMenu)

    local background = Sprite.New("custommenubanner", "shopbanner")
    shopMenu:SetBannerSprite(background, true)

    for k, v in pairs(Config.Items) do
        local Items = NativeUI.CreateItem("~s~" .. v.ItemLabel , Translation[Config.Locale]["thanks"])
        Items:RightLabel("~g~" .. v.Price .. "$")
        shopMenu:AddItem(Items)
    end

    shopMenu.OnItemSelect = function(sender, item, index)
        local selectedItem = Config.Items[index]
        if selectedItem then
            local ItemValue = selectedItem.ItemValue
            local ItemLabel = selectedItem.ItemLabel
            local ItemPrice = selectedItem.Price
            TriggerServerEvent("ms_shop:buyItem", ItemValue, ItemPrice, ItemLabel)
        end
    end

    shopMenu:Visible(true)
    _menuPool:MouseEdgeEnabled(false)
end
----------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        for k, v in pairs(Config.Locations) do
            DrawMarker(Config.MarkerType, v[1], v[2], v[3], 0, 0, 0, 0, 0, 0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, Config.MarkerColor.a, false, true, 2, nil, nil, false)
        end

        Citizen.Wait(1)
    end
end)
----------------------------------------------------------------------------------
Citizen.CreateThread(function()
    for k, v in pairs(Config.Locations) do
        local Blip = AddBlipForCoord(v[1], v[2], v[3])
        SetBlipSprite(Blip, Config.BlipSprite)
        SetBlipScale(Blip, Config.BlipScale)
        SetBlipColour(Blip, Config.BlipColor)
        SetBlipAsShortRange(Blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Translation[Config.Locale]["blip_label"])
        EndTextCommandSetBlipName(Blip)
    end
end)
----------------------------------------------------------------------------------
function showInfobar(msg)
    CurrentActionMessage = msg
    SetTextComponentFormat("STRING")
    AddTextComponentString(CurrentActionMessage)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, true)
end

function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end
----------------------------------------------------------------------------------