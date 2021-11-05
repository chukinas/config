#!/bin/bash

# ~/projects/dotfiles/dotfile/bash-general.sh
# ~/projects/dotfiles/dotfile/bash-personal.sh
# ~/projects/dotfiles/dotfile/bash-comoto.sh
# ~/monorepo/zlaverse/support
# ~/monorepo/zlaverse/support/bash_functions.sh
# ~/monorepo/zlaverse/support/frmt_vim.sh

# JETBRAINS DATAGRIP (db tool)
alias datagrip="/opt/jetbrains/DataGrip-2021.2.1/bin/datagrip.sh"

# MONOREPO
alias jclogs="cd_zla && docker-compose logs -f --tail=100 revzilla-redline-webapp"
function dlog () {
    cd_zla && docker-compose logs --tail=100 -f ${1:-revzilla-redline-webapp}
}
alias jcdocker="cd_zla && docker-compose stop && docker-compose up -d && jclogs"
source ~/monorepo/zlaverse/support/bash_functions.sh
export COMPOSE_FILE=./docker-compose.yml:./docker-compose-linux.yml
source /usr/share/google-cloud-sdk/completion.bash.inc

function cg-bash-noninteractive() {
  # This is the same as `cg-bash` from ~/monorepo/zlaverse/support/bash_functions.sh,
  # just without the -ti flags
  docker exec -u ${ZV_DEPLOY_UID} $ZV_CG bash -lc "$1"
}

function jc-format-elixir() {
  # Expects a single argument: path to file relative to ~/monorepo/redline/
  echo "formatting $1"
  cg-bash-noninteractive "mix format $1"
}

# OTHER
alias cdm='cd_zla 1>/dev/null; cd ../..'
alias cdr='cdm; cd redline'
alias vimr="cdr; nvim"
