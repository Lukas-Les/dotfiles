alias cdgithub="cd /Users/$USER/Documents/Github"
alias s="source ~/.zshrc"
alias spyv="source .venv/bin/activate"
alias v="nvim"
alias t="tmux"
alias tns="tmux new -s"
pea() {
  $(poetry env activate)
}
alias cdfintra="env-launcher fintra uv"
alias cdes="env-launcher external-service-v2 poetry"
alias cdds="env-launcher data-source poetry"
alias cddc="env-launcher data_common poetry"
alias cdbfintra="env-launcher fintra uv"
alias cdffintra="env-launcher fintra-front"
