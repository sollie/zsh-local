POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time os_icon context dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(kubecontext load ram time)
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=160
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=7
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND=232
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_FOREGROUND=232
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND=7
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND=7
POWERLEVEL9K_CONTEXT_FOREGROUND=232
POWERLEVEL9K_CONTEXT_BACKGROUND=7
POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%n@%m'
POWERLEVEL9K_CONTEXT_REMOTE_TEMPLATE='%n@%m'
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_TEMPLATE='%n@%m'
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{green}❯%f '
POWERLEVEL9K_OS_ICON_FOREGROUND="black"
POWERLEVEL9K_HOST_REMOTE_BACKGROUND="white"
POWERLEVEL9K_HOST_LOCAL_BACKGROUND="white"

zplug bobsoppe/zsh-ssh-agent, use:ssh-agent.zsh, from:github
zplug MichaelAquilina/zsh-you-should-use, use:you-should-use.plugin.zsh, from:github

setopt interactivecomments
export PATH=~/bin:~/go/bin:$PATH

if [ -d /usr/local/opt/mysql-client@5.7/bin ]; then
  export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"
fi

if [ -f ~/.zsh/local/local.zsh ]; then
  source ~/.zsh/local/local.zsh
fi

if [ -f ~/.zsh/local/alias ]; then
  source ~/.zsh/local/alias
fi

if [ -f ~/.zsh/local/alias_local ]; then
  source ~/.zsh/local/alias_local
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export TERM="xterm-256color"
export HISTCONTROL="ignorespace"

export EDITOR=vim

export LANG=en_US.UTF-8
export LC_COLLATE="no_NO.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="no_NO.UTF-8"
export LC_NUMERIC="no_NO.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
