require("config.lazy")

-- editorconfigs support is enabled by default in nvim >= 0.9
-- I just like being explicit; so that future me can remember this is a thing
vim.g.editorconfig = true

vim.g.clipboard = 'wl-copy'

-- Key mappings
vim.keymap.set('n', '<F8>', ':tabnext<CR>', {noremap = true})
vim.keymap.set('n', '<F32>', ':tabprevious<CR>', {noremap = true})  -- CTRL+F8

vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>', {noremap = true})

-- CoC completion mappings
vim.keymap.set('i', '<TAB>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#next'](1)
  else
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
      return '<Tab>'
    else
      return vim.fn['coc#refresh']()
    end
  end
end, {silent = true, expr = true})

vim.keymap.set('i', '<S-TAB>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#prev'](1)
  else
    return '<C-h>'
  end
end, {expr = true})

-- Make <CR> to accept selected completion item
vim.keymap.set('i', '<CR>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#confirm']()
  else
    return '<C-g>u<CR><c-r>=coc#on_enter()<CR>'
  end
end, {silent = true, expr = true})

-- Use <c-space> to trigger completion
if vim.fn.has('nvim') == 1 then
  vim.keymap.set('i', '<c-space>', 'coc#refresh()', {silent = true, expr = true})
else
  vim.keymap.set('i', '<c-@>', 'coc#refresh()', {silent = true, expr = true})
end

-- CoC diagnostic navigation
vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})

-- GoTo code navigation
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', {silent = true})
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', {silent = true})

-- Use K to show documentation in preview window
vim.keymap.set('n', 'K', function()
  if vim.fn['CocAction']('hasProvider', 'hover') then
    vim.fn['CocActionAsync']('doHover')
  else
    vim.fn.feedkeys('K', 'in')
  end
end, {silent = true})

-- Remap <C-f> and <C-b> to scroll float windows/popups
if vim.fn.has('nvim-0.4.0') == 1 or vim.fn.has('patch-8.2.0750') == 1 then
  vim.keymap.set('n', '<C-f>', function()
    if vim.fn['coc#float#has_scroll']() == 1 then
      return vim.fn['coc#float#scroll'](1)
    else
      return '<C-f>'
    end
  end, {silent = true, nowait = true, expr = true})
  
  vim.keymap.set('n', '<C-b>', function()
    if vim.fn['coc#float#has_scroll']() == 1 then
      return vim.fn['coc#float#scroll'](0)
    else
      return '<C-b>'
    end
  end, {silent = true, nowait = true, expr = true})
  
  vim.keymap.set('i', '<C-f>', function()
    if vim.fn['coc#float#has_scroll']() == 1 then
      return '<c-r>=coc#float#scroll(1)<cr>'
    else
      return '<Right>'
    end
  end, {silent = true, nowait = true, expr = true})
  
  vim.keymap.set('i', '<C-b>', function()
    if vim.fn['coc#float#has_scroll']() == 1 then
      return '<c-r>=coc#float#scroll(0)<cr>'
    else
      return '<Left>'
    end
  end, {silent = true, nowait = true, expr = true})
  
  vim.keymap.set('v', '<C-f>', function()
    if vim.fn['coc#float#has_scroll']() == 1 then
      return vim.fn['coc#float#scroll'](1)
    else
      return '<C-f>'
    end
  end, {silent = true, nowait = true, expr = true})
  
  vim.keymap.set('v', '<C-b>', function()
    if vim.fn['coc#float#has_scroll']() == 1 then
      return vim.fn['coc#float#scroll'](0)
    else
      return '<C-b>'
    end
  end, {silent = true, nowait = true, expr = true})
end

-- Symbol renaming
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)')

-- Commented out commands from original (they seem not to work according to original comment)
-- vim.api.nvim_create_user_command('Format', function() vim.fn['CocActionAsync']('format') end, {})
-- vim.api.nvim_create_user_command('Fold', function(opts) vim.fn['CocAction']('fold', opts.args) end, {nargs = '?'})
-- vim.api.nvim_create_user_command('OR', function() vim.fn['CocActionAsync']('runCommand', 'editor.action.organizeImport') end, {})
