--- autocmds.lua
--- 这里存放和基本配置相关的自动命令

local module = {}

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
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("auto_save"),
  pattern = {
    "tex",
    "typst",
  },
  callback = function()
      local autosave_timers = {}

      local function should_skip(bufnr)
        local ok, buftype = pcall(vim.api.nvim_buf_get_option, bufnr, 'buftype')
        if not ok then return true end
        if buftype ~= '' then return true end               -- skip terminal/nofile/quickfix...
        if not vim.api.nvim_buf_get_option(bufnr, 'modifiable') then return true end
        if vim.api.nvim_buf_get_option(bufnr, 'readonly') then return true end
        if vim.api.nvim_buf_get_option(bufnr, 'buftype') == 'prompt' then return true end
        if vim.api.nvim_buf_get_name(bufnr) == '' then return true end -- unnamed buffers: skip
        return false
      end

      vim.api.nvim_create_autocmd({'TextChanged','TextChangedI'}, {
        pattern = '*',
        callback = function(args)
          local bufnr = args.buf
          if should_skip(bufnr) then return end
          -- 只有在确实被修改时才排队保存
          if not vim.api.nvim_buf_get_option(bufnr, 'modified') then return end

          local delay_ms = 400  -- 防抖延迟（可按需调整，200-1000 范围常见）
          if autosave_timers[bufnr] then
            autosave_timers[bufnr]:stop()
            autosave_timers[bufnr]:close()
          end

          local timer = vim.loop.new_timer()
          autosave_timers[bufnr] = timer
          timer:start(delay_ms, 0, vim.schedule_wrap(function()
            -- 再次检查是否还需要保存（可能已撤销）
            if vim.api.nvim_buf_get_option(bufnr, 'modified') then
              -- 在目标缓冲上下文中执行写盘，避免影响其他缓冲
              pcall(vim.api.nvim_buf_call, bufnr, function()
                vim.cmd('silent! write')
              end)
            end
            timer:stop()
            timer:close()
            autosave_timers[bufnr] = nil
          end))
        end,
      })
    end,
})

return module

