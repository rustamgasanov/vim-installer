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
" nginx syntax highlighter
Plugin 'jinfield/vim-nginx'
" haml syntax highlighter
Plugin 'tpope/vim-haml'
" slim syntax highlighter
Plugin 'slim-template/vim-slim'
" scss syntax highlighter
Plugin 'cakebaker/scss-syntax.vim'
" json syntax highlighter
Plugin 'leshill/vim-json'
" coffeescript syntax highlighter
Plugin 'kchmck/vim-coffee-script'
" eco files support
Plugin 'AndrewRadev/vim-eco'
" monit syntax highlighter
Plugin 'tmatilai/vim-monit'
" base16-railscasts color scheme
Plugin 'rustamagasanov/color-schemes'
" tree view
Plugin 'scrooloose/nerdtree'
" html5 syntax highlighter
Plugin 'othree/html5.vim'
" rubocop
Plugin 'ngmy/vim-rubocop'
" fast search
" installation:
" cd ~/.vim/bundle/command-t/ruby/command-t
" ruby extconf.rb
" make
Plugin 'wincent/Command-T'
" angular support
Plugin 'burnettk/vim-angular'
" elixir support
Plugin 'elixir-lang/vim-elixir'
" git support
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

call vundle#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 " Automatically displays all buffers when there's only one tab open.

let g:vimrubocop_config = '.rubocop.yml'
let NERDTreeShowHidden=1

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

" statusline
" if has("statusline") && !&cp
"   set laststatus=2  " always show the status bar
" 
"   " Start the status line
"   " set statusline=%{hostname()}: 
"   set statusline=%f\ %m\ %r
" 
"   " Add rvm
"   " if exists('$rvm_path')
"   "   set statusline+=%{rvm#statusline()}
"   " endif
" 
"   " Add fugitive(branch)
"   " set statusline+=%{fugitive#statusline()}
" 
"   " display a warning if &paste is set
"   set statusline+=%#error#
"   set statusline+=%{&paste?'[paste]':''}
"   set statusline+=%*
" 
"   " Finish the statusline
"   " set statusline+=Line:%l/%L[%p%%]
"   set statusline+=Line:%l/
"   set statusline+=Col:%v
"   " set statusline+=Buf:#%n
"   " set statusline+=[%b][0x%B]
" endif

" >>> COLORSCHEME <<<
try
  colorscheme base16-railscasts
catch " /^Vim:E121/
  colorscheme default
endtry

" " >>> HIGHLIGHTING <<<
" " DARK  0 black 1 red 2 green 3 yellow 4 blue 5 magenta 6 cyan 7 white
" " LIGHT 8       9     10      11       74     13        14     15
" highlight clear SignColumn
" " split lines color
" highlight VertSplit    ctermbg=4
" " used only when colorcolumn is active
" " highlight ColorColumn  ctermbg=237
" " numbers color
" highlight LineNr       ctermbg=0   ctermfg=4
" " used only when cursorline is active
" " highlight CursorLineNr ctermbg=236 ctermfg=240
" " highlight CursorLine   ctermbg=236
" " status line on inactive pane
" highlight StatusLineNC ctermbg=0   ctermfg=4
" " status line on current pane
" highlight StatusLine   ctermbg=0   ctermfg=2
" " instant search highlight
" highlight IncSearch    ctermbg=2   ctermfg=0
" " search results highlight
" highlight Search       ctermbg=2   ctermfg=0
" " visual mode highlight
" highlight Visual       ctermbg=2   ctermfg=0
" " tab line(behind tabs)
" highlight TabLineFill  ctermbg=0   ctermfg=0
" " inactive tab
" highlight TabLine      ctermbg=0   ctermfg=2
" " active tab
" highlight TabLineSel   ctermbg=2   ctermfg=0
" " popup menu(ctrl+p)
" highlight Pmenu        ctermbg=236 ctermfg=4
" " popup menu selected item
" highlight PmenuSel     ctermbg=236 ctermfg=2
" " check spelling errors
" highlight SpellBad     ctermbg=0   ctermfg=1
" " highlight the status bar when in insert mode
" 
" if version >= 700
"   au InsertEnter * hi StatusLine ctermbg=2 ctermfg=0
"   au InsertLeave * hi StatusLine ctermbg=0 ctermfg=2
" endif

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
