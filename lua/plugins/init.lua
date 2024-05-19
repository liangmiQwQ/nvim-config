return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "octaltree/cmp-look", --用于完成英语单词
      "hrsh7th/cmp-path", --自动提示硬盘上的文件
      "hrsh7th/cmp-calc", --输入数学算式（如1+1=）自动计算
      "f3fora/cmp-spell", --nvim-cmp 的拼写源基于 vim 的拼写建议
      "hrsh7th/cmp-emoji", --输入: 可以显示表情
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "tailwindcss-language-server",
        "typescript-language-server",
        "markdownlint",
        "eslint_d",
      },
    },
  },

  -- {
  --   "goolord/alpha-nvim",
  --   config = function()
  --     require("alpha").setup(require("alpha.themes.dashboard").config)
  --   end,
  -- },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    cmd = "Alpha",
    config = function()
      local dashboard = require "alpha.themes.dashboard"
      dashboard.section.header.val = {
        [[ _                                           ]],
        [[( )     _                                  _ ]],
        [[| |    (_)   _ _   ___     __    ___ ___  (_)]],
        [[| |  _ | | /'_` )/' _ `\ /'_ `\/' _ ` _ `\| |]],
        [[| |_( )| |( (_| || ( ) |( (_) || ( ) ( ) || |]],
        [[(____/'(_)`\__,_)(_) (_)`\__  |(_) (_) (_)(_)]],
        [[                        ( )_) |              ]],
        [[                         \___/'              ]],
      }
      dashboard.section.header.opts.hl = "DashboardHeader"
      dashboard.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
      dashboard.config.layout[3].val = 3
      dashboard.config.opts.noautocmd = true
      require("alpha").setup(dashboard.config)

      vim.api.nvim_create_autocmd({ "User" }, {
        pattern = "LazyVimStarted",
        desc = "Add Alpha dashboard footer",
        once = true,
        callback = function()
          -- local stats = require("lazy").stats()
          -- local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
          dashboard.section.footer.val = {
            "😊 Good Luck with Code",
          }
          dashboard.section.footer.opts.hl = "DashboardFooter"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      local config = require "nvchad.configs.nvimtree"
      -- 添加或修改 filters 选项
      config.filters = {
        dotfiles = false, -- 设置为 true 以默认忽略所有点文件
        custom = { ".DS_Store", ".git", "Thumbs.db", ".svn", ".hg", ".idea", ".vscode" }, -- 自定义忽略的文件和文件夹
      }
      return config
    end,
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "nvimtree")
      require("nvim-tree").setup(opts)
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
