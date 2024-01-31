return {
  "folke/todo-comments.nvim",
  main = "todo-comments",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function(plugin, opts)
    local tc = require(plugin.main)
    tc.setup(opts)

    vim.keymap.set("n", "]t", tc.jump_next, { desc = "Next todo comment" })
    vim.keymap.set("n", "[t", tc.jump_prev, { desc = "Previous todo comment" })
  end,
}
