return {
  "linux-cultist/venv-selector.nvim",
  main = "venv-selector",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap-python",
  },
  opts = {
    auto_refresh = true,
    dap_enabled = true,
    parents = 0,
    name = { "venv", ".venv" },
  },
  config = function(plugin, opts)
    local vs = require(plugin.main)
    vs.setup(opts)

    vim.api.nvim_create_autocmd("VimEnter", {
      desc = "Auto select virtualenv",
      pattern = "*",
      callback = function()
        local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
        if venv ~= "" then
          vs.retrieve_from_cache()
        end
      end,
      once = true,
    })
  end,
}
