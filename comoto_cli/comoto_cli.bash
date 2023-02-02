#!/bin/bash

# TODO rename this file to comoto_cli.bash?
# TODO somewhere in all bash stuff I source the zla bash helpers twice. Rectify.
# TODO look into https://betterdev.blog/minimal-safe-bash-script-template/
# TODO make sure commands fail if they require args. Do not auto-display help.
# https://github.com/icy/bash-coding-style#function-names
# TODO see https://revzilla.atlassian.net/wiki/spaces/TECH/pages/338919566/Kubernetes+and+Google+Cloud+-+Getting+Started
# TODO https://github.com/revzilla/monorepo/wiki/Dev-Ops

export COMOTO_CLI_ZLA_BASH_FUNCTIONS="$COMOTO_PROJECT_ROOT/monorepo/zlaverse/support/bash_functions.sh"
export COMOTO_CLI_ENTRY_POINT="$COMOTO_CLI_ROOT/command/_main"
export COMOTO_CLI_LIB="$COMOTO_CLI_ROOT/lib"
export COMOTO_CLI_STORE="$COMOTO_CLI_ROOT/.store"

# This is just for my easy of testing the library scripts:
export cl=$COMOTO_CLI_LIB

# Set up github cli command completion
eval "$(gh completion -s bash)"

# Set up kubectl bash completion
source <(kubectl completion bash)

comoto_cli() {
  export COMOTO_CLI_COMMAND_PATH="$COMOTO_CLI_ENTRY_POINT"

  unset -f _comoto_cli_execute
  . $COMOTO_CLI_COMMAND_PATH
  _comoto_cli_execute $@
}

alias m=comoto_cli
export -f comoto_cli

complete_me() {
  unset -f _comoto_cli_command_completion
  . $COMOTO_CLI_ENTRY_POINT
  _comoto_cli_command_completion
}

complete -F complete_me comoto_cli m
