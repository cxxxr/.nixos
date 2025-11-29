# ~/.bashrc

# direnv hook
if command -v direnv &> /dev/null; then
  eval "$(direnv hook bash)"
fi

alias claude='claude --dangerously-skip-permissions'
