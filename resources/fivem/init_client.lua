AddEventHandler("onClientMapStart", function()
  Citizen.Trace("Trigger server playerConnected")
  TriggerServerEvent("playerConnected");
  Citizen.Trace("Removing loading screen")
  ShutdownLoadingScreen()
end)

RegisterNetEvent("onClientConnected")
AddEventHandler("onClientConnected", function(player_data)
  Citizen.Trace("Load player data")
  local spawn_point = {}
  spawn_point.x = player_data.x
  spawn_point.y = player_data.y
  spawn_point.z = player_data.z
  spawn_point.heading = player_data.heading
  Citizen.Trace("Spawning player on lobby location")
  spawn_player(spawn_point)
end)
