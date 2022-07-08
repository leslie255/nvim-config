# My personal modern NeoVim config

<p align="center">
<img src="https://i.imgur.com/f92Lc7Q.png" alt="Title screen" width="70%"/><br>
<img src="https://i.imgur.com/pk77c1k.png" alt="Outline" width="49%"/>
<img src="https://i.imgur.com/PjiHskD.png" alt="Git preview" width="49%"/><br>
<img src="https://i.imgur.com/pUMg9di.png" alt="Git difference" width="49%"/>
<img src="https://i.imgur.com/i9hcMbc.png" alt="Autocomplete" width="49%"/><br>
</p>

## Setup
0. Use the latest version of NVIM
1. This setup uses packer.nvim for the package manager, so first install packer.nvim by following the [official instructions](https://github.com/wbthomason/packer.nvim#quickstart)
2. Clone this repo into `~/.config/nvim`:
```
git clone https://github.com/leslie255/nvim-config.git ~/.config/nvim
```
3. When you first enter `nvim`, you will see a bunch of mess because the plugins aren't installed yet, so run `:PackerInstall` to install the plugins<br>
> Note that there is a chance that the download would timeout and `packer.nvim` would report install failed, in this case run `:PackerInstall` again
4. This setup uses the modern LSP system for language support, things like auto-complete, symbols tree, etc..., **which requires a LSP server outside the editor**. Fortunately [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) manages to configure most of the LSP server options for us, all we need to do is to install the LSP servers themselves:<br>
In `lua/configs/autocomplete.lua`, line `108`, edit the list of LSP servers, a complete list of supported LSP servers is listed [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md). After that install the corresponding servers on your OS, auto-complete should pop up for supported languages now :)
5. Final step, smart highlighting using treesitter!<br>
The default vim regex-based highlighting is pretty lame, for NVIM, [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) offered an advanced code highlighting that can make your code much cleaner<br>
You can use the `:TSInstall <lang>` command to install a parser for a language<br>
Alternatively, in `lua/configs/treesitter.lua`, line `6`, you can have a list of parsers that will be updated every time you use the `:TSUpdate` or `:TSUpdateSync` command (the latter is for synchronized updating), or you can just install all maintained parsers by uncommenting line `5` and commenting line `6`

## Usage
> TODO: for now read `lua/core/keymaps.lua` for reference

Note that the config uses `;` as the leader key by default, you can of course change it in `lua/core/keymaps.lua`, line `1`<br>
Most keymaps in this setup are what I call declarative keymaps, for example, everything related to terminal emulator starts with `;t`, so `;tt` means "terminal toggle", and `;tn` means "terminal new"<br>
Btw, tryout `;lb` in files with LSP support, it's really fancy!

## Contributing
**Having troubles**<br>
If you have issues while installing  or using my this setup, report an issue, 
don't just DM me on social media because others may run into the same problem and they can use the existing issues as a reference<br>
Discussions could be in either English or Chinese, although English is preferred<br>

**Adding more things**<br>
For now, you don't, this is *my personal config*, although do leave suggestions if you have any

