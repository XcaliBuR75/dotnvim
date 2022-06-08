local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')
local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')

local theme = ThemeManager.get_theme()

local neotree_highlights = HighlightGroups({
    NeoTreeGitAdded = { guifg = theme.bright.green },
    NeoTreeGitStaged = { guifg = theme.bright.green },

    NeoTreeGitRenamed = { guifg = theme.bright.cyan },
    NeoTreeGitConflict = { guifg = theme.bright.magenta },

    NeoTreeGitDeleted = { guifg = theme.bright.red },
    NeoTreeModified = { guifg = theme.bright.red },
    NeoTreeGitUnstaged = { guifg = theme.bright.red },
    NeoTreeGitUntracked = { guifg = theme.bright.red },

    NeoTreeGitModified = { guifg = theme.bright.yellow },
    NeoTreeGitModified_35 = { guifg = theme.bright.yellow },
    NeoTreeGitModified_60 = { guifg = theme.normal.yellow },
    NeoTreeGitModified_68 = { guifg = theme.normal.yellow },
})

Highlighter:new():add(neotree_highlights):register_highlights()

require('neo-tree').setup({

    filesystem = {
        window = {
            mappings = {
                ['o'] = 'open',
            },
            position = 'current',
        },
        renderers = {
            directory = {
                {
                    'icon',
                    default = '',
                    folder_closed = ' ',
                    folder_open = ' ',
                    padding = ' ',
                },
                { 'current_filter' },
                { 'name' },
                {
                    'clipboard',
                    highlight = 'NeoTreeDimText',
                },
                { 'diagnostics', errors_only = true },
            },
        },
    },
    default_component_configs = {
        modified = {
            symbol = '',
            highlight = 'NeoTreeModified',
        },
        name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = 'NeoTreeFileName',
        },
        git_status = {
            symbols = {
                -- Change type
                added = '', -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified = '', -- or "", but this is redundant info if you use git_status_colors on the name
                deleted = '✖', -- this can only be used in the git_status source
                renamed = '', -- this can only be used in the git_status source
                -- Status type
                untracked = '',
                ignored = '',
                unstaged = '',
                staged = '',
                conflict = '',
            },
        },
    },
})
