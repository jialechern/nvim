-- typst-preview.lua
return {
    'chomosuke/typst-preview.nvim',
    -- 在确定文件类型后构建
    event = 'FileType',
    version = '1.*', -- 使用最新主要版本
    build = function() -- 添加自动依赖检查
        local dependencies = { 'tinymist', 'websocat' }
        local missing = {}

        for _, dep in ipairs(dependencies) do
            if vim.fn.executable(dep) == 0 then
                table.insert(missing, dep)
            end
        end

        if #missing > 0 then
            vim.notify(
                'typst-preview 缺少依赖: ' .. table.concat(missing, ', ') .. '\n'
                .. '请通过 Mason 安装: :MasonInstall ' .. table.concat(missing, ' '),
                vim.log.levels.WARN
            )
        end
    end,
    keys = { -- 添加快捷键
        { '<leader>tp', '<cmd>TypstPreview<CR>', desc = '启动Typst预览' },
        { '<leader>tt', '<cmd>TypstPreviewToggle<CR>', desc = '切换Typst预览' },
        { '<leader>ts', '<cmd>TypstPreviewStop<CR>', desc = '停止Typst预览' },
        { '<leader>tr', '<cmd>TypstPreviewReload<CR>', desc = '重新加载预览' },
    },
    config = function()
            -- 设置插件配置
            require 'typst-preview'.setup {
                -- 调试模式：设为 true 会在日志文件中记录调试信息
                -- 日志路径: `vim.fn.stdpath 'data' .. '/typst-preview/log.txt'`
                debug = false,

                -- 自定义打开预览链接的命令格式，%s 会被替换为URL
                -- 示例: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
                -- open_cmd = 'firefox %s --new-window -P typst-preview --class typst-preview',
                open_cmd = 'google-chrome-stable --new-window %s',

                -- 预览服务器的端口号，0 表示随机端口
                port = 0,

                -- 颜色反转设置：
                -- 'never' 从不反转
                -- 'always' 总是反转（黑白互换）
                -- 'auto' 根据浏览器暗黑模式自动调整
                -- 也可分别设置图片和文本的反转: {rest = 'never', image = 'auto'}
                invert_colors = 'never',

                -- 是否在源文件中跟随光标位置
                follow_cursor = true,

                -- 依赖二进制路径（若已手动安装）
                -- 设置此项会跳过插件自动下载
                dependencies_bin = {
                    ['tinymist'] = nil, -- 设为路径如 '/usr/bin/tinymist'
                    ['websocat'] = nil
                },

                -- 传递给预览器的额外参数
                -- 示例: extra_args = { "--input=ver=draft", "--ignore-system-fonts" }
                extra_args = nil,

                -- 自定义项目根目录检测函数
                get_root = function(path_of_main_file)
                    -- 优先使用环境变量 TYPST_ROOT
                    local root = os.getenv 'TYPST_ROOT'
                    if root then
                        return root
                    end

                    -- 默认使用文件所在目录
                    return vim.fn.fnamemodify(path_of_main_file, ':p:h')
                end,

                -- 自定义主文件检测函数
                get_main_file = function(path_of_buffer)
                    -- 1. 如果当前文件是 typst 文件，直接使用
                    if vim.endswith(path_of_buffer, '.typ') then
                        return path_of_buffer
                    end

                    -- 2. 在项目根目录查找 main.typ
                    local root = require('typst-preview.util').get_root(path_of_buffer)
                    local main_file = root .. '/main.typ'
                    if vim.fn.filereadable(main_file) == 1 then
                        return main_file
                    end

                    -- 3. 使用当前文件
                    return path_of_buffer
                end,
            }

            -- 自动命令：保存时刷新预览
            vim.api.nvim_create_autocmd('BufWritePost', {
                pattern = '*.typ',
                callback = function()
                    pcall(vim.cmd, 'TypstPreviewReload')
                end
            })

            -- 自动命令：关闭缓冲区时停止预览
            vim.api.nvim_create_autocmd('BufDelete', {
                pattern = '*.typ',
                callback = function(args)
                    local bufnr = args.buf
                    local filepath = vim.api.nvim_buf_get_name(bufnr)
                    if require('typst-preview').is_running(filepath) then
                        vim.cmd('TypstPreviewStop')
                    end
                end
            })

            -- 自定义命令：复制预览URL
            vim.api.nvim_create_user_command('TypstCopyUrl', function()
                local preview = require('typst-preview')
                if not preview.is_running() then
                    vim.notify('预览未运行', vim.log.levels.WARN)
                    return
                end

                local port = preview.get_port()
                local url = 'http://localhost:' .. port
                vim.fn.setreg('+', url)
                vim.notify('预览URL已复制: ' .. url, vim.log.levels.INFO)
            end, { desc = '复制Typst预览URL' })
    end
}
