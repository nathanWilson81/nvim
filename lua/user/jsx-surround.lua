local queries = require("vim.treesitter.query")

local ts_utils = require("nvim-treesitter.ts_utils")

local M = {}

local get_master_node = function()
  local node = ts_utils.get_node_at_cursor()
  local root = ts_utils.get_root_for_node(node)
  local bufnr = vim.api.nvim_get_current_buf()
  local best_distance = 99

  local jsx_node

  if node == nil then
    error('No Treesitter parser found')
  end

  if node:type() == "jsx_element" then
    return node
  end

  local query = queries.parse_query("tsx", "((jsx_element) @capture)")

  for _, query_node in query:iter_captures(root, bufnr) do
    local query_row              = query_node:range() -- range of the capture
    local node_row               = node:range()
    local distance_to_query_node = math.abs(query_row - node_row)
    if (distance_to_query_node == 0) then
      return query_node
    end
    if (distance_to_query_node < best_distance and query_row < node_row) then
      best_distance = distance_to_query_node
      jsx_node = query_node
    end
  end

  return jsx_node
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
