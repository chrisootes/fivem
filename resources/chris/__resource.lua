resource_type 'gametype' { name = 'Minigames' }

client_script "init_client.lua"
server_script "init_server.lua"

client_script "manager/lobby_client.lua"
server_script "manager/lobby_server.lua"

client_script "manager/player_client.lua"
