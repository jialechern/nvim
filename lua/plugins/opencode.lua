--- opencode.lua
--- OpenCode (nickjvandyke/opencode.nvim) AI 编码助手的 Neovim 集成配置
--- 官方文档: https://github.com/nickjvandyke/opencode.nvim
--- 配置项全集: https://github.com/nickjvandyke/opencode.nvim/blob/main/lua/opencode/config.lua
---
--- 架构说明:
---   本插件是一个轻量桥接层, 不替换 OpenCode 的 TUI,
---   而是将编辑器上下文(光标/选区/缓冲区/诊断等)通过 HTTP API 注入到 OpenCode,
---   并通过 autocmd 监听 OpenCode 的事件(编辑/权限/状态变化)。
---   你仍然在终端里运行 `opencode --port`, Neovim 是"遥控器"。

local M = {}

function M.setup()
    ---------------------------------------------------------------------------
    -- 1. 全局前置设置 (必须在 packadd 之前, 因为插件初始化时会读取 opts)
    ---------------------------------------------------------------------------

    --- autoread 是 events.reload 功能所必需的:
    ---   当 OpenCode 编辑了某个文件, Neovim 需要自动重新读取该缓冲区
    vim.o.autoread = true

    ---------------------------------------------------------------------------
    -- 2. 插件配置 (通过全局变量 vim.g.opencode_opts 传递给插件)
    --    配置项类型定义见: ---@type opencode.Opts
    ---------------------------------------------------------------------------

    ---@type opencode.Opts
    vim.g.opencode_opts = {

        -----------------------------------------------------------------------
        -- server: OpenCode 服务器连接配置
        --   OpenCode 通过 HTTP API 暴露服务, 必须用 --port 参数启动
        --   本插件会自动发现运行中的 OpenCode 实例, 或按 start 函数启动一个
        -----------------------------------------------------------------------
        server = {
            --- 指定服务器 URL (默认 nil = 自动发现 localhost 上运行中的实例)
            --- 格式: "http://host:port" (例如 "http://localhost:49369")
            --- 设为 nil 时, 插件扫描 ~/.opencode/ 下所有实例并自动连接
            url = nil,

            --- 服务器认证用户名 (默认读取环境变量 OPENCODE_SERVER_USERNAME)
            --- 未设置时回退为 "opencode"
            username = nil,

            --- 服务器认证密码 (默认读取环境变量 OPENCODE_SERVER_PASSWORD)
            password = nil,

            --- 启动函数: 当找不到运行中的 OpenCode 时自动调用
            --- 注意: 不要在启动阶段自动打开终端, 因为会中断窗口上下文,
            --- 导致后续加载的 keymaps 等注册到错误的缓冲区环境。
            --- 请先在外部终端运行 `opencode --port`, 然后 Neovim 会自动连接。
            --- 如果你想在 Neovim 中启动, 使用 :StartOpenCode 命令 (已注册在下方)。
            start = nil,
        },

        -----------------------------------------------------------------------
        -- contexts: 上下文占位符定义
        --   prompt 中的 @this / @buffer 等会被替换成对应的编辑器上下文
        --   每个占位符返回一个字符串(内容) 或 opencode.Context 表(path/from/to)
        -----------------------------------------------------------------------
        contexts = {
            --- @this: 当前选区(可视模式) 或光标位置(普通模式)
            ['@this'] = nil,        -- 使用内置实现
            --- @buffer: 当前缓冲区的完整内容
            ['@buffer'] = nil,      -- 使用内置实现
            --- @buffers: 所有已打开缓冲区的列表
            ['@buffers'] = nil,     -- 使用内置实现
            --- @diagnostics: 选区/当前缓冲区的诊断信息(错误/警告)
            ['@diagnostics'] = nil, -- 使用内置实现
            --- @marks: 全局标记位置
            ['@marks'] = nil,       -- 使用内置实现
            --- @quickfix: Quickfix 列表内容
            ['@quickfix'] = nil,    -- 使用内置实现
            --- @visible: 当前可见区域的文本
            ['@visible'] = nil,     -- 使用内置实现
            -- 自定义上下文示例:
            -- ['@git_diff'] = function()
            --     return vim.fn.system('git diff HEAD')
            -- end,
        },

        -----------------------------------------------------------------------
        -- ask: 交互式输入提示 (通过 vim.ui.input, 可选 snacks.input 增强)
        --   触发方式: require('opencode').ask("@this: ")
        --   在可视模式下会捕获选中文本作为 @this 的上下文
        -----------------------------------------------------------------------
        ask = {
            --- 输入框提示文字
            prompt = 'Ask OpenCode: ',

            --- 内置补全: 按 <Tab> 补全上下文占位符 (@this / @buffer 等)
            --- 使用 vim.ui.input 的 customlist 补全机制
            completion = 'customlist,v:lua.opencode_completion',

            --- 以下为 snacks.nvim 集成配置 (仅在安装 snacks 时生效)
            --- snacks 提供了更现代、更美观的输入框体验
            --- 详见: https://github.com/folke/snacks.nvim/blob/main/docs/input.md
            snacks = {
                -- 图标: 在输入提示左侧显示
                icon = '󰚩 ',
                win = {
                    -- 标题位置: 左对齐
                    title_pos = 'left',
                    -- 窗口相对位置: 相对于光标
                    relative = 'cursor',
                    -- 距离光标上方 3 行
                    row = -3,
                    -- 与光标列对齐
                    col = 0,
                    keys = {
                        -- <CR> 提交输入
                        i_cr = { desc = 'submit' },
                    },
                },
                -- 缓冲区选项
                b = {
                    --- 启用补全 (需要 blink.cmp 等补全插件的 LSP source 开启)
                    completion = true,
                },
                bo = {
                    --- 设置文件类型以触发特定的补全源配置
                    filetype = 'opencode_ask',
                },
                --- 缓冲区创建后的回调: 启动进程内 LSP 以提供上下文补全
                --- 这会让 blink.cmp 等补全引擎在输入框中显示 @this / @buffer 等补全项
                on_buf = function(win)
                    vim.lsp.start(require('opencode.ui.ask.cmp'), {
                        bufnr = win.buf,
                    })
                end,
            },
        },

        -----------------------------------------------------------------------
        -- select: 选择器 (通过 vim.ui.select, 可选 snacks.picker 增强)
        --   触发方式: require('opencode').select()
        --   提供 prompts (预定义提示词)、commands (控制命令)、servers (服务器) 三类选择
        -----------------------------------------------------------------------
        select = {
            --- 选择器标题
            prompt = 'OpenCode: ',

            -------------------------------------------------------------------
            -- prompts: 内置预定义提示词
            --   选择后自动发送到 OpenCode, 会自动注入对应的上下文
            --   以 "..." 结尾的提示词会打开 Ask 输入框让你补充内容
            -------------------------------------------------------------------
            prompts = {
                --- 打开 Ask 输入框, 不预设内容
                ask = '...',
                --- 解释诊断信息
                diagnostics = 'Explain @diagnostics',
                --- 为当前代码添加文档注释
                document = 'Add comments documenting @this',
                --- 解释当前代码及其上下文
                explain = 'Explain @this and its context',
                --- 修复诊断中报告的所有问题
                fix = 'Fix @diagnostics',
                --- 实现当前代码
                implement = 'Implement @this',
                --- 优化性能和可读性
                optimize = 'Optimize @this for performance and readability',
                --- 代码审查: 检查正确性和可读性
                review = 'Review @this for correctness and readability',
                --- 为当前代码添加测试
                test = 'Add tests for @this',
            },

            -------------------------------------------------------------------
            -- commands: OpenCode TUI 控制命令
            --   用于在不离开 Neovim 的情况下控制 OpenCode 会话
            -------------------------------------------------------------------
            commands = {
                -- Agent
                ['agent.cycle']       = '切换 Agent 代理',
                -- Prompt
                ['prompt.clear']      = '清空当前提示词',
                ['prompt.submit']     = '提交当前提示词',
                -- Session
                ['session.compact']   = '压缩当前会话(上下文过长时使用)',
                ['session.interrupt'] = '中断当前会话',
                ['session.new']       = '开启新会话',
                ['session.redo']      = '重做当前会话的最后一步',
                ['session.select']    = '选择要切换的会话',
                ['session.undo']      = '撤销当前会话的最后一步',
            },

            -------------------------------------------------------------------
            -- server: 服务器管理命令
            -------------------------------------------------------------------
            server = {
                ['server.select'] = '选择要连接的 OpenCode 服务器',
                ['server.start']  = '启动配置的服务器',
            },

            -------------------------------------------------------------------
            -- 以下为 snacks.picker 集成配置 (仅在安装 snacks 时生效)
            -------------------------------------------------------------------
            snacks = {
                --- 预览模式: snacks.picker 中预览选中项
                preview = 'preview',
                layout = {
                    --- 使用 VSCode 风格的布局
                    preset = 'vscode',
                    --- 默认隐藏预览窗口 (vim.ui.select 默认行为)
                    hidden = {},
                },
            },
        },

        -----------------------------------------------------------------------
        -- events: OpenCode SSE 事件处理
        --   插件将 OpenCode 的服务器事件转发为 Neovim 的 User autocmd
        --   事件类型: OpencodeEvent:<type> (例如 OpencodeEvent:session.status)
        -----------------------------------------------------------------------
        events = {
            --- 是否启用事件系统 (设为 false 则完全禁用)
            enabled = true,

            --- 自动 reload: 当 OpenCode 编辑了某文件, 自动重新加载对应的 buffer
            --- 前置条件: vim.o.autoread = true (已在 setup 开头设置)
            reload = true,

            -------------------------------------------------------------------
            -- permissions: 权限审批
            --   当 OpenCode 请求执行某项操作(如编辑文件), 插件弹出审批窗口
            -------------------------------------------------------------------
            permissions = {
                --- 是否启用权限审批
                enabled = true,

                -------------------------------------------------------------------
                -- edits: 编辑请求的 diff 审查
                --   OpenCode 请求修改文件时, 在新标签页中打开 diff 对比视图
                --   diff 视图中的快捷键 (仅在编辑审查期间生效):
                --     da     - 接受所有修改
                --     dr     - 拒绝所有修改
                --     ]c/[c  - 跳转到下一个/上一个差异块
                --     dp     - 只接受光标下的差异块(其余拒绝)
                --     do     - 只拒绝光标下的差异块(其余拒绝)
                --     q      - 关闭 diff 视图
                --   可通过 'diffopt' 自定义 diff 显示行为
                -------------------------------------------------------------------
                edits = {
                    --- 是否启用编辑 diff 审查
                    enabled = true,
                },
            },
        },
    }

    ---------------------------------------------------------------------------
    -- 3. 加载插件
    ---------------------------------------------------------------------------
    vim.cmd.packadd('opencode.nvim')

    ---------------------------------------------------------------------------
    -- 4. 注册手动启动 OpenCode 的用户命令
    --    用于在 Neovim 中通过垂直分屏打开 OpenCode 终端
    ---------------------------------------------------------------------------
    vim.api.nvim_create_user_command('StartOpenCode', function()
        vim.cmd('vsplit term://opencode --port | wincmd p')
    end, { desc = '垂直分屏启动 OpenCode (带 --port 暴露 HTTP API)' })

    ---------------------------------------------------------------------------
    -- 5. 集成到 lualine.nvim 状态栏
    --    在状态栏右侧(z 区)最前面显示 OpenCode 服务器名称和连接状态
    --    未连接时不显示任何内容
    ---------------------------------------------------------------------------
    local has_lualine_config, lualine_config = pcall(require, 'lualine.config')
    if has_lualine_config and lualine_config.sections and lualine_config.sections.lualine_z then
        local has_opencode, opencode = pcall(require, 'opencode')
        if has_opencode and opencode.statusline then
            -- 插入到 lualine_z 最前面 (在列/行位置信息之前)
            table.insert(lualine_config.sections.lualine_z, 1, {
                opencode.statusline,
            })
            -- 触发 lualine 刷新, 使新增组件生效
            local has_lualine, lualine = pcall(require, 'lualine')
            if has_lualine and lualine.refresh then
                vim.schedule(function()
                    lualine.refresh()
                end)
            end
        end
    end

    ---------------------------------------------------------------------------
    -- 6. 快捷键映射
    --    使用 <leader> 前缀, 实际按下的键取决于你的 mapleader (当前: "/")
    --    你可以在熟悉后自行调整这些快捷键
    ---------------------------------------------------------------------------
    local map = require('utils.map').map

    -- Ask: 打开提示词输入框, 自动带 @this 上下文(选区或光标位置)
    map({ 'n', 'x' }, '<leader>oa', function()
        require('opencode').ask('@this: ')
    end, { desc = '询问 OpenCode (带当前上下文)' })

    -- Select: 打开选择器, 可选择提示词/命令/服务器
    map({ 'n', 'x' }, '<leader>os', function()
        require('opencode').select()
    end, { desc = 'OpenCode 选择器 (提示词/命令/服务器)' })

    -- Operator: 将范围(如 motion)作为上下文发送给 OpenCode
    --   用法: <leader>oo + motion (如 <leader>ooip = 将整个段落作为上下文)
    --   支持 . (dot-repeat) 重复操作
    map({ 'n', 'x' }, '<leader>oo', function()
        return require('opencode').operator('@this ')
    end, { desc = '将范围发送给 OpenCode (操作符)', expr = true })

    -- Operator (单行版): 操作当前行
    map('n', '<leader>ol', function()
        return require('opencode').operator('@this ') .. '_'
    end, { desc = '将当前行发送给 OpenCode', expr = true })

    -- 快速发送 Ask 不带预设前缀 (直接打开空输入框)
    map({ 'n', 'x' }, '<leader>oA', function()
        require('opencode').ask()
    end, { desc = '询问 OpenCode (空白输入框)' })

    -- --- OpenCode 会话滚动控制 ---
    --   这些快捷键让你在不离开 Neovim 的情况下滚动 OpenCode TUI 的消息

    -- 向上滚动半页
    map('n', '<leader>ou', function()
        require('opencode').command('session.half.page.up')
    end, { desc = 'OpenCode 向上滚动半页' })

    -- 向下滚动半页
    map('n', '<leader>od', function()
        require('opencode').command('session.half.page.down')
    end, { desc = 'OpenCode 向下滚动半页' })

    -- 向上滚动整页
    map('n', '<leader>oU', function()
        require('opencode').command('session.page.up')
    end, { desc = 'OpenCode 向上滚动整页' })

    -- 向下滚动整页
    map('n', '<leader>oD', function()
        require('opencode').command('session.page.down')
    end, { desc = 'OpenCode 向下滚动整页' })

    -- --- OpenCode 会话管理 ---

    -- 开启新会话 (清空历史, 开始新的对话)
    map('n', '<leader>on', function()
        require('opencode').command('session.new')
    end, { desc = 'OpenCode 开启新会话' })

    -- 中断当前会话 (停止 AI 正在生成的回复)
    map('n', '<leader>oi', function()
        require('opencode').command('session.interrupt')
    end, { desc = 'OpenCode 中断当前会话' })

    -- 压缩当前会话 (上下文过长时使用, 让 AI 总结后重开)
    map('n', '<leader>oc', function()
        require('opencode').command('session.compact')
    end, { desc = 'OpenCode 压缩会话上下文' })

    -- 撤销上一步操作
    map('n', '<leader>oz', function()
        require('opencode').command('session.undo')
    end, { desc = 'OpenCode 撤销上一步' })

    -- 重做被撤销的操作
    map('n', '<leader>oZ', function()
        require('opencode').command('session.redo')
    end, { desc = 'OpenCode 重做' })

    --- 选择会话 (在多会话之间切换)
    map('n', '<leader>oS', function()
        require('opencode').command('session.select')
    end, { desc = 'OpenCode 选择/切换会话' })

    -- --- Agent 代理控制 ---

    -- 切换 Agent (OpenCode 支持 build/plan 等多种 Agent 模式)
    map('n', '<leader>ot', function()
        require('opencode').command('agent.cycle')
    end, { desc = 'OpenCode 切换 Agent 代理' })

    -- 手动启动 OpenCode (垂直分屏打开终端)
    map('n', '<leader>o<CR>', function()
        vim.cmd('StartOpenCode')
    end, { desc = '在 Neovim 中启动 OpenCode' })

    ---------------------------------------------------------------------------
    -- 7. OpenCode 事件监听示例 (已注释, 可按需启用)
    --    监听 OpenCode 的 SSE 事件, 做自定义响应
    --    事件以 User autocmd 方式触发, pattern 格式: OpencodeEvent:<type>
    ---------------------------------------------------------------------------

    -- -- 示例: 当用户提交提示词时, 自动弹出通知
    -- vim.api.nvim_create_autocmd('User', {
    --     pattern = { 'OpencodeEvent:*' },
    --     callback = function(args)
    --         ---@type opencode.server.Event
    --         local event = args.data.event
    --         ---@type string
    --         local url = args.data.url
    --
    --         -- 可监听的事件类型(部分):
    --         --   session.created   - 会话创建
    --         --   session.status    - 会话状态变化(idle/busy/error等)
    --         --   session.updated   - 会话更新(新消息)
    --         --   file.watch        - 文件被 OpenCode 修改
    --         --   tui.command.execute - TUI 命令执行(prompt.submit等)
    --         --   permission.request - 权限请求
    --
    --         if event.type == 'session.status' then
    --             local status = event.properties.status
    --             vim.notify(
    --                 ('OpenCode 状态: %s (会话: %s)')
    --                     :format(status.type, event.properties.session_id),
    --                 vim.log.levels.INFO,
    --                 { title = 'OpenCode' }
    --             )
    --         end
    --     end,
    -- })
end

return M
