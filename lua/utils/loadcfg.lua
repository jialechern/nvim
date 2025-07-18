-- - loadcfg.lua
-- Description: 给出一个快速加载文件的函数

local module = {}

local function loadcfg(file)
    local chunk, err = loadfile(vim.fn.stdpath("config") .. file)
    if not chunk then
        error("加载失败: " .. err)
    else
        chunk()
    end
end

module.loadcfg = loadcfg

return module

