local status_ok, fzflua = pcall(require, "fzf-lua")
if not status_ok then
	return
end

local map = vim.api.nvim_set_keymap

local options = { noremap = true, silent = true }

fzflua.register_ui_select()

map("n", "<leader>p", ":FzfLua files <cr>", options)
map("n", "<leader>b", ":FzfLua buffers<cr>", options)
map("n", "<leader>s", ":FzfLua lsp_document_symbols<cr>", options)
map("n", "<leader>f", ":FzfLua grep_cWORD<cr>", options)
map("n", "<leader>w", ":FzfLua lsp_workspace_symbols<cr>", options)

map("n", "<leader>/", ":FzfLua live_grep<cr>", options)
map("n", "<leader>d", ":FzfLua lsp_references<cr>", options)
