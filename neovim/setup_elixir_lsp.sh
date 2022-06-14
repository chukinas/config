# TODO do I need this with my fancy new neovim packer setup?...
# https://www.mitchellhanberg.com/how-to-set-up-neovim-for-elixir-development/#setting-up-elixir-ls

# Clone Elixir LS project
cd ~/projects
DIR=elixir-ls
rm -rf $DIR
git clone git@github.com:elixir-lsp/elixir-ls.git
cd $DIR

# Tool Versions
ERLANG_VERSION="22.3.4.21"
ELIXIR_VERSION="1.10.4-otp-22"
asdf install erlang $ERLANG_VERSION
asdf install elixir $ELIXIR_VERSION
asdf local erlang $ERLANG_VERSION
asdf local elixir $ELIXIR_VERSION

# Compile
mkdir rel
mix deps.get
mix compile
mix elixir_ls.release -o release
