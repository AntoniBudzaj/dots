return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = {
          "css",
          "scss",
          "html",
          "qml",
        },
        user_default_options = {
          names = false,   -- Disable color names
          RGB = true,      -- Enable RGB color codes
          RRGGBB = true,   -- Enable RRGGBB color codes
          RRGGBBAA = true, -- Enable RRGGBBAA color codes
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "html", "css", "javascript", "typescript", "qmljs", "lua" },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        autotag = { enable = true },
      })
    end,
  },
  -- MASON LSP CONFIG
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "ts_ls",
        "html",
        "lua_ls",
        "clangd",
        "gopls",
        "tailwindcss",
        "cssls",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- 1. Define the Quickshell/QML configuration NATIVELY
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config.qmlls = {
        cmd = { "qmlls" },
        filetypes = { "qml", "qmljs" },
        -- Use the native table format for root markers
        root_markers = { ".qmlls.ini", "qmldir", ".git" },
      }

      vim.lsp.config.ts_ls = {
        capabilities = capabilities,
        settings = {
          typescript = {
            -- Enables auto-imports and better completion
            suggest = {
              completeFunctionCalls = true,
            },
            -- This shows you the types of variables without you having to hover
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              parameterNames = { enabled = "all" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
            },
          },
        }
      }

      -- 2. List all the servers you want to run
      local servers = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "qmlls",
        "clangd",
        "gopls",
        "pyright",
      }

      -- 3. Enable them using the 0.11+ native API
      for _, server in ipairs(servers) do
        if vim.lsp.config[server] then
          -- If we already defined it (like qmlls), just enable it
          vim.lsp.enable(server)
        else
          -- Otherwise, create a default config with our capabilities and enable
          vim.lsp.config[server] = { capabilities = capabilities }
          vim.lsp.enable(server)
        end
      end
    end,
  }
}
