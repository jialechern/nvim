-- - github-copilot.lua

return {
  "github/copilot.vim",            -- 插件仓库地址
  config = function()
    -- 禁用 Copilot 默认把 <Tab> 映射为“接受建议”
    vim.g.copilot_no_tab_map = true

    -- 禁用 Copilot 的预览窗口（如果你不喜欢浮窗干扰）
    vim.g.copilot_enable_preview = false

    -- 插入模式：Ctrl+j 接受建议
    vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
    -- vim.keymap.set("i", "<C-j>", function()
      -- return vim.fn["copilot#Accept"]()
    -- end, { expr = true, silent = true })

    -- 插入模式：Ctrl+k 跳到下一条建议
    -- vim.keymap.set("i", "<C-n>", function()
      -- return vim.fn["copilot#Next"]()
    -- end, { expr = true, silent = true })

    -- 插入模式：Ctrl+h 跳到上一条建议
    -- vim.keymap.set("i", "<C-p>", function()
      -- return vim.fn["copilot#Prev"]()
    -- end, { expr = true, silent = true })

    -- 普通模式：<leader>cp 打开 Copilot 面板（列出多条候选）
    -- vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>", { silent = true })

    -- 普通模式：<leader>ci 触发一次 Copilot 建议
    -- vim.keymap.set("n", "<leader>ci", ":Copilot suggestion<CR>", { silent = true })
  end,  -- 注意这里的逗号

}





