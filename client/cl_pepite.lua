ESX = nil 
Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(120)
    end
end)

RegisterNetEvent('n:usecasserole')
AddEventHandler('n:usecasserole', function()
    pepite()
end)

function pepite()
    local ped = GetPlayerPed(-1)
    local pProps = GetHashKey("prop_kitch_pot_lrg")

    local time = 12000
	local ped = GetPlayerPed(-1)
    if casseroltime and casseroltime > GetGameTimer() then 
		if notifCass then 
			RemoveNotification(notifCass) 
		end
		notifCass = ESX.ShowNotification(string.format("~r~Veuillez patienter encore %s seconde(s) avant de re-utiliser votre casserole.", math.floor((casseroltime - GetGameTimer()) / 1000))) return 
	end
	local treeeeTime = 0 + time
	casseroltime = GetGameTimer() + treeeeTime

    local casse=CreateObject(pProps,GetEntityCoords(GetPlayerPed(-1))+GetEntityForwardVector(GetPlayerPed(-1))*0.7-vec3(0.0,0.0,1.0),true,true,true)
    FreezeEntityPosition(casse,true)
    SetNetworkIdCanMigrate(ObjToNet(casse),false)

    if IsEntityInWater(ped) then 
        TriggerServerEvent('n:casserole')
    elseif not IsEntityInWater(ped) then 
        TriggerServerEvent('n:terrehumide')
    end
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_BUM_WASH", 0, false)
    Citizen.Wait(12000)
    ClearPedTasks(GetPlayerPed(-1))
    SetModelAsNoLongerNeeded(pProps)
    DeleteEntity(casse)
end 


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

local vente = { {x = 1072.91, y = -2008.89 , z = 32.08 } }

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k in pairs(vente) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, vente[k].x, vente[k].y, vente[k].z)

            if dist <= 2 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_PICKUP~ pour vendre vos ~b~pepites d'or~s~")
				if IsControlJustPressed(1,38) then 
					TriggerServerEvent('n:ventepepite')
				end
            end
		end
    end
end) 
Citizen.CreateThread(function()
    Citizen.Wait(50)
	for i=1, 1 do
		
		local blip = AddBlipForCoord(vente[i].x, vente[i].y, vente[i].z)
		SetBlipSprite (blip, 1)
		SetBlipDisplay(blip, 4)
		SetBlipColour (blip, 46)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Vente de pepite d\'or')
		EndTextCommandSetBlipName(blip)
	end

end)

Citizen.CreateThread(function()
    local hash = GetHashKey("a_m_m_prolhost_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "a_m_m_prolhost_01", 1072.91, -2008.89 , 31.08 , 64.1554794, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)