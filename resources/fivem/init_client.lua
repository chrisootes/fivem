AddEventHandler('onClientMapStart', function()
  Citizen.Trace("Removing loading screen")
  ShutdownLoadingScreen()
end)
