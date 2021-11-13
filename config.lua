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
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_style = "night"

require("user.lualine").config()
require("user.plugins").config()
require("user.whichkey").config()

-- Core settings
lvim.builtin.dashboard.active = true
lvim.builtin.bufferline.active = false
lvim.builtin.terminal.active = true
lvim.builtin.autopairs.active = true
lvim.builtin.terminal.insert_mappings = true
lvim.builtin.telescope.defaults.prompt_prefix = "   "
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.file_ignore_patterns = {
    "vendor/*",
    "%.lock",
    "__pycache__/*",
    "%.sqlite3",
    "%.ipynb",
    "node_modules/*",
    "%.jpg",
    "%.jpeg",
    "%.png",
    "%.svg",
    "%.otf",
    "%.ttf",
    ".git/",
    "%.webp",
    ".dart_tool/",
    ".github/",
    ".gradle/",
    ".idea/",
    ".settings/",
    ".vscode/",
    "__pycache__/",
    "build/",
    "env/",
    "gradle/",
    "node_modules/",
    "target/",
}
lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } }
vim.g.nvim_tree_indent_markers = 1


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

vim.g.vim_markdown_folding_disabled = true
vim.g.instant_markdown_autostart = false

-- keymappings
lvim.leader = "space"

lvim.keys.normal_mode["<S-l>"] = nil
lvim.keys.normal_mode["<S-h>"] = nil
lvim.keys.normal_mode["<esc>"] = "<cmd>nohlsearch<cr>"
lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"
lvim.keys.normal_mode["J"] = "mzJ`z"
lvim.keys.normal_mode["<F1>"] = "<Nop>"
lvim.keys.normal_mode["<TAB>"] = "<cmd>bnext<CR>"
lvim.keys.normal_mode["<S-TAB>"] = "<cmd>bprev<CR>"
-- back space to switch to alternative buffer with the cursor in the last position it was in the file
lvim.keys.normal_mode["<bs>"] = "<bs> <c-^>`”zz"
lvim.keys.normal_mode["gv"] = "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>"
lvim.keys.normal_mode["gA"] = "<cmd>lua vim.lsp.codelens.run()<cr>"
-- repeat macros with .
vim.api.nvim_set_keymap("x", ".", ":normal .<CR>", { silent = true })


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
    -- For i3 config
    {
        "BufRead,BufNewFile",
        "config",
        "set filetype=bash"
    }
    -- {
    --   "Filetype",
    --   "java",
    --   "nnoremap <leader>r <cmd>lua require('core.terminal')._exec_toggle('java " .. vim.fn.expand "%" .. ";read')<CR>",
    -- },

}

vim.cmd [[
    nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
    nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

    function! BoldWord()
        normal ysiw*w.*
    endfunction

    function! FixLastSpellingError()
        normal! mm[s1z='m""'
    endfunction

    function! ExecuteMacroOverVisualRange()
      echo "@".getcmdline()
      execute ":'<,'>normal @".nr2char(getchar())
    endfunction
    xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>


    let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
    let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
    let g:instant_markdown_browser = 'surf'

]]
