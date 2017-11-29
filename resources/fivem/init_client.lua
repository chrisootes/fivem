AddEventHandler('onClientMapStart', function()
  Citizen.Trace('Trigger server')
  TriggerServerEvent("playerConnected");
  Citizen.Trace('Removing loading screen')
  ShutdownLoadingScreen()
end)

RegisterNetEvent('onClientConnected')
AddEventHandler('onClientConnected', function(data)
  Citizen.Trace('Load player data')
  local SpawnPoint = {}
  SpawnPoint.x = data.x
  SpawnPoint.y = data.y
  SpawnPoint.z = data.z
  SpawnPoint.heading = data.heading
  Citizen.Trace('Spawning player on lobby location')
  TriggerEvent('SpawnPlayer', SpawnPoint)
end)
