SetMapName('San Andreas')
SetGameType('Freeroam')

-- load database

AddEventHandler('playerConnecting', function(PlayerName, setKickReason)
  print('Player connecting: ' .. PlayerName)
end)

AddEventHandler('playerConnected', function()
  PlayerName = GetPlayerName(source)
  print('Player connected: ' .. PlayerName)
  -- give player data
  TriggerClientEvent('onClientConnected', data)
end)
