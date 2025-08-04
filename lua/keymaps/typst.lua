-- typst.lua

--- 自动预览

require('settings.autocmd-by-filetype').cmds['typst'] = function ()
    vim.cmd('silent TypstPreview')
end

