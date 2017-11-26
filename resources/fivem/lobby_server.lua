local serverLobbyLocation = {
  x = 0.0,
  y = 0.0,
  z = 0.0,
  radius = 0.0
}

AddEventHandler('setServerLobbyLocation', function(x, y, z, radius)
  serverLobbyLocation.x = x
  serverLobbyLocation.y = y
  serverLobbyLocation.z = z
  serverLobbyLocation.radius = radius
end

AddEventHandler('playerConnecting', function(playerName, setKickReason)
  TriggerClientEvent("setClientLobbyLocation", serverLobbyLocation.x, serverLobbyLocation.y, serverLobbyLocation.z, serverLobbyLocation.radius)
  TriggerClientEvent("gotoLobby")
end)
