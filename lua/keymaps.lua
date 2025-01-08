-- keymaps.lua

-- end 设置写入模式的传送锚点
-- 跳转方式
vim.api.nvim_set_keymap('i', '<leader>;', '<Esc>/<++><CR>:nohlsearch<CR>c4l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<leader>:', '<Esc>/<++><CR>:nohlsearch<CR>c4l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '`;', '<Esc>/<++><CR>:nohlsearch<CR>c4l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-n>', '<Esc>/<++><CR>:nohlsearch<CR>c4l', { noremap = true, silent = true })
-- 设置清除当前行的传送锚点
vim.api.nvim_set_keymap('i', '<C-c>', '<Esc>mc:s/<++>//g<CR>`ca', { noremap = true, silent = true })
-- end 设置写入模式的传送锚点

-- begin 设置快速推出快捷键
vim.api.nvim_set_keymap('n', '<C-D>', ':q!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S>', ':wq<CR>', { noremap = true, silent = true })
-- end 设置快速推出快捷键

-- 复用旧的分屏设置
vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-base.vim')        
-- 设置拼写检查
vim.api.nvim_set_keymap('n', '<leader>sc', ':set spell!<CR>', { noremap = true, silent = true})

-- begin 设置 noremal 模式快速跳转
vim.api.nvim_set_keymap('n', 'H', '^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'H', '^', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '^', 'H', {noremap = true, silent = true})
-- 设置跳转到行尾键
vim.api.nvim_set_keymap('n', 'L', '$', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'L', '$', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '$', 'L', {noremap = true, silent = true})
-- 设置快速上下移动
vim.api.nvim_set_keymap('n', 'J', '5j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'J', '5j', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'K', '5k', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', 'K', '5k', {noremap = true, silent = true})
-- end 设置 noremal 模式快速跳转

-- vim.cmd('source $NVIMCONFIGP/lua/mathkeymaps.vim')
                                                        -- 引入数学公式的快捷键
-- begin    设置注释
-- 定义一个函数来添加或去除注释
function ToggleComment()
  local filetype = vim.bo.filetype
  if filetype == 'python' or
     filetype == 'make'
      then
      comment_prefix = '# '
  elseif filetype == 'c' or 
      filetype == 'cpp' or
      filetype == 'rust'
      then
          comment_prefix = '// '
  elseif filetype == 'lua' then
      comment_prefix = '-- '
  elseif filetype == 'tex' then
      comment_prefix = '% '
  end
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

vim.api.nvim_set_keymap('n', '<C-_>', ':lua ToggleComment()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-_>', '<Esc>:lua ToggleComment()<CR>a', { noremap = true, silent = true })
-- end      设置注释

-- begin    设置成对符号的自动配对
vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-symbols.vim')
-- end      设置成对符号的自动配对

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-math.vim')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-markdown.vim')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-math.vim')
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-elegant_note.vim')
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-latex.vim')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-rust.vim')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-python.vim')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "c", 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-c.vim')
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 
        "bash",
        "zsh",
    }, 
    callback = function()
        vim.cmd('source $NVIMCONFIGP/lua/keymaps/keymaps-shell_base.vim')
    end,
})

