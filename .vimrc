set number
set cursorline
set ruler
set showcmd
set title
syntax enable
filetype plugin indent on
set wildmenu
set ambiwidth=double
set smartindent
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

inoremap jj <Esc>
nmap <Esc><Esc> :nohlsearch<CR><Esc>

call plug#begin('~/.vim/plugged')

if has('nvim')
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/defx.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'pangloss/vim-javascript'
Plug 'dense-analysis//ale'

call plug#end()

let g:coc_global_extensions = ['coc-phpactor']
set timeoutlen=500
set completeopt=menuone,noselect
set completeopt=menuone,noinsert,noselect

let g:vimtex_view_method='zathura'
let g:vimtex_compiler_method='latexmk'

function! InsertPythonCalculation()
    let l:expr = input('Enter Python Expression: ')
    python << EOF
import vim
expr = vim.eval('l:expr')
result = eval(expr)
cursor_pos = vim.current.window.cursor[1]
current_line = vim.current.line
vim.current.line = current_line[:cursor_pos] + str(result) + current_line[cursor_pos:]
EOF
endfunction

command! Pycalc call InsertPythonCalculation()

