return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  opts = {
    auto_refresh = true,
    dap_enabled = true,
    parents = 0,
    name = { "venv", ".venv" },
  },
}
