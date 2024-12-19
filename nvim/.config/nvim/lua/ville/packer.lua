-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]



return require('packer').startup(function(use)
	  -- Packer can manage itself
	  use 'wbthomason/packer.nvim'

      -- use({"notomo/gesture.nvim"})
      -- use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
      -- setup = function() vim.g.mkdp_filetypes = { "markdown", "MD" , "md" } end,
      -- ft = { "markdown" }, })
      use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
      use({
          'sainnhe/gruvbox-material',
          as = 'gruvbox-material',
          config = function()
              vim.cmd('colorscheme gruvbox-material')
          end
      })
    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     run = function() vim.fn["mkdp#util#install"]() end,
    -- })
      use {
          'nvim-telescope/telescope.nvim',
	   -- tag = '0.1.4',
          branch = '0.1.x',
          requires = { {'nvim-lua/plenary.nvim'} }

      }

	use({
	    "stevearc/oil.nvim",
	  })
-- Lua
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                manual_mode = false,
                detection_methods = { "lsp","pattern", },
                silent_chdir = false,
                ignore_lsp = {"docker-compose-language-service"},
                scope_chdir = 'tab',

                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end
    }

      -- use{'ThePrimeagen/harpoon'}
      use{'cbochs/grapple.nvim'}

      use {'folke/twilight.nvim'}
      require('twilight').setup({
              dimming = {
                  alpha = 0.5, -- amount of dimming
                  -- we try to get the foreground from the highlight groups or fallback color
                  color = { "Normal", "#ffffff" },
                  term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
                  inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
              },
              context = 20, -- amount of lines we will try to show around the current line
              treesitter = true, -- use treesitter when available for the filetype
              -- treesitter is used to automatically expand the visible text,
              -- but you can further control the types of nodes that should always be fully expanded
              expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
              "function",
              "method",
              "table",
              "if_statement",
          },
          exclude = {}, -- exclude these filetypes
      })

      use {
          'nvim-treesitter/nvim-treesitter',
          run = function()
              local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
              ts_update()
          end,
      }
      -- use {
      --     "zbirenbaum/copilot.lua",
      --     cmd = "Copilot",
      --     event = "InsertEnter",
      --     config = function()
      --         require("copilot").setup({
      --             suggestion = { enabled = false},
      --             panel = { enabled = false },
      --         })
      --     end,
      -- }
      --
      use {
          'VonHeikemen/lsp-zero.nvim',
          requires = {
              -- LSP Support
              {'neovim/nvim-lspconfig'},
              {'williamboman/mason.nvim'},
              {'williamboman/mason-lspconfig.nvim'},

              -- Autocompletion
              {'hrsh7th/nvim-cmp'},
              {'hrsh7th/cmp-buffer'},
              {'hrsh7th/cmp-path'},
              {'saadparwaiz1/cmp_luasnip'},
              {'hrsh7th/cmp-nvim-lsp'},
              {'hrsh7th/cmp-nvim-lua'},
              {'hrsh7th/cmp-cmdline'},


              -- Snippets
              {
                  'L3MON4D3/LuaSnip',
                  dependencies = { "rafamadriz/friendly-snippets" }
              },
              {'rafamadriz/friendly-snippets'},
          }
      }
      -- use {
      --     "zbirenbaum/copilot-cmp",
      --     after = { "copilot.lua" },
      --     config = function ()
      --         require("copilot_cmp").setup()
      --     end
      -- }
      use('tpope/vim-surround')
      use ('christoomey/vim-tmux-navigator')
      use('nvim-treesitter/playground')
      use('mbbill/undotree')
      use('preservim/nerdtree')
      use "rafamadriz/friendly-snippets"
      use {
          'numToStr/Comment.nvim',
          config = function()
              require('Comment').setup()
          end
      }


      use('tpope/vim-fugitive')
      use {
          "danymat/neogen",
          config = function()
              require('neogen').setup ({snippet_engine = "luasnip"})
          end,
          requires = "nvim-treesitter/nvim-treesitter",
          -- Uncomment next line if you want to follow only stable versions
          tag = "*"
      }

require('mason').setup({
config = function()
      require("mason").setup()
      local pylsp = require("mason-registry").get_package("python-lsp-server")
      pylsp:on("install:success", function()
        local function mason_package_path(package)
          local path = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/" .. package)
          return path
        end

        local path = mason_package_path("python-lsp-server")
        local command = path .. "/venv/bin/pip"
        local args = {
          "install",
          "pylsp-rope",
          "python-lsp-black",
          "pyflakes",
          "python-lsp-ruff",
          "pyls-flake8",
          "sqlalchemy-stubs",
        }

        require("plenary.job")
          :new({
            command = command,
            args = args,
            cwd = path,
          })
          :start()
      end)
    end,
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

        -- python stuff
        "black",
        "isort",
        "mypy",
        -- "pyright",
        "python-lsp-server",
      },
    },
    event = "VeryLazy",
})
local cmp = require('cmp')
--
-- cmp.setup({
--     sources = {
--         {name = 'copilot'},
--         {name = 'nvim_lsp'},
--     },
--     mapping = cmp.mapping.preset.insert({
--         ['<CR>'] = cmp.mapping.confirm({
--             -- documentation says this is important.
--             -- I don't know why.
--             behavior = cmp.ConfirmBehavior.Replace,
--             select = false,
--         })
--     })
-- })
--


  end)




