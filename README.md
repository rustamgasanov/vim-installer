# Vim installer

Vim distribution for Ruby(Rails).

## Installation:

```
git clone git@github.com:rustamagasanov/vim-installer.git
cd vim-installer
./install.sh

# additional steps for command-t plugin
cd ~/.vim/bundle/command-t/ruby/command-t
ruby extconf.rb
make
```

## Plugins included:

  -  [gmarik/vundle](https://github.com/gmarik/Vundle.vim) - Vim bundler
  -  [tpope/vim-rails](https://github.com/tpope/vim-rails) - Syntax highlighting, :A, :R, :E, etc features
  -  [tomtom/tcomment_vim](https://github.com/tomtom/tcomment_vim) - Commenting features(gc, gcc, etc)
  -  [msanders/snipmate](https://github.com/msanders/snipmate.vim) - Textmate snippets features (<tab> autocomplete)
  -  [scrooloose/syntastic](https://github.com/scrooloose/syntastic) - Syntax checker
  -  [jinfield/vim-nginx](https://github.com/jinfield/vim-nginx) - Nginx syntax highlighter
  -  [tpope/vim-haml](https://github.com/tpope/vim-haml) - Haml syntax highlighter
  -  [cakebaker/scss-syntax.vim](https://github.com/cakebaker/scss-syntax.vim) - Scss syntax highlighter
  -  [slim-template/vim-slim](https://github.com/slim-template/vim-slim) - Slim syntax highlighter
  -  [leshill/vim-json](https://github.com/leshill/vim-json) - JSON syntax highlighter
  -  [kchmck/vim-coffee-script](https://github.com/kchmck/vim-coffee-script) - Coffeescript support(syntax, indenting, compiling)
  -  [AndrewRadev/vim-eco](https://github.com/AndrewRadev/vim-eco) - .eco syntax support
  -  [tmatilai/vim-monit](https://github.com/tmatilai/vim-monit) - Monit syntax highlighter
  -  [rustamagasanov/color-schemes](https://github.com/rustamagasanov/color-schemes) - Base16-railscasts(used) and other color schemas
  -  [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree) - Tree view support(:NERDTree)
  -  [othree/html5.vim](https://github.com/othree/html5.vim) - HTML5 syntax highlighter
  -  [ngmy/vim-rubocop](https://github.com/ngmy/vim-rubocop) - RuboCop code analyzer, requires installed gem(:RuboCop)
  -  [wincent/Command-T](https://github.com/wincent/Command-T) - Leader+T quick search through files
  -  [burnettk/vim-angular](https://github.com/burnettk/vim-angular) - Angular support
  -  [elixir-lang/vim-elixir](https://github.com/elixir-lang/vim-elixir) - Elixir support
