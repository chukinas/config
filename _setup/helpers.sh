#!bin/bash

red='\033[1;31m'
green='\033[1;32m'
blue='\033[1;34m'
cyan='\033[0;36m'
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
   echo -en "${cyan}"
   echo $1
   echo "--------------------------------------------------"
   echo -en "${no_color}"
}

function print_success() {
   echo -e "$green$1$no_color"
}

function print_fail() {
   echo -e "$red$1$no_color"
}

function print_cmd() {
   echo -e "$blue$1$no_color"
}
