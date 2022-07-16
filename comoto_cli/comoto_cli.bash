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

. $COMOTO_CLI_ROOT/lib/ansi_color
. $COMOTO_CLI_ROOT/lib/print
export COMOTO_CLI_ZLA_BASH_FUNCTIONS="$COMOTO_PROJECT_ROOT/monorepo/zlaverse/support/bash_functions.sh"

# Print the help for 'comoto_cli'
# Dynamically generates the list of commands and their summaries
_comoto_cli_help() {
  print_help_h1 'Common commands to assist in developing Comoto webapps'
  print_help_h2 Usage
  print_help_li 'comoto_cli [OPTIONS] COMMAND'
  print_help_h2 Options
  print_help_li '-h, --help  Print this help and exit'

  # Determine indent for COMMAND summaries
  # Loop thru command names, find longest one, add 3
  local max_char_count=0
  for file in $COMOTO_CLI_ROOT/command/*
  do
    local filename=$(basename $file)
    local char_count=${#filename}
    if [[ $char_count -gt $max_char_count ]] ; then
      max_char_count=$char_count
    fi
  done
  local command_summary_indent=$((max_char_count + 3))

  # Print the COMMAND summaries
  print_help_h2 Commands
  for file in $COMOTO_CLI_ROOT/command/*
  do
    local filename=$(basename $file)
    # TODO handle for missing summary
    unset _comoto_cli_command_summary
    . $file
    local whitespace_to_append=$((3 + $max_char_count - ${#filename}))
    local command_name_with_whitespace=$(printf "%s%*s" "$filename" "$whitespace_to_append" '')
    print_help_li "$command_name_with_whitespace$_comoto_cli_command_summary"
  done

  print_help_h2 Examples
  # TODO use the *_ex function in the other helps as well
  print_help_ex "comoto_cli cd redline        # change to monorepo's redline directory"
  print_help_ex "comoto_cli check             # run credo and dialyzer in local container"
  print_help_ex "comoto_cli bash cg           # bash into local Cycle Gear container"
  print_help_ex "comoto_cli migrate -ul       # migrate-up local db, then lock it"
  echo
  echo "Run 'comoto_cli COMMAND --help' for more information on a command"
  echo
}

# Expects a single argument: path to a command script.
# Prints the help for that script, then exits.
_comoto_cli_render_command_help() {

  # CLEAR VARS & SOURCE COMMAND SCRIPT
  command_path="$1"
  unset _comoto_cli_command_summary
  unset -f _comoto_cli_command_help
  . $command_path

  # RENDER SUMMARY
  if [[ -n $_comoto_cli_command_summary ]] ; then
    print_help_h1 $_comoto_cli_command_summary
  else
    print_help_h1 "${yellowf}${boldon}SCRIPT INCOMPLETE:${boldoff} Make sure $command_path has a ${boldon}_comoto_cli_command_summary${boldoff} variable ${reset}"
  fi

  # RENDER USAGE
  print_help_h2 'Usage'
  if [[ -n $_comoto_cli_command_usage ]] ; then
    print_help_li $_comoto_cli_command_usage
  else
    # maybe DRY this out?
    print_help_li "${yellowf}${boldon}SCRIPT INCOMPLETE:${boldoff} Make sure $command_path has a ${boldon}_comoto_cli_command_usage${boldoff} variable ${reset}"
  fi

  _comoto_cli_command_help
}

# Entry point for <TAB> command completion for 'comoto_cli'
_comoto_cli_completion() {
  # TODO does this include --help?
  # https://devmanual.gentoo.org/tasks-reference/completion/index.html

  # Complete wip command (e.g. 'comoto_cli bou<TAB>' or 'comoto_cli l<TAB>')
  if [[ $COMP_CWORD -eq 1 ]] ; then
    local cur_word="$2"
    COMPREPLY=( $(compgen -W "$(ls $COMOTO_CLI_ROOT/command)" -- "$cur_word"))
    return 0
  fi

  # Complete options or args for the command (e.g. 'comoto_cli logs r<TAB>')
  local cur_command="${COMP_WORDS[1]}"
  local cur_command_path="$COMOTO_CLI_ROOT/command/$cur_command"
  if [[ -f $cur_command_path ]] ; then
    unset _comoto_cli_command_completion
    . $cur_command_path
    # Exclude 'comoto_cli' and the command from the words sent over to the
    # command's completion function.
    _comoto_cli_command_completion "${COMP_WORDS[@]:2}"
  else
    echo -e "\n'${cur_command}' is an invalid command" >&2
  fi
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
    _comoto_cli_render_command_help $potential_command_path
  else
    unset -f _comoto_cli_command_execute
    . $potential_command_path
    _comoto_cli_command_execute $@
  fi
}

alias m=comoto_cli
export -f comoto_cli
complete -F _comoto_cli_completion comoto_cli m
