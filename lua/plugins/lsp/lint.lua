return {
  "mfussenegger/nvim-lint",
  main = "lint",
  config = function(plugin, _)
    local lint = require(plugin.main)
    lint.linters_by_ft = {
      python = { "mypy" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
