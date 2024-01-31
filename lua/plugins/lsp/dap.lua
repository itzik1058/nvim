return {
  "mfussenegger/nvim-dap",
  main = "dap",
  dependencies = {
    -- { "Weissle/persistent-breakpoints.nvim" },
  },
  config = function(plugin, _)
    local signs = {
      Breakpoint = "",
      BreakpointCondition = "ﳁ",
      BreakpointRejected = "",
      LogPoint = "",
      Stopped = "",
    }
    for type, icon in pairs(signs) do
      local sign = "Dap" .. type
      local hl = sign
      if string.match(type, "Breakpoint") then
        hl = "DapBreakpoint"
      end
      vim.fn.sign_define(sign, { text = icon, texthl = hl, numhl = hl })
    end

    -- local pb = require "persistent-breakpoints"
    -- pb.setup {
    --   load_breakpoints_event = { "BufReadPost" },
    -- }

    local dap = require(plugin.main)
    -- local pbapi = require "persistent-breakpoints.api"

    vim.keymap.set("n", "<leader>dn", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<leader>dh", dap.step_out, { desc = "Step Out" })
    vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "Step Over" })
    vim.keymap.set("n", "<leader>dk", dap.step_back, { desc = "Step Back" })
    vim.keymap.set("n", "<leader>dl", dap.step_into, { desc = "Step Into" })
    vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })

    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input "[Condition] > ")
    end, { desc = "Conditional Breakpoint" })
    -- vim.keymap.set("n", "<leader>db", pbapi.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    -- vim.keymap.set("n", "<leader>dB", pbapi.set_conditional_breakpoint, { desc = "Conditional Breakpoint" })
    -- vim.keymap.set("n", "<leader>dcb", pbapi.clear_all_breakpoints, { desc = "Clear breakpoints" })
  end,
}
