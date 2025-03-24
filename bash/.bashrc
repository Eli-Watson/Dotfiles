#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
export PS1="\[$(tput setaf 196)\]\u\[$(tput setaf 15)\]@\[$(tput setaf 196)\]\h \[$(tput setaf 15)\]\w \[$(tput sgr0)\]$ "

#This is my Startup configuration
#figlet -c "Alacritty"
#fortune | cowsay -f dragon 

