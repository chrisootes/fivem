local player_model = "a_m_y_skater_01"

function set_player_model(new_player_model)
  player_model = new_player_model
end

function spawn_player(spawn_point)
  Citizen.CreateThread(function()
    Citizen.Trace("Fade screen out")
    DoScreenFadeOut(500)
    while IsScreenFadingOut() do
      Citizen.Wait(1)
    end
    Citizen.Trace("Player model")
    RequestModel(player_model)
    while not HasModelLoaded(player_model) do
      Citizen.Wait(1)
    end
    SetPlayerModel(PlayerId(), player_model)
    SetModelAsNoLongerNeeded(player_model)
    Citizen.Trace("Teleport location")
    RequestCollisionAtCoord(spawn_point.x, spawn_point.y, spawn_point.z)
    local player_ped = GetPlayerPed(-1)
    SetEntityCoordsNoOffset(player_ped, spawn_point.x, spawn_point.y, spawn_point.z, false, false, false, true)
    NetworkResurrectLocalPlayer(spawn_point.x, spawn_point.y, spawn_point.z, spawn_point.heading, true, false)
    Citizen.Trace("Clear effects")
    ClearPedTasksImmediately(player_ped)
    RemoveAllPedWeapons(player_ped)
    ClearPlayerWantedLevel(PlayerId())
    while not HasCollisionLoadedAroundEntity(player_ped) do
      Citizen.Wait(1)
    end
    Citizen.Trace("Fade screen in")
    DoScreenFadeIn(500)
    while IsScreenFadingIn() do
      Citizen.Wait(1)
    end
    Citizen.Trace("Trigger onPlayerSpawned")
    TriggerEvent("onPlayerSpawned", spawn_point)
  end)
end)

function GivePlayer(Weapon)
  GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1, false, false)
end)

Citizen.CreateThread(function()
  while true do
    Wait(50)
    local player = PlayerId()
    if NetworkIsPlayerActive(player) then
      local ped = PlayerPedId()
      if IsPedFatallyInjured(ped) then
        Citizen.Trace("Trigger onPlayerDown")
        TriggerEvent("onPlayerDown")
      end
    end
  end
end)
