# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#--------------------------
#multi user zsh completion
#https://qiita.com/suin/items/7b49abadc387801e8d6f
#--------------------------
: "Multi-user Hack" && {
    compaudit > /dev/null 2>&1 || {
        echo "Need to change file ownership of zsh completion"
        sudo -v || exit
        compaudit 2>/dev/null | sudo xargs chown $(whoami)
    }
}
compinit


# Source Custome profile.
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
