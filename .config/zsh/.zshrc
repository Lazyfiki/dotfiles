autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats "%{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%}"
local return_code="%(?..%{$fg[red]%}%?%{$reset_color%})"

setopt prompt_subst
PROMPT='[%{$fg[magenta]%}%n@%{$fg[red]%}%M %{$fg[blue]%}%~%{$reset_color%}]$%b '
RPROMPT='${return_code}${vcs_info_msg_0_}'

stty stop undef
setopt interactive_comments

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors 'ex=32:di=34:fi=0:ln=36:pi=5:so=5:bd=5:cd=5:su=0:sg=0:tw=0:ow=0:'

zmodload zsh/complist
compinit

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$XDG_DATA_HOME/zsh_history"

bindkey -e
bindkey -s "^o" "^utmux_session\n"

source "$XDG_CONFIG_HOME/shell/aliasrc"
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 2>/dev/null
