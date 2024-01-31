return {
  "rcarriga/nvim-notify",
  main = "notify",
  config = function(plugin, _)
    vim.notify = require(plugin.main)
  end,
}
