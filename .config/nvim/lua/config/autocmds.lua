local function augroup(name)
  return vim.api.nvim_create_augroup("initlua_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd({ "BufModifiedSet" }, {
  group = augroup("global_mark"),
  pattern = { "*.md", "*.py" },
  callback = function()
    local ft = vim.bo.filetype
    local buf, line, col, _ = unpack(vim.fn.getpos("."))
    if ft == "pandoc" then
      vim.api.nvim_buf_set_mark(buf, "M", line, col, {})
    end
    if ft == "latex" then
      vim.api.nvim_buf_set_mark(buf, "T", line, col, {})
    end
    if ft == "python" then
      vim.api.nvim_buf_set_mark(buf, "P", line, col, {})
    end
  end,
})

vim.filetype.add({
  extension = { md = "pandoc", tex = "latex", frac = "glsl" },
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("formatopts"),
  callback = function()
    vim.bo.formatoptions = "ntcqj"
    vim.opt_local.wrap = true
  end,
})
