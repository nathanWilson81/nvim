local ts_utils = require("nvim-treesitter.ts_utils")

local M = {}

local get_master_node = function()
  local node = ts_utils.get_node_at_cursor()

  if node == nil then
    error('No Treesitter parser found')
  end

  local start_row = node:start()
  local parent = node:parent()

  while (parent ~= nil and parent:start() == start_row) do
    node = parent
    parent = node:parent()
  end

  return node
end

M.surround = function(tagName)
  local node = get_master_node()
  local bufnr = vim.api.nvim_get_current_buf()
  local start_row, start_col, end_row, end_col = node:range()
  local start_tag = string.format("<%s>", tagName)
  local end_tag = string.format("</%s>", tagName)

  local start_text = vim.api.nvim_buf_get_text(bufnr, start_row, start_col, end_row, end_col, {})
  table.insert(start_text, 1, start_tag)
  table.insert(start_text, end_tag)

  vim.api.nvim_buf_set_text(bufnr, start_row, start_col, end_row, end_col, start_text)
end

return M
