-- In your plugins configuration
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      dim = { enabled = false },
      explorer = { enabled = true },
      git = { enabled = false },
      gitbrowse = { enabled = false },
      indent = { 
          enabled = true,
          only_scope = true,
          char ="│",
          scope = {
              enabled = true,
              char = "│",
          },
      },
      input = { enabled = false },
      picker = { enabled = true },
      notifier = { enabled = false },
      quickfile = { enabled = true },
      rename = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    },
  },
}
