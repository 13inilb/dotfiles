# Zinit Location Variable Setting
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"

# Zinit Download and Dir Setup
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Zinit Source after Downloading the first time
source "${ZINIT_HOME}/zinit.zsh"

# Zinit Add Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
#zinit light zsh-users/zsh-completions #(already set in nix)
#autoload -U compinit && compinit #(already set in nix)

# Keybindings
#bindkey -e              	 #set emacs keybindings(already similar set in nix)
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History Setup
#HISTSIZE=5000                           #(already set in nix)
#HISTFILE=~/.zsh_history                 #(already set in nix)
HISTDUP=erase
#setopt share_history 
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_all_dups 
#setopt hist_ignore_dups                 #(already set in nix)
setopt hist_save_no_dups 
setopt hist_find_no_dups

# Aliases
alias nix-conf="sudo nvim /etc/nixos/configuration.nix"
alias hypr-conf="sudo nvim ~/.config/hypr/hyprland.conf"
alias ff="fastfetch"
alias nix-gens="sudo nixos-rebuild list-generations"
alias nix-pkgs="nix-store -q --requisites /run/current-system | cut -d'-' -f2- | sort | uniq | fzf" 

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

