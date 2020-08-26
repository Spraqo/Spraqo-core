--SPRAQO CORE V1.0.0

MySQL.ready(function ()
    print(MySQL.Sync.fetchScalar('SELECT @parameters', {
      ['@parameters'] =  'Spraqo'
    }))
end)

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local source = source
    local identifiers = GetPlayerIdentifiers(source)
    local identifier

    for k, v in ipairs(identifiers) do
        if string.match(v, 'steam') then
            identifier = v
            break
        end
    end

    if not identifier then
        deferrals.done('spraqo-core: You need to open steam')
    else
        deferrals.done()

        exports.ghmattimysql:scalar('SELECT 1 FROM users WHERE identifier = @identifier', {
            ['@identifier'] = identifier
        }, function(result)
            if not result then
                exports.ghmattimysql:execute('INSERT INTO users (identifier) VALUES (@identifier)', {
                    ['@identifier'] = identifier
                })
            end
        end)
    end

end)

RegisterServerEvent('Spraqo:SetSteamName')
AddEventHandler('Spraqo:SetSteamName', function(PosX, PosY, PosZ)
    local source = source
    local steamName = GetPlayerName(source)
    exports.ghmattimysql:execute('UPDATE users SET name = @name WHERE identifier = @identifier', {
        ['@identifier'] = GetPlayerIdentifier(source),
        ['@name'] = steamName
    })
end)
