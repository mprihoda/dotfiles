dvm() {
  unset -f dvm
  [[ -s "$(brew --prefix dvm)/dvm.sh" ]] && source "$(brew --prefix dvm)/dvm.sh"
  dvm "$@"
}

