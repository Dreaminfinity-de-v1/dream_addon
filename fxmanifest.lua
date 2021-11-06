fx_version 'adamant'

game 'gta5'

description 'FiveM- and ESX-Addon from Dreaminfinity.de'

version '1.1.0'

author 'EThunder, Grewo'

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
	'config_npcs.lua',
	'client/client.lua',
	'client/npcs.lua',
}

dependency {
	'es_extended',
}
