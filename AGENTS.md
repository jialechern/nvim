# AGENTS.md

个人 Neovim 配置(Lua, 约 2.5k 行 / 65 个文件)。无 lint / format / 测试 / CI / 构建步骤, 验证即"加载配置不报错"。

## 硬性前提

- 需要 Neovim >= 0.12(`vim.lsp.config`、`vim.lsp.completion`、`vim.snippet`、`vim.treesitter.start`、`winborder`); 本机为 0.12.5。
- 不要引入 lazy.nvim / packer / Mason 等插件管理器: **插件由 nix(home-manager 的 `programs.neovim.plugins`)声明**, 懒加载靠 `packadd`(见下); LSP 二进制也由 home-manager 安装, 不在编辑器内装。
- 仓库里不再有插件清单与 lockfile(`nvim-pack-lock.json` 已随 vim.pack 一起移除, 不要加回); `.pi/` 已 gitignore。

## 部署链路: 改完不等于生效

配置**直接从工作区加载**(实测 `nvim` 的 runtimepath 第一项就是 `~/.config/nvim`), 所以改完 Lua 重启 nvim 即生效。

- 插件是例外: 插件目录由 nix 声明并挂到 `~/.local/share/nvim/site/pack/hm/{start,opt}`, 新增/删除/改名插件必须改 `/etc/nixos` 里的 `programs.neovim.plugins` 并 rebuild, 仓库侧的 `packadd` 才能找到它们。
- 仓库仍是 gitee flake input(`nvim-dotfiles`)的源: 若在别处用 NixOS 部署本配置, 仍走 提交 → `git push`(gitee main) → `nix flake update nvim-dotfiles` → `home-manager switch`; 后两步是系统级/不可逆操作, 只在用户明确要求时执行。
- 在工作区直接跑 `nvim` 会写线上 `~/.local/share/nvim`(treesitter parser 等), 别用它当"临时沙箱"。

## 验证(已在当前工作区跑通, 均不联网、不改线上)

```bash
# 1) 全部 Lua 文件语法检查(最快, 不加载配置) → 期望输出 failures=0
nvim --headless -u NONE -c 'lua local bad=0 for _,f in ipairs(vim.fn.glob("**/*.lua", false, true)) do local fn,e=loadfile(f) if not fn then bad=bad+1 io.write("FAIL "..f..": "..tostring(e).."\n") end end io.write("failures="..bad.."\n")' -c 'qa!'

# 2) 不加载插件地加载仓库(覆盖 settings/ keymaps/ snippets 的 require 链, 退出码应为 0)
nvim --headless --noplugin --cmd "set rtp^=$PWD" -u "$PWD/init.lua" -c 'qa!'

# 3) 完整加载(含 nix 提供的插件; packadd 名写错会在这一步以 require 失败暴露, 退出码应为 0)
nvim --headless -u "$PWD/init.lua" --cmd "set rtp^=$PWD" -c 'qa!'

# 4) 快捷键自检 → 期望输出 keymap problems=0
nvim --headless -u "$PWD/init.lua" --cmd "set rtp^=$PWD" -c 'lua local p=require("utils.map").check() io.write("keymap problems="..#p.."\n") for _,s in ipairs(p) do io.write(s.."\n") end' -c 'qa!'

# 5) 核对 nix 侧插件目录名(packadd 认的是目录名, 不是 nixpkgs 属性名)
ls -1 ~/.local/share/nvim/site/pack/hm/opt

# 6) 离线类型检查 → 期望 no problems found(不带 VIMRUNTIME 时运行时类型会解析不到)
export VIMRUNTIME=$(nvim --headless -u NONE -c 'lua io.write(vim.fn.expand("$VIMRUNTIME"))' -c 'qa!')
lua-language-server --check=. --checklevel=Warning
```

`-u "$PWD/init.lua" --cmd "set rtp^=$PWD"` 是"用工作区代码启动"的通用姿势; 漏掉 `rtp` 前置会让 `require()` 全部落到线上配置。

## 结构与加载顺序

- `init.lua` → `require('settings')` → (`vim.o.loadplugins` 为真时)`require('plugins')` → `require('keymaps')`。
- `lua/settings.lua`: 顺序有意义, `settings.lsp` **必须最先**(否则错过 `LspAttach`); 无插件时(`loadplugins` 为假, 即 `-u NONE` / `--noplugin`)才走 `settings.transparency`。
- 插件三步接入: 在 `/etc/nixos` 的 `programs.neovim.plugins` 里声明(懒加载写 `{ plugin = <包>; optional = true; }`, 进 `pack/hm/opt`; 直接写包名则进 `start`, 启动即加载) → 新建 `lua/plugins/<name>.lua`(**被 require 时直接执行**: 先 `vim.cmd.packadd('<目录名>')` 再配置; 不写 `setup()` 壳, 也没有 `local M`/`return M`) → 在 `lua/plugins.lua` 里按顺序加一行 `require('plugins.<name>')`。那里的顺序就是加载顺序(直接执行, 所以不要随手挪动)。
  - `packadd` 认**目录名**(通常是插件仓库名, 如 `lualine.nvim`、`mini.snippets`), 与 nixpkgs 属性名(`lualine-nvim`、`mini-snippets`)不一定相同; 名字对不上时 `:packadd` 是静默失败, 只会在后续 `require` 时报错。核对方法(nix 侧 opt 目录列表)写在 `lua/plugins.lua` 头部。
  - 插件的编译与运行期依赖(jsregexp、fzf 二进制、treesitter grammar 等)全部由 nix 负责, 仓库里不再有 build 钩子。
- LSP: 服务器样板由 **`nvim-lspconfig`** 提供(上游 `lsp/` 目录里的 `cmd`/`filetypes`/`root_markers`), 在 `lua/plugins/nvim-lspconfig.lua` 里 `packadd` + `vim.lsp.enable(servers)` 统一启用 —— 旧的 `lsp/<name>.lua` 目录与 `after/ftplugin/*` 里逐文件类型启用的写法(以及 `lua/utils/lsp_enable.lua`)已删除。要覆盖上游配置一律写 `after/lsp/<server>.lua`(优先级: 上游 `lsp/` → 你的 `after/lsp/` → `vim.lsp.config()`), **不要**再建 `lsp/` 与上游同名竞争。新增语言: 上游有配置 → 把服务器名加进 `lua/plugins/nvim-lspconfig.lua` 的 `servers` 表 + 在 `settings/filetype.lua` 里做扩展名映射; 上游没有 → 自己写 `after/lsp/<name>.lua`(文件名即服务器名)。
  - `guile_ls` 只能在带点子类型 `scheme.guile` 上启动, 所以 `settings/filetype.lua` 把 `.scm`/`.guile` 映射为 `scheme.guile`(通用的 `scheme` ftplugin 依然会加载, 实测有效)。
- 类型解析与 LSP 配置无关: `lua_ls` 认识 `vim.*` 靠仓库根 `.luarc.json` 的 `workspace.library`(`${env:VIMRUNTIME}/lua`); 该变量由 nvim 自己设置, 命令行离线复检时才需要 `export VIMRUNTIME`。
- 键位与描述单一来源: 每个 `lua/keys/<命名空间>.lua` 导出 Hash Map(字段名 snake_case, 领头键以 `<名字>_leader` 字段放在同一张表), 每个按键是 `KeySpec = { lhs, desc, modes? }`(`modes` 缺省 `'n'`), 类型定义在 `lua/keys/types.lua`。使用处 `local keys = require('keys.<命名空间>')`, 用 `map(keys.<字段>, rhs[, opts])` 注册(变量名统一用 `keys`, 不要用单字母缩写)。
  - `lua/keymaps/*`(通用/命名空间)与 `after/ftplugin/*`(按文件类型)、插件内部一律只写行为, **不要在映射处硬编码 lhs 或写 desc**; desc 只写在 keys 表里(它是快捷键唯一的文档来源, 不再手写 help 映射)。
  - `keys/` 内部相互引用时不要再用 `keys` 这个名字(避免与"本文件的表"混淆), 用该命名空间的短名, 如 `local split = require('keys.windows.split')`。
  - `require('utils.map').map(spec, rhs, opts)` 是唯一入口: 支持 `{ modes = {...} }` 覆盖模式、透传 `vim.keymap.set` 选项(如 `buffer`); 缺 `desc`/`lhs` 会在注册时报错。已删除 `map_by_modes`(`vim.keymap.set` 原生支持模式列表)与 `noremap`(0.12 已不支持, 非递归本就是默认)。
  - 启动自检 `require('utils.map').check()` 在 `lua/keymaps.lua` 末尾调用: 报告同一作用域下被**不同代码位置**抢注的键位(同一处代码重复注册、以及全局与 buffer-local 并存都不算冲突); 新增/改动键位后跑验证第 4 条。
  - 有的命名空间只在特定上下文注册: LSP 在 `settings/lsp.lua` 的 `LspAttach`、运行键在 `after/ftplugin/*`、关闭特殊窗口的 `q` 在 `settings/autocmds.lua`、fzf/补全/对齐/浮动窗口在对应插件里。按文件类型注册的映射**必须带 `{ buffer = 0 }`**(否则会被最后打开的那种语言覆盖掉全局键位, 切回旧 buffer 时会跑错语言)。
- 非按键的静态配置(调色板、行为参数)集中在 `lua/settings/consts.lua`, 例如 `colors`、`fast_move_by_lines`、`window_resize_step`; 内容变大再拆 `lua/settings/consts/`。
- leader 约定: `<Leader>` = `/`, `<LocalLeader>` = `\`, LSP 前缀 `<C-\>`(`keys.lsp.lsp_leader`), fuzzy finder `<C-q>`(`keys.fuzzy_finder.fuzzy_finder_leader`), 编译/运行 `<C-e>`(`keys.run.run_file`)。`vim.g.mapleader` / `vim.g.maplocalleader` 在 `init.lua` 定义; keys 表里取前缀用 `vim.g.maplocalleader`, 不要读全局变量(否则 lua_ls 报 `undefined-field`)。
- 补全与片段: blink.cmp / LuaSnip 已删除, 改用 Neovim 原生实现 —— 补全在 `lua/settings/lsp.lua` 的 `LspAttach` 里用 `vim.lsp.completion.enable()` 启用(`<C-y>` 确认、`<C-e>` 取消), 片段用 `lua/plugins/snippets.lua` 的 `mini.snippets` + `friendly-snippets`, 引擎为 `vim.snippet`(展开/跳转/停止都用 `vim.snippet.*` 原生会话, 不再用 mini.snippets 的 session API); 相应的 `keys.lsp` 里的 `open_hint`/`close_hint`/`snippet_*` 由这两处注册。
- snippets: 自研片段已全部弃用(`snippets/` 目录不存在, 不要重建), 只用社区集合; 片段会经 mini.snippets 起的进程内 LSP 服务器进入原生补全菜单。
- 类型标注: 仓库根 `.luarc.json`(LuaJIT + `undefined-field` 提到 Warning + `different-requires` 降为 Information + 忽略 `.pi`)的 `workspace.library` 指向 `${env:VIMRUNTIME}/lua`, 才能解析 `vim.keymap.set.Opts`、`vim.api.keyset.create_autocmd.callback_args` 等运行时类型; 离线跑 `lua-language-server --check=. --checklevel=Warning` 前要 `export VIMRUNTIME`。
  - `different-requires` 降级的原因: `require('plugins.noice')` 与 `require('noice')` 都会被 lua-language-server 解析到 `lua/plugins/noice.lua`(插件源码不在 workspace), 属误报。
- 主题: catppuccin mocha + 透明背景。高亮覆盖集中在 `lua/plugins/colorscheme.lua` 与 `lua/settings/transparency.lua`(后者被 colorscheme 与无插件路径共用, 改透明相关走这里)。
- treesitter: **纯原生**(Neovim 0.12), 不依赖 nvim-treesitter 插件 —— `lua/settings/treesitter.lua`(settings.lua 里无条件加载, --noplugin 下也生效)只做 `vim.treesitter.start()` 高亮 + `foldexpr` 折叠; parser 与 queries 全由 nix 提供(两个 start 包: `pack/hm/start/nvim-treesitter-grammars` 提供 320 个 parser, `pack/hm/start/nvim-treesitter-queries` 提供 300+ 语言的 queries, 取自上游 nvim-treesitter 的 `runtime/queries`), 声明在 `/etc/nixos/home/shell/nvim.nix`; `~/.local/share/nvim/site/{parser,parser-info,queries}` 是旧 ts.install 残留, 已删除; **site/pack/hm 不能删**。0.12 原生没有 treesitter 缩进, 缩进交给 `$VIMRUNTIME/indent/<ft>.vim`。新增语言: nix grammar 列表 + 该文件的 `filetypes` 各加一项(缺 parser 时静默跳过不报错)。0.12 还内置了 treesitter 增量选择: Visual 模式 `an`/`in`/`[n`/`]n`/`[N`/`]N`。

## 外部依赖(不在本仓库)

可执行文件由 `/etc/nixos/home/shell/nvim.nix` 的 home-manager 声明: clangd、lua-language-server、nixd、marksman、ruff、basedpyright、black、guile-lsp-server、rust-analyzer、typescript-language-server、haskell-language-server、ormolu、nixfmt、prettierd、taplo、texlab、tinymist, 以及 telescope 用的 ripgrep/fd 等。README 里的 `pacman` / Mason 安装段落是通用历史说明, 不是本机流程; 缺工具时报告用户, 不要 `sudo` 安装(系统缺的临时工具用 `nix shell`)。

其它环境耦合: `guicursor` 只发闪烁序列, 动画由终端控制(kitty `cursor_blink_interval`); 未设置 `unnamedplus`, 系统剪贴板依赖终端/wl-clipboard; `j/k` 已与 `gj/gk` 对调, 新增移动类映射时注意。

## 风格

- 注释、README、commit 一律中文。commit 形如 `type(scope): 中文描述`(历史前缀拼写不统一, 如 `chorn`/`chron`, 不必模仿错拼)。
- 模块统一 `local M = {}` / `local module = {}` 加 `return`, 文件头常有 `--- <name>.lua` 与用法说明; 注释解释"为什么"而非复述代码。
- 改动保持最小, 不做任务外重构; 与相邻文件风格保持一致。
