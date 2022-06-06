require('window-picker').setup({
    autoselect_one = true,
    include_current_win = true,
    selection_chars = 'TNSERIAOPLCKFUWYQ;',
    filter_rules = {
        bo = {
            filetype = { 'NvimTree', 'neo-tree' },
            buftype = { 'terminal' },
        },
    },
})
