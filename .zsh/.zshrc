if [[ "$(uname)" == 'Darwin' ]]; then
  OS='Mac'
elif [[ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]]; then
  OS='Linux'
elif [[ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]]; then                                                                                           
  OS='Cygwin'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

### Mac Os
if [[ "$OS" == 'Mac' ]]; then
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
  #-----------------------
  # multiuser homebrew
  #-----------------------
  #umask 0022 を umask 0002 に変更し、新しく作成したファイルにgroup writeパーミッションがつくようにする
  umask 0002
fi


# Source Custome profile.
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
