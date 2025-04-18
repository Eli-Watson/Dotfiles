-- mathches the theme set in theme.lua
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
        options = {
            theme = 'gruvbox'
        }
    })
    end
}
