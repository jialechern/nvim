-- auto_save.lua

-- =============================================================================
-- 1. 全局变量与状态控制
-- =============================================================================
vim.g.autosave_enabled = false -- 默认关闭自动保存

local autosave_timers = {}
local autosave_group = vim.api.nvim_create_augroup("ZathuraWorkflow", { clear = true })

-- =============================================================================
-- 2. 辅助函数：判断是否需要跳过保存
-- =============================================================================
local function should_skip(bufnr)
    if not vim.g.autosave_enabled then return true end
    local bo = vim.bo[bufnr]
    if bo.buftype ~= '' then return true end               -- 过滤终端、弹窗等
    if not bo.modifiable or bo.readonly then return true end -- 过滤只读文件
    if vim.api.nvim_buf_get_name(bufnr) == '' then return true end -- 过滤无名缓冲区
    return false
end

-- =============================================================================
-- 3. 自动保存逻辑 (带防抖与上下文保护)
-- =============================================================================
vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI', 'BufLeave', 'FocusLost' }, {
    group = autosave_group,
    pattern = '*',
    callback = function(args)
        local bufnr = args.buf
        if not vim.api.nvim_buf_is_valid(bufnr) or should_skip(bufnr) then return end
        if not vim.bo[bufnr].modified then return end

        -- 情况 A：失去焦点或离开缓冲区，立即保存（模拟 VS Code 安全机制）
        if args.event == "FocusLost" or args.event == "BufLeave" then
            vim.api.nvim_buf_call(bufnr, function()
                vim.cmd('silent! write')
            end)
            return
        end

        -- 情况 B：正在编辑，执行防抖逻辑
        local delay_ms = 500 -- 500ms 是平衡实时预览与磁盘 IO 的黄金值
        if autosave_timers[bufnr] then
            autosave_timers[bufnr]:stop()
            if not autosave_timers[bufnr]:is_closing() then autosave_timers[bufnr]:close() end
        end

        local timer = vim.loop.new_timer()
        autosave_timers[bufnr] = timer
        timer:start(delay_ms, 0, vim.schedule_wrap(function()
            if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].modified then
                vim.api.nvim_buf_call(bufnr, function()
                    vim.cmd('silent! write')
                end)
            end
            if not timer:is_closing() then timer:close() end
            autosave_timers[bufnr] = nil
        end))
    end,
})

-- =============================================================================
-- 4. 全局开关快捷键 (方便随时禁用自动保存)
-- =============================================================================
vim.keymap.set("n", "<leader>S", function()
    vim.g.autosave_enabled = not vim.g.autosave_enabled
    local status = vim.g.autosave_enabled and "已开启" or "已禁用"
    vim.notify("自动保存 " .. status, vim.log.levels.INFO, { title = "System" })
end, { desc = "切换自动保存开关" })

