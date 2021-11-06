fx_version 'adamant'

game 'gta5'

description 'FiveM- and ESX-Addon from Dreaminfinity.de'

author 'EThunder, Grewo'

version '1.1.1'

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',

	'locales/en.lua',

	'config.lua',

	'server/server.lua',
	'server/sv_commands.lua',
}

client_scripts {
	'@es_extended/locale.lua',

	'locales/en.lua',

	'config.lua',
	'config_npcs.lua',

	'client/client.lua',
	'client/npcs.lua',
}

dependency {
	'es_extended',
}
