# dotfiles

# Pop!_OS
- terminal: change Pop profile:
  - Custom Font -> change size from 12 to 10

# ASDF and TOOL VERSIONS
1. Download asdf (http://asdf-vm.com/guide/getting-started.html#_1-install-dependencies)
   Note: the bash "install" is already set in my bashrc
- .tool-versions
- Setup requires installing asdf and the elixir etc plugins, then installing the versions and creating tool versions files
- github: https://github.com/asdf-vm/asdf
- See all available versions: `$ asdf list all elixir`
- See all installed versions: `$ asdf list     elixir`
- Install latest version:     `$ asdf install  elixir latest`
- Show latest version:        `$ asdf latest   elixir`

## ASDF ELIXIR
- install erlang first, then elixir
- The erlang version should match the otp version
- https://github.com/asdf-vm/asdf-elixirq




Note, some of my bash stuff fires based on computer name (msi for my work laptop, system76 for my personal)
