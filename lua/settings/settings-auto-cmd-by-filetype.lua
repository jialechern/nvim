-- - settings-auto-cmd-by-file-type.lua

local module = {}

-- 定义根据文件类型自动 编译/运行/预览... 的 Run 函数
local cmds = {
    python = function ()
        vim.cmd('silent write')
        vim.cmd('silent !python3 %')
    end,
    markdown = function ()
        vim.cmd('silent MarkdownPreview')
    end,
    typst = function ()
        vim.cmd('silent TypstPreview')
    end,
    tex = function ()
        vim.cmd('silent write')
        vim.cmd('silent !latexmk')
    end
}

module.cmds = cmds

return module

