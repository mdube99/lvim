-- Neovim settings
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.timeoutlen = 100
vim.opt.mouse = ""
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.inccommand = "split" -- shows small split at the bottom of the screen when searching
vim.opt.foldlevel = 4

-- Lunarvim settings
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "onedarker"

-- require("user.lualine").config()
require("user.evilline").config()
require("user.plugins").config()
require("user.bufferline").config()
require("user.whichkey").config()

-- Plugin settings
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.terminal.insert_mappings = true
lvim.builtin.telescope.defaults.prompt_prefix = "   "
lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- autocmd VimResized * :wincmd =
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
lvim.keys.normal_mode["<TAB>"] = ":BufferNext<CR>"
lvim.keys.normal_mode["<S-TAB>"] = ":BufferPrevious<CR>"
-- back space to switch to alternative buffer with the cursor in the last position it was in the file
lvim.keys.normal_mode["<bs>"] = "<bs> <c-^>`”zz"

lvim.keys.insert_mode[","] = ",<C-g>u"
lvim.keys.insert_mode["."] = ".<C-g>u"
lvim.keys.insert_mode["!"] = "!<C-g>u"
lvim.keys.insert_mode["?"] = "?<C-g>u"

-- Additional Plugins

lvim.autocommands.custom_groups = {
    {
        "FileType",
        "yaml,json,tex",
        "setlocal ts=2 ai sw=2 sts=2"
    },
    {
        "FileType",
        "java",
        "set makeprg=java\\ %"
    },
    {
        "Filetype",
        "python",
        "nnoremap <leader>r <cmd>lua require('core.terminal')._exec_toggle('python " .. vim.fn.expand "%" .. ";read')<CR>",
    },
    -- {
    --   "Filetype",
    --   "java",
    --   "nnoremap <leader>r <cmd>lua require('core.terminal')._exec_toggle('java " .. vim.fn.expand "%" .. ";read')<CR>",
    -- },

}

vim.cmd [[
    nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
    nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

    function! FixLastSpellingError()
       normal! mm[s1z='m""'
    endfunction

    let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
    let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
    let g:instant_markdown_browser = 'surf'

]]
