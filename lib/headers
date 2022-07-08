#!bin/bash

script_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]:-$0}"; )" &> /dev/null && pwd 2> /dev/null; )";
source $script_dir/../lib/ansi_color

red='\033[1;31m'
green='\033[1;32m'
blue='\033[1;34m'
cyan="${cyanf}${boldon}"
light_cyan='\033[1;36m'
no_color='\033[0m'

function print_header() {
   echo -e "${light_cyan}"
   echo "##################################################"
   echo $1
   echo "##################################################"
   echo -e "${no_color}"
}

function print_subheader() {
   echo -e "${cyan}"
   echo $1
   echo "--------------------------------------------------"
   echo -en "${no_color}"
}

function print_success() {
   echo -e "${green}SUCCESS. $1$no_color\n"
}

function print_fail() {
   echo -e "${red}FAIL. $1$no_color\n"
}

function print_cmd() {
   echo -e "$blue$1$no_color"
}



# TODO delete me later

function say_hi()
{
   echo "HI!!!!!!!"
   echo $0
}
