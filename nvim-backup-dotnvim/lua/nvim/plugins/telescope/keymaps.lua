-- Using Lua functions

--nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
--nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
--nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
--nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

local keymap = vim.api.nvim_set_keymap

--keymap('n', '<c-s>', ':w<CR>', {})
--keymap('i', '<c-s>', '<Esc>:w<CR>a', {})
--local opts = { noremap = true }
--keymap('n', '<c-j>', '<c-w>j', opts)
--keymap('n', '<c-h>', '<c-w>h', opts)
--keymap('n', '<c-k>', '<c-w>k', opts)
--keymap('n', '<c-l>', '<c-w>l', opts)

--vim.nnoremap('<leader>ff', [[:telescope find_files<cr>]])
keymap('n', '<leader>ff', ':Telescope find_files hidden=true<cr>', {})
keymap('n', '<leader>fg', ':Telescope live_grep<cr>', {})
keymap('n', '<leader>l', ':Telescope buffers<cr>', {})
keymap('n', '<leader>fh', ':Telescope help_tags<cr>', {})
keymap('n', '<leader>s', ':Telescope current_buffer_fuzzy_find<cr>', {})
keymap('n', '<leader>o', ':FZF ~<cr>', {})

--Telescope find_files hidden=true layout_config={"prompt_position":"top"}
