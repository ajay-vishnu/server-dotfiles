# Completions:
source "$ZDOTDIR/zsh-completions"
#
# Functions:
source "$ZDOTDIR/zsh-functions"

# Aliases:
source "$ZDOTDIR/zsh-aliases"

# Keybinds:
source "$ZDOTDIR/zsh-bindkeys"

# Options:
source "$ZDOTDIR/zsh-options"

# Plugins
source "$ZDOTDIR/zsh-plugins"

# Cursor
source "$ZDOTDIR/zsh-cursor"

# Misc
eval "$(starship init zsh)"
 # eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/config.omp.json)"
eval "$(zoxide init zsh)"

# fzf should work
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ajayv/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ajayv/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ajayv/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ajayv/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Node.js 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
