AddEventHandler( 'rconCommand', function(commandName, args)
  if commandName:lower() == 'clientkick' then
      local playerId = table.remove(args, 1)
      local msg = table.concat(args, ' ')
      DropPlayer(playerId, msg)
      CancelEvent()
  elseif commandName:lower() == 'gotolobby' then
    local playerId = table.remove(args, 1)
    TriggerClientEvent('gotoLobby', playerId)
  end
end)
