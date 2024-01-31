return {
  "mfussenegger/nvim-dap-python",
  main = "dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function(plugin, _)
    require(plugin.main).setup "python"

    local dap = require "dap"

    table.insert(dap.configurations.python, {
      type = "python",
      request = "launch",
      name = "Module",
      console = "integratedTerminal",
      cwd = "${workspaceFolder}",
    })
  end,
}
