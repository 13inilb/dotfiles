alias nix-conf="sudo nvim /etc/nixos/configuration.nix"

alias hypr-conf="sudo nvim ~/.config/hypr/hyprland.conf"

alias ff="fastfetch"

alias nix-gens="sudo nixos-rebuild list-generations"

alias nix-pkgs="nix-store -q --requisites /run/current-system | cut -d'-' -f2- | sort | uniq | fzf" 

