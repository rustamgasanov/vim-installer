" >>> BUNDLE <<<
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" vim bundler
Plugin 'VundleVim/Vundle.vim'
" rails features with (R...)
Plugin 'tpope/vim-rails'
" commenting features (gc gcc)
Plugin 'tComment'
" textmate snippets features (<tab> autocomplete)
Plugin 'msanders/snipmate.vim'
" syntax checker features
Plugin 'scrooloose/syntastic'
" json syntax highlighter
Plugin 'leshill/vim-json'
" base16-railscasts color scheme
Plugin 'rustamgasanov/color-schemes'
" tree view
Plugin 'scrooloose/nerdtree'
" quick search
Plugin 'kien/ctrlp.vim'
" html5 syntax highlighter
Plugin 'othree/html5.vim'
" elixir support
Plugin 'elixir-lang/vim-elixir'
Plugin 'rustamgasanov/vim-airline'

call vundle#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 " Automatically displays all buffers when there's only one tab open.

let g:vimrubocop_config = '.rubocop.yml'
let NERDTreeShowHidden=1

filetype plugin indent on
syntax on " show syntax highlighting

" macvim
set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline:h12
"set guifont=Meslo\ LG\ M\ DZ\ for\ Powerline\ RegularForPowerline:h12
set guioptions-=L " remove scrollbars
set guioptions-=r " remove scrollbars
set encoding=utf-8
set fileencoding=utf-8

" >>> SETTINGS <<<
set autoindent " copy indent from prev line
set tabstop=2 " set indent to 2 spaces
set shiftwidth=2 " set '>>' and '<<' spacing indent
set expandtab " use spaces instead of tabs
set showmatch " show bracket matches
set ignorecase " ignore case in search
set hlsearch " highlight all search matches
" set cursorline " highlight current line
set smartcase " pay attention to case when caps are used
set incsearch " show search results as I type
set ttimeoutlen=100 " decrease timeout for faster insert with 'O'
set ruler " show row and column in footer
set scrolloff=2 " minimum lines above/below cursor
set laststatus=2 " always show status bar
set listchars=tab:»·,nbsp:·,trail:·,extends:>,precedes:<
set list " display unprintable characters
set wildmenu " enable bash style tab completion
set wildmode=list:longest,full
set number " display line numbers
set numberwidth=5 " 4 spaces before numbers
set showcmd " display actions in bottom line
set fillchars+=vert:\  " remove pipes from split lines
set backspace=indent,eol,start " set backspace to work like in other apps
set background=dark
" toggle paste mode on F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set autoread

" open nerdtree on F3
map <F3> :NERDTree<CR>
" toggle number/nonumber on F12
function! NumberNo()
  set nonumber
  map <F12> :call NumberYes()<CR>
endfunction

function! NumberYes()
  set number
  map <F12> :call NumberNo()<CR>
endfunction
map <F12> :call NumberNo()<CR>

" g[bB] in command mode switch to the next/prev. buffer
map gb :bnext<cr>
map gB :bprev<cr>

" >>> COLORSCHEME <<<
" let base16colorspace=256
" let g:airline_theme='base16'
try
  colorscheme base16-railscasts
catch " /^Vim:E121/
  colorscheme default
endtry


" 0 lightblack main background
" 1 red #e35f48
" 2 green #b3ca73 or #b3cb73
" 3 yellow #ffcf7f
" 4 blue #7eacc9
" 9 orange
" 10 green
" 11 yellow
" 12 13 white
" 16 black #383838
" 236 black behind line numbers
" 237 grey, line numbers
" 240 grey line numbers
" magenta #c3c2ef
" cyan #60ab62
" white #ebe6e2
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight IncSearch    ctermbg=196   ctermfg=236
highlight Search       ctermbg=9   ctermfg=236
highlight Visual       ctermbg=9   ctermfg=236

" >>> MISC <<<
" automatically removing all trailing whitespace
autocmd BufWritePre *.rb,*.ex,*.exs,*.sass,*.eco,*.erb,*.coffee :%s/\s\+$//e

" automatically load .vimrc source when saved
autocmd BufWritePost .vimrc source $MYVIMRC

" file types autodetection
autocmd BufNewFile,BufRead *.txt setfiletype text
autocmd BufNewFile,BufRead Gemfile,Guardfile,Vagrantfile,Procfile,Rakefile setfiletype ruby
autocmd FileType text,markdown,html,xhtml,eruby,asc,slim setlocal wrap linebreak nolist

" show syntax highlighting groups for word under cursor
" nmap <C-S-P> :call <SID>SynStack()<CR>
nmap <C-S-H> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <c-l> :bp <cr>
let mapleader = "\\"

" local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Rails shortcuts
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb
command! Rgemfile :e Gemfile

au BufRead,BufNewFile *.es6 setfiletype javascript
