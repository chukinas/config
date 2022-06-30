# config

## Installing this Config

This repo contains submodules (at the time of writing: just the neovim config files)

### Clone

```
$MY_CONFIG=$HOME/projects/config
mkdir -p $MY_CONFIG
cd $MY_CONFIG
git clone https://github.com/jonathanchukinas/config.git . --recurse-submodules
bash setup
```

If you've already cloned it in the normal way, then you have to manually init and update the submodules:

```
git submodule update --init --recursive
```

- https://git-scm.com/book/en/v2/Git-Tools-Submodules
- https://git-scm.com/docs/gitmodules
- When cloning the main repo, do so as normal, then...
  - cd neovim/config
  - git submodule init
  - # Can we do that using path instead? and then not have to cd into it?
  - git submodule update

## How to set up new System76 laptop

### Non-dev setup

- [x] slack: install from pop!_shop
- [ ] chrome
  - [x] install from pop!_shop
  - [x] set as default
  - [x] sign into rz google
  - [x] sign into personal google
- [x] 1password
   - [x] install from site
   - [x] add chrome plugin
- [ ] dropbox: download from site, install with eddy, set up selective sync
- [ ] printer (hardware, optional): connect and print test page

### Configure

- [ ] zlaverse (comoto only) follow instructions:
- [ ] terminal: change font-size to 8




## TODO

- [ ] bash/main.sh -> bash/bashrc
- [ ] ack/setup.sh
- [ ] ack/main.sh
- [ ] asdf/setup.sh
- [ ] asdf/main.sh
- [ ] can I configure my System76 terminal via a config file?
- [ ] rename repo -> config
- [ ] install git cli
- [ ] /neovim
      - setup: symlink to .projections.json
- [ ] /git
      - setup: symlink to ./gitconfig
- [ ] add padding to terminal. It's hard to see the text b/c the blue outline
- [ ] change my gh handle to chukinas
- [ ] address any FIX comments

## Notes

To make a file executable:
chmod u+x filename
