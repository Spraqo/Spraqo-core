--SPRAQO CORE V1.0.0

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('Spraqo:SetSteamName')
end)










--Base scripts

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        local plyr = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(plyr)

        ClearAreaOfCops(playerLoc.x, playerLoc.y, playerLoc.z, 400.0)
    end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		for i = 1, 12 do
			EnableDispatchService(i, false)
		end
		SetPlayerWantedLevel(PlayerId(), 0, false)
		SetPlayerWantedLevelNow(PlayerId(), false)
		SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
	end
end)
