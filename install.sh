#!/bin/zsh

echo "Setting up Mac ..."

# create .config folder
echo "create .config folder"
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

echo "Installing brew casks ..."
brew install --cask font-hack-nerd-font
brew install --cask sf-symbols
brew install --cask visual-studio-code
brew install --cask miniconda
brew install --cask zed
brew install --cask visual-studio-code
brew install --cask ghostty
brew install --cask hammerspoon
brew install --cask 1password
brew install --cask 1password-cli
brew install --cask alfred
brew install --cask microsoft-teams
brew install --cask signal
brew install --cask iina
brew install --cask proton-drive
brew install --cask proton-mail-bridge
brew install --cask protonvpn
brew install --cask slack
brew install --cask vlc
brew install --cask mactex
brew install --cask transmission
brew install --cask prusaslicer
brew install --cask autodesk-fusion

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

# Install mas so we can install AppStore Apps
brew install mas

# Mac App Store Apps
echo "Installing Mac App Store Apps..."
mas install 1451685025 #Wireguard
mas install 1569813296 #1p for Safari


# Set macOS settings
echo "Changing macOS defaults..."

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain AppleHighlightColor -string "0.79608 0.65098 0.96863"
defaults write NSGlobalDomain AppleAccentColor -int 6
defaults write com.apple.screencapture location -string "$HOME/Downloads"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0.001
defaults write com.apple.dock springboard-show-duration -float 0.001
defaults write com.apple.dock springboard-hide-duration -float 0.001
defaults write com.apple.dock springboard-page-duration -float 0.001
defaults write com.apple.dock mineffect -string scale
killall Dock

defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
killall Finder

defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari IncludeDevelopMenu -bool true

# All done!
echo "---"
echo "All done! Enjoy:)\n"