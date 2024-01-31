return {
  "goolord/alpha-nvim",
  opts = function()
    local dashboard = require "alpha.themes.dashboard"

    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  > Find File", "Telescope find_files<CR>"),
      dashboard.button("r", "  > Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("p", "  > Projects", ":Telescope projects<CR>"),
      dashboard.button("c", "  > Configuration", ":e $MYVIMRC | :cd %:p:h | pwd<CR>"),
      dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
    }

    return dashboard.opts
  end,
}
