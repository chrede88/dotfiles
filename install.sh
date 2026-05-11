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
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update brew
brew update
brew analytics off

# use brew bundle to install everything in Brewfile
echo 'Install Apps with Brew...'
brew bundle install --file=.Brewfile

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
# turn on "reduce motion"
defaults write com.apple.universalaccess reduceMotion -bool true
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
# set default open path in finder to home folder
defaults write com.apple.finder NewWindowTarget -string "PfHm"

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
echo "Next sync dotfiles using stow\n"
echo "Use ./sync.sh -n to test"
