--- typst.lua

local map = require('utils.map').map
local keys = require('keys.run')

-- makeprg 只负责编译, 入口文件由 <C-e> 传入
vim.bo.makeprg = 'typst compile'

-- <C-e>: 先编译(错误进 quickfix), 再用 zathura 预览; 反向同步靠 --remote-send 把行号送回本 nvim
map(keys.run_file, function()
    vim.cmd('silent write')

    ---@type string? 项目根(main.typ / typst.toml / .git 所在目录)
    local root = vim.fs.root(0, { 'main.typ', 'typst.toml', '.git' })
    ---@type string 入口文件: 优先根目录的 main.typ, 否则当前文件
    local entry = (root and vim.fn.filereadable(root .. '/main.typ') == 1) and (root .. '/main.typ')
        or vim.fn.expand('%:p')

    vim.cmd('make ' .. vim.fn.fnameescape(entry))
    if #vim.fn.getqflist() > 0 then
        return -- 编译报错已进 quickfix
    end

    ---@type string
    local pdf_path = entry:gsub('%.typ$', '.pdf')
    if vim.fn.filereadable(pdf_path) == 0 then
        vim.notify('未找到 PDF 文件: ' .. pdf_path, vim.log.levels.WARN)
        return
    end

    ---@type string
    local server = vim.v.servername
    ---@type string[]
    local zathura_cmd = { 'zathura' }
    if server ~= '' then
        zathura_cmd[#zathura_cmd + 1] = '-x'
        zathura_cmd[#zathura_cmd + 1] = string.format([[nvim --server %s --remote-send ":%%slG<CR>"]], server)
    end
    zathura_cmd[#zathura_cmd + 1] = pdf_path

    vim.fn.jobstart(zathura_cmd, { detach = true })
    vim.notify('Zathura 预览: ' .. vim.fn.fnamemodify(pdf_path, ':t'))
end, { buffer = 0 })
