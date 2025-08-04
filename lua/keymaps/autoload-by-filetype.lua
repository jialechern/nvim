--- auto-load-by-filetype.lua
--- 该文件用于根据文件类型自动加载相应的键位映射配置

local function create_autocmd_by_filetype(filetype, callback)
    local group = vim.api.nvim_create_augroup(filetype, { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
        group = group,
        pattern = filetype,
        callback = callback,
    })
end

for _, filetype in ipairs({
    'sh',
    'zsh',
    'bash',
}) do
    create_autocmd_by_filetype(filetype, function ()
        require('keymaps.shell-base')
    end)
end

for _, filetype in ipairs({
    'c',
    'lua',
    'tex',
    'fish',
    'rust',
    'make',
    'typst',
    'python',
    'markdown',
    'javascript',
}) do
    create_autocmd_by_filetype(filetype, function ()
            require('keymaps.' .. filetype)
    end)
end

