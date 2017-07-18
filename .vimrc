set nocompatible                " choose no compatibility with legacy vi
syntax enable
set t_Co=256
set encoding=utf-8
set showcmd                     " display incomplete commands
set vb                          " disable bell warnings
filetype plugin indent on       " load file type plugins + indentation
colorscheme desert

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
set ruler
set number
set relativenumber
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set splitright
set wrap

map <C-T> :vsp <CR><C-W><C-W>
map <C-E> <C-W><C-W>

if &compatible
  set nocompatible
end

if exists("g:ctrl_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor/*,*/coverage/*,*/spec/reports/*

:set textwidth=80
:set colorcolumn=+1
:hi ColorColumn guibg=#2d2d2d ctermbg=246

"" NERDTree setup

let NERDTreeShowHidden=1

""let g:syntastic_javascript_checkers = ['eslint']

"" https://github.com/scrooloose/nerdtree/issues/433#issuecomment-92590696

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Define bundles via Github repos
Plugin 'christoomey/vim-run-interactive'
Plugin 'croaky/vim-colors-github'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/tComment'
Plugin 'yegappan/grep'
Plugin 'scrooloose/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-commentary'
Plugin 'fatih/vim-go'
Plugin 'briancollins/vim-jst'
Plugin 'Shutnik/jshint2.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'janko-m/vim-test'

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

call vundle#end()

filetype on
