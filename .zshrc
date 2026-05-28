# check if wsl2
if grep -qi microsoft /proc/version 2>/dev/null; then
  echo "Running in WSL"
  mkdir -p /mnt/g
  sudo mount -t drvfs G: /mnt/g
fi

# antigen init
source /home/antek/antigen.zsh

# antigen plugins
antigen bundle zsh-users/zsh-syntax-highlighting

# Lines configured by zsh-newuser-install
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/antek/.zshrc'

# completion
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

setopt correct_all # autocorrect commands
setopt auto_cd # cd by typing directory name if it's not a command
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

# aliases
alias la="ls -al"
alias cdwin="cd /mnt/c/Users/Antbu"
alias cdlin="cd /home/antek"
alias cdg="cd /mnt/g/My Drive"
alias open="explorer.exe ."

#binds
bindkey "^[[1;5C" forward-word   # Ctrl+Right
bindkey "^[[1;5D" backward-word  # Ctrl+Left
bindkey "^[[3~" delete-char       # Delete key

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

