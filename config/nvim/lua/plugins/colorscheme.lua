return {
  -- add dracula
  { 
      "Mofiqul/dracula.nvim",
      lazy = false,
      priority = 9999,
  },
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },
  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
