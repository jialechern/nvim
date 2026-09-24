--- vim_options.lua
--- 交互设置 vim/neovim 内置选项 (键位与描述见 lua/keys/vim_options.lua)

local map = require('utils.map').map
local keys = require('keys.vim_options')

map(keys.make_program, function()
    ---@type string
    local makeprg = vim.fn.input('设定 makeprg(make-program) 为: ', '')
    vim.bo.makeprg = makeprg
end)

map(keys.grep_program, function()
    ---@type string
    local grepprg = vim.fn.input('设定 grepprg(grep-program) 为: ', '')
    vim.bo.grepprg = grepprg
end)

map(keys.grep_format, function()
    ---@type string
    local grepformat = vim.fn.input('设定 grepformat(grep-format) 为: ', '')
    vim.opt.grepformat = grepformat
end)

map(keys.shell_pipe, function()
    ---@type string
    local shellpipe = vim.fn.input('设定 shellpipe(shell-pipe) 为: ', '')
    vim.opt.shellpipe = shellpipe
end)

map(keys.shell_redir, function()
    ---@type string
    local shellredir = vim.fn.input('设定 shellredir(shell-redir) 为: ', '')
    vim.opt.shellredir = shellredir
end)

map(keys.format_program, function()
    ---@type string
    local formatprg = vim.fn.input('设定 formatprg(format-program) 为: ', '')
    vim.bo.formatprg = formatprg
end)
