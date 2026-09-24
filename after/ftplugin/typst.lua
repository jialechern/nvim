--- typst.lua
--- 用于配置 typst 语言的快捷键映射

-- 导入自定义的工具函数以及需要的符号
local map = require('utils.map').map
local keys = require('keys.run')

-- 设置编译器
vim.bo.makeprg = 'typst'

map(keys.run_file, function()
	local root = vim.fs.root(0, { 'main.typ', 'typst.toml', '.git' })

	local pdf_path
	if root and vim.fn.filereadable(root .. "/main.pdf") == 1 then
		pdf_path = root .. "/main.pdf"
	else
		pdf_path = vim.fn.expand('%:p:r') .. '.pdf'
	end

	if vim.fn.filereadable(pdf_path) == 0 then
		vim.notify("未找到 PDF 文件，请确保编译已成功执行", vim.log.levels.WARN)
		return
	end

	local server = vim.v.servername
	local zathura_cmd = {
		'zathura',
		'-x',
		string.format([[nvim --server %s --remote-send ":%%slG<CR>"]], server),
		pdf_path
	}

	vim.fn.jobstart(zathura_cmd, { detach = true })
	vim.notify("Zathura 预览: " .. vim.fn.fnamemodify(pdf_path, ":t"))
end, { buffer = 0 })
