-- auto-load-by-filetype.lua
-- 该文件用于根据文件类型自动加载相应的键位映射配置

-- 引入自定义的函数来加载配置文件
local map = require('utils.map').map
local autocmd_by_pattern = require('utils.autocmd').autocmd_by_pattern

-------------------------- 加载不同文件类型的键位映射 --------------------------

autocmd_by_pattern(
    'markdown',
    function ()
        require('keymaps.math')
        require('keymaps.markdown')
    end
)

autocmd_by_pattern(
    'tex',
    function ()
        require('keymaps.math')
        require('keymaps.latex')
    end
)

autocmd_by_pattern({
        'sh',
        'zsh',
        'bash',
    },
    function ()
        require('keymaps.shell-base')
    end
)

autocmd_by_pattern(
    'make',
    function ()
        require('keymaps.shell-base')
        require('keymaps.makefile')
    end
)

for _, filetype in ipairs({
    'c',
    'toml',
    'fish',
    'rust',
    'typst',
    'python',
    'javascript',
}) do
    autocmd_by_pattern(
        filetype,
        function ()
            require('keymaps.' .. filetype)
        end
    )
end

------------------------------- 加载编程语言的通用映射 -------------------------------

-- 根据不同的程序类型加载相应的程序入口点
autocmd_by_pattern(
    { '*' },
    function()
        local entry_point = require('utils.entry-point').GetEntryPoint()
        local entry_key = require('settings.variables.entry-points').entry_point
        if entry_point then
            map('i', '<LEADER>' .. entry_key, entry_point, { expr = true, desc = "程序入口点", })
        end
    end
)

-- 根据不同的程序类型加载相应的程序函数片段
autocmd_by_pattern(
    { '*' },
    function ()
        local func = require('utils.functions').GetFunction()
        local func_key = require('settings.variables.functions').func_key
        if func then
            map('i', '<LEADER>' .. func_key, func, { expr = true, desc = "根据不同的程序类型加载相应的程序函数片段", })
        end
    end
)

-- 根据不同的程序语言类型加载相应的分支型结构映射
autocmd_by_pattern(
    { '*' },
    function ()
        local branchs = require('settings.variables.branchs').branch_keys
        local GetBrach = require('utils.branchs').GetBrach
        for type, key in pairs(branchs) do
            local branch = GetBrach(type)
            if key and branch then
                map('i', '<LEADER>' .. key, branch, { expr = true, desc = "分支结构: " .. type, })
            end
        end
    end
)

-- 根据不同的程序语言类型加载相应的循环结构映射
autocmd_by_pattern(
    { '*' },
    function ()
        local loops = require('settings.variables.loops').loop_keys
        local GetLoop = require('utils.loops').GetLoop
        for type, key in pairs(loops) do
            local loop = GetLoop(type)
            if key and loop then
                map('i', '<LEADER>' .. key, loop, { expr = true, desc = "分支结构: " .. type, })
            end
        end
    end
)

