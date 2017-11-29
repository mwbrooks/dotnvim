# dot Neovim

## Setup Dependencies

Deoplete dependencies:

```bash
brew install python3
```

Neovim dependencies:

```bash
pip3 install neovim
```

## Install Neovim

```bash
brew install neovim
```

## Install Airline Font

- [Install Source Code Pro patched font](https://github.com/ryanoasis/nerd-fonts#patched-fonts) for Airline
  - [Learn more about patched fonts](https://powerline.readthedocs.io/en/master/installation.html#patched-fonts) for custom arrows and symbols

## Link Dot Files

```bash
git clone https://github.com/mwbrooks/dotnvim.git
ln -s /Users/username/path/to/dotnvim/ ~/.config/nvim
```

## Alias `nvim` as `vim`

Add the following to your bash profile:

```bash
alias vim="nvim"
```

## Install Neovim Plugins

The `init.vim` is setup to auto-install the plugins on first launch.

Alternatively, you can manually install the plugins with:

```
:PlugInstall
```
