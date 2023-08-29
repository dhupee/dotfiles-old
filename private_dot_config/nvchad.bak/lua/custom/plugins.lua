local plugins ={
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },
  { "gelguy/wilder.nvim",
    lazy = true,
    config = function()
      -- custom config]]
    end,
  },
  -- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    opts = {
      ensure_installed = {
        "pyright",
        "clangd",
        "tsserver",
        "gopls",
        "lua-language-server",
        "dockerls",
        "bashls",
      },
    },
  },
}

return plugins
