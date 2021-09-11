local M = {}

local components = require "core.lualine.components"
M.config = function()
    lvim.builtin.lualine.style = "none"
    lvim.builtin.lualine.style = "lvim"
    lvim.builtin.lualine.sections.lualine_a = { "mode" }
    lvim.builtin.lualine.sections.lualine_b = { "branch" }
    lvim.builtin.lualine.sections.lualine_c = { "filename" }
    lvim.builtin.lualine.sections.lualine_w = { "encoding", "fileformat", "filetype" }
    lvim.builtin.lualine.sections.lualine_x = { components.lsp }
    lvim.builtin.lualine.sections.lualine_y = { "filetype" }
    lvim.builtin.lualine.sections.lualine_z = { components.scrollbar }
    lvim.builtin.lualine.options.component_separators = { "│", "│" }
    lvim.builtin.lualine.options.section_separators = { "", "" }
    lvim.builtin.lualine.extensions = { "quickfix" }
    end
return M
