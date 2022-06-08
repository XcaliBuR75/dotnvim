require('gitsigns').setup({
    keymaps = {
        noremap = true,

        ['n ]c'] = {
            expr = true,
            "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'",
        },
        ['n [c'] = {
            expr = true,
            "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'",
        },

        ['n <leader>gs'] = '<cmd>Gitsigns stage_hunk<CR>',
        ['v <leader>gs'] = ':Gitsigns stage_hunk<CR>',
        ['n <leader>gu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
        ['n <leader>gr'] = '<cmd>Gitsigns reset_hunk<CR>',
        ['v <leader>gr'] = ':Gitsigns reset_hunk<CR>',
        ['n <leader>gR'] = '<cmd>Gitsigns reset_buffer<CR>',
        ['n <leader>gp'] = '<cmd>Gitsigns preview_hunk<CR>',
        ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
        ['n <leader>gS'] = '<cmd>Gitsigns stage_buffer<CR>',
        ['n <leader>gU'] = '<cmd>Gitsigns reset_buffer_index<CR>',

        -- Text objects
        ['o kg'] = ':<C-U>Gitsigns select_hunk<CR>',
        ['x kg'] = ':<C-U>Gitsigns select_hunk<CR>',
    },
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 1000,
        ignore_whitespace = false,
    },
})
