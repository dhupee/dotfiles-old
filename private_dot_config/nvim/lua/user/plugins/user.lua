return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    'anurag3301/nvim-platformio.lua',
    rocks = {'luasec'},
    requires = {
        {'akinsho/nvim-toggleterm.lua'},
        {'nvim-telescope/telescope.nvim'},
        {'nvim-lua/plenary.nvim'},
    }
  },
}
