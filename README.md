# config

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

### Configure dotfiles

```
$MY_CONFIG=$HOME/projects/config
mkdir -p $MY_CONFIG
cd $MY_CONFIG
git clone https://github.com/jonathanchukinas/dotfiles.git .
bash setup
```

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
