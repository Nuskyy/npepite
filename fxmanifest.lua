fx_version 'adamant'

game 'gta5'

description 'pepite'
author 'nuskyy'
version '0.0.1'


client_scripts{
    '@es_extended/locale.lua',
    'client/cl_pepite.lua',
}

server_scripts{
    '@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
    'server/sv_pepite.lua',
}