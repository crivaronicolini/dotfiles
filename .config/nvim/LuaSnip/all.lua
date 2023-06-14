-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Return snippet tables
return {}, {
  s("trigger", { t("Wow! Text!") }),
  -- s({ trig = ";a", type = "autosnippet", key = "all_auto" }, { t("\\alpha") }),
  -- alpha
  s({ trig = ";a", type = "autosnippet" }, {
    t("\\alpha"),
  }),
  -- beta
  s({ trig = ";b", type = "autosnippet" }, {
    t("\\beta"),
  }),
  --gamma
  s({ trig = ";g", type = "autosnippet" }, {
    t("\\gamma"),
  }),
}

-- return {
--     s("ctrig", t("also loaded!!"))
-- }, {
--     s("autotrig", t("autotriggered, if enabled"))
-- }
