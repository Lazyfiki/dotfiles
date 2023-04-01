export ZSH="$HOME/.config/zsh/oh-my-zsh"
ZSH_THEME="alanpeabody"
plugins=(git)
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$XDG_CONFIG_HOME/shell/aliasrc"

function move(){
    cd "$(find ~/ -type d | fzf --layout reverse)"
}

zle -N move move
# blindkey ^; move

function open(){
    xdg-open "$(find ~/ -type f | fzf --layout reverse)"
}

zle -N open open
# blindkey ^o; open

function countdown(){
    date1=$((`date +%s` + $1));
    while [ "$date1" -ge `date +%s` ]; do
        echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
        sleep 0.1
    done
}

function stopwatch(){
    date1=`date +%s`;
    while true; do
        echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
        sleep 0.1
    done
}
