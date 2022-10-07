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
3. When you first enter `nvim`, you will see a bunch of mess because the plugins aren't installed yet, so run `:PackerInstall` to install the plugins

> Note that there is a chance that the download would timeout and `packer.nvim` would report install failed, in this case run `:PackerInstall` again
4. This setup uses the modern LSP system for language support, things like auto-complete, symbols tree, etc..., **which requires a LSP server outside the editor**. Fortunately [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) manages to configure most of the LSP server options for us, all we need to do is to install the LSP servers themselves:

In `lua/configs/autocomplete.lua`, line `108`, edit the list of LSP servers, a complete list of supported LSP servers is listed [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md). After that install the corresponding servers on your OS, auto-complete should pop up for supported languages now :)
5. Final step, smart highlighting using treesitter!

The default vim regex-based highlighting is pretty lame, for NVIM, [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) offered an advanced code highlighting that can make your code much cleaner

You can use the `:TSInstall <lang>` command to install a parser for a language

Alternatively, in `lua/configs/treesitter.lua`, line `6`, you can have a list of parsers that will be updated every time you use the `:TSUpdate` or `:TSUpdateSync` command (the latter is for synchronized updating), or you can just install all maintained parsers by uncommenting line `5` and commenting line `6`

## Usage
> TODO: for now read `lua/core/keymaps.lua` for the keymaps

Note that the config uses `;` as the leader key by default, you can change it in `lua/core/keymaps.lua`, line `1`

Most keymaps in this setup are what I call declarative keymaps, for example, everything related to terminal emulator starts with `;t`, so `;tt` means "terminal toggle", and `;tn` means "terminal new"

## FAQ
> Why does the theme not match the screenshots?

I switch between a few themes sometimes during my usage just to fresh things up a bit, the screenshots are quite old and might not reflect the latest theme, you can change the theme at `lua/core/theme.lua`. You can also switch between light and dark mode using the keymap `<leader>vd` (dark) and `<leader>vl` (light).

> Why are there a bunch of question marks?

They are supposed to be the fancy file and arrow icons, to use these icons you need Nerd Fonts, a special kind of font that supports these icons.

## Contributing
### Having troubles

If you have issues while installing or using my this setup, report an issue, if the problem occurred during setup, first make sure you have followed through the setup guide.
don't just DM me on social media because others may run into the same problem and they can use the existing issues as a reference

Discussions could be in either English or Chinese, although English is preferred

### Adding more things

For now, you don't, this is *my personal config*. However if there's any problem with the documentation above feel free to correct or add more details by a PR.
