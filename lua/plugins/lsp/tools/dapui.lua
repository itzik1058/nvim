return {
  "rcarriga/nvim-dap-ui",
  main = "dapui",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function(plugin, opts)
    local dapui = require(plugin.main)

    dapui.setup(opts)

    local dap = require "dap"

    dap.listeners.before.attach.dapui_config = dapui.open
    dap.listeners.before.launch.dapui_config = dapui.open
    dap.listeners.before.event_terminated.dapui_config = dapui.open
    dap.listeners.before.event_exited.dapui_config = dapui.open

    vim.keymap.set("n", "<leader>dd", dapui.toggle, { desc = "Toggle UI" })
    vim.keymap.set({ "n", "x" }, "<leader>de", dapui.eval, { desc = "Evaluate" })
    vim.keymap.set("n", "<leader>dE", function()
      dapui.eval(vim.fn.input "[Expression] > ")
    end, { desc = "Evaluate Input" })
  end,
}
