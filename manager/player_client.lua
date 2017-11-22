local AutoSpawn = false
local SpawnPoints = {}
local SpawnPointIndex = 0
local PlayerModel = {
  ["model"] = 0,
  ["clothes"] = false
}

function addSpawnPoint(SpawnPoint, CleanTable)
  if CleanTable == true then
    SpawnPoints = {}
    SpawnPointIndex = 0
  else
    SpawnPointIndex = SpawnPointIndex + 1
  end
  SpawnPoint.index = SpawnPointIndex
  table.insert(SpawnPoints, SpawnPoint)
end

function SpawnPlayer()
  SpawnPointIndex = GetRandomIntInRange(1, #SpawnPoints + 1)
  SetEntityCoords(GetPlayerPed(-1), LobbyLocation.x, LobbyLocation.y, LobbyLocation.z)
end

-- check dead
