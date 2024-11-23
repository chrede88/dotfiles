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
brew install --cask sf-symbols
brew install --cask kitty
brew install --cask visual-studio-code
brew install --cask miniconda
brew install --cask zed

echo "Installing brew packages ..."
# We can now install the package I need
# First let's get the package needed for my terminal setup
brew install bat
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

# Setup stuff for sketchybar
echo "Installing extra stuff for Sketchybar ..."
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v2.0.24/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf


# Start brew services
brew services start sketchybar
