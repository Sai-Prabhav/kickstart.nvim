local ls = require 'luasnip' -- Import LuaSnip
local s = ls.snippet -- Define a snippet
local t = ls.text_node -- Text node
local i = ls.insert_node -- Insert node
local conds = require 'luasnip.extras.conditions' -- Conditions

-- Add the snippet for LaTeX files
ls.add_snippets('tex', {
  s('or', { t '\\cup' }, { condition = conds.in_mathzone }),
})

ls.add_snippets('tex', {
  s('and', { t '\\cap' }, { condition = conds.in_mathzone }),
})
