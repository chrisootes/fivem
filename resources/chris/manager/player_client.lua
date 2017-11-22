local PlayerModel = "a_m_m_bevhills_02"

function setPlayerModel(newPlayerModel)
  PlayerModel = newPlayerModel
end

function SpawnPlayer(SpawnPoint)
  RequestModel(PlayerModel)
  while not HasModelLoaded(PlayerModel) do
    Wait(0)
  end
  SetPlayerModel(PlayerId(), PlayerModel)
  SetModelAsNoLongerNeeded(PlayerModel)
  RequestCollisionAtCoord(SpawnPoint.x, SpawnPoint.y, SpawnPoint.z)
  local PlayerPed = GetPlayerPed(-1)
  SetEntityCoordsNoOffset(PlayerPed, SpawnPoint.x, SpawnPoint.y, SpawnPoint.z, false, false, false, true)
  NetworkResurrectLocalPlayer(SpawnPoint.x, SpawnPoint.y, SpawnPoint.z, SpawnPoint.heading, true, true, false)
  ClearPedTasksImmediately(PlayerPed)
  RemoveAllPedWeapons(PlayerPed)
  ClearPlayerWantedLevel(PlayerId())
  while not HasCollisionLoadedAroundEntity(PlayerPed) do
    Wait(0)
  end
  TriggerEvent('onPlayerSpawned', SpawnPoint)
end

function GivePlayer()
  GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1, false, false)
end

Citizen.CreateThread(
function()
  while true do
    Wait(0)
    local player = PlayerId()
    if NetworkIsPlayerActive(player) then
      local ped = PlayerPedId()
      if IsPedFatallyInjured(ped) then
        TriggerEvent('onPlayerDown')
      end
    end
end)
