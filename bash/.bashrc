# ~/.bashrc

#Bash Stuff
export EDITOR='nvim'

# add custom scripts dir
export PATH="$HOME/bin:$PATH"

#Alias
alias inv='nvim $(fzf -m --preview="bat --color=always {}")'

## Non Bash Stuff

# Tmuxifer
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"

# Runs the fortune program on madlib passed through to coysay so it displays a moose
fortune | cowsay -f moose
# Same thing but runs my madlib program
#~/bin/madlib | cowsay -f moose

# Tmux
# Auto-start or attach to a tmux session
#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#  tmux has-session -t default 2>/dev/null
#  if [ $? != 0 ]; then
#    tmux new-session -s default
#  else
#    tmux attach-session -t default
#  fi
#fi

# Prompt
#Regular text color
BLACK='\[\e[0;30m\]'
#Bold text color
BBLACK='\[\e[1;30m\]'
#background color
BGBLACK='\[\e[40m\]'
RED='\[\e[0;31m\]'
BRED='\[\e[1;31m\]'
BGRED='\[\e[41m\]'
GREEN='\[\e[0;32m\]'
BGREEN='\[\e[1;32m\]'
BGGREEN='\[\e[1;32m\]'
YELLOW='\[\e[0;33m\]'
BYELLOW='\[\e[1;33m\]'
BGYELLOW='\[\e[1;33m\]'
BLUE='\[\e[0;34m\]'
BBLUE='\[\e[1;34m\]'
BGBLUE='\[\e[1;34m\]'
MAGENTA='\[\e[0;35m\]'
BMAGENTA='\[\e[1;35m\]'
BGMAGENTA='\[\e[1;35m\]'
CYAN='\[\e[0;36m\]'
BCYAN='\[\e[1;36m\]'
BGCYAN='\[\e[1;36m\]'
WHITE='\[\e[0;37m\]'
BWHITE='\[\e[1;37m\]'
BGWHITE='\[\e[1;37m\]'

PROMPT_COMMAND=smile_prompt

function smile_prompt
{
if [ "$?" -eq "0" ]
then
#smiley
SC="${GREEN}:)"
else
#frowney
SC="${RED}:("
fi
if [ $UID -eq 0 ]
then
#root user color
UC="${YELLOW}"
else
#normal user color
UC="${RED}"
fi
#hostname color
HC="${RED}"
#regular color
RC="${BWHITE}"
#default color
DF='\[\e[0m\]'
PS1="${UC}\u${RC}@${HC}\h ${RC}\w${DF} ${SC}${DF}"
}


