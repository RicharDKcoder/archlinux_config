"========================================config========================================
"set nocompatible
syntax on
set showmode
set showcmd
set encoding=utf-8
"set t_Co=256
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
"set rnu
set nu
"set relativenumber
"set cursorline
"set textwidth=100
"set wrap
"set linebreak
"set wrapmargin=2
set scrolloff=5
set sidescrolloff=15
set laststatus=2
set ruler
set showmatch
set hlsearch
set incsearch
"set ignorecase
"set spell spelllang=en_us
set nobackup
set noswapfile
set noerrorbells
"set visualbell
set history=100
set nowrap
set backspace=2

"========================================vim plugin========================================
call plug#begin('~/.vim/plugged')

"file tree      \
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"easymotion     \\
Plug 'easymotion/vim-easymotion'
"surround       ys cs ds 
Plug 'tpope/vim-surround'
"fzf
Plug 'junegunn/fzf',{ 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
"vim-man
Plug 'vim-utils/vim-man'

call plug#end()

filetype plugin on
"======================================== plug config ========================================

"======================================== autocmd ========================================

"========================================key map========================================
"vim
:nmap <c>[ <esc>
:imap <c-h> <left>
:imap <c-l> <right>
:imap <c-k> <up>
:imap <c-j> <down>
:imap <c-o> <esc>o

"nerdtree
:nmap <Leader>d :NERDTreeToggle<CR>

" fzf
:nmap <c-f> :Files
:nmap <c-m> :Marks<CR>

" vim-man
nmap <s-k> <Plug>(Man)


"##### auto fcitx  ###########
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######
