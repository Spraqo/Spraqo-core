RegisterServerEvent('Spraqo:SpawnPlayer')
AddEventHandler('Spraqo:SpawnPlayer', function()
    local source = source
    exports.ghmattimysql:execute('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifier(source)
    }, function(result)
        local SpawnPos = json.decode(result[1].position)
        TriggerClientEvent('Spraqo:lastPosition', source, SpawnPos[1], SpawnPos[2], SpawnPos[3])
    end)
end)

--MySQL.Async.execute

RegisterServerEvent('Spraqo:SavePlayerPosition')
AddEventHandler('Spraqo:SavePlayerPosition', function(PosX, PosY, PosZ)
    local source = source
    exports.ghmattimysql:execute('UPDATE users SET position = @position WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifier(source),
        ['@position'] = '{ ' .. PosX  .. ', ' .. PosY .. ', ' .. PosZ .. '}'
    })
end)