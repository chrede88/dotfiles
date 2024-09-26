# Dotfiles

This repo contains my dot files. I use `homebrew` to install all my dependencies and I use `stow` to easily setup my dot files on any machine.

## Setup
On a new machine I'll have to install some things before I can sync my dot files. Everything I need is defined in `install.sh`. Executing this should setup 99% od the stuff I need. 

Firstly, I need to clone my repo to the home folder (and rename it):
```zsh
git clone https://github.com/chrede88/dotfiles.git .dotfiles
```

It's important to clone it to the `$HOME` folder, as `stow` is setup to reference this path.

After cloning the repo the only step needed is to make `install.sh` executable:

```zsh
chmod +x ~/.dotfiles/install.sh
```

And install all my stuff:

```zsh
./install.sh
```

There are a few steps needed to finish the setup of some programs after running `stow`. These are listed in the last section.

---

### Sync dotfiles
We can now create symlinks to the dot files using `stow`.

First let's test that everything will work out as expected by passed `-n` to the sync.sh script.

```zsh
./sync.sh -n
```
This will run a simulation and output the symlinks that will be created when running it for real. If everything looks good, we can execute the actual stow command: 

```zsh
./sync.sh
```

The output should print the created symlinks.

---

## Extra Setup

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
