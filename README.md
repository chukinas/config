# dotfiles

# Pop!_OS
- terminal: change Pop profile:
  - Custom Font -> change size from 12 to 10

# ASDF and TOOL VERSIONS
1. Create `.tool-versions` file in `~/`. Better yet, create symlink to `./dotfile/.tool-versions`.
2. Download asdf (http://asdf-vm.com/guide/getting-started.html#_1-install-dependencies)
3. "Install" asdf (though there's no need; my bashrc already takes care of this)
4. Install language plugin (start with erlang)
   - `asdf plugin list all` to see plugins and where to get them. Click the link and follow install instructions.
   - `asdf plugin add erlang <github url>`
5. Install language `asdf install` install all languages listed in the current `.tool-versions`.
   - Note: erlang has some specific dependencies that need installed first. See the plugin's ubuntu notes.
- See all available versions: `$ asdf list all elixir`
- See all installed versions: `$ asdf list     elixir`
- Install latest version:     `$ asdf install  elixir latest`
- Show latest version:        `$ asdf latest   elixir`

## ASDF ELIXIR
- install erlang first, then elixir
- The erlang version should match the otp version
- https://github.com/asdf-vm/asdf-elixirq




Note, some of my bash stuff fires based on computer name (msi for my work laptop, system76 for my personal)
