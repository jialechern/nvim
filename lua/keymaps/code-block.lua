-- code-block.lua
-- 根据不同的文件名设置不同的代码块

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function()
        local map = require('utils.map').map
        local GetCodeBlock = require('utils.code-blocks').GetCodeBlock
        local code_block = GetCodeBlock()
        if code_block then
            map('i', '<LEADER>b' .. _G.End, code_block, {
                desc = "根据不同的源代码文件设置代码块",
                expr = true,
            })
        end
    end
})

