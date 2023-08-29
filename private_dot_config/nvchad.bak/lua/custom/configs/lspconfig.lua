local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

-- python
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "python"
  },
})

-- cpp 
lspconfig.clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "c", "cpp", "objc", "objcpp"
  }
}

-- golang
lspconfig.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {
    "go", "gomod", "gotmpl"
  }
}

-- bash
lspconfig.bashls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"bash-language-server", "start"},
  filetypes = {
    "bash", "sh", "zsh"
  }
}

-- docker
lspconfig.dockerls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "dockerfile"
  }
}

