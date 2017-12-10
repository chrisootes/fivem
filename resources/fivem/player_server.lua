AddEventHandler("playerConnecting", function(player_name, set_kick_reason)
  print("Player connecting: " .. player_name)
end)

AddEventHandler("playerConnected", function()
  player_name = GetPlayerName(source)
  print("Player connected: " .. player_name)
  player_data = data[player_name]
  if player_data == nil then
    player_data = data["newplayer"]
  end
  print("Player data: " .. player_data)
  TriggerClientEvent("onClientConnected", player_data)
end)
