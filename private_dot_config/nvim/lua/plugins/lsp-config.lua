return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Arduino
        "arduino-language-server",

        -- C++
        "clangd", -- lsp
        "cpplint", -- linter

        -- Docker
        "docker-compose-language-service", --lsp
        "dockerfile-language-server", -- lsp
        "hadolint", -- linter

        -- Go
        "gofumpt", -- formatter
        "goimports", -- formatter
        "gopls", -- lsp

        -- Lua
        "lua-language-server", -- lsp
        "stylua",

        -- Markdown
        "markdownlint", -- linter
        "marksman", -- lsp

        -- HTML, JS, CSS, JSON
        "prettier", -- formatter
        "json-lsp", -- lsp

        -- Python
        "autopep8", -- formatter
        "pyright", -- lsp
        "pylint", --linter
        "ruff-lsp", -- lsp

        -- Shell Script
        "bash-language-server", -- lsp
        "shellcheck", -- linter
        "beautysh", -- formatter

        -- TailwindCSS
        "tailwindcss-language-server", -- lsp

        -- YAML
        "yaml-language-server",
      },
    },
  },
}
