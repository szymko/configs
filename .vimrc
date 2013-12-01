execute pathogen#infect()
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set t_Co=256
let g:solarized_termcolors=256
set encoding=utf-8
set showcmd                     " display incomplete commands
set background=light
filetype plugin indent on       " load file type plugins + indentation
colorscheme solarized

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set nu
set ruler
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

map <C-P> :FufCoverageFile <CR>
map <C-T> :vsp <CR><C-W><C-W>
map <C-E> <C-W><C-W>
map <C-D> :ciw
