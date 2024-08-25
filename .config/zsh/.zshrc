export ZSH="$ZDOTDIR/ohmyzsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source "$XDG_CONFIG_HOME/shell/aliasrc"
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 2>/dev/null

HISTFILE="$XDG_DATA_HOME/zsh_history"

unsetopt hist_verify

bindkey -s "^o" "^utmux-sessionizer\n"
bindkey -s "^f" "^utmux-switcher\n"
eval "$(direnv hook zsh)"

