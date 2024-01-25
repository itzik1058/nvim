return {
  "mfussenegger/nvim-dap-python",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("dap-python").setup "python"

    table.insert(require("dap").configurations.python, {
      type = "python",
      request = "launch",
      name = "Module",
      console = "integratedTerminal",
      cwd = "${workspaceFolder}",
    })
  end,
}
