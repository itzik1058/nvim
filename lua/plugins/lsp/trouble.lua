return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local trouble = require "trouble"
    trouble.setup()
    vim.keymap.set("n", "<leader>dt", function()
      trouble.open()
    end)
    vim.keymap.set("n", "<leader>dw", function()
      trouble.open "workspace_diagnostics"
    end)
    vim.keymap.set("n", "<leader>dd", function()
      trouble.open "document_diagnostics"
    end)
    vim.keymap.set("n", "<leader>dq", function()
      trouble.open "quickfix"
    end)
    vim.keymap.set("n", "<leader>dl", function()
      trouble.open "loclist"
    end)
    vim.keymap.set("n", "gR", function()
      trouble.open "lsp_references"
    end)
  end,
}
