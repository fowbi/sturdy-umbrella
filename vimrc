" Fowbi vimrc
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Github repos {
    " Use this on top of netrw
    Plugin 'tpope/vim-vinegar'
	" Vim plugin for intensely orgasmic commenting.
	Plugin 'scrooloose/nerdcommenter'
    " Snippets
	Plugin 'SirVer/ultisnips'
    " Airline statusbar
	Plugin 'bling/vim-airline'
    " Search jump to characer (f, F, t, T)
	Plugin 'rhysd/clever-f.vim'
    " Search files in current directory
    Plugin 'ctrlpvim/ctrlp.vim'
    " The silver searcher
	Plugin 'rking/ag.vim'
	" Colaborates with Dash (mac only)
	Plugin 'rizzatti/dash.vim'
    " Easily replace, remove and add tags and charactes around text.
	Plugin 'tpope/vim-surround'
    " Automatically generate ctags for the project
    Plugin 'ludovicchabant/vim-gutentags'
    " Undo tree
    Plugin 'mbbill/undotree'
	" Search with ack/ag/...
	Plugin 'mileszs/ack.vim'
    " Buffer explorer
    Plugin 'vim-scripts/bufexplorer.zip'
    " Better navigation between vim and tmux
    Plugin 'christoomey/vim-tmux-navigator'
    " apib support
	Plugin 'kylef/apiblueprint.vim'
    " Fancy emoji :3
    Plugin 'junegunn/vim-emoji'
    " Asynchronous Lint Engine
    Plugin 'w0rp/ale'
    " Markdown support
    Plugin 'plasticboy/vim-markdown'
    " Go support
    Plugin 'fatih/vim-go'

    " XML/HTML {
        " XML Edit
        Plugin 'sukima/xmledit'
        " Expanding abbreviations in html, xml, ...
        Plugin 'mattn/emmet-vim'
    " }

    " GIT {
        " GIT wrapper
        Plugin 'tpope/vim-fugitive'
        " Show file changes in the sign column
        Plugin 'mhinz/vim-signify'
    " }

    " PHP {
        " generating PHP doc blocks
        Plugin 'tobyS/pdv'
        " indenting
        Plugin '2072/PHP-Indenting-for-VIm'
        " phpcs fixer
        Plugin 'stephpy/vim-php-cs-fixer'
        " Auto add use statements (php)
        Plugin 'arnaud-lb/vim-php-namespace'
        " PHP autocompleter
		Plugin 'shawncplus/phpcomplete.vim'
        " Indent support for PHP in HTML
        Plugin 'captbaritone/better-indent-support-for-php-with-html'
        " Namespaces via composer
        Plugin 'dantleech/vim-phpnamespace'
        " Refactoring toolbox
        Plugin 'adoy/vim-php-refactoring-toolbox'
    " }

    " Javascript {
        " Node.js support
        Plugin 'moll/vim-node'
        " Mustache template system implementation (needed by PDV)
        Plugin 'tobyS/vmustache'
        " JS support
        Plugin 'pangloss/vim-javascript'
        " Syntaxh highlighting for jsx
        Plugin 'mxw/vim-jsx'
    " }

    " Python {
        " Python static syntax checker (Flake8)
        Plugin 'nvie/vim-flake8'
        " Easy python dev
        Plugin 'klen/python-mode'
        " Python autocompleter
        Plugin 'davidhalter/jedi-vim'
    " } 

    " Ruby {
        Plugin 'vim-ruby/vim-ruby'
    " }

    " Colors {
        Plugin 'chriskempson/base16-vim'
    " }

    " Someday {
        "Plugin 'joonty/vdebug.git'
    " }
" }

call vundle#end()            " required
filetype plugin indent on    " required


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use project based configuration files.
set exrc

" Encrypt away ...
set cryptmethod=blowfish
" Disable swap files, backups, temp files and history if the file has a key set.
autocmd BufReadPost * if &key != "" | set noswapfile nowritebackup viminfo= nobackup noshelltemp history=0 secure | endif

" confim instead of error when leaving unsaved file
"set confirm 

" Hi my name is ...
let g:AuthorName="Yolo"
let g:AuthorEmail="yolo@swag.be"

syntax enable " enable syntax processing

" Split screens a bit better.
set splitbelow
set splitright

set smartcase " Case Sensitivity (only apply case sensitivity when at least one letter is uppercase)

" set wrap linebreak " Linebreaks (disabled for now)

" GUI only changes {
	if has("gui_running")
		" Hide fugly toolbar
		set guioptions=aiA

		" os x
        set guifont=Fira\ Code:h11
		
		" Vim size stuff
		set lines=60 columns=100

		" Set screen to max dimensions when fullscreen
		set fuoptions=maxvert,maxhorz
        colorscheme desert
		set background=dark
	else
        colorscheme base16-isotope
	endif
" }

" Backup rules (swap teh swap) {
	set backup
	set backupdir=~/.tmp
	set directory=~/.tmp
" }

" Commandline history
set history=1000

" Some weird stuff to make it faster
set nocursorcolumn
set nocursorline

" Interface options {
	set ruler " show cursorposition
	set showcmd " display incomplete commands
	set incsearch " incremental searching
	set hlsearch " highlight searchresult
	set number "show line numbers
	set linespace=0
	set hidden " hide buffer even when changed
	set listchars=tab:>-,trail:- " Show tabs and trailing 
" }

" Fileformats {
	set fileformat=unix
	set fileformats=unix
	set encoding=utf-8
	set fileencoding=utf-8
	set fileencodings=utf-8,ucs-bom,cp1250
" }

" Filetype
filetype on
filetype plugin on
filetype indent on

" Default tabs {
" Global settings for all files (can be overriden in ftplugin)
    set tabstop=4 " number of visual spaces per TAB
    set softtabstop=4 " number of spaces in tab when editing
    set shiftwidth=4 " sets behaviours for << & >> (in|un)denting
	set expandtab " turns tabs in to spaces
" }

" Folding {
	set foldenable " Turn on folding.
	set foldmarker={,} " FoldC style code (only use this as default if you use a high foldlevel).
	set foldmethod=marker " Fold on the marker.
	set foldopen=block,hor,mark,percent,quickfix,tag " What movements open folds.
	function SimpleFoldText()
		return getline(v:foldstart).''
	endfunction
	set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default).
" }

" AutoClose settings
let g:AutoCloseOn=1
let g:AutoClosePairs={'(':')', '[':']','"':'"',"'":"'"}

" Function key mapping {
    map <silent> <F5> :Explore<CR>
	map <silent> <F6> :call PhpCsFixerFixFile()<CR>
	map <silent> <F7> :BufExplorer<CR>
	map <silent> <F8> :CheckSyntax<CR>
" }

" Leader change to something easier {
	let mapleader = ','
" }

set backspace=2 " make backspace work like most other apps

" Remaps {
	" Only yank from the cursor.
	nnoremap Y y$

	" Change split panes a bit more fluently
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k
	noremap <C-l> <C-w>l
	noremap <C-h> <C-w>h

	map  <C-l> :tabn<CR>
	map  <C-h> :tabp<CR>
	map  <C-n> :tabnew<CR>

    :nmap <silent> <leader>d <Plug>DashSearch
" }

" Autosave and AutoRead
set autoread

augroup autoSaveAndRead
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost * silent! wall
    autocmd CursorHold * silent! checktime
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsEditSplit="vertical"
if ! exists('g:snips_author')
	let g:snips_author = "Tobi Beernaert <yolo@swag.be>"
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL-P 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Use regexp as default, this seemed to work better ...
let g:ctrlp_regexp = 1

" No max file limit
let g:ctrlp_max_files = 0

" let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\var$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }
" let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_show_hidden = 0
let g:ctrlp_user_command =
    \ ['.git', 'cd %s && git ls-files . -co --exclude-standard']


" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Emoji
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completefunc=emoji#complete


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Git Gutter + Emoji
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_max_signs = 500

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Buffers / MRU
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close current buffer
map <leader>bd :Bclose<cr>
" Close all buffers
map <leader>ba :1,1000 bd!<cr>

nmap <silent> <leader>x :%s/></>\r</g<CR>

au BufRead,BufNewFile *.twig set filetype=htmljinja

" Node dict.
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict

" Persistent undo
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif


" Tags
set tags=./tags,tags;
let g:autotagTagsFile="tags"

" Hightlight jsx in .js files
let g:jsx_ext_required = 0

" Ale ale
let g:ale_fixers = { 'javascript': ['eslint'], }
let g:ale_fix_on_save = 'always'

" Netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" Use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Signify [alternative for gitgutter as vim-php-namespace breaks it]
let g:signify_vcs_list = ['git']
let g:signify_realtime = 1

