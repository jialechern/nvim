-- tabs.lua
-- 这里定义标签相关的按键映射

-- 引入自定义工具函数以及相应符号
local map = require('utils.map').map
local get_key = require('settings.variables.tabs').get_key

map('n', get_key('edit'), function ()
    local file = vim.fn.input("请输入文件名: ", '', 'file')
    vim.cmd('tabedit ' .. vim.fn.fnameescape(file))
end, { desc = "在新标签页打开文件"})

map('n', get_key('list'), function ()
    vim.cmd('tabs')
end, { desc = "列出当前所有的标签页"})

map('n', get_key('new'), function ()
    vim.cmd('tabnew')
end, { desc = "新建标签页" })

map('n', get_key('close'), function ()
    vim.cmd('tabclose')
end, { desc = "关闭标签页" })

map('n', get_key('only'), function ()
    vim.cmd('tabonly')
end, { desc = "仅留下当前窗口" })

map('n', get_key('T'), function ()
    vim.cmd('wincmd T')
end, { desc = "将当前窗口移动至新的标签页" })

map('n', get_key('next'), function ()
    vim.cmd('tabnext')
end, { desc = "下一个标签页" })

map('n', get_key('previous'), function ()
    vim.cmd('tabprevious')
end, { desc = "上一个标签页" })

map('n', get_key('goto'), function ()
    local num = vim.fn.input("请输入标签页编号: ")
    vim.cmd('tabnext' .. num)
end, { desc = "切换到指定编号的标签页" })

map('n', get_key('move'), function ()
    local num = vim.fn.input("请输入标签页编号: ")
    vim.cmd('tabmove' .. num)
end, { desc = "将当前标签页移动到指定编号的标签页前" })

map('n', get_key('first'), function ()
    vim.cmd('tabfirst')
end, { desc = "跳转到第一个标签页" })

map('n', get_key('last'), function ()
    vim.cmd('tablast')
end, { desc = "跳转到最后一个标签页" })

map('n', get_key('help'), function ()
    local help_text = [[
标签页快捷键文档:
    %s : 在新标签页打开文件
    %s : 列出当前所有的标签页
    %s : 新建标签页
    %s : 关闭标签页
    %s : 仅留下当前窗口
    %s : 将当前窗口移动至新的标签页
    %s : 下一个标签页
    %s : 上一个标签页
    %s : 切换到指定编号的标签页
    %s : 将当前标签页移动到指定编号的标签页前
    %s : 跳转到第一个标签页
    %s : 跳转到最后一个标签页
    ]]
    vim.notify(help_text:format(
        get_key('edit'),
        get_key('list'),
        get_key('new'),
        get_key('close'),
        get_key('only'),
        get_key('T'),
        get_key('next'),
        get_key('previous'),
        get_key('goto'),
        get_key('move'),
        get_key('first'),
        get_key('last')
    ), vim.log.levels.INFO, { title = "标签页快捷键文档" })
end, { desc = "打开标签页快捷键文档" })

