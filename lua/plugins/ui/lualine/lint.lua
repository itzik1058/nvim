return {
  function()
    local linters = require("lint").get_running()
    if #linters == 0 then
      return "󰦕"
    end
    return "󱉶 " .. table.concat(linters, ", ")
  end,
  cond = function()
    return package.loaded["lint"] ~= nil
  end,
}
