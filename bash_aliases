#!/bin/bash

export PATH=/sbin:~/bin:~/tools:$PATH

TERM=xterm
PS1='╔║${debian_chroot:+($debian_chroot)}\[\033[35m\]\w\[\033[00m\]║═╗\n╚═>> '

case ${TERM} in
    *)
        # user command to change default pane title on demand
        function title { TMUX_PANE_TITLE="$*"; }

        # function that performs the title update (invoked as PROMPT_COMMAND)
        function update_title { printf "\033]2;%s\033\\" "${1:-$TMUX_PANE_TITLE}"; }

        # default pane title is the name of the current process (i.e. 'bash')
        TMUX_PANE_TITLE=$(ps -o comm $$ | tail -1)

        # Reset title to the default before displaying the command prompt
        PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'update_title'

        # Update title before executing a command: set it to the command
        trap 'update_title "$BASH_COMMAND"' DEBUG

        ;;
esac

# for git information of tmux-powerline
#PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

alias vi="vim"
alias d="sdcv"

[ -e ~/.bashrc_notrack ] && . ~/.bashrc_notrack
. ~/tools/common.sh