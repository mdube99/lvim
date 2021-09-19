local M = {}
M.config = function()
    lvim.plugins = {
    { "folke/tokyonight.nvim",
      config = function()
        require("user/theme").tokyonight()
        vim.cmd [[
      colorscheme tokyonight
      ]]
      end,
      cond = function()
        local _time = os.date "*t"
        return (_time.hour >= 0 and _time.hour < 7) or (_time.hour >= 11 and _time.hour < 17)
      end,
    },

    {
        "abzcoding/Catppuccino.nvim",
            config = function()
            require("user.theme").config()
        end,
        cond = function()
            local _time = os.date "*t"
            return (_time.hour >= 7 and _time.hour < 11)
        end,
    },
    {
      "NTBBloodbath/doom-one.nvim",
      config = function()
        vim.g.doom_one_italic_comments = true
      end,
        cond = function()
        local _time = os.date "*t"
        return (_time.hour >= 17 and _time.hour < 21)
      end,
    },
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
    { "lervag/vimtex" },

}

end

return M
