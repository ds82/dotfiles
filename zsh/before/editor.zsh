export EDITOR=nvim
export VISUAL=nvim

# change default editor if NVIM variable is not empty
if [ -n "$NVIM" ]; then
    export EDITOR="nvr -l --remote-wait"
    export VISUAL=$EDITOR
    export TIG_EDITOR="nvr -l"
    export GIT_EDITOR="nvr -cc split --remote-wait +'set bufhidden=delete'"
fi
