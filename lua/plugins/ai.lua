return {
    {
        "olimorris/codecompanion.nvim",
        opts = {
            strategies = {
                chat = {
                    adapter = "copilot"
                },
                inline = {
                    adapter = "copilot"
                },
                cmd = {
                    adapter = "copilot"
                },
            }
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "github/copilot.vim",
            "nvim-treesitter/nvim-treesitter",
        }
    }
}
