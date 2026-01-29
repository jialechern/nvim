--- markdown.lua
--- 用于配置 markdown 的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local autocmd_key = require('settings.variables.auto-run').autocmd_key

--- 自动预览
if vim.fn.exists(':MarkdownPreview') ~= 0 then
    map('n', autocmd_key, function ()
        vim.cmd('MarkdownPreview')
    end, { desc = '预览 markdown 文件' })
end

