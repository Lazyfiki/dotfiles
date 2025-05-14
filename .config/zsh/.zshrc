source "$XDG_CONFIG_HOME/shell/aliasrc"

HISTFILE="$XDG_DATA_HOME/zsh_history"
unsetopt hist_verify

bindkey -s "^o" "^utmux-sessionizer\n"

if [[ -n "$IN_NIX_SHELL" ]]; then
    export PS1="(nix-shell) $PS1"
fi

eval "$(direnv hook zsh)"
