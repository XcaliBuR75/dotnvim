-- compile the lua code to bitecode so neovim strat up faster
pcall(require, 'impatient')
require('nvim')

vim.o.winbar = "%{%v:lua.require'nvim.utils.nvim.winbar'.eval()%}"
