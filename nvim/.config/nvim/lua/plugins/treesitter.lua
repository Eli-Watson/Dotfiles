-- Treesitter plugin
return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                auto_install = false,
                ensure_installed = {
                    "bash",
                    "html",
                    "css",
                    "javascript",
                    "json",
                    "lua",
                    "python",
                    "c",
                    "perl"
                },
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
