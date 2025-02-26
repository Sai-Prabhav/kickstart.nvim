local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node
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
local function create_snippet(trig, replacement)
  return s({
    trig = trig,
    snippetType = 'autosnippet',
  }, {
    t('\\' .. replacement .. ' '),
  }, {
    condition = math,
  })
end

local greek = {
  'alpha', 'beta', 'gamma', 'Gamma', 'delta', 'Delta', 'epsilon', 'varepsilon', 'zeta', 'eta', 'theta', 'vartheta', 'Theta', 'iota', 'kappa', 'lambda', 'Lambda', 'mu', 'nu', 'xi', 'omicron', 'pi', 'rho', 'varrho', 'sigma', 'Sigma', 'tau', 'upsilon', 'Upsilon', 'phi', 'varphi', 'Phi', 'chi', 'psi', 'omega', 'Omega',
}

local symbols = {
  'parallel', 'perp', 'partial', 'nabla', 'hbar', 'ell', 'infty', 'oplus', 'ominus', 'otimes', 'oslash', 'square', 'star', 'dagger', 'vee', 'wedge', 'subseteq', 'subset', 'supseteq', 'supset', 'emptyset', 'exists', 'nexists', 'forall', 'implies', 'impliedby', 'iff', 'setminus', 'neg', 'lor', 'land', 'bigcup', 'bigcap', 'cdot', 'times', 'simeq', 'approx', 'peq', 'fa', 'RR', 'CC', 'NN', 'where', 'disc', 'mat', 'if', 'or', 'so', 'then', 'st', 're', 'im', 'exp', 'log', 'ln',
}

local more_symbols = {
  'leq', 'geq', 'neq', 'gg', 'll', 'equiv', 'sim', 'propto', 'rightarrow', 'leftarrow', 'Rightarrow', 'Leftarrow', 'leftrightarrow', 'to', 'mapsto', 'cap', 'cup', 'in', 'sum', 'prod', 'exp', 'ln', 'log', 'det', 'dots', 'vdots', 'ddots', 'pm', 'mp', 'int', 'iint', 'iiint', 'oint',
}

local snippets = {}

for _, trig in ipairs(greek) do
  table.insert(snippets, create_snippet(trig, trig))
end

for _, trig in ipairs(symbols) do
  table.insert(snippets, create_snippet(trig, trig))
end

for _, trig in ipairs(more_symbols) do
  table.insert(snippets, create_snippet(trig, trig))
end

-- All snippets for LaTeX
return vim.tbl_extend('force', snippets, {
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
    trig = 'sr',
    snippetType = 'autosnippet',
  }, {
    t '\\sqrt{',
    i(1),
    t { '} ' },
  }, {
    condition = math,
  }),
  s({
    trig = 'sq',
    snippetType = 'autosnippet',
  }, {
    t '^{2}',
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
})
