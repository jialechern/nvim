-- - Coc.lua
return {
    'neoclide/coc.nvim',
    branch = 'release',
    lazy = false,
    build = function()
        -- 检查 Node.js 是否安装
        if vim.fn.executable('node') == 0 then
            vim.notify("Coc.nvim 需要 Node.js (v16+)，请先安装 Node.js", vim.log.levels.ERROR)
            return
        end
      
        -- 安装依赖
        vim.notify("正在安装 Coc.nvim 依赖...", vim.log.levels.INFO)
        local result = vim.fn.system('npm install --frozen-lockfile --ignore-scripts --no-lockfile')
        if vim.v.shell_error ~= 0 then
            vim.notify("依赖安装失败: " .. result, vim.log.levels.ERROR)
        else
            vim.notify("Coc.nvim 安装成功!", vim.log.levels.INFO)
        end
    end,
    config = function()
        -- 基础配置
        vim.g.coc_global_extensions = {
            'coc-json',
            'coc-tsserver',
            'coc-pyright',
            'coc-rust-analyzer',
            'coc-clangd',
            'coc-lua',
            'coc-vimlsp',
            'coc-go',
            'coc-java'
        }
      
        -- 快捷键配置
        local function map(mode, lhs, rhs, opts)
            vim.keymap.set(mode, lhs, rhs, vim.tbl_extend('force', {
                silent = true,
                noremap = true
            }, opts or {}))
        end
      
        -- 补全控制
        map('i', '<C-Space>', 'coc#refresh()', { expr = true })
        map('i', '<C-j>', [[coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"]], { expr = true })
        map('i', '<C-k>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"]], { expr = true })
        map('i', '<CR>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], { expr = true })
      
        -- 导航与诊断
        map('n', 'gd', '<Plug>(coc-definition)')
        map('n', 'gy', '<Plug>(coc-type-definition)')
        map('n', 'gi', '<Plug>(coc-implementation)')
        map('n', 'gr', '<Plug>(coc-references)')
        map('n', '<leader>rn', '<Plug>(coc-rename)')
        map('n', '<leader>f', '<Plug>(coc-format)')
        map('n', '<leader>a', '<Plug>(coc-codeaction)')
        map('x', '<leader>a', '<Plug>(coc-codeaction-selected)')
      
        -- 诊断导航
        map('n', '[d', '<Plug>(coc-diagnostic-prev)')
        map('n', ']d', '<Plug>(coc-diagnostic-next)')
      
        -- 文档查看
        map('n', '<LEADER>?', function()
            local cw = vim.fn.expand('<cword>')
            if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
                vim.api.nvim_command('h ' .. cw)
            elseif vim.api.nvim_eval('coc#rpc#ready()') then
                vim.fn.CocActionAsync('doHover')
            else
                vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
            end
        end)
      
        -- 自动命令
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
            callback = function()
                map('n', '<leader>o', '<Plug>(coc-import-jump)')
            end
        })
      
        -- 状态栏集成
        if package.loaded['lualine'] then
            require('lualine').setup {
                sections = {
                lualine_x = {
                       {
                    function()
                        return vim.g.coc_status or ''
                    end,
                    color = { fg = '#61afef' }
                        }
                    }
                }
            }
        end
    end
}

