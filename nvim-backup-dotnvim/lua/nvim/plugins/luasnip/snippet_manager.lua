local class = require('pl.class')
local ls = require('luasnip')
local Highlighter = require('nvim.utils.nvim.highlighting.highlighter')
local HighlightGroups = require('nvim.utils.nvim.highlighting.highlight-groups')
local ThemeManager = require('nvim.utils.nvim.theme.theme-manager')

local theme = ThemeManager.get_theme()

local highlighter = Highlighter:new():add(HighlightGroups({
    LuaSnipChoiseNode = { guifg = theme.bright.yellow },
    LuaSnipActiveNode = { guifg = theme.bright.green },
}))

highlighter:register_highlights()

local M = class()

-- M:new creates a snippet manager instance
function M:_init(language)
    self.language = language
end

-- M:add_snippet adds a new snippet
function M:add_snippet(snippet)
    ls.add_snippets(self.language, { snippet })
end

return M
