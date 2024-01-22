return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    direction = "float",
  },
  config = function(_, opts)
    local toggleterm = require "toggleterm"
    toggleterm.setup(opts)

    vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
  end,
}
