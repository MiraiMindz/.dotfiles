local plugins = {
    { 
        "folke/neoconf.nvim", 
        cmd = "Neoconf" 
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
}
return plugins
