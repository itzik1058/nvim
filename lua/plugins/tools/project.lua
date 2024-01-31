return {
  "ahmedkhalf/project.nvim",
  main = "project_nvim",
  opts = {},
  config = function(plugin, opts)
    require(plugin.main).setup(opts)

    require("telescope").load_extension "projects"
  end,
}
