local map = vim.api.nvim_set_keymap

local options = { noremap = true, silent = true }

-- Normal Mode
--
map('n', 'j', 'gj', options)
map('n', 'k', 'gk', options)

map('n', '<leader>p', ':Telescope find_files<cr>', options)
map('n', '<leader>b', ':Telescope buffers<cr>', options)
map('n', '<leader>s', ':Telescope lsp_document_symbols<cr>', options)
map('n', '<leader>f', ':Telescope current_buffer_fuzzy_find<cr>', options)
map('n', '<leader>w', ':Telescope lsp_workspace_symbols<cr>', options)
map('n', '<leader>t', ':NvimTreeToggle<cr>', options)
map('n', '<leader>fs', ':w<cr>', options)
map('n', '<leader>/', ':Telescope live_grep<cr>', options)
map('n', '<leader>d', ':Telescope lsp_references<cr>', options)
map('n', '<leader>h', ':lua vim.lsp.buf.hover()<cr>', options)
map('n', '<leader>r', ':lua vim.lsp.buf.rename()<cr>', options)
map('n', '<leader>a', ':lua vim.lsp.buf.code_action()<cr>', options)

-- Insert Mode
--
map('i', 'df', '<Esc>', options)


-- Visual Mode
--
map('v', '<C-F>', 'y:Telescope live_grep <C-R>"<cr>', options)
--
-- Move up code chunks up and down in Visual mode
--
map('v', 'J', ":m '>+1<CR>gv=gv", options)
map('v', 'K', ":m '<-2<CR>gv=gv", options)
