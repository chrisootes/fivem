local PlayerModel = 'a_m_y_skater_01'

RegisterNetEvent('setPlayerModel')
AddEventHandler('setPlayerModel', function(newPlayerModel)
  PlayerModel = newPlayerModel
end

RegisterNetEvent('SpawnPlayer')
AddEventHandler('SpawnPlayer', function(SpawnPoint)
  Citizen.CreateThread(function()
    Citizen.Trace('Fade screen out')
    DoScreenFadeOut(500)
    while IsScreenFadingOut() do
      Citizen.Wait(1)
    end
    Citizen.Trace('Player model')
    RequestModel(PlayerModel)
    while not HasModelLoaded(PlayerModel) do
      Citizen.Wait(1)
    end
    SetPlayerModel(PlayerId(), PlayerModel)
    SetModelAsNoLongerNeeded(PlayerModel)
    Citizen.Trace('Teleport location')
    RequestCollisionAtCoord(SpawnPoint.x, SpawnPoint.y, SpawnPoint.z)
    local PlayerPed = GetPlayerPed(-1)
    SetEntityCoordsNoOffset(PlayerPed, SpawnPoint.x, SpawnPoint.y, SpawnPoint.z, false, false, false, true)
    NetworkResurrectLocalPlayer(SpawnPoint.x, SpawnPoint.y, SpawnPoint.z, SpawnPoint.heading, true, false)
    Citizen.Trace('Clear effects')
    ClearPedTasksImmediately(PlayerPed)
    RemoveAllPedWeapons(PlayerPed)
    ClearPlayerWantedLevel(PlayerId())
    while not HasCollisionLoadedAroundEntity(PlayerPed) do
      Citizen.Wait(1)
    end
    Citizen.Trace('Fade screen in')
    DoScreenFadeIn(500)
    while IsScreenFadingIn() do
      Citizen.Wait(1)
    end
    TriggerEvent('onPlayerSpawned', SpawnPoint)
  end)
end)

RegisterNetEvent('GivePlayer')
AddEventHandler('GivePlayer', function()
  GiveWeaponToPed(GetPlayerPed(-1), GetHashKey('WEAPON_FLASHLIGHT'), 1, false, false)
end)

Citizen.CreateThread(function()
  while true do
    Wait(50)
    local player = PlayerId()
    if NetworkIsPlayerActive(player) then
      local ped = PlayerPedId()
      if IsPedFatallyInjured(ped) then
        TriggerEvent('onPlayerDown')
      end
    end
  end
end)
