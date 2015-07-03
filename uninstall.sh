#!/bin/sh

echo 'Uninstalling vim...'

[ -d "$HOME/.vim" ] && rm -rvf $HOME/.vim
rm -v $HOME/.vimrc
