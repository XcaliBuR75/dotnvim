local FiletypeEvent = require('nvim.utils.nvim.filetype-event')

FiletypeEvent.on_filetype_open('java', function()
    require('nvim.utils.treesitter.java.query').setup()
end)
