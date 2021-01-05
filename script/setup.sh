# VIM
# Install a version of VIM with clipboard enabled
sudo apt-get install vim-gtk
# Install minpac (for managing vim packages)
git clone https://github.com/k-takata/minpac.git ~/.vim/pack/minpac/opt/minpac
# Remind me to update minpac
echo "Open Vim and run the `:PackUpdate` command"

# ASDF
# https://asdf-vm.com/#/core-manage-asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0
# erlang Plugin
# see github page for dependencies needed before doing asdf install.
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
# elixir Plugin
# it seems there are no special conditions for installing elixir.
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
# nodejs plugin
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
# TODO do I have to use the github link?
# TODO it seems I don't need these fancy github links. Doing a regular asdf plugin add
# It's in doing the install that things get messy. Follow the instructions on the
# makee sure to follow the nodejs instructions

# ACK
sudo apt-get install ack
