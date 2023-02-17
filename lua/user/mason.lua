local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local lsp_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not lsp_status_ok then
	return
end

mason.setup({})
mason_lspconfig.setup({})
