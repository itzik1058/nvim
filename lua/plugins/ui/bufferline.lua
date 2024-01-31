return {
  "akinsho/bufferline.nvim",
  enabled = false,
  main = "bufferline",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "NvimTree",
          text = "NvimTree",
          text_align = "left",
          separator = true,
        },
      },
    },
  },
  config = function(plugin, opts)
    require(plugin.main).setup(opts)

    vim.keymap.set("n", "<tab>", "<cmd> BufferLineCycleNext <CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<S-tab>", "<cmd> BufferLineCyclePrev <CR>", { desc = "Previous buffer" })
  end,
}
