return {
  -- Set lualine as statusline
  "nvim-lualine/lualine.nvim",
  dependencies = {
    -- { "arkav/lualine-lsp-progress", opts = {} },
  },
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      theme = "catppuccin",
      component_separators = "|",
      section_separators = "",
    },
    sections = {
      -- lualine_d = { "lsp_progress" },
    },
  },
}
