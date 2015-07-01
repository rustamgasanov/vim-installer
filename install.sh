#!/bin/sh

ROOT_PATH=`pwd -P`

mkdir -p $HOME/.vim/bundle/vundle
git clone git://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
ln -nfs $ROOT_PATH/vimrc $HOME/.vimrc
vim +BundleInstall +qall

mkdir -p $HOME/.vim/colors
cp $HOME/.vim/bundle/color-schemes/railscasts/base16-railscasts.vim $HOME/.vim/colors/

