vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} }
}
end)

