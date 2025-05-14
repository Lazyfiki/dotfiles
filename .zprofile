export EDITOR="nvim"
export TERMINAL="ghostty"
export BROWSER="zen"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export XAUTHORITY=/tmp/Xauthority
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export MANPAGER="nvim +Man!"
export PATH=$PATH:$HOME/.local/bin

export NIX_PATH="nixos-config=/home/ahmed/.dotfiles/nixos/hosts/configuration.nix:$NIX_PATH"

export MPD_HOST="localhost"
export MPD_PORT="6600"

[ ! -s ~/.config/mpd/pid ] && mpd

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi
