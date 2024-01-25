local function parse_filename(path)
  if path ~= nil and string.find(path, "/") then
    local orig_path = path
    for w in orig_path:gmatch "([^/]+)" do
      path = w
    end
    path = string.format("%s", path)
  end
  return path
end

local function get_venv()
  return (
    parse_filename(os.getenv "CONDA_DEFAULT_ENV")
    or parse_filename(os.getenv "VIRTUAL_ENV")
    or package.loaded["venv-selector"] and parse_filename(require("venv-selector").get_active_venv())
  )
end

return {
  function()
    return " " .. get_venv()
  end,
  cond = function()
    return vim.bo.filetype == "python" and get_venv() ~= nil
  end,
}
