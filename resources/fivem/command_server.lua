AddEventHandler( 'rconCommand', function(CommandName, CommandArguments)
  if CommandName:lower() == 'clientkick' then
      local PlayerId = table.remove(CommandArguments, 1)
      local Message = table.concat(CommandArguments, ' ')
      DropPlayer(PlayerId, Message)
      CancelEvent()
  elseif CommandName:lower() == 'clientspawn' then
    local  = table.remove(CommandArguments, 1)
    TriggerClientEvent('SpawnPlayer', )
  end
end)
