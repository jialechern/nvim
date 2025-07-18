-- - auto-compile.lua

-- 载入需要的工具
local map = require('utils.map').map

-- 定义自动编译运行的 Run 函数
function Run()
    local filetype = vim.bo.filetype
    if filetype == 'python' then
        vim.cmd('silent write')
        vim.cmd('silent !python3 %')
    elseif filetype == 'markdown' then
        vim.cmd('silent MarkdownPreview')
    elseif filetype == 'typst' then
        vim.cmd('silent TypstPreview')
    elseif filetype == 'tex' then
        vim.cmd('silent write')
        vim.cmd('silent !latexmk')
    else
        print('No command for this file type.')
    end
end

-- 定义自动编译运行的键盘映射
map('n', '<A-r>', function ()
    vim.cmd( 'lua Run()' )
end, { desc = "根据当前文件类型自动执行默认命令( 编译/预览/... )." })

