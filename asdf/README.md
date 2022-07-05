# ASDF

General Steps (with elixir as example)
1. Download and install asdf (http://asdf-vm.com/guide/getting-started.html#_1-install-dependencies)
3. Install language plugin (start with erlang)
   - `asdf plugin list all` to see plugins and where to get them. Click the link and follow install instructions.
   - `asdf plugin add erlang <github url>`
4. Install language `asdf install` install all languages listed in the current `.tool-versions`.
   - Note: erlang has some specific dependencies that need installed first. See the plugin's ubuntu notes.

 ASDF ELIXIR
- install erlang first, then elixir
- The erlang version should match the otp version
- https://github.com/asdf-vm/asdf-elixirq

## Steps for installing erlang

1. download and install asdf (done already by setup script)
2. "Add" erlang plugin `asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git`
3. install linux dependencies `sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk`
4. "Install" erlang `asdf install erlang` ... I specify no version here so that the one in ~/.tool-versions (which is symlinked to the file in this dir) is used.

## Steps for installing elixir
0. asdf is already installed...
1. Remove any existing elixir plugin `asdf plugin-remove elixir`
2. "Add" elixir plugin `asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git`
3. Install linux dependencies `apt-get unzip`
4. Install elixir `asdf install elixir`

Note: when doing this in the setup script, make sure all the erlang stuff is done first (TODO)

## Other useful `asdf` commands:

- See all available versions: `$ asdf list all elixir`
- See all installed versions: `$ asdf list     elixir`
- Install latest version:     `$ asdf install  elixir latest`
- Show latest version:        `$ asdf latest   elixir`
