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

alias selenium-start="~/monorepo/monotest/browser-container.sh;"
alias test_std="cd ~/monorepo/monotest; mix test"
alias test_dev="cd ~/monorepo/monotest; RZ_URL=https://rz.devzla.com CG_URL=https://cg.devzla.com mix test"
alias test_dev_mobile="PLATFORM=chrome_iphone cd ~/monorepo/monotest; RZ_URL=https://rz.devzla.com CG_URL=https://cg.devzla.com mix test"

function test_dev_mobile {
  cd ~/monorepo/monotest
  PLATFORM="chrome_iphone" RZ_URL=https://rz.devzla.com CG_URL=https://cg.devzla.com mix test
}

function test_staging {
  cd ~/monorepo/monotest
  "RZ_URL=https://rz-pr-${1}.stagezla.com/ CG_URL=https://cg-pr-${1}.stagezla.com/ mix test"
}

function test_staging_mobile {
  cd ~/monorepo/monotest;
  PLATFORM="chrome_iphone" RZ_URL=https://rz-pr-${1}.stagezla.com/ CG_URL=https://cg-pr-${1}.stagezla.com/ mix test;
}

# function mixtest {
#   alias test="cd ~/monorepo/monotest; RZ_URL=https://rz.devzla.com CG_URL=https://cg.devzla.com mix test"
# }

# OTHER
alias cdr='cd ~/monorepo/redline'
alias cdt='cd ~/monorepo/monotest'
