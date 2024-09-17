return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require "mason"
    local mason_tool_installer = require "mason-tool-installer"
    mason.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        "lua-language-server",
        "stylua",

        -- c/c++
        "clangd",
        "clang-format",

        -- rust
        "rust-analyzer",

        -- go
        "gopls",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "emmet-ls",
        "json-lsp",
        "prettier",
        "eslint-lsp",

        -- shell
        "bash-language-server",
        "shfmt",
        "shellcheck",

        -- python
        "pyright",
        "black",

        -- yaml
        "yaml-language-server",

        -- ansible
        "ansible-language-server",
        "ansible-lint",

        -- docker
        "dockerfile-language-server",

        -- terraform
        "terraform-ls",
      },
    }
  end,
}
