local Variable = require('nvim.utils.nvim.variable')
Variable.g({
    nvim_tree_indent_markers = 1,
    nvim_tree_git_hl = 1,
    nvim_tree_highlight_opened_files = 1,
    nvim_tree_root_folder_modifier = ':~',
    nvim_tree_add_trailing = 1,
    nvim_tree_group_empty = 1,
    nvim_tree_icon_padding = ' ',
    nvim_tree_symlink_arrow = ' >> ',
    nvim_tree_respect_buf_cwd = 1,
    nvim_tree_create_in_closed_folder = 1,
    nvim_tree_refresh_wait = 500,
    nvim_tree_show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 1,
    },
    nvim_tree_icons = {
        default = '',
        symlink = '',
        git = {
            unstaged = '✗',
            staged = '✓',
            unmerged = '',
            renamed = '➜',
            untracked = '★',
            deleted = '',
            ignored = '◌',
        },
        folder = {
            arrow_open = '',
            arrow_closed = '',
            default = '',
            open = '',
            empty = '',
            empty_open = '',
            symlink = '',
            symlink_open = '',
        },
    },
})

require('nvim-tree').setup({
    gitignore = 1,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    auto_close = false,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    diagnostics = {
        enable = false,
        icons = {
            hint = ' ',
            info = ' ',
            warning = ' ',
            error = ' ﱥ',
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = { '.git', 'node_modules', '.cache' },
    },
    system_open = {
        cmd = nil,
        args = {},
    },

    view = {
        width = 30,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = false,
            list = {},
        },
    },
    filter = {
        dotfiles = true,
    },
    window_picker = {
        enable = true,
        chars = 'TNSERIAOPLCMFUWYQ123098',
        exclude = {
            filetype = {
                'notify',
                'packer',
                'qf',
                'diff',
                'fugitive',
                'fugitiveblame',
            },
            buftype = { 'nofile', 'terminal', 'help' },
        },
    },
})
