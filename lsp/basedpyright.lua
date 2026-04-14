-- =============================================================================
-- basedpyright.lua —— basedpyright Language Server 配置(Neovim 0.11+ 原生 LSP 接口)
-- 放置路径: <nvim-config-dir>/lsp/basedpyright.lua
--
-- 依赖:
--   - Neovim >= 0.11(使用 vim.lsp.config / vim.lsp.enable 原生接口)
--   - basedpyright（推荐通过 Mason 或 pipx/pip 安装）
--       Mason:  :MasonInstall basedpyright
--       pipx:   pipx install basedpyright
--
-- 启用方式(在 init.lua 或其他入口文件里调用):
--   vim.lsp.enable('basedpyright')
--   -- 或已有的封装：
--   require('utils.lsp_enable').enable('basedpyright')
--
-- 搭配说明:
--   basedpyright 负责: 类型检查、补全、hover 文档、跳转定义、查引用、重命名等
--   ruff          负责: lint、format、import 整理(见 lsp/ruff.lua)
--   两者职责互补, 不冲突
-- =============================================================================

-- -------------------------------------------------------------------------
-- 辅助函数: 执行 basedpyright 的 workspace/executeCommand 命令
-- -------------------------------------------------------------------------

--- 整理当前 buffer 的 import 语句(basedpyright 内置命令)
--- 注意: 已配置 disableOrganizeImports = true,
---       日常 import 整理交由 ruff 处理, 此函数作为备用保留
local function organize_imports()
    local params = {
        command = "basedpyright.organizeimports",
        arguments = { vim.uri_from_bufnr(0) },
    }
    local clients = vim.lsp.get_clients({
        bufnr = vim.api.nvim_get_current_buf(),
        name = "basedpyright",
    })
    for _, client in ipairs(clients) do
        client.request("workspace/executeCommand", params, nil, 0)
    end
end

--- 动态设置当前 buffer 使用的 Python 解释器路径
--- 用法: require('lsp.basedpyright').set_python_path('/path/to/python')
--- 或在命令模式调用: :lua require('lsp.basedpyright').set_python_path(...)
local function set_python_path(path)
    local clients = vim.lsp.get_clients({
        bufnr = vim.api.nvim_get_current_buf(),
        name = "basedpyright",
    })
    for _, client in ipairs(clients) do
        if client.settings then
            client.settings.python = vim.tbl_deep_extend(
                "force",
                client.settings.python or {},
                { pythonPath = path }
            )
        else
            client.config.settings = vim.tbl_deep_extend(
                "force",
                client.config.settings,
                { python = { pythonPath = path } }
            )
        end
        client.notify("workspace/didChangeConfiguration", { settings = nil })
    end
end

-- -------------------------------------------------------------------------
-- 导出辅助函数, 方便外部调用
-- -------------------------------------------------------------------------
-- 若需要从其他地方调用上述函数, 可以这样用:
--   local bp = loadfile(vim.fn.stdpath('config') .. '/lsp/basedpyright.lua')
-- 但更推荐直接在 on_attach 里用 vim.api.nvim_create_user_command 暴露命令（见下方）

---@type vim.lsp.Config
return {
    -- -------------------------------------------------------------------------
    -- 服务器启动命令
    -- basedpyright 安装后提供 basedpyright-langserver 可执行文件
    -- -------------------------------------------------------------------------
    cmd = { "basedpyright-langserver", "--stdio" },

    -- -------------------------------------------------------------------------
    -- 适用的文件类型
    -- -------------------------------------------------------------------------
    filetypes = { "python" },

    -- -------------------------------------------------------------------------
    -- 项目根目录标记(从当前文件向上查找，第一个命中的目录作为 workspace root)
    -- 嵌套列表表示同等优先级(任一命中即可)
    -- -------------------------------------------------------------------------
    root_markers = {
        { "pyproject.toml", "pyrightconfig.json" }, -- 最优先: 有明确配置文件的项目
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        "Pipfile",
        ".git", -- 兜底: git 仓库根目录
    },

    -- -------------------------------------------------------------------------
    -- LSP 能力声明(capabilities)
    -- 告知服务器客户端支持哪些功能, basedpyright 会根据此激活
    -- -------------------------------------------------------------------------
    capabilities = (function()
        -- 基础能力(Neovim 内置)
        local caps = vim.lsp.protocol.make_client_capabilities()

        -- 启用 snippet 支持(让补全候选可以包含 snippet, 如函数参数占位符)
        caps.textDocument.completion.completionItem.snippetSupport = true

        -- 启用 preselectSupport(允许服务器预选某个补全候选)
        caps.textDocument.completion.completionItem.preselectSupport = true

        -- 启用 insertReplaceSupport(区分「插入」和「替换」两种补全模式)
        caps.textDocument.completion.completionItem.insertReplaceSupport = true

        -- 启用 labelDetailsSupport(补全项可以显示额外的类型/来源信息)
        caps.textDocument.completion.completionItem.labelDetailsSupport = true

        -- 启用 deprecatedSupport(补全中的废弃符号会有特殊标记)
        caps.textDocument.completion.completionItem.deprecatedSupport = true

        -- 启用 commitCharactersSupport(允许通过特定字符如 '(' 确认补全)
        caps.textDocument.completion.completionItem.commitCharactersSupport = true

        -- 启用 tagSupport(支持「废弃」标签, 编辑器会对废弃符号加删除线)
        caps.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }

        -- 启用 resolveSupport(补全候选的详细信息可以按需懒加载, 减少初始响应体积)
        caps.textDocument.completion.completionItem.resolveSupport = {
            properties = { "documentation", "detail", "additionalTextEdits" },
        }

        -- 启用 semanticTokensProvider(语义高亮, basedpyright 支持此功能)
        -- basedpyright 移植了 pylance 的语义高亮, 比纯 treesitter 更准确
        caps.textDocument.semanticTokens = {
            multilineTokenSupport = true,
            overlappingTokenSupport = true,
        }

        return caps
    end)(),

    -- -------------------------------------------------------------------------
    -- 服务器设置(settings)
    -- basedpyright 的设置通过 settings.basedpyright 传递
    -- 参考文档: https://docs.basedpyright.com/latest/configuration/language-server-settings/
    -- -------------------------------------------------------------------------
    settings = {
        basedpyright = {

            -- -----------------------------------------------------------------------
            -- [禁用 import 整理]
            -- 我们使用 ruff 来整理 import，禁用 basedpyright 的该功能避免重复/冲突。
            -- 参考: https://docs.astral.sh/ruff/editors/setup/#pyright (官方推荐配置)
            -- -----------------------------------------------------------------------
            disableOrganizeImports = true,

            -- -----------------------------------------------------------------------
            -- [禁用标记提示] disableTaggedHints
            -- 控制是否显示「grayed out(变灰)」或「strikethrough(删除线)」样式的 hint
            -- 这些 hint 用于标记: 未使用的符号(变灰)、废弃的功能(删除线)
            -- 设为 false(默认)保留这些视觉提示, 有助于发现问题代码
            -- -----------------------------------------------------------------------
            disableTaggedHints = false,

            analysis = {
                -- ---------------------------------------------------------------------
                -- [诊断模式] diagnosticMode
                -- "openFilesOnly": 只对当前打开的文件进行分析(速度快, 适合大项目)
                -- "workspace"    : 分析整个工作区(更全面, 但对大项目可能较慢)
                -- 个人项目推荐 "workspace" 以获得完整的跨文件类型检查
                -- ---------------------------------------------------------------------
                diagnosticMode = "workspace",

                -- ---------------------------------------------------------------------
                -- [类型检查模式] typeCheckingMode
                -- "off"         : 关闭所有类型检查, 只做语法分析
                -- "basic"       : 基础检查(pyright 默认值)
                -- "standard"    : 标准检查(较均衡, pyright 推荐)
                -- "strict"      : 严格检查
                -- "recommended" : basedpyright 默认值，比 strict 更全面(启用所有规则为 warn/error)
                -- "all"         : 启用所有规则为 error 级别(最严格)
                -- 个人项目推荐从 "standard" 开始, 稳定后逐步提升到 "recommended"
                -- 若有 pyproject.toml / pyrightconfig.json, 该文件中的设置优先
                -- ---------------------------------------------------------------------
                typeCheckingMode = "standard",

                -- ---------------------------------------------------------------------
                -- [自动搜索路径] autoSearchPaths
                -- 自动将 "src" 等常见目录添加到搜索路径(当没有明确执行环境配置时)
                -- 默认 true, 保留
                -- ---------------------------------------------------------------------
                autoSearchPaths = true,

                -- ---------------------------------------------------------------------
                -- [使用库源码推断类型] useLibraryCodeForTypes
                -- 当没有类型 stub 文件时, 读取库的源码来推断类型信息
                -- 推断结果可能不完整, 但好过完全没有. 默认 true, 保留
                -- ---------------------------------------------------------------------
                useLibraryCodeForTypes = true,

                -- ---------------------------------------------------------------------
                -- [自动补全 import] autoImportCompletions
                -- 在补全列表中显示可自动插入 import 的候选(补全时自动添加 import 语句)
                -- 默认 true, 保留
                -- ---------------------------------------------------------------------
                autoImportCompletions = true,

                -- ---------------------------------------------------------------------
                -- [Inlay Hints] 内嵌提示(basedpyright 专属特性, 移植自 pylance)
                -- 在编辑器中以灰色小字显示类型推断信息, 无需 hover 即可看到类型
                -- 需要编辑器/插件支持(Neovim 通过 vim.lsp.inlay_hint 支持)
                -- ---------------------------------------------------------------------
                inlayHints = {
                    -- 变量赋值处显示推断的变量类型, 例如: x = 1  →  x: int = 1
                    variableTypes = true,

                    -- 函数调用处显示参数名, 例如: foo(1, 2)  →  foo(a=1, b=2)
                    callArgumentNames = true,

                    -- 函数定义处显示推断的返回类型, 例如: def f():  →  def f() -> int:
                    functionReturnTypes = true,

                    -- 泛型类型参数处显示推断的具体类型(较为嘈杂, 默认关闭)
                    genericTypes = false,
                },

                -- ---------------------------------------------------------------------
                -- [日志级别] logLevel
                -- 控制 basedpyright 输出到 Output Panel 的日志级别。
                -- "Error" | "Warning" | "Information" | "Trace"
                -- 日常使用推荐 "Warning", 排查问题时改为 "Trace"
                -- ---------------------------------------------------------------------
                logLevel = "Warning",
            },
        },

        -- -------------------------------------------------------------------------
        -- python.* 设置(兼容 pyright 的通用 Python 环境设置)
        -- 注意: basedpyright 会自动检测 .venv, 通常不需要手动指定
        -- 若自动检测失败(如使用非标准路径的 venv), 取消注释并填入路径
        -- -------------------------------------------------------------------------
        python = {
            -- pythonPath 指定 Python 解释器路径
            -- basedpyright 默认优先检测 .venv/bin/python(推荐使用 uv/venv 创建标准结构)
            pythonPath = vim.fn.exepath("python3"),   -- 使用 $PATH 中的 python3(不推荐)
            -- pythonPath = ".venv/bin/python",           -- 使用项目本地 venv(相对路径)

            -- venvPath 配合 venv 一起指定 venv 目录，basedpyright 不推荐此方式
            -- 建议直接用 pythonPath 或依赖自动检测。
            -- venvPath = vim.fn.expand("~/.venvs"),
            -- venv = "myproject",
        },
    },

    -- -------------------------------------------------------------------------
    -- on_attach: 当 basedpyright 连接到 buffer 时执行的回调
    -- -------------------------------------------------------------------------
    on_attach = function(client, bufnr)
        -- -----------------------------------------------------------------------
        -- [Inlay Hints] 启用内嵌提示
        -- 需要 Neovim >= 0.10 且 basedpyright 支持 inlayHintProvider。
        -- 可通过 vim.lsp.inlay_hint.enable(false, { bufnr = bufnr }) 随时关闭。
        -- -----------------------------------------------------------------------
        if client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end

        -- -----------------------------------------------------------------------
        -- [用户命令] 注册 buffer 局部命令, 方便日常使用
        -- -----------------------------------------------------------------------

        -- :BasedpyrightOrganizeImports —— 调用 basedpyright 整理 import
        -- (通常交给 ruff 处理, 此命令作为备用)
        vim.api.nvim_buf_create_user_command(bufnr, "BasedpyrightOrganizeImports", function()
            organize_imports()
        end, { desc = "basedpyright: 整理 Import（备用，通常由 ruff 负责）" })

        -- :BasedpyrightSetPythonPath <path> —— 动态切换 Python 解释器
        -- 例: :BasedpyrightSetPythonPath /home/user/.venvs/myproject/bin/python
        vim.api.nvim_buf_create_user_command(bufnr, "BasedpyrightSetPythonPath", function(args)
            set_python_path(args.args)
        end, {
            nargs = 1,
            complete = "file",
            desc = "basedpyright: 设置 Python 解释器路径",
        })
    end,
}
