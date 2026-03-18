#!/bin/zsh

echo "Setting up Mac ..."

# create .config folder
echo "create .config folder"
mkdir -p "$HOME/.config"

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

echo "Installing Homebrew ..."
# Install Homebrew
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
brew install micro

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
mas install 6752347588 #Spool buddy

# Set macOS settings
echo "Changing macOS defaults..."

# show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# set highligt color
defaults write NSGlobalDomain AppleHighlightColor -string "0.85 0.85 0.85"
# set accent color to purple
defaults write NSGlobalDomain AppleAccentColor -int 5
# save screenshots to downloads folder
defaults write com.apple.screencapture location -string "$HOME/Downloads"
# show screenshot thumbnail
defaults write com.apple.screencapture show-thumbnail -bool false
# set screenshot format
defaults write com.apple.screencapture type -string png
# trun off window opening animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
# prefer to save files locally
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# set sidebar icons size in Finder
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1
# enable tab to move focus
defaults write NSGlobalDomain AppleKeyboardUIMode -int "2"
# switch to space with open window
defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool true
# don't ask to use external disk for backups
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
# don't show downloaded warning
defaults write com.apple.LaunchServices LSQuarantine -bool false

# make dock auto hide
defaults write com.apple.dock autohide -bool true
# set dock location to left
defaults write com.apple.dock orientation left
# set icon size
defaults write com.apple.dock tilesize -int 48
# set animation times (fast as possible)
defaults write com.apple.dock autohide-time-modifier -float 0.0
defaults write com.apple.dock springboard-show-duration -float 0.0
defaults write com.apple.dock springboard-hide-duration -float 0.0
defaults write com.apple.dock springboard-page-duration -float 0.0
# set dock effect to scale
defaults write com.apple.dock mineffect -string scale
# don’t show recent applications
defaults write com.apple.dock show-recents -bool false
# don’t animate opening applications
defaults write com.apple.dock launchanim -bool false
# show indicator lights for open applications
defaults write com.apple.dock show-process-indicators -bool true
# don't rearange sapces
defaults write com.apple.dock mru-spaces -bool false
# minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# don't show anything on the desktop
defaults write com.apple.finder CreateDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
# reduce animations
defaults write com.apple.finder DisableAllAnimations -bool true
# don't ask when changing file extensions
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# set colunm view in Finder
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
# show pathbar
defaults write com.apple.finder ShowPathbar -bool true
# sort folder first
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# hide status bar (bottom of Finder window)
defaults write com.apple.finder ShowStatusBar -bool false

# never open downloaded stuff automatically
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# show the developer menu in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
# show full url
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# don't flash the min/sec seperator in menubar
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

# disable notification on new song
defaults write com.apple.Music userWantsPlaybackNotifications -bool false

# kill processes to update settings
killall Dock
killall Finder
killall SystemUIServer
killall Safari
killall Music

# clone dotfiles repo
echo "Cloning dotfiles ..."
git clone https://github.com/chrede88/dotfiles.git .dotfiles

# All done!
echo "---"
echo "All done! Enjoy:)\n"
