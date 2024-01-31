return {
  "akinsho/toggleterm.nvim",
  version = "*",
  main = "toggleterm",
  opts = {
    direction = "float",
  },
  config = function(plugin, opts)
    local toggleterm = require(plugin.main)
    toggleterm.setup(opts)

    vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
  end,
}
