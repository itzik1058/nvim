return {
  "nvim-telescope/telescope-dap.nvim",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("telescope").load_extension "dap"
  end,
}
