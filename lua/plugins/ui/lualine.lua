local function parse_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil and string.find(venv, "/") then
    local orig_venv = venv
    for w in orig_venv:gmatch "([^/]+)" do
      venv = w
    end
    venv = string.format("%s", venv)
  end
  return venv
end

local venv_plugin = {
  function()
    local venv = parse_venv "CONDA_DEFAULT_ENV" or parse_venv "VIRTUAL_ENV" or "NO ENV"
    return " " .. venv
  end,
  cond = function()
    return vim.bo.filetype == "python"
  end,
}

return {
  -- Set lualine as statusline
  "nvim-lualine/lualine.nvim",
  dependencies = {
    -- { "arkav/lualine-lsp-progress", opts = {} },
  },
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = "|",
      section_separators = "",
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {
        "filename",
        -- "lsp_progress",
      },
      lualine_x = { "encoding", "fileformat", "filetype", venv_plugin },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
