-- =============================================================================
-- ruff.lua —— Ruff Language Server 配置
--
-- 依赖:
--   - Neovim >= 0.11(使用 vim.lsp.config / vim.lsp.enable 原生接口)
--   - ruff >= 0.5.3(推荐安装最新版, 可通过 Mason 或 pip/pipx 安装)
--
-- 启用方式(在 init.lua 或其他入口文件里调用):
--   vim.lsp.enable('ruff')
--   -- 或者已有的封装：
--   require('utils.lsp_enable').enable('ruff')
--
-- 注意: ruff 仅提供 lint / format / code action, 不提供补全和 hover
--       请同时启用 basedpyright（或 pyright）作为补全/类型检查的 LSP
-- =============================================================================

---@type vim.lsp.Config
return {
  -- -------------------------------------------------------------------------
  -- 服务器启动命令
  -- ruff 内置 LSP server(自 v0.4.0 起不再需要 ruff-lsp 包), 直接调用即可
  -- -------------------------------------------------------------------------
  cmd = { "ruff", "server" },

  -- -------------------------------------------------------------------------
  -- 适用的文件类型
  -- -------------------------------------------------------------------------
  filetypes = { "python" },

  -- -------------------------------------------------------------------------
  -- 项目根目录标记
  -- ruff 会从这些文件向上查找 pyproject.toml / ruff.toml
  -- -------------------------------------------------------------------------
  root_markers = {
    "pyproject.toml",
    "ruff.toml",
    ".ruff.toml",
    "setup.py",
    "setup.cfg",
    ".git",
  },

  -- -------------------------------------------------------------------------
  -- 初始化选项(所有 ruff LSP 专属设置均放在 init_options.settings 下)
  -- 参考文档: https://docs.astral.sh/ruff/editors/settings/
  -- -------------------------------------------------------------------------
  init_options = {
    settings = {

      -- -----------------------------------------------------------------------
      -- [配置策略] configurationPreference
      -- 控制编辑器设置与项目配置文件(pyproject.toml / ruff.toml)的优先级
      --   "editorFirst"    : 编辑器设置优先（默认值）
      --   "filesystemFirst": 项目配置文件优先
      --   "editorOnly"     : 完全忽略项目配置文件，仅使用编辑器设置
      -- -----------------------------------------------------------------------
      configurationPreference = "filesystemFirst",

      -- -----------------------------------------------------------------------
      -- [行长度] lineLength
      -- linter 和 formatter 共用的行长度限制, 默认为 88
      -- 若项目 pyproject.toml 中已设置, filesystemFirst 模式下会被项目配置覆盖
      -- -----------------------------------------------------------------------
      lineLength = 88,

      -- -----------------------------------------------------------------------
      -- [显示语法错误] showSyntaxErrors
      -- 是否在诊断中显示 Python 语法错误
      -- 默认 true, 建议保留
      -- -----------------------------------------------------------------------
      showSyntaxErrors = true,

      -- -----------------------------------------------------------------------
      -- [自动修复所有] fixAll
      -- 是否注册 source.fixAll code action
      -- 默认 true
      -- -----------------------------------------------------------------------
      fixAll = true,

      -- -----------------------------------------------------------------------
      -- [自动整理 import] organizeImports
      -- 是否注册 source.organizeImports code action(整理/排序 import 语句)
      -- 默认 true
      -- -----------------------------------------------------------------------
      organizeImports = true,

      -- -----------------------------------------------------------------------
      -- [日志级别] logLevel
      -- ruff server 的日志级别, 日志写入 stderr(可通过 :lua vim.print(vim.lsp.get_log_path()) 查看)
      --   可选: "trace" | "debug" | "info" | "warn" | "error"
      -- 日常使用推荐 "warn", 排查问题时改为 "debug"
      -- -----------------------------------------------------------------------
      logLevel = "warn",

      -- -----------------------------------------------------------------------
      -- [Code Action 设置]
      -- -----------------------------------------------------------------------
      codeAction = {
        -- 是否显示「通过 noqa 注释禁用规则」的 Quick Fix
        -- 默认 true，保留可让你快速在某行添加 # noqa: EXXX 注释
        disableRuleComment = {
          enable = true,
        },
        -- 是否显示「修复当前 lint 违规」的 Quick Fix
        -- 默认 true
        fixViolation = {
          enable = true,
        },
      },

      -- -----------------------------------------------------------------------
      -- [Lint 设置]
      -- -----------------------------------------------------------------------
      lint = {
        -- 启用 lint(设为 false 则 ruff 仅作为 formatter 运行)
        enable = true,

        -- 启用 preview 模式(包含尚未稳定的实验性规则)
        -- 个人项目可酌情开启, 团队项目谨慎使用
        preview = false,

        -- 要启用的规则集(替换默认规则集 ["E", "F"])
        -- 注意: 此处若配置了 select, 会覆盖项目 pyproject.toml 中的 select
        --       filesystemFirst 策略下, 项目配置优先, 故此处注释掉让项目配置生效
        --       如需强制全局默认, 取消注释并按需调整
        --
        -- select = { "E", "F", "W", "I", "UP", "B", "C4", "RUF" },

        -- 在 select 基础上额外追加的规则(不替换, 而是追加)
        -- extendSelect = { "TID251" },

        -- 要忽略的规则。
        -- ignore = { "E501" },  -- 例如: 忽略行长度检查(如果用 formatter 控制)
      },

      -- -----------------------------------------------------------------------
      -- [Format 设置]
      -- -----------------------------------------------------------------------
      format = {
        -- 启用 formatter 的 preview 模式(包含实验性格式化行为)
        preview = false,
      },
    },
  },

  -- -------------------------------------------------------------------------
  -- on_attach: 当 ruff 连接到 buffer 时执行的回调
  -- -------------------------------------------------------------------------
  on_attach = function(client, bufnr)
    -- ruff 不提供 hover(悬停文档), 禁用以避免与 basedpyright 冲突
    -- basedpyright 会提供 hover 信息
    client.server_capabilities.hoverProvider = false

    -- [保存时自动格式化]
    -- 使用 ruff 的 LSP formatter 在保存前自动格式化 Python 文件
    -- 若使用 conform.nvim 等专用格式化插件, 请删除此块, 在 conform 中配置
    if client:supports_method("textDocument/formatting") then
      local fmt_group = vim.api.nvim_create_augroup(
        "ruff_format_on_save_" .. bufnr,
        { clear = true }
      )
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = fmt_group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            -- 指定只用 ruff 格式化, 避免多个 LSP 冲突
            filter = function(c) return c.name == "ruff" end,
            bufnr = bufnr,
            async = false,   -- 同步执行, 确保保存前格式化完成
            timeout_ms = 3000,
          })
        end,
        desc = "Ruff: 保存时自动格式化",
      })
    end

    -- [可选] 绑定快捷键: 手动触发整理 import
    -- <leader>ri : 整理 import(Organize Imports)
    vim.keymap.set("n", "<leader>ri", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" }, diagnostics = {} },
        apply = true,   -- 自动应用唯一可用的 action
      })
    end, { buffer = bufnr, desc = "Ruff: 整理 Import" })

    -- [可选] 绑定快捷键: 一键修复所有可自动修复的 lint 错误
    -- <leader>rf : Fix All
    vim.keymap.set("n", "<leader>rf", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.fixAll" }, diagnostics = {} },
        apply = true,
      })
    end, { buffer = bufnr, desc = "Ruff: 修复所有 Lint 错误" })
  end,
}
