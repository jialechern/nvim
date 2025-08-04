--- python.lua
--- python 的 log snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

--- 模块定义
local module = {}

--- 日志处理
module[#module+1] = s({
    trig = 'log',
    -- snippetType = 'autosnippet',
    }, {
    t({'import logging', '', ''}),

    t({'def get_logger(', ''}),
    t({'\tname: str = __name__,', ''}),
    t({'\tlevel: int = logging.INFO,', ''}),
    t({'\tfmt: str = \'%(asctime)s - %(name)s - %(levelname)s - %(message)s\',', ''}),
    t({'\tinto: str=\'console\',', ''}),
    t({'\t) -> logging.Logger:', '', ''}),

    t({'\tlogger = logging.getLogger(name)', ''}),
    t({'\tlogger.setLevel(level)', '', ''}),

    t({'\tformatter = logging.Formatter(fmt)', ''}),
    t({'\thandler: logging.Handler', '', ''}),

    t({'\tmatch into:', ''}),
    t({'\t\tcase \'console\':', ''}),
    t({'\t\t\thandler = logging.StreamHandler()', ''}),
    t({'\t\tcase \'file\':', ''}),
    t({'\t\t\thandler = logging.FileHandler(f\'{name}.log\', mode=\'a\')', '', ''}),

    t({'\t\tcase _:', ''}),
    t({'\t\t\traise ValueError(f\'不支持将日志写入到 {into}\')', '', ''}),

    t({'\thandler.setLevel(level)', ''}),
    t({'\thandler.setFormatter(formatter)', '', ''}),
    t({'\tlogger.addHandler(handler)', ''}),
    t('\treturn logger'),
})

--- 模块返回
return module

