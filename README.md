# My personal modern NeoVim config

Some outdated demo screenshots can be seen here: https://www.reddit.com/gallery/spt2tm (It has since become much better!)

## Install
1. This setup uses packer.nvim for the package manager, so first install packer.nvim by following the [official instructions](https://github.com/wbthomason/packer.nvim#quickstart)
2. Clone this repo into `~/.config/nvim`:
```
git clone https://github.com/p-z-l/nvim-config.git ~/.config/nvim
```
3. When you first enter `nvim`, you will see a bunch of mess because the plugins aren't installed yet, so run `:PackerInstall` to install the plugins<br>
> Note that there is a chance that the download would timeout and `packer.nvim` would report install failed, in this case run `:PackerInstall` again
4. Now it's time to setup the language support, auto-complete, error popup, dynamic highlighting, symbols tree, etc... This setup uses the modern LSP system for langauge support, **which requires a LSP server outside the editor**. Fortunately [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) manages to configure most of the LSP server options for us, all we need to do is to install the LSP servers themselves:<br>
In `lua/configs/autocomplete.lua`, line `51`, edit the list of LSP servers, a complete list of supported LSP servers is listed [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md). After that install the corresponding servers on your OS, and you're good to go :)

## Usage
> TODO, for now read `lua/core/keymaps.lua` for some reference

## Contributing
**Having troubles**<br>
If you have issues while installing  or using my this setup, report an issue, 
don't just DM me on social media because others may run into the same problem and they can use the existing issues as a reference<br>
Discussions could be in either English or Chinese, although English is preferred<br>

**Adding more things**<br>
For now, you don't, this is *my personal config*, although do leave suggestions if you have any

## TODOs
- Better git integration
- Clean up Lua config code
- Optimize startup time
