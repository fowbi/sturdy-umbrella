autocmd FileType ruby compiler ruby

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" Run current ruby buffer
map <leader>r :!ruby %<cr>
