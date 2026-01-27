
local module = {}

module.cmd = { 'tinymist' }
module.filetypes = { 'typst' }
module.root_markers = { 'main.typ', '.git' }
module.settings = {
    -- 实时增量编译 PDF
	exportPdf = "onType",
    formatterMode = "typstyle",
	semanticTokens = "enable",
    -- "auto" | "enable" | "disable"
    syntaxOnly = "auto",
    lint = { enabled = true, when = "onType" },
    -- 核心配置：固定主文件模式
    -- "pinned" 会寻找 root_markers 里的 main.typ
    -- "root" 则尝试将根目录下的文件作为入口
    typstExtraArgs = { "--root", vim.fn.getcwd() },
    -- 告诉 Tinymist：如果找到主文件，就一直编译它
    -- mainFile = "main.typ",
    preview = {
        refresh = "onType",
        partialRendering = true,
        background = { enabled = false }
    },
}

-- 动态功能绑定 (替代传统的 on_attach)
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.name == "tinymist" then
			local bufnr = args.buf

			-- [动态固定]：把当前文件设为主入口
			vim.keymap.set("n", "<leader>tp", function()
				client:exec_cmd({
					command = "tinymist.pinMain",
					arguments = { vim.api.nvim_buf_get_name(bufnr) },
				}, { bufnr = bufnr })
				vim.notify("已固定当前文件为主入口")
			end, { buffer = bufnr, desc = "Typst: Pin Main" })

			-- [取消固定]
			vim.keymap.set("n", "<leader>tu", function()
				client:exec_cmd({
					command = "tinymist.pinMain",
					arguments = { vim.v.null },
				}, { bufnr = bufnr })
				vim.notify("已取消固定，恢复自动检测")
			end, { buffer = bufnr, desc = "Typst: Unpin Main" })
		end
	end,
})

return module

