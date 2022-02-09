local Shortcut = require('nvim.utils.nvim.shortcut')
local builtin = require('telescope.builtin')

Shortcut
    :mode('n')
    :options()
    :noremap()
    :next()
    :keymaps({
        ----------------------------------------------------------------------
        --                          FILES & BUFFER                          --
        ----------------------------------------------------------------------
        -- find a file in current working directory
        { '<leader>n', builtin.find_files },

        -- find line in current working directory
        { '<leader>e', builtin.live_grep },

        -- find buffer
        { '<leader>i', builtin.buffers },

        -- find line in current buffer
        { '<leader>o', builtin.current_buffer_fuzzy_find },

        -- find word under the cursor in current buffer
        { '<leader>*', builtin.grep_string },

        -- find help index
        { '<leader>m', builtin.help_tags },

        -- resumes the previous search
        { '<leader>k', builtin.resume },

        ----------------------------------------------------------------------
        --                               LSP                                --
        ----------------------------------------------------------------------
        -- browse code implementation
        { '<leader>t', builtin.lsp_implementations },

        -- browse code definition
        { '<leader>s', builtin.lsp_definitions },

        -- find references of word under the cursor
        { '<leader>x', builtin.lsp_references },

        -- find diagnostics in the file
        { '<leader>c', builtin.diagnostics },

        -- show code actions
        { '<leader>a', builtin.lsp_code_actions },
    })
    :mode('i')
    :options()
    :noremap()
    :next()
    :keymaps({
        -- find register by containing value
        { '<c-r>', builtin.registers },
    })
