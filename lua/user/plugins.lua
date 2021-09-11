local M = {}
M.config = function()
    lvim.plugins = {
    { "folke/tokyonight.nvim" },
    { "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "InsertEnter",
    },
    { "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup()
        end,
    },
    { "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
    },
    -- Markdown stuff
    { "vimwiki/vimwiki" },
    { "instant-markdown/vim-instant-markdown" },
    -- Better blankline
    { "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "user.blankline"
        end,
    },
    { "tpope/vim-fugitive" },
    { "tpope/vim-surround" },
    { "lambdalisue/suda.vim" },
    { "kevinhwang91/nvim-bqf", event = "BufRead",
    config = function()
    require("bqf").setup({
          auto_enable = true,
          preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
          },
          func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
          },
          filter = {
          fzf = {
          },
          },
          })
    end,
    },
    { "karb94/neoscroll.nvim",
    config = function()
        require("user.neoscroll").config()
    end,
    },
    { "andymass/vim-matchup",
        event = "CursorMoved", config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
    },
    { "norcalli/nvim-colorizer.lua",
    config = function()
      require("user.colorizer").config()
    end,
    },
    { "RRethy/nvim-base16" },
     event = "BufRead",
    { "monaqa/dial.nvim",
    config = function()
      require("user.dial").config()
    end,
    },
    { "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("todo-comments").setup()
    end,
    event = "BufRead",
    },

}

end

return M
