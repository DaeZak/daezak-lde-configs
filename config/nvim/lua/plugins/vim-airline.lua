return {
  { 
      "vim-airline/vim-airline",
      lazy = false,
      priority = 1000,
      config = function()
        -- Vim Airline tablines settings
        vim.g['airline#extensions#tabline#enabled'] = 1
        vim.g['airline#extensions#tabline#show_buffers'] = 0
        vim.g['airline_powerline_fonts'] = 1
        vim.g['airline_theme'] = 'angr'
        vim.g['airline_left_sep'] = ''
        vim.g['airline_left_alt_sep'] = ''
        vim.g['airline_right_sep'] = ''
        vim.g['airline_right_alt_sep'] = ''
        vim.g['airline_symbols.branch'] = ''
        vim.g['airline_symbols.colnr'] = ' ℅:'
        vim.g['airline_symbols.readonly'] = ''
        vim.g['airline_symbols.linenr'] = ' :'
        vim.g['airline_symbols.maxlinenr'] = '☰ '
        vim.g['airline_symbols.dirty'] ='⚡'
        vim.g['airline_symbols.crypt'] = '🔒'
        vim.g['airline_symbols.executable'] = '⚙'
        vim.g['airline_symbols.branch'] = '⎇'
        vim.g['airline_symbols.paste'] = 'Þ'
        vim.g['airline_symbols.spell'] = 'Ꞩ'
        vim.g['airline_symbols.notexists'] = 'Ɇ'
        vim.g['airline_symbols.whitespace'] = 'Ξ'
      end,
      dependencies = {
        "vim-airline/vim-airline-themes",
        "ryanoasis/vim-devicons",
      }
  },
}
