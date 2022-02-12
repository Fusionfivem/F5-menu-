-- Resource Metadata
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Fusion'
description 'F5 Menu'
version '1.0.0'

-- What to run
client_scripts {
    '@menuv/menuv.lua',
    'client.lua',
	'config.lua'
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
	'config.lua',
    "server.lua",
	'svconfig.lua',
}

shared_script 'config.lua'

