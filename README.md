# Dotfiles

This repo contains my dot files. I use `stow` to easily setup my dot files on any machine.

## Setup
On a new machine I'll have to install some things before I can sync my dot files.

### Install Homebrew
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Make sure to add brew to the PATH buy following the quide at the end of the install process

---
### Install git

First we need `git` in order to clone the repo, that contains the list of packages I need to install.

```zsh
brew install git
```

Next let's setup some general git config

```zsh
git config --global user.name "Christian Olsen"
git config --global user.email <my-email>
git config --global init.defaultbranch main
git config --global core.editor "code --wait"
git config --global user.signingkey ~/.ssh/github_ed25519.pub
git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global gpg.ssh.allowedsignersfile ~/.config/git/allowed_signers
```
---

### Install packages
Now that we have install adn setup git, we can clone the dot files repo to our machine. It's imortant that it's cloned to the home folder `~/` for `stow` to work correctly.

```zsh
git clone git@github.com:chrede88/dotfiles.git
```

Now we can install the rest of the packages needed. Execute the install.sh script to install the packages needed.

```zsh
chmod +x install.sh
install.sh
```

---

### Stow
We can now create symlinks to the dot files using `stow`.

```zsh
stow -v .
```

The output should print the created symlinks.

---

### Kitty
Let's open the downloaded terminal emulator.
Hit `control-shift-f5` to load the configuration if needed.

#### Bat
We also have to compile a new list of themes for `bat` before it'll pickup our theme.

```zsh
bat cache --build
```
Next verify that the Catppuccin theme is avaliable

```zsh
bat --list-themes | grep Cat
```