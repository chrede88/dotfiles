
autoload -U +X compinit && compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/cjso/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/cjso/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/cjso/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/cjso/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Init Starship
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# Setup SOPS and Age
export SOPS_AGE_KEY_FILE=~/.config/sops/age/keys.txt

# Setup zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Setup zsh syntas highlighting (using catppuccin colors)
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Setup kubectl autocompletion
source <(kubectl completion zsh)

# Set bat theme
export BAT_THEME="Catppuccin Mocha"

# Setup Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Setup zoxide
eval "$(zoxide init --cmd cd zsh)"

# Alias commands
alias k="kubectl"
alias cat="bat --paging never --style plain"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"