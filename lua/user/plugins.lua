local M = {}
M.config = function()
    lvim.plugins = {
    { "abzcoding/tokyonight.nvim",
      branch = "feature/vim-diagnostics",
      config = function()
        require("user.theme").tokyonight()
      end,
    },
    { "ray-x/lsp_signature.nvim",
        config = function()
        require("user.lsp_signature").config()
        end,
        event = "BufRead",
    },
    -- { "folke/trouble.nvim",
    --     requires = "kyazdani42/nvim-web-devicons",
    --     config = function()
    --         require("trouble").setup()
    --     end,
    -- },
    { "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
    },
    {
    "vimwiki/vimwiki",
      -- ft = {"markdown"},
    },
    {
    "instant-markdown/vim-instant-markdown",
      ft = {"markdown"},
    },
    { "lukas-reineke/indent-blankline.nvim",
        config = function()
            require "user.blankline"
        end,
    },
    { "tpope/vim-fugitive" },
    { "tpope/vim-surround" },
    { "lambdalisue/suda.vim" },
        cmd = "SudaWrite",
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
          action_for = { ["ctrl-s"] = "split" },
          extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
        },
        },
        })
    end,
    },

    {
    "karb94/neoscroll.nvim",
    config = function()
        require("user.neoscroll").config()
    end,
    },

    {
    "andymass/vim-matchup",
        event = "CursorMoved", config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
    },
    {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("user.colorizer").config()
    end,
    },
    {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
        require("user.todo_comments").config()
    end,
    event = "BufRead",
    },
    {
    "RishabhRD/nvim-cheat.sh",
    requires = "RishabhRD/popfix",
    config = function()
        vim.g.cheat_default_window_layout = "split"
    end,
    opt = true,
    cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
    },
    {
      "akinsho/bufferline.nvim",
      config = function()
        require("user.bufferline").config()
      end,
        requires = "nvim-web-devicons",
    },
    {
      "npxbr/glow.nvim",
      ft = {"markdown"}
    },
    {
    "beauwilliams/focus.nvim", config = function() require("focus").setup({signcolumn = false}) end,
    },
}

end

return M
