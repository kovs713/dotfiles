eval "$(starship init zsh)"

export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias ls='ls --color=auto'
alias g='git'
alias t='tmux new -s'
alias tm='tmux'
alias vim='nvim'
alias cls="clear"
alias ws="/opt/webstorm/bin/webstorm.sh"

source /home/kovs/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# source /home/kovs/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi

# pnpm
export PNPM_HOME="/home/kovs/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
