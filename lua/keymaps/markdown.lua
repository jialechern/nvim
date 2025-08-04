-- markdown.lua

--- 自动预览

require('settings.autocmd-by-filetype').cmds['markdown'] = function ()
    vim.cmd('silent MarkdownPreview')
end

