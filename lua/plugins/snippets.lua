--- snippets.lua
--- 片段: Neovim 原生引擎(vim.snippet) + mini.snippets(集合与匹配) + friendly-snippets(社区集合)。
--- 自研片段已弃用(snippets/ 目录已删); 键位见 keys/lsp.lua 的 snippet_*, 片段另经进程内 LSP 服务器进补全菜单。

vim.cmd.packadd('mini.snippets')
vim.cmd.packadd('friendly-snippets') -- 只提供数据(snippets/<lang>.json), 不加载脚本

local map = require('utils.map').map
local keys = require('keys.lsp')
local snippets = require('mini.snippets')

snippets.setup({
    -- 从 runtimepath 的 snippets/ 目录按语言加载: friendly-snippets 正在其中
    snippets = { snippets.gen_loader.from_lang() },
    -- 关掉内置映射: 键位统一由 keys/lsp.lua 定义, 避免两套映射打架
    mappings = { expand = '', jump_next = '', jump_prev = '', stop = '' },
    -- 用 Neovim 原生片段会话(高亮与跳转都是原生的)
    expand = {
        ---@param snippet { body: string } 待展开的片段
        insert = function(snippet)
            vim.snippet.expand(snippet.body)
        end,
    },
})

-- 展开或跳到下一个节点: 沿用 LuaSnip 时代"一个键搞定"的手感
map(keys.snippet_forward, function()
    if #snippets.expand({ insert = false }) > 0 then
        snippets.expand()
    elseif snippets.session.get() ~= nil then
        snippets.session.jump('next')
    end
end)

map(keys.snippet_backward, function()
    if snippets.session.get() ~= nil then
        snippets.session.jump('prev')
    end
end)

map(keys.snippet_clear, function()
    snippets.session.stop()
end)

-- 起一个只实现 completion 的进程内 LSP 服务器, 让社区片段进入原生补全菜单
snippets.start_lsp_server()
