
#PROMPT='%F{magenta}%n%f.@.%F{green}%m%f %F{blue}%~%f$ '

###################
##### HISTORY #####
###################
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt inc_append_history 
setopt hist_ignore_dups

###################
##### KEYBOARD ####
###################
bindkey -e # Tryb Emacs (standardowy)

###################
## AUTOCOMPLETE ###
###################
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/d3athw1sh/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
autoload -Uz compinit
compinit

###################
###### ALIAS ######
###################
if command -v eza > /dev/null; then
    alias ls='eza -a --icons --group-directories-first'
    alias ll='eza -lh --icons --group-directories-first --git'
    alias la='eza -a --icons --group-directories-first'
    alias lt='eza --tree --level=2 --icons'
fi

if command -v bat > /dev/null; then
    alias cat='bat'
fi


###################
####### LOOK ######
###################
eval "$(starship init zsh)"
fastfetch

###################
##### PLUGINS #####
###################
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh