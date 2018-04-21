#!/bin/sh
set -e

# if ! [ -d config/.vim/bundle/neobundle.vim/.git ]; then
#   git submodule init && git submodule update --depth 1
# fi

bin/setup

# Homebrew does not allow sudo.
case "$(uname)" in
  "Darwin")
    ! which brew >/dev/null && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ! [ -d /Applications/Xcode.app ] && sudo xcode-select --install
    bin/mitamae local $@ lib/recipe.rb ;;
  *) sudo -E bin/mitamae local $@ lib/recipe.rb ;;
esac
