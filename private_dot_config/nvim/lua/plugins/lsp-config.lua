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
        "golangci-lint", -- linter

        -- Lua
        "lua-language-server", -- lsp
        "stylua", -- formatter

        -- Markdown
        "markdownlint", -- linter
        "marksman", -- lsp

        -- HTML, JS, CSS, JSON
        "prettier", -- formatter
        "json-lsp", -- lsp

        -- Python
        "ruff", -- linter and formatter
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
