export TERM=xterm-256color
export ZSH="$ZDOTDIR/ohmyzsh"

ZSH_THEME="robbyrussell"

plugins=(git fzf)

source $ZSH/oh-my-zsh.sh
source "$XDG_CONFIG_HOME/shell/aliasrc"
source "/nix/store/b5hrwv6dzypslhg27gpqwjg8s5gksakh-zsh-syntax-highlighting-0.8.0/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 2>/dev/null

HISTFILE="$XDG_DATA_HOME/zsh_history"
unsetopt hist_verify

bindkey -s "^o" "^utmux-sessionizer\n"

if [[ -n "$IN_NIX_SHELL" ]]; then
    export PS1="(nix-shell) $PS1"
fi

eval "$(direnv hook zsh)"
