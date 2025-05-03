-- replacement for null-ls
-- plugin for linting and formatting
return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua, --lua
                null_ls.builtins.formatting.prettier, --JS
                null_ls.builtins.formatting.black, --python
                null_ls.builtins.formatting.isort, --python (Imports)
                null_ls.builtins.formatting.clang_format,
                -- null_ls.builtins.diagnostics.eslint_d,
            },
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
