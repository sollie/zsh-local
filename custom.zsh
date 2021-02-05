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

export PATH=$PATH:~/bin
alias tf="aws-vault exec telia_admin -- terraform"
