-- - settings-auto-cmd-by-file-type.lua

local module = {}

-- 定义根据文件类型自动 编译/运行/预览... 的 Run 函数
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

module.Run = Run

return module

