return {
  "akinsho/git-conflict.nvim",
  version = "*",
  opts = {
    default_mappings = false,
  },
  config = function(_, opts)
    require("git-conflict").setup(opts)
    vim.keymap.set("n", "<leader>gco", "<cmd> GitConflictChooseOurs <CR>", { desc = "Conflict choose ours" })
    vim.keymap.set("n", "<leader>gct", "<cmd> GitConflictChooseTheirs <CR>", { desc = "Conflict choose theirs" })
    vim.keymap.set("n", "<leader>gcb", "<cmd> GitConflictChooseBoth <CR>", { desc = "Conflict choose both" })
    vim.keymap.set("n", "<leader>gc0", "<cmd> GitConflictChooseNone <CR>", { desc = "Conflict choose none" })
    vim.keymap.set("n", "]x", "<cmd> GitConflictNextConflict <CR>", { desc = "Next conflict" })
    vim.keymap.set("n", "[x", "<cmd> GitConflictPrevConflict <CR>", { desc = "Previous conflict" })
    vim.keymap.set("n", "<leader>gca", "<cmd> GitConflictListQf <CR>", { desc = "Open conflict list" })
  end,
}
