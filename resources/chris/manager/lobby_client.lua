local LobbyLocation = {
  ["x"] = -1664.5,
  ["y"] = -537.5,
  ["z"] = 35.3,
  ["radius"] = 0.0
}

function gotoLoby()
  local SpawnPoint
  SpawnPoint.x = LobbyLocation.x + math.random(-LobbyLocation.radius, LobbyLocation.radius)
  SpawnPoint.y = LobbyLocation.y + math.random(-LobbyLocation.radius, LobbyLocation.radius)
  SpawnPoint.z = -500.0
  SpawnPoint.heading = math.random(0.0, 1.0)
  SpawnPlayer(SpawnPoint)
end
