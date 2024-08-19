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
        "stylua", -- lua formatter
        "clangd",
        "clang-format",
        "rust-analyzer",
        "gopls",
        "prettier", -- prettier formatter
      },
    }
  end,
}
