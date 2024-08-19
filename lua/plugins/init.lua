return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "c",
        "cpp",
        "rust",
        "go",
      },
    },
  },
  {
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
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
    },
    keys = {
      -- Will use Telescope if installed or a vim.ui.select picker otherwise
      { "<leader>fs", "<cmd>SessionSearch<CR>", desc = "Session search" },
      { "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session" },
      { "<leader>wat", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
    },
    config = function()
      require("auto-session").setup {
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        session_lens = {
          -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
        },
      }
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    tag = "stable",
    config = function()
      require("crates").setup()
    end,
  },
  -- {
  --   "kdheepak/lazygit.nvim",
  --   cmd = {
  --     "LazyGit",
  --     "LazyGitConfig",
  --     "LazyGitCurrentFile",
  --     "LazyGitFilter",
  --     "LazyGitFilterCurrentFile",
  --   },
  --   -- optional for floating window border decoration
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   -- setting the keybinding for LazyGit with 'keys' is recommended in
  --   -- order to load the plugin when the command is run for the first time
  --   keys = {
  --     { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  --   },
  -- },
}
