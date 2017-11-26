local clientLobbyLocation = {
  x = 0.0,
  y = 0.0,
  z = 0.0,
  radius = 0.0
}

AddEventHandler('setClientLobbyLocation', function(x, y, z, radius)
  clientLobbyLocation.x = x
  clientLobbyLocation.y = y
  clientLobbyLocation.z = z
  clientLobbyLocation.radius = radius
end

AddEventHandler('gotoLobby', function()
  local SpawnPoint = {}
  SpawnPoint.x = clientLobbyLocation.x + math.random(-clientLobbyLocation.radius, clientLobbyLocation.radius)
  SpawnPoint.y = clientLobbyLocation.y + math.random(-clientLobbyLocation.radius, clientLobbyLocation.radius)
  SpawnPoint.z = clientLobbyLocation.z
  SpawnPoint.heading = 0.0
  Citizen.Trace("Spawning player on lobby location")
  Citizen.Trace("X: " .. tostring(SpawnPoint.x))
  Citizen.Trace("Y: " .. tostring(SpawnPoint.y))
  Citizen.Trace("Z: " .. tostring(SpawnPoint.z))
  Citizen.Trace("Heading: " .. tostring(SpawnPoint.heading))
  exports.fivem:SpawnPlayer(SpawnPoint)
end
