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

. $COMOTO_CLI_ROOT/lib/print

_comoto_cli_help() {
  print_help_h1 'Common commands to assist in developing Comoto webapps'
  print_help_h2 Usage
  print_help_li 'comoto_cli [OPTIONS] COMMAND'
  print_help_h2 Options
  print_help_li '-h, --help  Print this help and exit'
  print_help_h2 Commands
  . $COMOTO_CLI_ROOT/command/bash
  print_help_li "bash        $_comoto_cli_command_summary"
  print_help_li "bounce      Restart containers"
  print_help_li "cd          Change directory to commonly-used directories like redline and ecom"
  print_help_li "check       Quality-control your code locally so you don't have to wait for Circle CI to catch it in 30 minutes"
  print_help_li "container   No-op for now, but will be the home for logging, bouncing, etc"
  print_help_li "db          Initial setup of a local database and migration helpers"
  print_help_li "logs        View the logs for one or several containers"
  print_help_li "path        Generate fully-qualified paths to common projects"
  print_help_li "repl        Start an IEx or Ruby session in a container"
  print_help_li "setup       Set up this app and the whole Comoto ecosystem"
  print_help_li "vc          Version Control helpers (git and gh wrappers)"
  print_help_h2 Examples
  # TODO use the *_ex function in the other helps as well
  print_help_ex "comoto_cli cd redline        # change to monorepo's redline directory"
  print_help_ex "comoto_cli check             # run credo and dialyzer in local container"
  print_help_ex "comoto_cli bash cg           # bash into local Cycle Gear container"
  print_help_ex "comoto_cli migrate -ul       # migrate-up local db, then lock it"
  echo
  echo "Run 'comoto_cli COMMAND --help' for more information on a command"
  echo
  # TODO add examples
}

comoto_cli() {
  if [[ $# -eq 0 ]] || [[ $# -eq 1 &&  $1 =~ ^(-h|--help)$ ]] ; then
    _comoto_cli_help
    return 0
  fi

  local command="$1"
  local potential_command_path="$COMOTO_CLI_ROOT/command/$command"
  shift

  if [[ ! -f $potential_command_path ]] ; then
    echo "No such command '$command' (TODO: improve error msg)" >&2
    return 1
  elif [[ $# -eq 1 &&  $1 =~ ^(-h|--help)$  ]] ; then
    unset -f _comoto_cli_command_help
    . $potential_command_path
    _comoto_cli_command_help
  else
    unset -f _comoto_cli_command_execute
    . $potential_command_path
    _comoto_cli_command_execute $@
  fi
}

alias moto=comoto_cli
alias m=comoto_cli

export -f comoto_cli

_comoto_cli_completion() {
  # TODO does this include --help?
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
