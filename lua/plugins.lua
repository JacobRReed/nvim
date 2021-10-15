local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  ---@diagnostic disable-next-line: lowercase-global
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup({function()
  -- Packer can manage itself
  -- https://github.com/wbthomason/packer.nvim
  use {'wbthomason/packer.nvim'}

  -- LSP configs
  -- https://github.com/neovim/nvim-lspconfig
  use {'neovim/nvim-lspconfig'}

  -- Allows %, g%, [%, ]%, and z% to navigate to likewise symbols
  -- similar to VSCode's Ctrl+D
  -- https://github.com/andymass/vim-matchup
  use {'andymass/vim-matchup'}

  -- Autocompletion
  -- https://github.com/nvim-lua/completion-nvim
  use {'nvim-lua/completion-nvim'}

  -- LazyGit required LazyGit (https://github.com/jesseduffield/lazygit)
  -- https://github.com/kdheepak/lazygit.nvim
  use {'kdheepak/lazygit.nvim'}

  -- Highlights current active pane
  -- https://github.com/TaDaa/vimade
  use {'TaDaa/vimade'}

  -- https://github.com/nvim-treesitter/nvim-treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Git decorations and blame lines
  -- https://github.com/lewis6991/gitsigns.nvim
  use {'lewis6991/gitsigns.nvim'}

  -- For Async operations
  -- https://github.com/nvim-lua/plenary.nvim
  use {'nvim-lua/plenary.nvim'}

  -- theme
  -- https://draculatheme.com/vim
  use {'dracula/vim', as = 'dracula'}

  -- Web dev icons
  -- https://github.com/ryanoasis/vim-devicons
  use {'ryanoasis/vim-devicons'}

  -- Statusline
  -- https://github.com/glepnir/galaxyline.nvim
  use {
      'glepnir/galaxyline.nvim',
      branch = 'main',
      config = "require'plugins.galaxyline'",
      event = 'BufWinEnter',
      -- some optional icons
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Dashboard
  -- https://github.com/glepnir/dashboard-nvim
  use {'glepnir/dashboard-nvim', config = "require'plugins.dashboard'", event = 'BufWinEnter'}

  -- Telescope
  -- https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- which-key
  -- Displays popup that can display keybinds
  -- https://github.com/folke/which-key.nvim
  use {
    'folke/which-key.nvim',
    event = "BufWinEnter"
  }

  -- File explorer
  -- https://github.com/kyazdani42/nvim-tree.lua
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- Commenter
  -- https://github.com/b3nj5m1n/kommentary
  use{'b3nj5m1n/kommentary'}

  -- Buffer bar
  -- https://github.com/akinsho/bufferline.nvim
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

    -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    -- uses a floating window
    open_fn = require('packer.util').float,
  }
}})
