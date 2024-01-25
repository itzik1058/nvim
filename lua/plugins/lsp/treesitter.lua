return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  opts = {
    ensure_installed = {
      "lua",
      "python",
      "javascript",
      "typescript",
      "jsdoc",
      "svelte",
      "json",
      "json5",
      "jsonc",
      "sql",
      "gitignore",
      "yaml",
      "toml",
      "html",
    },
    auto_install = true,

    highlight = {
      enable = true,
      disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    indent = { enable = false },
    incremental_selection = {
      enable = true,
      keymaps = {
        node_incremental = "v",
      },
    },
    textobjects = {
      select = {
        enable = true,
        -- lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]f"] = "@function.outer",
          ["]c"] = "@class.outer",
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]C"] = "@class.outer",
        },
        goto_previous_start = {
          ["[f"] = "@function.outer",
          ["[c"] = "@class.outer",
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[C"] = "@class.outer",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader>csp"] = "@parameter.inner",
          ["<leader>csf"] = "@function.outer",
          ["<leader>csc"] = "@class.outer",
        },
        swap_previous = {
          ["<leader>csP"] = "@parameter.inner",
          ["<leader>csF"] = "@function.outer",
          ["<leader>csC"] = "@class.outer",
        },
      },
    },
  },
}
