# Fist install Homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Make sure to add brew to the PATH buy following the quide at the end of the install process

# We can now install the package I need
# First let's get the package needed for my terminal setup
brew install kitty
brew install bat
brew install eza
brew install fzf
brew install jq
brew install starship
brew install yq
brew install zoxide
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install font-hack-nerd-font
brew install macchina

# Next let's install the package needed for kubernetes
brew install age
brew install flux
brew install helm
brew install helmfile
brew install krew
brew install kubernetes-cli
brew install sops
brew install talosctl

# Next let's install package needed for Hugo
brew install go
brew install hugo
brew install node

# misc packages
brew install gh
brew install pipx
brew install pre-commit
brew install stow
brew install --cask visual-studio-code

# conda
brew install --cask miniconda