" >>> BUNDLE <<<
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" vim bundler
Bundle 'gmarik/vundle'
" rails features with (R...)
Bundle 'tpope/vim-rails'
" commenting features (gc gcc)
Bundle 'tComment'
" textmate snippets features (<tab> autocomplete)
Bundle 'msanders/snipmate.vim'
" git features with (G...)
Bundle 'tpope/vim-fugitive'
" rvm features with (Rvm...)
Bundle 'tpope/vim-rvm'
" syntax checker features
Bundle 'scrooloose/syntastic'
" ruby syntax highlighter
Bundle 'timcharper/textile.vim'
" nginx syntax highlighter
Bundle 'jinfield/vim-nginx'
" haml, sass, scss syntax highlighter
Bundle 'tpope/vim-haml'
" slim syntax highlighter
Bundle 'slim-template/vim-slim'
" json syntax highlighter
Bundle 'leshill/vim-json'
" coffeescript syntax highlighter
Bundle 'kchmck/vim-coffee-script'
" monit syntax highlighter
Bundle 'tmatilai/vim-monit'
" base16-railscasts color scheme
Bundle 'rustamagasanov/color-schemes'
" tree view
Bundle 'scrooloose/nerdtree'
" rubocop
Bundle 'ngmy/vim-rubocop'

filetype plugin indent on
syntax on " show syntax highlighting

" >>> SETTINGS <<<
" http://serverfault.com/questions/130632/problems-with-vim-locale-as-non-root-user-on-solaris
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  set fileencodings=utf-8
endif
set autoindent " copy indent from prev line
set tabstop=2 " set indent to 2 spaces
set shiftwidth=2 " set '>>' and '<<' spacing indent
set expandtab " use spaces instead of tabs
set nocompatible " don't need to be compatible with old vim
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
set listchars=tab:»·,nbsp:·,trail:·,extends:>,precedes:< " show extra space characters
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
" statusline
if has("statusline") && !&cp
  set laststatus=2  " always show the status bar

  " Start the status line
  " set statusline=%{hostname()}: 
  set statusline=%f\ %m\ %r

  " Add rvm
  " if exists('$rvm_path')
  "   set statusline+=%{rvm#statusline()}
  " endif

  " Add fugitive(branch)
  " set statusline+=%{fugitive#statusline()}

  " display a warning if &paste is set
  set statusline+=%#error#
  set statusline+=%{&paste?'[paste]':''}
  set statusline+=%*

  " Finish the statusline
  " set statusline+=Line:%l/%L[%p%%]
  set statusline+=Line:%l/
  set statusline+=Col:%v
  " set statusline+=Buf:#%n
  " set statusline+=[%b][0x%B]
endif

" >>> COLORSCHEME <<<
try
  colorscheme base16-railscasts
catch " /^Vim:E121/
  colorscheme default
endtry

" >>> HIGHLIGHTING <<<
" DARK  0 black 1 red 2 green 3 yellow 4 blue 5 magenta 6 cyan 7 white
" LIGHT 8       9     10      11       74     13        14     15
highlight clear SignColumn
" split lines color
highlight VertSplit    ctermbg=4
" used only when colorcolumn is active
" highlight ColorColumn  ctermbg=237
" numbers color
highlight LineNr       ctermbg=0   ctermfg=4
" used only when cursorline is active
" highlight CursorLineNr ctermbg=236 ctermfg=240
" highlight CursorLine   ctermbg=236
" status line on inactive pane
highlight StatusLineNC ctermbg=0   ctermfg=4
" status line on current pane
highlight StatusLine   ctermbg=0   ctermfg=2
" instant search highlight
highlight IncSearch    ctermbg=2   ctermfg=0
" search results highlight
highlight Search       ctermbg=2   ctermfg=0
" visual mode highlight
highlight Visual       ctermbg=2   ctermfg=0
" tab line(behind tabs)
highlight TabLineFill  ctermbg=0   ctermfg=0
" inactive tab
highlight TabLine      ctermbg=0   ctermfg=2
" active tab
highlight TabLineSel   ctermbg=2   ctermfg=0
" popup menu(ctrl+p)
highlight Pmenu        ctermbg=236 ctermfg=4
" popup menu selected item
highlight PmenuSel     ctermbg=236 ctermfg=2
" check spelling errors
highlight SpellBad     ctermbg=0   ctermfg=1
" highlight the status bar when in insert mode

if version >= 700
  au InsertEnter * hi StatusLine ctermbg=2 ctermfg=0
  au InsertLeave * hi StatusLine ctermbg=0 ctermfg=2
endif

" >>> MISC <<<
" automatically removing all trailing whitespace
autocmd BufWritePre *.rb :%s/\s\+$//e

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
