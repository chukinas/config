#!/bin/bash

# TODO rename this file to comoto_cli.bash?
# TODO somewhere in all bash stuff I source the zla bash helpers twice. Rectify.
# TODO look into https://betterdev.blog/minimal-safe-bash-script-template/
# TODO make sure commands fail if they require args. Do not auto-display help.

# NOTE: I take a lot of design cues from the 'docker' cli, especially when it comes to the help/usage messages


# Add moto script to path
export COMOTO_CLI_ROOT="$JJC_CONFIG_DIR/comoto_cli"

# TODO this shouldn't be hardcoded in here
# TODO rename COMOTO_PROJECT_ROOT?
export COMOTO_PROJECTS_DIR="$HOME/projects/comoto"
export COMOTO_PROJECT_ROOT=$COMOTO_PROJECTS_DIR


# TODO this shouldn't live here..
alias cdc="cd $COMOTO_PROJECT_ROOT"

# Set up github cli command completion
eval "$(gh completion -s bash)"

# https://github.com/icy/bash-coding-style#function-names
# TODO see https://revzilla.atlassian.net/wiki/spaces/TECH/pages/338919566/Kubernetes+and+Google+Cloud+-+Getting+Started
# TODO https://github.com/revzilla/monorepo/wiki/Dev-Ops

_comoto_cli_usage() {
  # TODO might be nice to take some cues from the gh help, like:
  #   putting the description first
  #   headers are in caps and bold
  #   usage is on its own line and indented
  #   The examples have '$' preceeding them
  . $COMOTO_CLI_ROOT/command/bash
  cat <<EOF

Usage: comoto_cli [OPTIONS] COMMAND

Common commands to assist in developing Comoto webapps

Options:
  -h, --help  Print this help and exit

Commands:
  bash        $_comoto_cli_command_summary
  bounce      Restart containers
  cd          Change directory to commonly-used directories like redline and ecom
  check       Quality-control your code locally so you don't have to wait for Circle CI to catch it in 30 minutes
  container   No-op for now, but will be the home for logging, bouncing, etc
  db          Initial setup of a local database and migration helpers
  logs        View the logs for one or several containers
  path        Generate fully-qualified paths to common projects
  repl        Start an IEx or Ruby session in a container
  setup       Set up this app and the whole Comoto ecosystem
  vc          Version Control helpers (git and gh wrappers)

Run 'comoto_cli COMMAND --help' for more information on a command

EOF
# TODO add examples
}

comoto_cli() {
  if [[ $# -eq 0 ]] || [[ $# -eq 1 &&  $1 =~ ^(-h|--help)$  ]] ; then
    _comoto_cli_usage
    return 0
  fi

  local command="$1"
  # Run command if valid or throw error
  potential_command_path="$COMOTO_CLI_ROOT/command/$command"
  shift
  if [[ -f $potential_command_path ]] ; then
    unset -f _comoto_cli_command_execute
    . $potential_command_path
    _comoto_cli_command_execute $@
  else
    echo "No such command '$command' (TODO: improve error msg)" >&2
    return 1
  fi
}

alias moto=comoto_cli
alias m=comoto_cli

export -f comoto_cli

_comoto_cli_completion() {
  # https://devmanual.gentoo.org/tasks-reference/completion/index.html

  if [[ $COMP_CWORD -eq 1 ]] ; then
    local cur_word="$2"
    COMPREPLY=( $(compgen -W "$(ls $COMOTO_CLI_ROOT/command)" -- "$cur_word"))
    return 0
  fi

  local cur_command="${COMP_WORDS[1]}"
  local cur_command_path="$COMOTO_CLI_ROOT/command/$cur_command"
  if [[ -f $cur_command_path ]] ; then
    unset _comoto_cli_command_completion
    . $cur_command_path
    _comoto_cli_command_completion "${COMP_WORDS[@]:2}"
  else
    echo -e "\n'${cur_command}' is an invalid command" >&2
  fi
}
complete -F _comoto_cli_completion comoto_cli m
