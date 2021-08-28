# dotfiles

# Pop!_OS
- terminal: change Pop profile:
  - Custom Font -> change size from 12 to 10

# ASDF and TOOL VERSIONS
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
