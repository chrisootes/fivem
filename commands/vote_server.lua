RegisterCommand("vote", function(source, args, rawCommand)
    print("Command from: " .. ((source == 0) and 'console' or GetPlayerName(source)) )

    print("Arguments were:")
    for k,v in pairs(args) do
        print("\t" .. k .. " = " .. v)
    end

    print("Raw Command: " .. rawCommand)
end, false)
