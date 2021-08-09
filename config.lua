-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "base16-onedark"
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.timeoutlen = 100
vim.opt.mouse = ""
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- autocmd VimResized * :wincmd =
vim.cmd("autocmd FileType java set makeprg=java\\ %")
vim.g.vim_markdown_folding_disabled = true
vim.g.instant_markdown_autostart = false

-- keymappings
lvim.leader = "space"

lvim.keys.normal_mode["<esc>"] = "<cmd>nohlsearch<cr>"
lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["J"] = "mzJ`z"
lvim.keys.normal_mode["<F1>"] = "<Nop>"
lvim.keys.normal_mode["H"] = "0"
lvim.keys.normal_mode["L"] = "$"
lvim.keys.normal_mode["<TAB>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-TAB>"] = ":bprevious<CR>"
-- back space to switch to alternative buffer with the cursor in the last position it was in the file
lvim.keys.normal_mode["<bs>"] = "<bs> <c-^>`”zz"

lvim.keys.insert_mode[","] = ",<C-g>u"
lvim.keys.insert_mode["."] = ".<C-g>u"
lvim.keys.insert_mode["!"] = "!<C-g>u"
lvim.keys.insert_mode["?"] = "?<C-g>u"

lvim.keys.term_mode["<Esc>"] = "C-\\><C-n"


-- whichkey
lvim.builtin.which_key.mappings.s.p = { ":call FixLastSpellingError<CR>", "Fix last Spelling error" }
lvim.builtin.which_key.mappings.s.s = { ":setlocal spell!<CR>", "Turn on spell check" }
lvim.builtin.which_key.mappings["m"] = {
    name = "Markdown",
    d = { ":InstantMarkdownPreview<CR>", "Instant Markdown Preview" },
    m = { ":w<CR>:make<CR>", "Make" },
}
lvim.builtin.which_key.mappings["d"] = {
    name = "Terminals",
    v = { ":call VerticalTerminal()<CR>", "Vertical Terminal" },
    h = { ":call HorizontalTerminal()<CR>", "Horizontal Terminal" },
}


-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.terminal.insert_mappings = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Additional Plugins
lvim.plugins = {
    { "ray-x/lsp_signature.nvim",
        config = function() require"lsp_signature".on_attach() end,
        event = "InsertEnter",
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
    -- tpope
    -- {"tpope/vim-surround"},
    { "tpope/vim-fugitive" },
    { "tpope/vim-surround" },
    -- Register menu
    { "tversteeg/registers.nvim" },
    { "lambdalisue/suda.vim" },
    { "kevinhwang91/nvim-bqf", event = "BufRead", },
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
}

lvim.autocommands.custom_groups = {
    { "FileType", "yaml", "setlocal ts=2 ai sw=2 sts=2" },
    { "FileType", "java", "set makeprg=java\\ %" },
}

vim.cmd [[
    nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
    nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

    function! FixLastSpellingError()
       normal! mm[s1z='m""'
    endfunction

    function! VerticalTerminal()
        :vsp | :terminal
        :vertical resize 45
        :setlocal nobuflisted
    endfunction

    function! HorizontalTerminal()
        :split | :terminal
        :resize 5
        :setlocal nobuflisted
    endfunction

    let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
    let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
    let g:instant_markdown_browser = 'surf'

]]

