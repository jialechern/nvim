-- entry-points.lua
-- 这是一个配置根据不同程序类型生成不同的入口点的文件

local module = {}

local entry_points = {}

for _, key in ipairs({ 'sh', 'zsh', 'bash', 'fish' }) do
    entry_points[key] = function () return
        '#!/usr/bin/env ' .. key
    end
end

module.entry_points = entry_points

return module

