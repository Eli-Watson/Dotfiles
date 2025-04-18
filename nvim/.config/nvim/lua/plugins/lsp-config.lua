-- File to configure all of my lsp stuff
-- mason, nvim-lspconfig, and mason-lspconfig
-- they are all in one file for simplicity
return {
    {

        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "denols", "harper_ls", "html", "bashls", "pyright", "cssls",},
            })

            -- automatic installation of lsp servers
            require("mason-lspconfig").setup_handlers {
                function (server_name)
                    require("lspconfig")[server_name].setup {}
                end,
            -- you can provide a dedicated handler for specific servers
            -- ["rust_analyzer"] = function()
                -- require("rust-tools").setup{}
                --end
            }

        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            --keymaps
            --Shows info about an error when hovering over it
            vim.keymap.set('n', "K", vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end
    },
}
