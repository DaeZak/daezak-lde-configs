vim.g.lazyvim_check_order = false

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ','
-- vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable compatibility to old-time vi
vim.opt.compatible = false

-- Always show the signcolumn, otherwise the text will shift each time
-- CoC diagnostics appear/become resolved
vim.opt.signcolumn = "yes"

-- UX/UI options
vim.opt.showcmd = true      -- Show info on the currently executing command
vim.opt.confirm = true      -- Confirmation dialog for actions that would otherwise fail
vim.opt.scrolloff = 5       -- keep 5 lines above/below the cursor

-- Search Options
vim.opt.showmatch = true    -- show matching brackets
vim.opt.hlsearch = true     -- highlight search
vim.opt.incsearch = true    -- incremental search
vim.opt.ignorecase = true   -- case insensitive search

-- Tab and indentation settings
vim.opt.tabstop = 4         -- number of columns occupied by a tab
vim.opt.softtabstop = 4     -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true    -- converts tabs to white space
vim.opt.shiftwidth = 4      -- width for autoindents
vim.opt.autoindent = true   -- indent a new line the same amount as the line just typed
-- vim.opt.number = true    -- add line numbers (commented out in original)

vim.opt.wildmode = "longest,list"  -- get bash-like tab completions
vim.opt.colorcolumn = "98"         -- set an 98 column border for good coding style

-- Mouse settings
vim.opt.mouse = "a"         -- enable mouse click
-- Note: mouse=v is overridden by mouse=a, so commenting out the second setting

vim.opt.clipboard = "unnamedplus"  -- using system clipboard

-- vim.opt.spell = true     -- enable spell check (commented out in original)
vim.opt.swapfile = false    -- disable creating swap file
vim.opt.backupdir = vim.fn.expand("~/.cache/vim")  -- Directory to store backup files

-- Switch buffers with F8 hot keys
vim.opt.switchbuf = "usetab"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "dracula" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Enable filetype plugins and syntax
vim.cmd('filetype plugin indent on')  -- allow auto-indenting depending on file type
vim.cmd('syntax on')                  -- syntax highlighting

vim.cmd('filetype plugin on')
vim.opt.cursorline = true   -- highlight current cursorline
vim.opt.ttyfast = true      -- Speed up scrolling in Vim

