#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='rg' 
alias ff='fastfetch'
alias cat='bat'
alias ls='exa --icons --group-directories-first'
alias ll='exa -lah --icons --group-directories-first'
alias tree='ls --tree'


alias down='cd $HOME/Downloads'

alias update='sudo pacman -Syu && yay -Syu'
alias clean='sudo pacman -Rns $(pacman -Qtdq) && sudo pacman -Sc && yay -Sc && yay -Yc'

alias mirror='sudo reflector -c Portugal -a 10 --sort rate --save /etc/pacman.d/mirrorlist'

# Define the color variables
LINE_COLOR='\[\e[38;5;103m\]'
PROMPT_COLOR='\[\e[38;5;203m\]'
PATH_COLOR='\[\e[38;5;63m\]'
RESET='\[\e[0m\]'

# Use the variables in PS1
PS1="${LINE_COLOR}┌─(${PROMPT_COLOR}\u@\h${LINE_COLOR})─[${PATH_COLOR}\w${LINE_COLOR}]\n└─>${RESET} "

cd ~

# Crazy fortune as fortune-mod, cowsay and lolcat dependencies
crazyfortune() {
  local dbs=(linux computers magic drugs love)
  local selected_db=$(printf "%s\n" "${dbs[@]}" | shuf -n1)
  fortune -s "$selected_db" | cowsay -f tux | lolcat
}

crazyfortune
