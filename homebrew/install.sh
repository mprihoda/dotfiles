#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install homebrew packages
brew install grc coreutils spark ctags reattach-to-user-namespace
# I used to install macvim, but since it is impossible to use vim server from command line with macvim
# a change has been necessary.
brew install cask
brew install macvim --override-system-vim
brew install neovim/neovim/neovim
brew install powerline
brew cask install iterm2-beta

exit 0
