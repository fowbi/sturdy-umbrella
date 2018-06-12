" PHP specific settings.
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent

" SQL highlighting inside strings
let php_sql_query=0
" HTML highlighting inside strings
let php_htmlInStrings=1
" Do not allow PHP short tags...
let php_noShortTags=1
" Fold PHP functions and classes
let php_folding=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PHP Doc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function key mapping
"map <silent> <F4> :PhpDoc<CR>

" Hi my name is ...
let g:AuthorName="Yolo"
let g:AuthorEmail="yolo@swag.be"

" no PHP4 mmmkaythxbai
let g:pdv_cfg_php4always = 0

let g:pdv_template_dir = $HOME ."/.vim/ftplugin/pdv/templates"
nnoremap <buffer> <F4> :call pdv#DocumentWithSnip()<CR>

" Set 120 character lines guidline {
    :set textwidth=120
    :set colorcolumn=+1
    :hi ColorColumn ctermbg=1
" }

" phpcomplete
source ~/.vim/bundle/phpcomplete.vim/autoload/phpcomplete.vim
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
let g:phpcomplete_enhance_jump_to_definition = 1
let g:phpcomplete_mappings = {'jump_to_def': ',g',}

" Run current php buffer
map <leader>p :!php %<cr>

let g:ale_fixers = ['php-cs-fixer']
let g:ale_php_cs_fixer_use_global = 1
let g:ale_php_phpcs_standard = 'PSR1,PSR2'

" PHP namespaces
let g:php_namespace_sort_after_insert = 1
