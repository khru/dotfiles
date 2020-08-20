# Setup fzf
# ---------
if [[ ! "$PATH" == */home/evalverde/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/evalverde/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/evalverde/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/evalverde/.fzf/shell/key-bindings.bash"
