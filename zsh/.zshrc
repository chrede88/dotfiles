
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
source ~/.config/zsh-highlight/catppuccin_mocha-zsh-highlighting.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Setup kubectl autocompletion
source <(kubectl completion zsh)

# Setup kubecolor
alias k=kubecolor
compdef kubecolor=kubectl
export KUBECOLOR_CONFIG="$HOME/.config/kubecolor/color.yaml"

# Set bat theme
export BAT_THEME="Catppuccin Mocha"

# Setup Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Setup zoxide
eval "$(zoxide init --cmd cd zsh)"

# Setup fzf
source <(fzf --zsh)

# Setup Micro
export "MICRO_TRUECOLOR=1"

# Alias commands
alias cat="bat --color=always --paging never --style='changes,numbers,grid,header'"
alias ls="eza --color=always --git --no-filesize --icons=always --no-time --oneline"
alias fp="fzf --preview 'bat --color=always --style='changes,numbers,grid,header' {}' | xargs code"

# Setuo yazi to change the cwd on exit
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
} 

# run fastfetch at startup
fastfetch
