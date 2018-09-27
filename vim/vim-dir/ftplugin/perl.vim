" Check perl syntax with _c
nnoremap <buffer> <silent> _c :w<Enter>:!perl -wc %<Enter>

" Tidy selected lines (or entire file) with _t:
nnoremap _t :%!perltidy -q<Enter>
vnoremap _t :!perltidy -q<Enter>

" The K command will invoke perldoc on functions/keywords in a perl file
setlocal keywordprg=perldoc\ -T\ -f
