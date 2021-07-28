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
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
vim.g.indent_blankline_buftype_exclude = {"terminal"}
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false
vim.g.vim_markdown_folding_disabled = true
vim.g.instant_markdown_autostart = false

-- keymappings
lvim.leader = "space"
-- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
lvim.keys.normal_mode = {
--   Navigate buffers
    {'<Tab>', ':bnext<CR>'},
    {'<S-Tab>', ':bprevious<CR>'},
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

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
    { "lukas-reineke/indent-blankline.nvim" },
    -- tpope
    -- {"tpope/vim-surround"},
    { "tpope/vim-fugitive" },
    -- Register menu
    { "tversteeg/registers.nvim" },
    { "lambdalisue/suda.vim" },
    { "kevinhwang91/nvim-bqf", event = "BufRead", },
    { "karb94/neoscroll.nvim",
        config = function() require('neoscroll').setup({
            -- All these keys will be mapped to their corresponding default scrolling animation
            mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>'},
            hide_cursor = true,          -- Hide cursor while scrolling
            stop_eof = true,             -- Stop at <EOF> when scrolling downwards
            use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            easing_function = nil,        -- Default easing function
            pre_hook = nil,              -- Function to run before the scrolling animation starts
            post_hook = nil,              -- Function to run after the scrolling animation ends
        })
    end,
    },
    { "andymass/vim-matchup",
        event = "CursorMoved", config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
    },
    { "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
    },
    { "blackCauldron7/surround.nvim",
    config = function()
    require "surround".setup {}
    end,
    },
    { "RRethy/nvim-base16"},
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- Additional Leader bindings for WhichKey
vim.cmd [[
    nnoremap <silent> <ESC> :nohl<CR>
    nnoremap Y y$
    nnoremap <F1> <Nop>

    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
    tnoremap <Esc> <C-\\><C-n>

    function! FixLastSpellingError()
       normal! mm[s1z='m""'
    endfunction
    nnoremap <leader>sp :call FixLastSpellingError()<CR>
    nnoremap <leader>ss :setlocal spell!<CR>

    nnoremap <leader>md :InstantMarkdownPreview<CR>
    nnoremap <leader>mm :make<CR>

    autocmd FileType yaml setlocal ts=2 ai sw=2 sts=0

    let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
    let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
    let g:instant_markdown_browser = 'surf'

    let g:workbench_storage_path = getenv('HOME') . '/vimwiki/workbench/'
]]
