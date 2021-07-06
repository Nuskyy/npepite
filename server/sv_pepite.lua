ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

PlayerSelling = {}

RegisterServerEvent('n:casserole')
AddEventHandler('n:casserole', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    Citizen.Wait(12000)
    xPlayer.addInventoryItem('terrehumide', 1)
end)
RegisterNetEvent('n:terrehumide')
AddEventHandler('n:terrehumide', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local TerreCount = xPlayer.getInventoryItem('terrehumide').count
    if TerreCount >= 1 then 
        local pepite = 1
        pepite = math.random(1,3)
        Citizen.Wait(12000)
        xPlayer.removeInventoryItem('terrehumide', 1)
        xPlayer.addInventoryItem('or', pepite)
    end 
end)

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    print('Merci Nuskyy#1284')
    print('Merci Nuskyy#1284')
    print('Merci Nuskyy#1284')
    print('Merci Nuskyy#1284')
    print('Merci Nuskyy#1284')
    print('Merci Nuskyy#1284')
    Citizen.Wait(2000)
end)

local function sellpepite()
    local xPlayer = ESX.GetPlayerFromId(source)
    local PepiteCount = xPlayer.getInventoryItem('or').count
    if PlayerSelling[source] == true then 
        if PepiteCount >= 1 then 
            local payement = 25
            payement = math.random(20,30)
            xPlayer.removeInventoryItem("or", 1)
            xPlayer.addMoney(payement)
        end 
    end 
end 

RegisterServerEvent('n:ventepepite')
AddEventHandler('n:ventepepite', function()
    if PlayerSelling[source] == false then 
        PlayerSelling[source] = false
    else 
        PlayerSelling[source] = true 
        sellpepite()
    end
end)

RegisterServerEvent('n:stopvente')
AddEventHandler('n:stopvente', function()
    if PlayerSelling[source] == true then 
        PlayerSelling[source] = false
    else 
        PlayerSelling[source] = false 
    end
end)

ESX.RegisterUsableItem('casserole', function(source)
	TriggerClientEvent('n:usecasserole', source)
end)