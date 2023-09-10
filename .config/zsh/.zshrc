autoload -U colors && colors
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats "%{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%}"
setopt prompt_subst

PS1='[%{$fg[magenta]%}%n@%{$fg[red]%}%M %{$fg[blue]%}%~%{$reset_color%}]$%b '
RPS1='${vcs_info_msg_0_}'

stty stop undef
setopt interactive_comments

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zmodload zsh/complist
compinit
_comp_options+=(globdots)

HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="$XDG_DATA_HOME/zsh_history"

bindkey -e
bindkey -s "^o" "^utmux_session\n"

source "$XDG_CONFIG_HOME/shell/aliasrc"
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
export MESA_GL_VERSION_OVERRIDE=4.5
