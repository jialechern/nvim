local M = {}

function M.setup()
  -- 先设置全局变量, 再在 tex 文件里按需加载
  vim.g.vimtex_view_method = 'zathura'

  local group = vim.api.nvim_create_augroup('UserVimTeX', { clear = true })

  vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = { 'tex', 'latex' },
    callback = function()
      vim.cmd.packadd('vimtex')
    end,
  })
end

return M
