set nocompatible
filetype plugin indent on   "allow auto-indenting depending on file type
filetype plugin on

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'windwp/nvim-autopairs'
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug '/home/zura/.vim/tokyonight'
Plug 'rebelot/kanagawa.nvim'
Plug 'projekt0n/github-nvim-theme', { 'tag': 'v0.0.7' }
Plug 'ellisonleao/glow.nvim'
Plug 'matbme/JABS.nvim'
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'arcticicestudio/nord-vim'
Plug 'glepnir/lspsaga.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jay-babu/mason-null-ls.nvim'
Plug 'folke/which-key.nvim'
Plug 'folke/trouble.nvim'
Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'stevearc/aerial.nvim'
Plug 'olexsmir/gopher.nvim' 
Plug 'xiyaowong/nvim-transparent'
Plug 'kdheepak/tabline.nvim'
Plug 'sudormrfbin/cheatsheet.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'kevinhwang91/nvim-bqf'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Configure Lua-based plugins
lua require('lua_config')

"quit with Q
nnoremap Q <ESC>:q<CR>

nnoremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Make comments italic
highlight comment cterm=italic gui=italic

" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>

" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>

" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

"Keybind Ctrl+l to clear search 
nnoremap <leader>l :nohl<CR>:echo "Search Cleared"<CR>

" When python filetype is detected, F5 can be used to execute script 
autocmd FileType python nnoremap <buffer> <F5> :w<cr>:exec '!clear'<cr>:exec '!python3' shellescape(expand('%:p'), 1)<cr>

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
"JABs Buffer «manager»
nnoremap <C-b> :JABSOpen<CR>

":TransparentEnable<CR>
