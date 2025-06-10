-- - keymaps-for-code-block.lua

-- 根据不同的文件名设置不同的代码块映射
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  callback = function()
    local code_block = _G.GetCodeBlock()
    if code_block then
      vim.keymap.set("i", "<LEADER>b" .. _G.End, code_block, {
        noremap = true,
        silent = true
      })
    end
  end
})

