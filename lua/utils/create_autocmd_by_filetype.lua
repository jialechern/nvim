-- create_autocmd_by_filetype.lua
-- 这里放置根据文件类型创建自动命令的工具


local module = {}

local function create_autocmd_by_filetype(filetype, callback)
    local group = vim.api.nvim_create_augroup(filetype, { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
        group = group,
        pattern = filetype,
        callback = callback,
    })
end

module.create_autocmd_by_filetype = create_autocmd_by_filetype

return module


