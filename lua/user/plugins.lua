    lvim.plugins = {

    { 'alexghergh/nvim-tmux-navigation', config = function()

        local nvim_tmux_nav = require('nvim-tmux-navigation')

        nvim_tmux_nav.setup {
            disable_when_zoomed = true -- defaults to false
        }

        vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
        vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
        vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
        vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
        vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
        vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

    end
},
    { "tiagovla/tokyodark.nvim" },
    { "lunarvim/darkplus.nvim" },
    { "ellisonleao/gruvbox.nvim" },
    { "ray-x/lsp_signature.nvim",
        config = function()
        require("user.lsp_signature").config()
        end,
        event = "BufRead",
    },
    -- {
    -- "vimwiki/vimwiki",
    --   -- ft = {"markdown"},
    -- },
    { "tpope/vim-fugitive" },
    { "tpope/vim-surround" },
    { "lambdalisue/suda.vim" },
        cmd = "SudaWrite",
    {
    "karb94/neoscroll.nvim",
    config = function()
        require("user.neoscroll").config()
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
        vim.g.cheat_default_window_layout = "vertical_split"
      end,
      opt = true,
      cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
    },
}
