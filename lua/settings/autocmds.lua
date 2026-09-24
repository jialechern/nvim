--- autocmds.lua
--- 存放与基础配置相关的自动命令(键位只写在 keys/ 里, 这里只注册行为)


---@class Settings.Autocmds
---@type Settings.Autocmds
local module = {}

---@param name string
---@return integer
local function augroup(name)
    return vim.api.nvim_create_augroup(name, { clear = true })
end

-- 改动设置时重新加载配置
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  callback = function()
    if vim.o.buftype ~= "nofile" then
      vim.cmd("checktime")
    end
  end,
})

-- 高亮复制结果
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- 如果窗口大小被调整，则调整分割大小
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    ---@type integer
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- 打开缓冲区时转到最后一个位置
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- 使用 <q> 关闭某些文件类型
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- 使在线打开 man 文件时更容易关闭
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("man_unlisted"),
  pattern = { "man" },
  ---@param event vim.api.keyset.create_autocmd.callback_args
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})

-- 文本文件类型中的换行和拼写检查
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- 修复 json 文件的隐藏级别
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("json_conceal"),
  pattern = { "json", "jsonc", "json5" },
  callback = function()
    vim.opt_local.conceallevel = 0
  end,
})

-- 保存文件时自动创建目录，以防某些中间目录不存在
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  ---@param event vim.api.keyset.create_autocmd.callback_args
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    ---@type string
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- 自动切换输入法(仅 GNU/Linux, 需 `fcitx5-remote`), 当前关闭: InsertLeave 时若输入法处于中文态(2)则切回英文
-- vim.api.nvim_create_autocmd({ "InsertLeave" }, { pattern = { "*" }, callback = function()
--     local input_status = tonumber(vim.fn.system("fcitx5-remote")); if input_status == 2 then vim.fn.system("fcitx5-remote -c") end end })

return module

