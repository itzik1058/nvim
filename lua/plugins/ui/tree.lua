WIDTH_RATIO = 0.7
HEIGHT_RATIO = 0.8

local function open_win_config()
  local screen_w = vim.opt.columns:get()
  local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
  local window_w = screen_w * WIDTH_RATIO
  local window_h = screen_h * HEIGHT_RATIO
  local window_w_int = math.floor(window_w)
  local window_h_int = math.floor(window_h)
  local center_x = (screen_w - window_w) / 2
  local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
  return {
    border = "rounded",
    relative = "editor",
    row = center_y,
    col = center_x,
    width = window_w_int,
    height = window_h_int,
  }
end

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  api.config.mappings.default_on_attach(bufnr)

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set("n", "<leader>r", function()
    api.tree.change_root_to_node(api.tree.get_node_under_cursor())
  end, opts "Change root")
  vim.keymap.set("n", "<esc>", api.tree.close, opts "Close")
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  main = "nvim-tree",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    on_attach = on_attach,
    disable_netrw = true,
    hijack_netrw = true,
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    view = {
      relativenumber = true,
      float = {
        enable = true,
        open_win_config = open_win_config,
      },
      width = function()
        return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
      end,
    },
    renderer = {
      icons = {
        git_placement = "signcolumn",

        glyphs = {
          git = {
            unstaged = "U",
            staged = "S",
            unmerged = "UM",
            renamed = "R",
            deleted = "D",
            untracked = "UT",
            ignored = "I",
          },
        },
      },
    },
  },
  config = function(plugin, opts)
    local nvim_tree = require(plugin.main)
    nvim_tree.setup(opts)

    vim.keymap.set("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
  end,
}
