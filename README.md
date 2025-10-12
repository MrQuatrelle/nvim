My personal NeoVim configuration.

## About the config

Bear in mind that this is a **personal** config for NeoVim. It has some opinionated settings that I know many *purists* don't approve. I also remapped many *standard* keybinds most people use, especially the LSP ones, to others that made more sense to me.

It also has some more elaborated configs for certain languages:
- `rustaceanvim`, a plugin that works together with `rust-analyzer` (rust's official language server) to extend its functionality
- `jdtls`, same as above but for Java
- `hyprlang` is just a normal language server for [Hyprland](https://hyprland.org/)'s config language that is on an early phase and still needs to be manually attached to the buffer.

### Plugins I use

- [packer.nvim](https://github.com/wbthomason/packer.nvim) 
- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) 
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) 
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) 
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) 
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) 
- [harpoon](https://github.com/theprimeagen/harpoon) 
- [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim) 
- [rustaceanvim](https://github.com/mrcjkb/rustaceanvim) 
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) 
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) 
- [neogen](https://github.com/danymat/neogen) 
- [presence.nvim](https://github.com/andweeb/presence.nvim) 
- [smartcolumn.nvim](https://github.com/m4xshen/smartcolumn.nvim) 
- [undotree](https://github.com/mbbill/undotree) 
- [auto-save.nvim](https://github.com/Pocco81/auto-save.nvim) 
- [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) 
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) 
- [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) 
- [codesnap.nvim](https://github.com/mistricky/codesnap.nvim) 
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) 
- [neotex](https://github.com/donRaphaco/neotex) 


## Dependencies

- [fd/fdfind](https://github.com/sharkdp/fd) and [ripgrep](https://github.com/BurntSushi/ripgrep) for [Telescope](https://github.com/nvim-telescope/telescope.nvim)
    - About *fd/fdfind*: the package and the name of the binary change from OS to OS and from distro to distro, e.g. on Arch Linux both are named *fd*, on Ubuntu Linux they are both called *fdfind* and on MacOS/Brew they are called *fdfind* and *fd*, respectively. Change Telescope's config ([here](after/plugin/telescope.lua#L8)) accordingly.
    - *ripgrep* is used for Telescope's `grep_string()` builtin extension.

## Installation

1. Clone this repo into *~/.config/nvim*:
```sh
    git clone https://github.com/mrquatrelle/nvim.git ~/.config/nvim
```

2. Launch NeoVim: ```nvim```
    - *A lot* of errors will appear on your screen. This is because the config's plugins aren't installed yet. That will be done
    on the next step. Just "spam" `q` until they all disappear

3. Quit NeoVim. Once you relaunch it, all should be working, *hopefully...*

## Final tips for newbies

Repeat after me one last time: *This is a **personal** config!*. LOL. You should create your own config and just check mine out to understand how I do some simple stuff and setups (my config is relatively very simple).

If you just want to check NeoVim out, check out [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). If you *really* want to base your config on mine, you should fork it and modify it to your own taste. Don't just clone it. 

Plus, I can guarantee you that I will mod it from time to time... Try other stuff out, etc. Just so you don't lose its current state, if you like it, fork it and use your fork (e.g. on step 2 of the installation).

## Bugs

1. In some OS/distros, an error appears on method `.preset()`, of lsp-zero. I don't know what makes that happen, and the config still works anyway... If it annoys you, RTFM :)

## Next steps

1. Add [which-key.nvim](https://github.com/folke/which-key.nvim) to the config. Not very useful but definitely very cool.
2. Add [compile-mode.nvim](https://github.com/ej-shafran/compile-mode.nvim) to the config.

## Changes

- 19/Aug/2025: I changed from `jkl;` back to `hjkl`. Let's see how it goes... Might change back, dunno.
- 12/Out/2025: I finally changed from Packer to Lazy.nvim.
