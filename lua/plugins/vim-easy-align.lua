local M = {}

function M.setup()
    vim.cmd.packadd('vim-easy-align')

    local align_leader = require('settings.variables.align').align_leader

    -- Visual 模式: 选中文本后, 直接对齐
    vim.keymap.set('x', align_leader, '<Plug>(EasyAlign)', { desc = 'EasyAlign (Visual)' })

    -- Normal 模式: 配合 motion 对齐
    vim.keymap.set('n', align_leader .. 'n', '<Plug>(EasyAlign)', { desc = 'EasyAlign (Normal/Motion)' })

    -- 如需自定义分隔符规则, 可以继续在这里加
end

return M
