SetMapName('San Andreas')
SetGameType('Freeroam')

-- load database

AddEventHandler('playerConnecting', function(playerName, setKickReason)
  print('Player connecting: ' .. playerName)
end)

AddEventHandler('playerConnected', function()
  playerName = GetPlayerName(source)
  print('Player connected: ' .. playerName)

  -- give player data
end)
