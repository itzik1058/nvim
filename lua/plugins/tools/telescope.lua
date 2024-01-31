return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  main = "telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = "make",
      cond = function()
        return vim.fn.executable "make" == 1
      end,
    },
  },
  opts = {
    pickers = {
      find_files = {
        hidden = true,
        file_ignore_patterns = { ".git" },
      },
    },
  },
  config = function(plugin, opts)
    local telescope = require(plugin.main)
    telescope.setup(opts)

    -- use native fzf
    pcall(telescope.load_extension, "fzf")

    local builtin = require "telescope.builtin"

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find existing buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search diagnostics" })
  end,
}
