#--------------------------
# 各種ライブラリ
#--------------------------
export PATH=$PATH:/Users/itokosuke/.nodebrew/current/bin
export PATH=$PATH:/Users/itokosuke/.composer/vendor/bin/laravel
export PATH=$PATH:/Users/itokosuke/.composer/vendor/bin
export PATH=$PATH:/usr/local/opt/mysql@5.7/bin
export PATH=$PATH:/Users/itokosuke/study/grin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Wireshark.app/Contents/MacOS:/Users/itokosuke/.nodebrew/current/bin:/Users/itokosuke/.composer/vendor/bin/laravel:/Users/itokosuke/.composer/vendor/bin:/usr/local/opt/mysql@5.7/bin:/usr/X11R6/bin
export PATH=$PATH:/Users/itokosuke/.rbenv/bin
export PATH=$PATH:/Users/itokosuke/pear/bin
export PATH=$PATH:/Users/itokosuke/.cargo/bin

#--------------------------
# PHP 開発用
#--------------------------
alias phpunit="XDEBUG_CONFIG="on" vendor/phpunit/phpunit/phpunit $@"
alias redis-server="redis-server /usr/local/etc/redis.conf"

#--------------------------
#Geth
#--------------------------
alias geth_local="geth --networkid "15" --rpc --nodiscover --datadir "/Users/itokosuke/study/eth_private_net" console 2>> /Users/itokosuke/study/eth_private_net/geth_err.log"
export PATH=$PATH:$HOME/bin

#--------------------------
#Go
#--------------------------
export GOPATH=$HOME/go
export PATH=$PATH:$HOME/go/bin
alias cdgo="cd $HOME/go/src/github.com/aerialpartners"

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
