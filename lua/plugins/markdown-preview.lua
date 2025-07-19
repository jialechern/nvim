-- markdown-preview.lua
return {
    "iamcco/markdown-preview.nvim",
    build = function()
        -- 跨平台构建命令，带错误处理
        local build_cmd = [[cd app && npm install || yarn install]]
        if vim.fn.executable("yarn") == 1 then
            build_cmd = "cd app && yarn install"
        elseif vim.fn.executable("npm") == 1 then
            build_cmd = "cd app && npm install"
        end

        vim.notify("正在构建 markdown-preview.nvim...")
        local result = vim.fn.system(build_cmd)
        if vim.v.shell_error ~= 0 then
            vim.notify("构建失败: " .. result, vim.log.levels.ERROR)
        else
            vim.notify("markdown-preview 构建成功!", vim.log.levels.INFO)
        end
        end,
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        keys = { -- 添加实用的快捷键
            { "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown 预览" },
            { "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", desc = "停止预览" },
        },
        init = function()
        -- 设置文件类型检测
        vim.g.mkdp_filetypes = { "markdown" }

        -- 自定义配置选项
        vim.g.mkdp_theme = 'light'                   -- 默认主题 (dark/light)
        vim.g.mkdp_browser = 'firefox'               -- 指定浏览器
        vim.g.mkdp_port = ''                         -- 随机端口避免冲突
        vim.g.mkdp_page_title = '「${name}」'         -- 页面标题
        vim.g.mkdp_auto_start = false                -- 自动开启预览
        vim.g.mkdp_auto_close = true                 -- 关闭缓冲区时自动停止预览
        vim.g.mkdp_refresh_slow = false              -- 延迟刷新（大文件时有用）
        vim.g.mkdp_command_for_global = false        -- 允许在非markdown缓冲区使用
        vim.g.mkdp_markdown_css = ''                 -- 自定义markdown样式
        vim.g.mkdp_highlight_css = ''                -- 自定义代码高亮样式
        vim.g.mkdp_preview_options = {
            disable_sync_scroll = false,               -- 是否同步滚动
            hide_yaml_meta = true,                     -- 隐藏YAML元数据
            toc_levels = '1..3',                       -- TOC级别
        }

        -- 自动关闭预览当离开Markdown缓冲区
        vim.api.nvim_create_autocmd('BufWinLeave', {
            pattern = '*.md',
            callback = function()
            if vim.fn.exists(':MarkdownPreviewStop') > 0 then
                vim.cmd('MarkdownPreviewStop')
            end
            end
        })
        end,
        config = function()
        -- 添加语法高亮支持
        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'markdown',
            callback = function()
            -- 启用语法高亮
            if vim.fn.exists('g:loaded_nvim_treesitter') == 1 then
                vim.cmd('TSEnable highlight')
            end

            -- 可选：设置wrap和换行符显示
            vim.opt_local.wrap = true
            vim.opt_local.linebreak = true
            vim.opt_local.conceallevel = 2
            end
        })

        -- 增强功能：复制预览页面URL
        vim.api.nvim_create_user_command('MkdpCopyUrl', function()
            local port = vim.g.mkdp_port or '8080'
            local filepath = vim.fn.expand('%:p')
            local url = 'http://localhost:' .. port .. '/?p=' .. vim.fn.fnameescape(filepath)

            -- 复制到系统剪贴板
            vim.fn.setreg('+', url)
            vim.notify('预览URL已复制: ' .. url, vim.log.levels.INFO)
        end, { desc = '复制Markdown预览URL' })
    end
}
