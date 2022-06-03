local Lsp = require('nvim.utils.lsp')
local Event = require('nvim.utils.lsp.event')
local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')
local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')

local theme = ThemeManager.get_theme()

local v = vim
local fn = v.fn

local dap_highlight_groups = HighlightGroups({
    DapBreakpoint = { guifg = theme.bright.red },
    DapBreakpointRejected = { guifg = theme.bright.yellow },
    DapStopped = { guifg = theme.bright.cyan },
    DapLogPoint = { guifg = theme.bright.blue },
    DapStoppedCursorLine = { guifg = theme.normal.green },
})

local M = {}

function M.init()
    Highlighter:new():add(dap_highlight_groups):register_highlights()

    fn.sign_define('DapBreakpoint', {
        text = '',
        texthl = 'DapBreakpoint',
        linehl = 'CursorLine',
        numhl = 'DapBreakpoint',
    })

    fn.sign_define('DapBreakpointRejected', {
        text = '',
        texthl = 'DapBreakpointRejected',
        linehl = '',
        numhl = 'DapBreakpointRejected',
    })

    fn.sign_define('DapStopped', {
        text = '',
        texthl = 'DapStopped',
        linehl = 'DapStoppedCursorLine',
        numhl = 'DapStopped',
    })

    fn.sign_define('DapLogPoint', {
        text = '﬌',
        texthl = 'DapLogPoint',
        linehl = '',
        numhl = 'DapLogPoint',
    })
end

function M.setup()
    Lsp.add_listener(Event.END, function()
        M.init()
    end)
end

return M
