#!/bin/zsh

echo "Setting up Mac ..."

# create .config folder
mkdir -p "$HOME/.config"

echo "Installing Homebrew ..."
# Install Homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Make sure to add brew to the PATH buy following the quide at the end of the install process
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update brew
brew update
brew analytics off

echo "Installing brew Taps ..."
brew tap FelixKratz/formulae

echo "Installing brew casks ..."
brew install --cask font-hack-nerd-font
brew install --cask font-sketchybar-app-font
brew install --cask sf-symbols
brew install --cask kitty
brew install --cask visual-studio-code
brew install --cask miniconda
brew install --cask zed
brew install --cask ghostty

echo "Installing brew packages ..."
# We can now install the package I need
# First let's get the package needed for my terminal setup
brew install bat
brew install btop
brew install duf
brew install eza
brew install fzf
brew install fastfetch
brew install starship
brew install zoxide
brew install jq
brew install yq
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install yazi
brew install gh
brew install stow
brew install git
brew install pipx
brew install pre-commit
brew install sketchybar
brew install borders
brew install cmatrix

# Next let's install the package needed for kubernetes
brew install age
brew install flux
brew install helm
brew install helmfile
brew install krew
brew install kubernetes-cli
brew install sops
brew install talosctl
brew install kubecolor

# Next let's install package needed for Hugo
brew install go
brew install hugo
brew install node

# Start brew services
brew services start sketchybar

# Set macOS settings
echo "Changing macOS defaults..."
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0.001
defaults write com.apple.dock springboard-show-duration -float 0.001
defaults write com.apple.dock springboard-hide-duration -float 0.001
defaults write com.apple.dock springboard-page-duration -float 0.001
defaults write com.apple.dock mineffect -string scale
killall Dock

defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.finder DisableAllAnimations -bool true
killall Finder

defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true
