local M = {
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = require('mirai.keymaps').comment.line,
        ---Block-comment toggle keymap
        block = require('mirai.keymaps').comment.block,
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = require('mirai.keymaps').comment.line,
        ---Block-comment keymap
        block = require('mirai.keymaps').comment.block,
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = require('mirai.keymaps').comment.lineup,
        ---Add comment on the line below
        below = require('mirai.keymaps').comment.linedown,
        ---Add comment at the end of line
        eol = require('mirai.keymaps').comment.lineend,
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
}

return M
