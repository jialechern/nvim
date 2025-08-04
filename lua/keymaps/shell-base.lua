--- shell-base.lua
--- 用于配置通用 shell 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local autocmd_key = require('settings.variables.auto-run').autocmd_key

-- 支持的 shell 语言
local langs = {
    'sh',
    'zsh',
    'bash',
}

--- 自动运行

for _, lang in ipairs(langs) do
    map('n', autocmd_key, function ()
        vim.bo.makeprg = lang .. ' ' .. '%:p'
        vim.cmd('silent write')
        vim.cmd('make')
    end, { desc = '运行 ' .. lang .. ' 语言文件' })
end

