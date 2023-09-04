export ZSH="$HOME/.config/zsh/oh-my-zsh"
ZSH_THEME="alanpeabody"
plugins=(git)
source $ZSH/oh-my-zsh.sh
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$XDG_CONFIG_HOME/shell/aliasrc"
export MESA_GL_VERSION_OVERRIDE=4.5


function move(){
    cd "$(find ~/ -type d | fzf --layout reverse)"
}

function open(){
    xdg-open "$(find ~/ -type f | fzf --layout reverse)"
}

function share(){
    curl -F "file=@$(find ~/ -type f | fzf --layout reverse)" 0x0.st | xclip -sel c
}

bindkey -s "^f" "tmux_session\n"
