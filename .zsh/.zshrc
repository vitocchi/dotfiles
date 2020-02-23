# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source Custome profile.
[[ -e ~/dotfiles/.profile ]] && emulate sh -c 'source ~/dotfiles/.profile'