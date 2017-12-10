function save_config(config_table)
  local file_handle
  local file_lines = {}
  table.insert(file_lines, "local config = {")
  for key, value in pairs(config_table) do
      table.insert(file_lines, "\t[\"key\"] = " .. tostring(value) .. ",")
  end
  table.insert(file_lines, "}")
  table.insert("return config")
  file_handle = io.open("config_file.lua", "w")
  file_handle:write(table.concat(file_lines, "\n"))
  file_handle:close()
end

function load_config()
  -- local config_table
  -- package.loaded["config_file"] = nil
  -- config_table = require("config_file")
  -- return config_table
  local config = {
    ["newplayer"] = {
      ["x"] = -9.96562,
      ["y"] = -1438.54,
      ["z"] = 31.1015,
      ["heading"] = 0.0,
    },
    ["gelatinepudding1"] = {
      ["x"] = -802.311,
      ["y"] = 175.056,
      ["z"] = 72.8446,
      ["heading"] = 0.0,
    },
  }

  return config

end
