local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end
-- Autocommand that reloads neovim whenever you save the packages.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packages.lua source <afile> | PackerSync
  augroup end
]]


require('packer').startup(function()
  -- Let Packer manage itself
  use {'wbthomason/packer.nvim', opt = true}
  -- Themes
  use 'folke/tokyonight.nvim'
  use 'tomasr/molokai'

  use {
    'vimwiki/vimwiki',
    config = function()
      vim.g.vimwiki_list = {
        {
          path = '~/',
          syntax = 'markdown',
          ext  = '.md',
        }
      }
      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown',
      }
    end
  }

use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
config = function ()
require('plugins.alpha')
--    require'alpha'.setup(require'alpha.themes.startify'.opts)
--    local startify = require("alpha.themes.startify")
--    startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
--    startify.section.bottom_buttons.val = {
--      startify.button("e", "new file", ":ene <bar> startinsert <cr>"),
 --     startify.button("v", "neovim config", ":e ~/.config/nvim/init.lua<cr>"),
 --     startify.button("q", "quit nvim", ":qa<cr>"),
--    }
--    vim.api.nvim_set_keymap('n', '<c-n>', ':Alpha<cr>', {noremap = true, silent=true})
    end
}

  use {
    "akinsho/toggleterm.nvim",
    config = function ()
      require('plugins.toggleterm')
    end
  }

-- statusline
  use {
    'hoob3rt/lualine.nvim',
    config = function() require('plugins.lualine') end,
  }
  -- bufferline
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.bufferline') end,
    event = 'BufWinEnter',
  }
  -- NvimTree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.nvimtree') end,  -- Must add this manually
  }
 -- LSP server
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('lsp')
    end
  }
  use 'williamboman/nvim-lsp-installer'  -- Helper for installing most language servers
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
 use {"folke/which-key.nvim",
    config = function() require('plugins.whichkey') end,
    }
-- Telescope
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} }
}

-- IDE
use {'nvim-treesitter/nvim-treesitter',
config = function ()
  require('plugins.treesitter')
end
}

 -- Autocomplete
  use "L3MON4D3/LuaSnip"  -- Snippet engine
  use "rafamadriz/friendly-snippets"

  use {
    "hrsh7th/nvim-cmp",
    -- Sources for nvim-cmp
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      'hrsh7th/cmp-cmdline',
      "saadparwaiz1/cmp_luasnip",
    },
    config = function() require('plugins.cmp') end,
  }

use {
  'lewis6991/gitsigns.nvim',
  requires = {
   { 'nvim-lua/plenary.nvim'}
  },
  config = function()
    require('plugins.gitsigns')
  end
}


use {
  "ahmedkhalf/project.nvim",
  config = function() require("plugins.project") end
}
end)
