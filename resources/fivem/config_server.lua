function save_config(config_table)
    local file_handle
    local file_lines = {}
    table.insert(file_lines, "local config = {")
    for key, value in pairs(config_table) do
        table.insert(file_lines, "\t[\"key\"] = " .. tostring(value) .. ",")
    end
    table.insert(file_lines, "}")
    table.insert("return config")
    file_handle = io.open("config_server.cfg", "w")
    file_handle:write(table.concat(file_lines, "\n"))
    file_handle:close()
end

function load_config()
    local config_table
    package.loaded[configModule] = nil
    config_table = require("config_server.cfg")
    return config_table
end
