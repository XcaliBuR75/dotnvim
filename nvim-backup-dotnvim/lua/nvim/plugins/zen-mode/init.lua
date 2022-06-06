require('zen-mode').setup({
    window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
            signcolumn = 'yes:1',
            number = true,
            relativenumber = true,
            cursorline = true,
            cursorcolumn = false,
            foldcolumn = '1',
            list = false,
        },
    },
    plugins = {
        options = { enabled = true, ruler = true, showcmd = true },
        twilight = { enabled = true },
        gitsigns = { enabled = true },
    },
})

