# My personal modern NeoVim config


<img src="https://i.imgur.com/MRHEtoO.png" alt="Autocomplete" width="49%"/>
<img src="https://i.imgur.com/6favuEM.png" alt="Git diff" width="49%"/><br>
<img src="https://i.imgur.com/adZiidz.png" alt="Doc preview" width="49%"/>
<img src="https://i.imgur.com/FWuzSqD.png" alt="Glance" width="49%"/><br>
<img src="https://i.imgur.com/lh8K1GW.png" alt="Floating terminal" width="49%"/><br>
<img src="https://i.imgur.com/N61fK6b.png" alt="Telescope search" width="49%"/><br>

## Note for users
You're supposed to fork this repo and work from there (as oppose to cloning it and keep fetching updates by git pulling). This is just a place I share my configs in, not a neovim distribution (like LazyVim or NvChad). I make breaking changes unannounced and if I screw you up welp I told you so.

## Setup
0. Use the latest version of NVIM
1. Clone this repo into `~/.config/nvim`:

```
git clone https://github.com/leslie255/nvim-config.git ~/.config/nvim
```

2. Set up LSP

This setup uses [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) which contains config for most languages servers out there. See `lua/configs/autocomplete.lua`, edit the list of LSP's in this file to languages you need, and make sure those LSP's are installed globally.

3. Set up treesitter

Config for treesitter is in `lua/configs/treesitter.lua`, edit the list of languages in this file and run `:TSUpdate`.

4. Set up snippets

Snippet files are in `snippets/` (outside the `lua/` folder!), this setup uses [LuaSnip](https://github.com/L3MON4D3/LuaSnip) for snippets.

This setup configrued LuaSnip to use snipmate-like snippet syntax, but LuaSnip also supports VSCode-like JSON snippet syntax, to change it, change `"luasnip.loaders.from_snipmate"` to `"luasnip.loaders.from_vscode"` in `lua/configs/autocomplete.lua`, for more information see [related LuaSnip docs](https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#add-snippets).

## FAQ
> Why does the theme not match the screenshots?

I switch between a few themes sometimes during my usage just to fresh things up a bit, the screenshots are quite old and might not reflect the latest theme, you can change the theme at `lua/core/theme.lua`. You can also switch between light and dark mode using the keymap `<leader>vd` (dark) and `<leader>vl` (light).

> Why are there a bunch of question marks?

They are supposed to be the fancy file and arrow icons, to use these icons you need Nerd Fonts, a special kind of font that supports these icons.

> Why does it have a bunch of error messages?

First check if you have followed the setup instructions.

If you have and error messages still exist, that's because I've been lazy and couldn't keep up with the latest breaking changes in plugins or neovim.

## Contributing
### Having troubles

Report an issue If you have issues (don't DM me on social media, report an issue here).

### Adding more things

You don't, this isn't a neovim distribution, so fork it and make changes from there.
