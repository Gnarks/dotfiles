# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/etude/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#
#

PROMPT='%F{blue}%n%f@%F{magenta}%1d%f%# '

export EDITOR=/usr/bin/nvim

# pipes à la con pour zoli
alias pipes="pipes.sh -p 6 -t 1 -f 50 -R -r 25000 -s 5 -K"
alias n="nvim"
# make a function (alias) for zathura to run without taking the terminal (unmodular)
function zathura() {
  /bin/zathura $1 & disown 
}
# permet de copier coller vers clipboard avec $ output > clipboard
alias clipboard="xclip -selection clipboard"



# zoxide
eval "$(zoxide init zsh)"

# Created by `pipx` on 2025-05-02 13:03:05
export PATH="$PATH:/home/etude/.local/bin"
