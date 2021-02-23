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
export PATH=$PATH:~/bin

if [ -f ~/.zsh/local/alias ]; then
  source ~/.zsh/local/alias
fi


# Window Title
#--------------------

# Percent encode
function pct_encode {
	# Collect all arguments into a single string.
	local input="$(echo $@)"

	# Process the input byte-by-byte.
	local LC_ALL=C

	# Percent encode the input.
	local output=''
	local i ch hexch
	for i in {1..${#input}}
	do
		ch="${input[i]}"
		if [[ "${ch}" =~ [/._~A-Za-z0-9-] ]]
		then
			output+="${ch}"
		else
			hexch=$(printf "%02X" "'${ch}")
			output+="%${hexch}"
		fi
	done
	echo "${output}"
}

# Get the pwd as a `file://` URL, including the hostname.
function pwurl {
	echo "file://${HOST}$(pct_encode ${PWD})"
}

# Present working directory as a `file://` URL.
# This is updated by the chpwd hook.
export PWURL=$(pwurl)

# Sets the title to whatever is passed as $1
function set-term-title {
	# Escape the argument for printf formatting.
	local title=$1
	title=${title//\\/\\\\}
	title=${title//\"/\\\"}
	title=${title//\%/\%\%}

	# OSC 0, 1, and 2 are the portable escape codes for setting window titles.
	printf "\e]0;$title\a"  # Both tab and window
	printf "\e]1;$title\a"  # Tab title
	printf "\e]2;$title\a"  # Window title

	# OSC 6 and 7 are used on macOS to advertise host and pwd.
	# These codes may foobar other terminals on Linux, like gnome-terminal.
	if [[ ${TERM_PROGRAM} == 'Apple_Terminal' || ${TERM_PROGRAM} == 'iTerm.app' ]]
	then
		print -n "\e]6;${PWURL}\a"  # Current document as a URL (Terminal.app)
		print -n "\e]7;${PWURL}\a"  # PWD as a URL (Terminal.app and iTerm2)
	fi

	# Also set window name in tmux.
	if [[ ${TMUX} ]]
	then
		tmux rename-window $title
	fi
}

# At the prompt, we set the title to "$HOST : $PWD".
function precmd-title {
	set-term-title "$(print -P %n@%m: %~)"
}

# When running a command, set the title to "$HOST : $COMMAND"
function preexec-title {
	set-term-title "$(print -P %n@%m: $1)"
}

# Update PWURL whenever we change PWD
function chpwd-chpwurl {
	export PWURL=$(pwurl)
}

# Setup the hooks
autoload add-zsh-hook
add-zsh-hook precmd precmd-title
add-zsh-hook preexec preexec-title
add-zsh-hook chpwd chpwd-chpwurl

alias jssh="ssh -J scalpel"

export TERM="xterm-256color"
export HISTCONTROL="ignorespace"

export LANG=en_US.UTF-8
export LC_COLLATE="no_NO.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="no_NO.UTF-8"
export LC_NUMERIC="no_NO.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
