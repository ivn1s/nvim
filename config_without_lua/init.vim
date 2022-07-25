" -------------- PLUGINS -----------------
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary' "gc command to comment
Plug 'tpope/vim-surround' "ys to surround
Plug 'machakann/vim-highlightedyank' "visual yanks
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mattn/emmet-vim' "xml html jsx
Plug 'chriskempson/base16-vim' " themes
Plug 'neoclide/coc.nvim' "Lsp
" Plug 'vim-scripts/paredit.vim' " Clojure parens
" Plug 'Olical/conjure' "clojure 
Plug 'luochen1990/rainbow'
call plug#end()

" ----------------- BASIC ---------------
filetype plugin indent on
syntax on
set winaltkeys=no
set hidden 
set scrolloff=8
set relativenumber
set number
set incsearch
set ignorecase
set nohlsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowrap
set laststatus=0
set path+=**
set wildmenu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*.class,*.dex,*/node_modules/**,.shadow-cljs/**,.clj-kondo/**,public/js/cljs-runtime/**,target/**
set completeopt=menuone,noinsert,noselect
set timeoutlen=300
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:netrw_banner = 0  " remove help from netwr
let g:spellstate = 0 
map <LocalLeader> ,

" -------------- THEMES ----------------
colorscheme base16-tomorrow-night
set termguicolors
set background=dark
hi clear VertSplit
hi! VertSplit ctermfg=none ctermbg=none guifg=none guibg=none
hi LineNr guibg=none
set fillchars=vert:.
set updatetime=300
set cmdheight=1
set nobackup
set nowritebackup

" Transparency 
hi Normal ctermbg=none guibg=none

" ---------------- FZF ---------------------
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'below vsplit',
            \ 'ctrl-d': 'below split' }
let g:fzf_layout = { 'down': '40%' }


" ---------------- Rainbow Parens ---------------------
let g:rainbow_active = 1 

" ---------------- EMMET ---------------------
let g:user_emmet_leader_key='<M-1>'

" ---------------- CONJURE ---------------------
nnoremap <Space>eb :ConjureEvalBuf<CR>
nnoremap <Space>ee :ConjureEvalCommentCurrentForm<CR>
nnoremap <Space>er :ConjureEvalRootForm<CR>
nnoremap <Space>ev :ConjureEvalVisual<CR> 
nnoremap <Space>ew :ConjureEvalWord<CR>
nnoremap <Space>em :ConjureEvalMarkedForm<CR>
nnoremap <Space>vv :ConjureLogVSplit<CR>

" ---------------- COC ---------------------
command! CA CocAction
map ,i :call CocAction('runCommand', 'editor.action.organizeImport')<CR>
map ,? :call CocAction('runCommand', '')<CR>

" ---------------- Markdown ---------------------
let g:mkdp_browser = 'firefox'

" ---------------- SHORTCUTS ---------------------
nnoremap ZA :q!<CR>
cnoremap ;; <c-r>=expand("%:p:h")<CR>/
cnoremap vi<SPACE> Vi <c-r>=expand("%:p:h")<CR>/
cnoremap mv<space> Mv <c-r>=expand("%:p:h")<cr>/
inoremap jj <ESC>
noremap <Space>1 i<c-r>=expand("%:p")<CR>
noremap <Space>2 i<c-r>=expand("%:p:h")<CR>
noremap Y y$
vmap s <Plug>VSurround
vnoremap <C-c> "+y
vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
tnoremap <Esc> <C-\><C-n>

" follow cursor
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" move in command mode
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <c-k> <Up>
cnoremap <c-j> <Down>

" navigation
nnoremap <SPACE>f :Files<CR>
nnoremap <SPACE>g :GFiles<CR>
nnoremap <c-p> :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <SPACE>r :call Run()<CR>
nnoremap <M-9> :bprevious<CR>
nnoremap <M-0> :bnext<CR>

" move lines 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" resize
nmap <Left> :wincmd <<CR>
nmap <Right> :wincmd ><CR>
nmap <Up> :wincmd +<CR>
nmap <Down> :wincmd -<CR>

" navigate split screens easily
nmap <silent> <c-Up> :wincmd k<CR>
nmap <silent> <c-Down>:wincmd j<CR>
nmap <silent> <c-Left> :wincmd h<CR>
nmap <silent> <c-Right> :wincmd l<CR>
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Stay in visual mode when indenting. You will never have to run gv after performing an indentation.
vnoremap < <gv
vnoremap > >gv

" Writting
nnoremap <SPACE>s :call EnableSpellChecker()<CR>

" Code snippets
inoremap <M-2> <esc>:call PrintLineSnippet()<cr>i

" ------------------ FUNCTIONS ----------------------
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function Run()
    let g:file_path = expand('%:p')
    let g:document = expand('%:r')
    let g:dir_path = expand('%:p:h')

    if expand('%:e') == 'hs' 
        below vnew
        execute 'terminal ghci ' . g:file_path
    elseif expand('%:e') == 'js' 
        execute '!node ' . g:file_path
    elseif expand('%:e') == 'c' 
        echo ' ==== compiling ===='
        execute '!cc ' . g:file_path
        echo ' ==== running ===='
        execute '!' . g:dir_path . '/a.out'
        execute 'silent !rm ' . g:dir_path . '/a.out'
    elseif expand('%:e') == 'jl'
        execute '!julia ' . g:file_path
    elseif expand('%:e') == 'java' 
        call JavaMode()
    elseif expand('%:e') == 'tex' 
        execute '!evince ' . g:document . '.pdf &'
    elseif expand('%:e') == 'sh' 
        below vnew
        execute '!sh ' . '"' . g:file_path . '"'
    endif
endfunction

function! ClipboardYank()
    call system('xclip -i -selection clipboard', @@)
endfunction

function! CreateFileAndDir(path) 
    let dirpath = system('echo ' . a:path . ' | sed -E "s/(.)\/\w+\.\w+$/\1/g"')
    execute 'silent !mkdir -p ' . dirpath
    execute 'silent !touch ' . a:path
    execute 'edit ' . a:path
endfunction

function! DeleteFile(path)
    if confirm('Delete file? ' . a:path, "&Yes\n&No", 1) == 1
        execute 'silent !rm -rf ' . a:path
    endif
endfunction

function! RenameFile(new_name)
    execute 'silent !mv ' . expand('%:p') . ' ' . a:new_name
    execute 'edit ' . a:new_name
endfunction

function! JavaMode() 
    let g:file_path = expand('%:p')
    let g:document = expand('%:r')
    let g:valueConfirm = confirm('Java Mode', "&a Run\n&; Compile\n&f Debug")
    if g:valueConfirm == 1
        below new
        execute 'terminal sh ~/.scripts/javaRunner.sh ' . g:file_path
    elseif g:valueConfirm == 2
        execute '! sh ~/.scripts/javaCompiler.sh ' . g:file_path
    elseif g:valueConfirm == 3
        below vnew
        execute 'terminal jdb' . g:document
    endif
endfunction

function PrintLineSnippet() 
    if expand('%:e') == 'java' 
        normal iSystem.out.println();
        normal h==%
    elseif expand('%:e') == 'js' 
        normal iconsole.log();
        normal h==%
    endif
endfunction

function EnableSpellChecker() 
    if g:spellstate != 1
        setlocal spell spelllang=en_gb
        let g:spellstate = 1 
    else
        set nospell
        let g:spellstate = 0 
    endif
endfunction

command! -complete=file -nargs=1 Mv call RenameFile(<f-args>)
command! Tex silent !pdflatex %
command! -complete=file -nargs=1 Rm call DeleteFile(<f-args>)
command! -complete=file -nargs=1 Vi call CreateFileAndDir(<f-args>)

" to avoid creating additional comment lines when using 'o'
autocmd FileType java,c,cpp,rs,clj,cljs,js,hs,py,rb,lisp,cs,html,css,vim setlocal formatoptions-=o
