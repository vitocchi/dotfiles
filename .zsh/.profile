#--------------------------
# PATHの設定
#--------------------------
export PATH=$PATH:/usr/local/heroku/bin
export PATH=$PATH:/usr/local/opt/mysql@5.7/bin
export PATH=$PATH:/usr/local/opt/openssl@1.1/bin
export PATH=$PATH:$HOME/.nodebrew/current/bin
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=$PATH:$HOME/private/grin
export PATH=$PATH:$HOME/.rbenv/bin
export PATH=$PATH:$HOME/pear/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.cargo
export PATH=$PATH:$HOME/go/bin

#--------------------------
# PHP 開発用
#--------------------------
alias phpunit="XDEBUG_CONFIG="on" vendor/phpunit/phpunit/phpunit $@"
alias redis-server="redis-server /usr/local/etc/redis.conf"

#--------------------------
#Geth
#--------------------------
alias geth_local="geth --networkid "15" --rpc --nodiscover --datadir "/Users/itokosuke/study/eth_private_net" console 2>> /Users/itokosuke/study/eth_private_net/geth_err.log"

#--------------------------
#Go
#--------------------------
export GOPATH=$HOME/go
export GO111MODULE=on
alias cdgo="cd $HOME/go/src/github.com/aerialpartners"
alias initMakefile="wget https://raw.githubusercontent.com/vitocchi/go-makefile-temp/master/Makefile"

#--------------------------
#rbenv(Ruby)
#--------------------------
eval "$(rbenv init -)"


#--------------------------
# docker 
#-------------------------
alias d="docker"

function din() { 
    docker container exec -it $1 /bin/bash
} 

#--------------------------
# dig
#--------------------------
function digno() { 
    dig $@ +noedns
} 

#--------------------------
# nvim
#--------------------------
alias v="vim"
alias vi="vim"
#alias vim="nvim"

#--------------------------
# atcoder
#--------------------------
alias initat="git clone https://github.com/vitocchi/atcoder-rust-temp.git"

#--------------------------
# global ip　確認
#--------------------------
alias myip="curl inet-ip.info"

#--------------------------
# pwgen
# 大文字、小文字、数字、記号を含んだ12文字のパスワードを生成してクリップボードに保存する
alias cpwgen="pwgen 12 -cny1 | pbcopy"
#--------------------------

#--------------------------
# peco-ssh
#--------------------------
function peco-ssh () {
  local selected_host=$(ls -d ~/.ssh/conf.d/* | xargs awk '
  tolower($1)=="host" {
    for (i=2; i<=NF; i++) {
      if ($i !~ "[*?]") {
        print $i
      }
    }
  }
  ' | sort | peco --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-ssh
bindkey '^s' peco-ssh

#------------------------
# git
#-----------------------
alias g='git'

#------------------------
# vscode
#------------------------
alias c='code'
