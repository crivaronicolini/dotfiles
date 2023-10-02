-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

local helpers = require("personal.luasnip-helper-funcs")
local get_visual = helpers.get_visual
local tex_math_mode = helpers.tex_math_mode
local md_math_mode = helpers.markdown_math_mode

-- -- Math context detection
-- local tex = {}
-- tex.in_mathzone = function()
--   return vim.fn["vimtex#syntax#in_mathzone"]() == 1
-- end
-- tex.in_text = function()
--   return not tex.in_mathzone()
-- end

-- Return snippet tables
return {
  -- is md_math_mode
  s(
    { trig = "md", wordTrig = false, regTrig = false, snippetType = "autosnippet" },
    f(function()
      return "md" .. tostring(md_math_mode())
    end)
  ),
  -- is tex_math_mode
  -- s(
  --   { trig = "tx", wordTrig = false, regTrig = false, snippetType = "autosnippet" },
  --   f(function()
  --     return "tx" .. tostring(tex_math_mode())
  --   end)
  -- ),
  -- SUPERSCRIPT
  s(
    { trig = "([%w%)%]%}])'", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>^{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex_math_mode() }
  ),
  -- SUBSCRIPT
  s(
    { trig = "([%w%)%]%}]);", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex_math_mode() }
  ),
  -- SUBSCRIPT AND SUPERSCRIPT
  s(
    { trig = "([%w%)%]%}])__", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>^{<>}_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex_math_mode() }
  ),
  -- TEXT SUBSCRIPT
  s(
    { trig = "sd", snippetType = "autosnippet", wordTrig = false },
    fmta("_{\\mathrm{<>}}", { d(1, get_visual) }),
    { condition = tex_math_mode() }
  ),
  -- SUPERSCRIPT SHORTCUT
  -- Places the first alphanumeric character after the trigger into a superscript.
  s(
    { trig = '([%w%)%]%}])"([%w])', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>^{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    }),
    { condition = tex_math_mode() }
  ),
  -- SUBSCRIPT SHORTCUT
  -- Places the first alphanumeric character after the trigger into a subscript.
  s(
    { trig = "([%w%)%]%}]):([%w])", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    }),
    { condition = tex_math_mode() }
  ),
  -- EULER'S NUMBER SUPERSCRIPT SHORTCUT
  s(
    { trig = "([^%a])ee", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>e^{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex_math_mode() }
  ),
  -- ZERO SUBSCRIPT SHORTCUT
  s(
    { trig = "([%a%)%]%}])00", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      t("0"),
    }),
    { condition = tex_math_mode() }
  ),
  -- MINUS ONE SUPERSCRIPT SHORTCUT
  s(
    { trig = "([%a%)%]%}])11", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      t("-1"),
    }),
    { condition = tex_math_mode() }
  ),
  -- J SUBSCRIPT SHORTCUT (since jk triggers snippet jump forward)
  s(
    { trig = "([%a%)%]%}])JJ", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      t("j"),
    }),
    { condition = tex_math_mode() }
  ),
  -- PLUS SUPERSCRIPT SHORTCUT
  s(
    { trig = "([%a%)%]%}])%+%+", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>^{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      t("+"),
    }),
    { condition = tex_math_mode() }
  ),
  -- COMPLEMENT SUPERSCRIPT
  s(
    { trig = "([%a%)%]%}])CC", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>^{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      t("\\complement"),
    }),
    { condition = tex_math_mode() }
  ),
  -- CONJUGATE (STAR) SUPERSCRIPT SHORTCUT
  s(
    { trig = "([%a%)%]%}])%*%*", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>^{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      t("*"),
    }),
    { condition = tex_math_mode() }
  ),
  -- VECTOR, i.e. \vec
  s(
    { trig = "([^%a])vv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\vec{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex_math_mode() }
  ),
  -- DEFAULT UNIT VECTOR WITH SUBSCRIPT, i.e. \unitvector_{}
  s(
    { trig = "([^%a])ue", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\unitvector_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex_math_mode() }
  ),
  -- UNIT VECTOR WITH HAT, i.e. \uvec{}
  s(
    { trig = "([^%a])uv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\uvec{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex_math_mode() }
  ),
  -- MATRIX, i.e. \vec
  s(
    { trig = "([^%a])mt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\mat{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex_math_mode() }
  ),
  -- FRACTION
  s(
    { trig = "([^%a])ff", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\frac{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
      i(2),
    }),
    { condition = tex_math_mode() }
  ),
  -- ANGLE
  s(
    { trig = "([^%a])gg", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\ang{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex_math_mode() }
  ),
  -- ABSOLUTE VALUE
  s(
    { trig = "([^%a])aa", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\abs{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex_math_mode() }
  ),
  -- TEXY
  s(
    { trig = "([^%a])tx", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\text{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = md_math_mode() }
  ),
  -- SQUARE ROOT
  s(
    { trig = "([^%\\])sq", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\sqrt{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex_math_mode() }
  ),
  -- BINOMIAL SYMBOL
  s(
    { trig = "([^%\\])bnn", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\binom{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex_math_mode() }
  ),
  -- LOGARITHM WITH BASE SUBSCRIPT
  s(
    { trig = "([^%a%\\])ll", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\log_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex_math_mode() }
  ),
  -- DERIVATIVE with denominator only
  s(
    { trig = "([^%a])dV", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\dvOne{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex_math_mode() }
  ),
  -- DERIVATIVE with numerator and denominator
  s(
    { trig = "([^%a])dvv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\dv{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex_math_mode() }
  ),
  -- DERIVATIVE with numerator, denominator, and higher-order argument
  s(
    { trig = "([^%a])ddv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\dvN{<>}{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
      i(3),
    }),
    { condition = tex_math_mode() }
  ),
  -- PARTIAL DERIVATIVE with denominator only
  s(
    { trig = "([^%a])pV", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\pdvOne{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex_math_mode() }
  ),
  -- PARTIAL DERIVATIVE with numerator and denominator
  s(
    { trig = "([^%a])pvv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\pdv{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex_math_mode() }
  ),
  -- PARTIAL DERIVATIVE with numerator, denominator, and higher-order argument
  s(
    { trig = "([^%a])ppv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\pdvN{<>}{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
      i(3),
    }),
    { condition = tex_math_mode() }
  ),
  -- SUM with lower limit
  s(
    { trig = "([^%a])sM", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\sum_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
    }),
    { condition = tex_math_mode() }
  ),
  -- SUM with upper and lower limit
  s(
    { trig = "([^%a])smm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\sum_{<>}^{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex_math_mode() }
  ),
  -- INTEGRAL with upper and lower limit
  s(
    { trig = "([^%a])intt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\int_{<>}^{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      i(1),
      i(2),
    }),
    { condition = tex_math_mode() }
  ),
  -- INTEGRAL from positive to negative infinity
  s(
    { trig = "([^%a])intf", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\int_{\\infty}^{\\infty}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
    }),
    { condition = tex_math_mode() }
  ),
  -- BOXED command
  s(
    { trig = "([^%a])bb", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\boxed{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    }),
    { condition = tex_math_mode() }
  ),
  --
  -- BEGIN STATIC SNIPPETS
  --

  -- DIFFERENTIAL, i.e. \diff
  s({ trig = "df", priority = 2000, snippetType = "autosnippet" }, {
    t("\\diff"),
  }, { condition = tex_math_mode() }),
  -- BASIC INTEGRAL SYMBOL, i.e. \int
  s({ trig = "in1", snippetType = "autosnippet" }, {
    t("\\int"),
  }, { condition = tex_math_mode() }),
  -- DOUBLE INTEGRAL, i.e. \iint
  s({ trig = "in2", snippetType = "autosnippet" }, {
    t("\\iint"),
  }, { condition = tex_math_mode() }),
  -- TRIPLE INTEGRAL, i.e. \iiint
  s({ trig = "in3", snippetType = "autosnippet" }, {
    t("\\iiint"),
  }, { condition = tex_math_mode() }),
  -- CLOSED SINGLE INTEGRAL, i.e. \oint
  s({ trig = "oi1", snippetType = "autosnippet" }, {
    t("\\oint"),
  }, { condition = tex_math_mode() }),
  -- CLOSED DOUBLE INTEGRAL, i.e. \oiint
  s({ trig = "oi2", snippetType = "autosnippet" }, {
    t("\\oiint"),
  }, { condition = tex_math_mode() }),
  -- GRADIENT OPERATOR, i.e. \grad
  s({ trig = "gdd", snippetType = "autosnippet" }, {
    t("\\grad "),
  }, { condition = tex_math_mode() }),
  -- CURL OPERATOR, i.e. \curl
  s({ trig = "cll", snippetType = "autosnippet" }, {
    t("\\curl "),
  }, { condition = tex_math_mode() }),
  -- DIVERGENCE OPERATOR, i.e. \divergence
  s({ trig = "DI", snippetType = "autosnippet" }, {
    t("\\div "),
  }, { condition = tex_math_mode() }),
  -- LAPLACIAN OPERATOR, i.e. \laplacian
  s({ trig = "laa", snippetType = "autosnippet" }, {
    t("\\laplacian "),
  }, { condition = tex_math_mode() }),
  -- PARALLEL SYMBOL, i.e. \parallel
  s({ trig = "||", snippetType = "autosnippet" }, {
    t("\\parallel"),
  }),
  -- CDOTS, i.e. \cdots
  s({ trig = "cdd", snippetType = "autosnippet" }, {
    t("\\cdots"),
  }),
  -- LDOTS, i.e. \ldots
  s({ trig = "ldd", snippetType = "autosnippet" }, {
    t("\\ldots"),
  }),
  -- EQUIV, i.e. \equiv
  s({ trig = "eqq", snippetType = "autosnippet" }, {
    t("\\equiv "),
  }),
  -- SETMINUS, i.e. \setminus
  s({ trig = "stm", snippetType = "autosnippet" }, {
    t("\\setminus "),
  }),
  -- SUBSET, i.e. \subset
  s({ trig = "sbb", snippetType = "autosnippet" }, {
    t("\\subset "),
  }),
  -- APPROX, i.e. \approx
  s({ trig = "px", snippetType = "autosnippet" }, {
    t("\\approx "),
  }, { condition = tex_math_mode() }),
  -- PROPTO, i.e. \propto
  s({ trig = "pt", snippetType = "autosnippet" }, {
    t("\\propto "),
  }, { condition = tex_math_mode() }),
  -- COLON, i.e. \colon
  s({ trig = "::", snippetType = "autosnippet" }, {
    t("\\colon "),
  }),
  -- IMPLIES, i.e. \implies
  s({ trig = ">>", snippetType = "autosnippet" }, {
    t("\\implies "),
  }),
  -- DOT PRODUCT, i.e. \cdot
  s({ trig = ",.", snippetType = "autosnippet" }, {
    t("\\cdot "),
  }),
  -- CROSS PRODUCT, i.e. \times
  s({ trig = "xx", snippetType = "autosnippet" }, {
    t("\\times "),
  }),
}
