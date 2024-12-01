-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- plugins.lua
vim.g.mapleader = " "
local plugins = {
    -- Package manager itself is not needed in lazy.nvim

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
      dependencies = {
        "nvim-lua/plenary.nvim",
        "3rd/image.nvim", 
        "nvim-telescope/telescope-media-files.nvim", 
    "nvim-lua/popup.nvim"
    }
    },

    -- Rose Pine Theme
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    -- Harpoon
    {
        'theprimeagen/harpoon'
    },

    -- Undotree
    {
        'mbbill/undotree'
    },

    -- Fugitive
    {
        'tpope/vim-fugitive'
    }
    -- image preview
,  
    {
        "3rd/image.nvim",
    }, 
    --preview in netrw
    {

        'nvim-tree/nvim-web-devicons'
    }
   ,  {
        "lewis6991/gitsigns.nvim"
   }
}

require("lazy").setup(plugins, {})
