" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Plug plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'morhetz/gruvbox'
call plug#end()

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Set theme
if (has("termguicolors"))
    set termguicolors
endif
set background=dark
colorscheme gruvbox

" Basic settings
set number relativenumber
set visualbell
set encoding=utf-8
set scrolloff=7
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Set tabs in specific files
autocmd Filetype xml setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Set jk to exit all modes
inoremap jk <Esc>

" Automatic closing of brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

