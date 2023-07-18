local M = {
    theme = "hyper",
    shortcut_type = "number",
    config = {
        shortcut = {
            { desc = '', group = '@property', action = '', key = 'MiraiMindz' },
        },
        footer = { "", "Mirai" },
        packages = { enable = true },
        project = { enable = true, limit = 4 },
        mru = { limit = 4 },
    },
    preview = {
        command = "sh",
        file_path = "$DOTFILES/apps/editors/neovim/CustomConfig/lua/mirai/pluginsAssets/dashboard_art.sh",
        file_height = 27,
        file_width = 48,
    }
}

return M
