AddEventHandler('playerSpawned', function()
    TriggerServerEvent('Spraqo:SpawnPlayer')
end)

RegisterNetEvent('Spraqo:lastPosition')
AddEventHandler('Spraqo:lastPosition', function(PosX, PosY, PosZ)
    Citizen.Wait(1)

    local defaulModel = GetHashKey('mp_m_freemode_01')
    RequestModel(defaulModel)
    while not HasModelLoaded(defaulModel) do
        Citizen.Wait(1)
    end
    SetPlayerModel(PlayerId(), defaulModel)
    SetPedDefaultComponentVariation(PlayerPedId())
    SetModelAsNoLongerNeeded(defaulModel)

    SetEntityCoords(GetPlayerPed(-1), PosX, PosY, PosZ, 1, 0, 0, 1)
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(5000)

        lastX, lastY, lastZ = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
        TriggerServerEvent('Spraqo:SavePlayerPosition', lastX, lastY, lastZ)
    end
end)