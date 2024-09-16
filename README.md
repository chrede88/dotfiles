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

---

### Install packages
Now that we have installed git, we can clone the dot files repo to our machine. As I'm still missing my `.gitconfig` file, I'll have to clone it using https. It's imortant that it's cloned to the home folder `~/` for `stow` to work correctly.

```zsh
git clone https://github.com/chrede88/dotfiles.git .dotfiles
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
---

### Miniconda
After installing miniconda we've to initialize conda:

```zsh
~/miniconda3/bin/conda init zsh
```
