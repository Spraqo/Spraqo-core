fx_version 'bodacious'
games {'gta5'}

client_script 'client.lua'

server_script { 
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}