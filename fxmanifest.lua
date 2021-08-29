fx_version 'adamant'

game 'gta5'

description 'FiveM Server addon by Grewo'

version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'de.lua',
	'config.lua',
	'server/server.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'de.lua',
	'config.lua',
	'client/client.lua',
}

dependency {
	'es_extended',
}
