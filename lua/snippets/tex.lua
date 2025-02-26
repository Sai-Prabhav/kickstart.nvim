local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node
local conds = require 'luasnip.extras.conditions'
local rep = require('luasnip.extras').rep

ls.config.setup { enable_autosnippets = true }

local function math()
  local ts_utils = require 'nvim-treesitter.ts_utils'
  local node = ts_utils.get_node_at_cursor()

  while node do
    if node:type() == 'math_environment' or node:type() == 'inline_formula' then
      print 'true '
      return true
    end
    node = node:parent()
  end
  print 'false'
  return false
end

-- All snippets for LaTeX
return {
  -- Autosnippet: "or" → "\cup" in math zones
  s({
    trig = '^',
    snippetType = 'autosnippet',
  }, {
    t '^{',
    i(1),
    t '}',
  }, {
    condition = math,
  }),

  s({
    trig = '_',
    snippetType = 'autosnippet',
  }, {
    t '_{',
    i(1),
    t '}',
  }, {
    condition = math,
  }),

  s({
    trig = 'or',
    snippetType = 'autosnippet',
  }, {
    t '\\cup ',
  }, {
    condition = math,
  }),

  -- Autosnippet: "__" → "$" in math zones (avoid conflicting with <Tab> jumps)
  s({
    trig = 'sq',
    snippetType = 'autosnippet',
  }, {
    t '\\sqrt{',
    i(1),
    t { '} ' },
  }, {
    condition = math,
  }),

  s({
    trig = '/',
    snippetType = 'autosnippet',
  }, {
    t '\\frac{',
    i(1),
    t { '}{' },

    i(2),

    t { '} ' },
  }, {
    condition = math,
  }),
  s({

    trig = 'mk',
    snippetType = 'autosnippet',
  }, {
    t '$',
    i(1),
    t { '$' },
  }, {
    condition = conds.in_mathzone,
  }),

  -- Snippet for environments
  s({
    trig = 'beg',
    snippetType = 'autosnippet',
  }, {
    t '\\begin{',
    i(1, 'env'),
    t '}',
    t { '', '  ' },
    i(0),
    t { '', '\\end{' },
    rep(1),
    t '}',
  }),

  -- Snippet for align*
  s({
    trig = 'dm',
    snippetType = 'autosnippet',
  }, {
    t '\\begin{align*}',
    t { '', '' },
    i(1),
    t { '', '\\end{align*}' },
  }),
}
