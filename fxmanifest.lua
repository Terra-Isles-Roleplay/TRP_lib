fx_version 'cerulean'
game 'gta5'

name "TRP_lib"
description "TRP Libary"
author "Tristian R. / TRP Dev Team"
version "1.0.0-beta"

lua54 'on'

shared_scripts{
	'@ox_lib/init.lua',
	'@TRP_lib/init.lua',
	'main.lua',
	'**/shared.lua'
}

client_scripts{
	'**/client.lua',
}
server_scripts{
	'**/server.lua',
	'server.lua'
}

files{
	"init.lua",
}
