fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'lachysek'
description 'Evidence bag for police'

client_scripts {
    'client/**.lua'
}

server_scripts {
  'server/**.lua'
}

shared_scripts {
  '@ox_lib/init.lua',
  'config.lua'
}

dependencies {
  'ox_inventory'
}