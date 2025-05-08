return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            javascript = { "prettierd", "prettier", "eslint_d", stop_after_first = true },
            typescript = { "prettierd", "prettier", "eslint_d", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", "eslint_d", stop_after_first = true },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback"
        }
    },
}
