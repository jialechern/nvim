--- typst.lua
--- 用于配置 typst 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local autocmd_key = require('settings.variables.auto-run').autocmd_key

-- 设置编译器
vim.bo.makeprg = 'typst'

--- 自动预览
map('n', autocmd_key, function ()
    vim.cmd('silent TypstPreview')
end, { desc = '预览 typst 语言文件' })

-- 设置 LspAttach 自动命令来处理快捷键和 Zathura 逻辑
-- 在你的 LspAttach 回调函数内部
vim.keymap.set('n', '<leader>pv', function()
	-- 1. 获取项目根目录
	local root = vim.fs.root(0, { 'main.typ', 'typst.toml', '.git' })

	-- 2. 确定 PDF 路径的优先级：
	-- 优先级 A: 如果当前目录下有 main.pdf，优先预览它（配合 pin 功能）
	-- 优先级 B: 否则预览当前文件对应的 PDF 路径
	local pdf_path
	if root and vim.fn.filereadable(root .. "/main.pdf") == 1 then
		pdf_path = root .. "/main.pdf"
	else
		pdf_path = vim.fn.expand('%:p:r') .. '.pdf'
	end

	-- 3. 检查 PDF 是否真的存在
	if vim.fn.filereadable(pdf_path) == 0 then
		vim.notify("未找到 PDF 文件，请确保编译已成功执行", vim.log.levels.WARN)
		return
	end

	-- 4. 构造启动命令 (包含你最关心的反向搜索 --server)
	local server = vim.v.servername
	local zathura_cmd = {
		'zathura',
		'-x',
		-- 这里的指令会让 Zathura 在 Ctrl+点击时，通过当前 nvim 的 servername 调回对应的行号
		string.format([[nvim --server %s --remote-send ":%%slG<CR>"]], server),
		pdf_path
	}

	-- 5. 异步启动 Zathura
	vim.fn.jobstart(zathura_cmd, { detach = true })
	vim.notify("Zathura 预览: " .. vim.fn.fnamemodify(pdf_path, ":t"))
end, { buffer = bufnr, desc = "Typst Smart Preview" })

