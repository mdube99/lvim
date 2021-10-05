local M = {}

M.config = function()

-- unbind f key
lvim.builtin.which_key.mappings["f"] = {}
lvim.builtin.which_key.mappings["f"] = {
    name = "Telescope",
    f = { "<Cmd>Telescope find_files<CR>", "Find Files" },
    o = { "<Cmd>Telescope oldfiles<CR>", "Old Files" },
    h = { "<Cmd>Telescope command_history<CR>", "Command History" },
    p = { "<Cmd>Telescope projects<CR>", "Projects" },
    w = { "<Cmd>Telescope live_grep<CR>", "Search for Word"},
    v = { "<Cmd>Telescope vimwiki live_grep<CR>", "Search for Vimwiki"}
}

lvim.builtin.which_key.mappings.s.p = { ":call FixLastSpellingError()<CR>", "Fix last Spelling error" }
lvim.builtin.which_key.mappings.s.s = { ":setlocal spell!<CR>", "Turn on spell check" }
lvim.builtin.which_key.mappings["n"] = {
    name = "Number",
    n = { ":set norelativenumber!<CR>", "Toggle relativenumber" },
}

lvim.builtin.which_key.mappings["m"] = {
    name = "Markdown",
    d = { ":InstantMarkdownPreview<CR>", "Instant Markdown Preview" },
    m = { ":w<CR>:make<CR>", "Make" },
}

lvim.builtin.which_key.mappings["w"] = {
    name = "Windows",
    v = { ":vsp<CR>", "Vertical Split" },
    h = { ":split<CR>", "Horizontal Split" },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Trouble",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
lvim.builtin.which_key.mappings.b.P = { "<cmd>BufferPin<CR>", "Pin Buffer" }
lvim.builtin.which_key.mappings.b.d = { "<cmd>bdelete<CR>", "Delete Buffer" }

lvim.builtin.which_key.mappings.c = { "<cmd>Cheat<CR>", "Cheat.sh" }

end
return M
