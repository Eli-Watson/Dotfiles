-- Startup screen, standard preset.
-- matches current theme (gruvbox)
return {
    'goolord/alpha-nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function ()
        require'alpha'.setup( require'alpha.themes.startify'.config)
    end
}
