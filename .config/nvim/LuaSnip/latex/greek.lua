-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Return snippet tables
return {}, {
  s({ trig = ";a", type = "autosnippet" }, {
    t("\\alpha"),
  }),
  s({ trig = ";b", type = "autosnippet" }, {
    t("\\beta"),
  }),
  s({ trig = ";g", type = "autosnippet" }, {
    t("\\gamma"),
  }),
  s({ trig = ";G", type = "autosnippet" }, {
    t("\\Gamma"),
  }),
  s({ trig = ";d", type = "autosnippet" }, {
    t("\\delta"),
  }),
  s({ trig = ";D", type = "autosnippet" }, {
    t("\\Delta"),
  }),
  s({ trig = ";e", type = "autosnippet" }, {
    t("\\epsilon"),
  }),
  s({ trig = ";ve", type = "autosnippet" }, {
    t("\\varepsilon"),
  }),
  s({ trig = ";z", type = "autosnippet" }, {
    t("\\zeta"),
  }),
  s({ trig = ";h", type = "autosnippet" }, {
    t("\\eta"),
  }),
  s({ trig = ";o", type = "autosnippet" }, {
    t("\\theta"),
  }),
  s({ trig = ";vo", type = "autosnippet" }, {
    t("\\vartheta"),
  }),
  s({ trig = ";O", type = "autosnippet" }, {
    t("\\Theta"),
  }),
  s({ trig = ";k", type = "autosnippet" }, {
    t("\\kappa"),
  }),
  s({ trig = ";l", type = "autosnippet" }, {
    t("\\lambda"),
  }),
  s({ trig = ";L", type = "autosnippet" }, {
    t("\\Lambda"),
  }),
  s({ trig = ";m", type = "autosnippet" }, {
    t("\\mu"),
  }),
  s({ trig = ";n", type = "autosnippet" }, {
    t("\\nu"),
  }),
  s({ trig = ";x", type = "autosnippet" }, {
    t("\\xi"),
  }),
  s({ trig = ";X", type = "autosnippet" }, {
    t("\\Xi"),
  }),
  s({ trig = ";p", type = "autosnippet" }, {
    t("\\pi"),
  }),
  s({ trig = ";P", type = "autosnippet" }, {
    t("\\Pi"),
  }),
  s({ trig = ";r", type = "autosnippet" }, {
    t("\\rho"),
  }),
  s({ trig = ";s", type = "autosnippet" }, {
    t("\\sigma"),
  }),
  s({ trig = ";S", type = "autosnippet" }, {
    t("\\Sigma"),
  }),
  s({ trig = ";t", type = "autosnippet" }, {
    t("\\tau"),
  }),
  s({ trig = ";f", type = "autosnippet" }, {
    t("\\phi"),
  }),
  s({ trig = ";vf", type = "autosnippet" }, {
    t("\\varphi"),
  }),
  s({ trig = ";F", type = "autosnippet" }, {
    t("\\Phi"),
  }),
  s({ trig = ";c", type = "autosnippet" }, {
    t("\\chi"),
  }),
  s({ trig = ";y", type = "autosnippet" }, {
    t("\\psi"),
  }),
  s({ trig = ";Y", type = "autosnippet" }, {
    t("\\Psi"),
  }),
  s({ trig = ";w", type = "autosnippet" }, {
    t("\\omega"),
  }),
  s({ trig = ";W", type = "autosnippet" }, {
    t("\\Omega"),
  }),
}
