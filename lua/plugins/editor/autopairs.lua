return {
  "windwp/nvim-autopairs",
  main = "nvim-autopairs",
  opts = {
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
  },
  config = function(plugin, opts)
    require(plugin.main).setup(opts)

    -- setup cmp for autopairs
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
