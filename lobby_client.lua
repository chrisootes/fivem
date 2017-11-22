local LobbyLocation = {
  ["x"] = 0.0,
  ["y"] = 0.0,
  ["z"] = 0.0,
  ["heading"] = 0.0,
  ["radius"] = 0.0,
  ["model"] = 0.0,
  ["car"] = false
}

function SetLobbyLocation(NewLocation)
  LobbyLocation = {
    ["x"] = NewLocation.x,
    ["y"] = NewLocation.y,
    ["z"] = NewLocation.z,
    ["heading"] = NewLocation.heading,
    ["radius"] = NewLocation.radius,
    ["car"] = false
  }
end

function GoToLoby()
  -- strip weapons

end
