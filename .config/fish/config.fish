# stop welcome message
set fish_greeting ""

alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

if status is-interactive
    # Commands to run in interactive sessions can go here
    tmux a || tmux new -s base
    clear
end
