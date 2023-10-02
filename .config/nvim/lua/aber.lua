-- Math context detection
local ts_utils = require("nvim-treesitter.ts_utils")
local M = {}
M.aber = function()
  local cursornode = ts_utils.get_node_at_cursor()
  print(cursornode)
  print(ts_utils.is_parent("latex_block"))
  print(ts_utils.get_named_children(cursornode)[1])
end
M.in_mathzone = function()
  return ts_utils.is_parent("@latex_block")
end
M.in_text = function()
  return not M.in_mathzone()
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
      local tab = ola.treesitter.get_node_text(node, 0)
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
    if t == "inline" then
      local start_row, _, end_row, _ = ola.treesitter.get_node_range(node)
      local tab = ola.api.nvim_buf_get_lines(0, start_row, end_row + 1, false)
      local row, col = unpack(ola.api.nvim_win_get_cursor(0))
      local inside = false
      for i, text in ipairs(tab) do
        if i > row - start_row then
          break
        end
        local index = 0
        local flag = false
        repeat
          _, index = string.find(text, "%$%$", index)
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
-- print(M.tex_math_mode())
print(M.markdown_math_mode())
