-- code-comment.lua
-- 这是一份用于代码注释的的配置文件

-- 载入自定义工具函数
local map = require('utils.map').map
local map_by_modes = require('utils.map').map_by_modes

-- 定义一个函数来添加或去除行注释
local function ToggleComment( get_comment )
	local comment_prefix = get_comment()

	-- 如果未设置有效的注释, 则直接返回
	if not comment_prefix then return end

	local comment_prefix_len = #comment_prefix

	-- 获取当前行号和列号
	local line = vim.fn.line('.')
	local col = vim.fn.col('.')

	-- 获取当前行内容
	local current_line = vim.fn.getline('.')

	-- 检查当前行是否以指定的注释前缀开头
	if current_line:find('^' .. vim.pesc(comment_prefix)) then
		-- 如果以注释前缀开头，则移除注释
		local new_line = current_line:gsub('^' .. vim.pesc(comment_prefix), '')
		col = col - comment_prefix_len
		vim.fn.setline(line, new_line)
	else
		-- 如果没有注释前缀，则添加注释
		local new_line = comment_prefix .. current_line
		col = col + comment_prefix_len
		vim.fn.setline(line, new_line)
	end

	-- 保持光标位置
	vim.fn.cursor(line, col)
end

-- 设置一般注释
map_by_modes({ 'n', 'i' }, '<C-A-_>', function ()
    local GetComment = require('utils.code-comments').GetComment
    ToggleComment(GetComment())
end, { desc = "设置用于注释代码的快捷键." })
-- 设置文档注释
map_by_modes({ 'n', 'i' }, _G.CoLeader .. _G.CoLeader .. '/', function ()
    local GetDocumentationComment = require('utils.documentation-comments').GetDocumentationComment
    ToggleComment(GetDocumentationComment())
end, { desc = "设置用于文档注释的快捷键." })

-- 定义一个函数用于增加/去除可视模式下的块注释
local function BlockToggleComment( get_comment )
	local insert_string = get_comment()	-- 你想要插入或删除的字符串
    if not insert_string then return end

	-- 获取当前选中的行范围
	local start_line = vim.fn.getpos("'<")[2]
	local end_line = vim.fn.getpos("'>")[2]
	local insert_string_len = #insert_string

	-- 保存可视模式状态
	local saved_view = vim.fn.winsaveview()

	-- 遍历选中的每一行
	for line = start_line, end_line do
		local current_line = vim.fn.getline(line)
		if current_line:sub(1, insert_string_len) == insert_string then
			-- 如果行前已经包含插入字符串，则删除它
			vim.fn.setline(line, current_line:sub(insert_string_len + 1))
		else
			-- 如果行前不包含插入字符串，则插入它
			vim.fn.setline(line, insert_string .. current_line)
		end
	end

	-- 恢复可视模式状态
	vim.fn.winrestview(saved_view)
	vim.cmd('normal! gv')
end

-- 设置可视模式下的块注释
map('x', '<C-A-_>', function ()
    local GetComment = require('utils.code-comments').GetComment
    BlockToggleComment(GetComment())
end, { desc = "设置可视模式下的块注释快捷键." })

-- 设置可视模式下的块文档注释
map('x', _G.CoLeader .. _G.CoLeader .. '/', function ()
    local GetDocumentationComment = require('utils.documentation-comments').GetDocumentationComment
    BlockToggleComment(GetDocumentationComment())
end, { desc = "设置可视模式下的块文档注释快捷键." })

-- 根据不同的文件名设置不同的块注释键盘映射
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function()
        local GetBlockComment = require('utils.block-code-comments').GetBlockComment
		local comment_prefix = GetBlockComment()

		if comment_prefix then
            map('i', '<LEADER>/', comment_prefix, {
                expr = true,
                desc = "设置块注释的快捷键.",
            })

            map('i', '<LEADER>?', comment_prefix, {
                expr = true,
                desc = "设置块注释的快捷键.",
            })
		end
	end
})

-- 根据不同的文件名设置不同的块文档注释键盘映射
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "*" },
	callback = function()
        local GetBlockDocumentationComment = require('utils.block-documentation-comments').GetBlockDocumentationComment
        local comment_prefix = GetBlockDocumentationComment()

		if comment_prefix then
            map('i', _G.CoLeader .. '/', comment_prefix, {
                expr = true,
                desc = "设置块文档注释的快捷键.",
            })
		end
	end
})

