local M = {}

local ts_utils = require("nvim-treesitter.ts_utils")
local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

function M.get_ISO_8601_date()
  return os.date("%Y-%m-%d")
end

function M.get_visual(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ""))
  end
end

function M.tex_math_mode()
  local node = ts_utils.get_node_at_cursor(0)
  local root
  if node then
    root = ts_utils.get_root_for_node(node)
  end
  if not root then
    return false
  end
  local parent
  if node then
    parent = node:parent()
  end
  while node ~= nil and node ~= root do
    local t = node:type()
    if t == "label_definition" or t == "text_mode" then
      return false
    elseif t == "inline_formula" or t == "displayed_equation" or t == "math_environment" then
      return true
    elseif t == "ERROR" then
      local tab = vim.treesitter.get_node_text(node, 0)
      if type(tab) == "string" then
        tab = { tab }
      end
      for _, text in ipairs(tab) do
        if string.find(text, "%$") or string.find(text, "\\%[") then
          return true
        end
      end
    end
    node = parent
    if node then
      parent = node:parent()
    end
  end
  return false
end

function M.markdown_math_mode()
  if M.tex_math_mode() then
    return true
  end
  local node = ts_utils.get_node_at_cursor(0)
  local parent
  if node then
    parent = node:parent()
  end
  while node ~= nil do
    local t = node:type()
    if t == "inline_formula" then
      local start_row, _, end_row, _ = vim.treesitter.get_node_range(node)
      local tab = vim.api.nvim_buf_get_lines(0, start_row, end_row + 1, false)
      local row, col = unpack(vim.api.nvim_win_get_cursor(0))
      local inside = false
      for i, text in ipairs(tab) do
        if i > row - start_row then
          break
        end
        local index = 0
        local flag = false
        repeat
          _, index = string.find(text, "%$", index)
          if index then
            if i == row - start_row then
              if index > col + 1 then
                flag = true
              else
                inside = not inside
              end
            else
              inside = not inside
            end
          else
            flag = true
          end
        until flag == true
      end
      return inside
    end
    node = parent
    if node then
      parent = node:parent()
    end
  end
  return false
end

vim.cmd([[
nmap ,t :lua print(tostring(require("personal.luasnip-helper-funcs").tex_math_mode()))<cr>
nmap ,m :lua print(tostring(require("personal.luasnip-helper-funcs").markdown_math_mode()))<cr>
]])
return M
