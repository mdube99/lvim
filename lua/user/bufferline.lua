local M = {}
M.config = function()
    vim.g.bufferline = {
        -- icons = false;
        clickable = true;
        icon_separator_active = '',
        icon_separator_inactive = '',
        tabpages = true;
        }

end

return M
