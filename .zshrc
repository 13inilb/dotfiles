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
zinit light zsh-users/zsh-completions


# Zinit Load Plugins
#autoload -U compinit && compinit

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

