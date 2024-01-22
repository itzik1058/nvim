return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
    },
  },
}
