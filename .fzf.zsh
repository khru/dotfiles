# Setup fzf
# ---------
if [[ ! "$PATH" == */home/evalverde/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/evalverde/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/evalverde/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/evalverde/.fzf/shell/key-bindings.zsh"
