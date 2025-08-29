-- buffers.lua
-- 这里放置一些缓冲区相关的设置

-- 导入自定义工具函数以及需要的符号
local map = require('utils.map').map
local get_key = require('settings.variables.buffers').get_key

map('n', get_key('previous'), function ()
    vim.cmd('bprevious')
end, { desc = "切换到缓冲区列表中的上一个文件" })

map('n', get_key('next'), function ()
    vim.cmd('bnext')
end, { desc = "切换到缓冲区列表中的下一个文件" })

map('n', get_key('first'), function ()
    vim.cmd('bfirst')
end, { desc = "切换到缓冲区列表中的首个文件" })

map('n', get_key('last'), function ()
    vim.cmd('blast')
end, { desc = "切换到缓冲区列表中的末个文件" })

map('n', get_key('list'), function ()
    vim.cmd('buffers')
end, { desc = "切换到缓冲区列表中的末个文件" })

map('n', get_key('goto'), function ()
    local num = vim.fn.input('请输入缓冲区编号: ')
    vim.cmd('buffer ' .. num)
end, { desc = "切换到缓冲区列表中的末个文件" })

map('n', get_key('#'), function ()
    vim.cmd('e #')
end, { desc = "在当前编辑的文件与上个编辑的文件间跳转" })

map('n', get_key('help'), function ()
    local help_text = [[
缓冲区快捷键帮助手册:
    %s : 切换到上一个缓冲区
    %s : 切换到下一个缓冲区
    %s : 切换到第一个缓冲区
    %s : 切换到最后一个缓冲区
    %s : 列出所有缓冲区
    %s : 跳转到指定编号的缓冲区
    %s : 切换到上次访问的缓冲区
]]
    vim.notify(help_text:format(
        get_key('previous'),
        get_key('next'),
        get_key('first'),
        get_key('last'),
        get_key('list'),
        get_key('goto'),
        get_key('#')
    ), vim.log.levels.INFO, { title = '缓冲区快捷键帮助手册' })
end, { desc = '缓存区快捷键帮助手册' })

