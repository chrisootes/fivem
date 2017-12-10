AddEventHandler( "rconCommand", function(command_name, command_arguments)
  if command_name:lower() == "clientkick" then
      local player_id = table.remove(command_arguments, 1)
      local message = table.concat(command_arguments, " ")
      DropPlayer(player_id, message)
      CancelEvent()
  elseif command_name:lower() == "clientspawn" then
    local  = table.remove(command_arguments, 1)
    TriggerClientEvent("SpawnPlayer", )
  end
end)
