local venv = require "plugins.ui.lualine.venv"
local lint = require "plugins.ui.lualine.lint"

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
        lint,
      },
      lualine_x = {
        "encoding",
        "fileformat",
        "filetype",
        venv,
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },
}
