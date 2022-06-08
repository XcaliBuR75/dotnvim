require('telescope').setup({
    defaults = {
        path_display = { 'truncate' },
        file_ignore_patterns = {
            'dist',
            'target',
            'node_modules',
            'pack/plugins',
            "%.git",
        },

        mappings = {
            i = {
                ['<C-h>'] = 'which_key',
                ['<C-n>'] = 'move_selection_next',
                ['<C-e>'] = 'move_selection_previous',
            },
        },
    },
})
require('telescope').load_extension('fzf')
