--- python.lua
--- python 的 log snipets

-- 基本引入
local luasnip = require('luasnip')

-- 自定义 snippet(Lua 方式)
local s = luasnip.snippet
-- local t = luasnip.text_node
local fmt = require('luasnip.extras.fmt').fmt
-- local i = luasnip.insert_node
-- local c = luasnip.choice_node
-- local d  = luasnip.dynamic_node
-- local sn = luasnip.snippet_node

--- 模块定义
local module = {}

--- 日志处理
local logger_key = require('settings.variables.logger').logger_key
module[#module+1] = s({
    trig = logger_key,
    -- wordTrig  = true,
    -- regTrig   = false,
    -- snippetType = 'autosnippet',
    name = 'log',
    desc = 'python 日志处理',
    }, fmt([[
    import logging

    def get_logger(
        name: str = __name__,
        level: int = logging.INFO,
        fmt: str = '%(asctime)s - %(name)s - %(levelname)s - %(message)s',
        into: str='console',
    ) -> logging.Logger:

        logger = logging.getLogger(name)
        logger.setLevel(level)

        formatter = logging.Formatter(fmt)
        handler: logging.Handler

        match into:
            case 'console':
                handler = logging.StreamHandler()
            case 'file':
                handler = logging.FileHandler(f'{{name}}.log', mode='a')
            case _:
                raise ValueError(f'不支持将日志写入到 {{into}}')

        handler.setLevel(level)
        handler.setFormatter(formatter)

        logger.addHandler(handler)
        return logger
    ]], {}))

--- 模块返回
return module

