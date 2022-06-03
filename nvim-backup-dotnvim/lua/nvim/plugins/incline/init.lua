local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')
local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')

local theme = ThemeManager.get_theme()

local incline_highlights = HighlightGroups({
    InclineNormal = { guifg = theme.bright.black, guibg = theme.bright.white },
})

Highlighter:new():add(incline_highlights):register_highlights()

require('incline').setup({
    window = {
        zindex = 1000,
        placement = {
            horizontal = 'right',
            vertical = 'top',
        },
        padding = {
            left = 5,
            right = 5,
        },
    },

    highlight = {
        groups = {
            InclineNormal = 'InclineNormal',
            InclineNormalNC = 'InclineNormal',
        },
    },
})
