export EDITOR="nvim"
export TERMINAL="ghostty"
export BROWSER="zen"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export XCURSOR_THEME=Adwaita
# export XDG_CURRENT_DESKTOP=niri
export XAUTHORITY=/tmp/Xauthority
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export INPUTRC="$XDG_CONFIG_HOME/shell/inputrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export MANPAGER="nvim +Man!"
export PATH=$PATH:$HOME/.local/bin

export MPD_HOST="localhost"
export MPD_PORT="6600"

[ ! -s ~/.config/mpd/pid ] && mpd

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
  # exec niri-session
fi
