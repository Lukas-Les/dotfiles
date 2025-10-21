alias cdgithub="cd /Users/$USER/Documents/Github"
alias s="source ~/.zshrc"
alias spyv="source .venv/bin/activate"
alias v="nvim"
alias t="tmux"
alias tns="tmux new -s"
pea() {
  $(poetry env activate)
}
alias cdes="env-launcher external-service-v2 poetry"
alias cdds="env-launcher data-source poetry"
alias cddc="env-launcher data_common poetry"
alias cddieiac="env-launcher data-integration-infrastructure"
alias cdag="env-launcher data-aggregators poetry"
alias cdago="env-launcher data-aggregatorsGo"
alias cdfintra="env-launcher fintra uv"
