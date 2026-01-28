# VimConfig
## 使用说明
需要注意的是, 使用之前：

### 插件说明
- markdown-proview 需要执行 `install.sh` 安装才可以启用;
- LSP 使用 neovim 的内置 LSP 功能. 其中 LSP Server 通过插件 Mason.nvim 管理
    
    - 每种语言所需要的 LSP 服务器以及其服务器的配置文件对应关系都在 `settings.lsp` 中
    - 可以通过 `:MasonInstall LSP-Server` 手动安装 LSP Server, 也可以通过 `:MasonUninstall LSP-Server` 手动卸载 LSP Server

### 插件依赖的配置

- 通过一下方式可以自检插件的依赖是否满足

进入 `nvim` 运行 `:checkhealth` 可以检查所有插件的依赖是否满足.
也可以通过 `:checkhealth <plugin_name>` 来检查某个插件的依赖. 

- 当没有默认的 `lua5.1` 以及 `luarocks` 环境时需要手动安装

lazy.nvim 通过内置的 hererocks（一个在 Neovim “用户目录” 下自动管理 LuaRocks 环境的工具）尝试去检查是否能安装那些声明了 rocks（LuaRocks）依赖的插件. 

```bash
sudo pacman -S lua51 luarocks
```

- 没有默认的 `tree-sitter` 时可以手动安装

nvim-treesitter 的 “:TSInstallFromGrammar” 功能, 可以让你在没有预编译二进制解析器（parser.so）的情况下, 直接下载 grammar（.js、.json）文件, 然后用 tree-sitter cli 生成对应的 C 解析库.

```bash
sudo pacman -S tree-sitter-cli
```

- 一些操作可能需要依赖系统提供的剪切板, 可以单独下载

在 Neovim 中, 如果你想使用 "+y、"+p 或者 "*y、"*p 这类访问系统剪贴板的命令, 就必须要有一个外部程序来做桥接, 否则这些寄存器都会失效, 只在内部寄存器里工作.

```bash
# Wayland
sudo pacman -S wl-clipboard
# X11
sudo pacman -S xclip
# 或者
sudo pacman -S xsel
```

- Neovim 内置了一个 Node.js provider, 用来让某些基于 Node.js 的插件（如 coc.nvim、denops、vim-node-rpc 等）能够在 Neovim 里运行 JavaScript/TypeScript 逻辑. 

要启用这个 provider, 除了系统要有 Node.js（这里你的系统显示 Node.js v23.11.1 已安装）, 还需要全局安装一个名为 neovim 的 npm 包, 它负责在 Node 与 Neovim 之间做通信. 如果没有安装, 就会报上面那条警告. 

```bash
# 如果你用 npm：
npm install -g neovim

# 如果你用 yarn (推荐)：
yarn global add neovim

# 如果你用 pnpm：
pnpm install -g neovim
```

- 如果你打算在 Neovim 里运行 Ruby 脚本（例如一些用 Ruby 写的插件）, 就需要在系统里有可用的 ruby 可执行文件和 RubyGems（gem）. 

```bash
sudo pacman -S ruby
```

- Neovim 支持通过 Perl 写插件或脚本, 需要安装一个名为 Neovim::Ext 的 CPAN 模块, 同时系统里还要有 Perl 可执行文件. 如果这两个条件都不满足, 就会出现上述两条警告. 

绝大多数人并不使用 Perl provider, 所以它也属于可选项, 一般可以直接忽略. 

```bash
sudo pacman -S perl
```

#### 其它依赖

## 一些基本符号的设置

- `vim.g.mapleader/_G.Leader`: neovim/vim 自带的可自定义的领头键
- `_G.CoLeader`: 本配置文件中副带的一个可自定义领头键
- `_G.Next`: 游标跳转符号
- `_G.End`: 键盘映射的结束符号, 当载入的映射过多可能导致冲突时应当使用这个符号来结束映射

以上所有符号均可通过 `config` 脚本进行自定义(推荐), 也可以在 `lua/settings/init-symbols` 下进行自定义.

详细操作可以使用下面的命令获取:

```bash
# 在 Unix-like 系统中
./config --help

# 在 Windows 系统中
python .\config --help
```

下面是一个符号配置的示例, 也是默认推荐的配置:

```bash
# 在 Unix-like 系统中
./config --leader '>' \
    --coleader '`' \
    --next '<++>' \
    --end ' '

# 在 Windows 系统中
python .\config --set-symbols `
    --leader '>' `
    --coleader '`' `
    --next '<++>' `
    --end ' '
```

## 去除插件依赖

1. 使用配置文件根目录下的 `config` 脚本去除(推荐):
    
    ```bash
    # 在 Unix-like 系统中
    ./config --no-plugins

    # 在 Windows 系统中
    python .\config --no-plugins
    ```

    如果配置文件路径不正确, 可以使用 `-c` 或者 `--cfg-path` 参数指定配置文件的路径:

    ```bash
    # 在 Unix-like 系统中
    ./config --no-plugins -c <neovim-config-path>

    # 在 Windows 系统中
    python .\config --no-plugins --cfg-path <neovim-config-path>
    ```

2. 使用配置文件自带的配置变量去除

    只要将 lua/settings/variables.lua 中的变量 `LoadPlugins` 设置为 `false` 即可去除所有插件的加载.

3. 通过 neovim 的自带参数和 shell 的别名功能去除

    如果当前环境无法满足 加载/更新/使用 插件的功能可以考虑使用一下的方式去除插件依赖:
    ```bash
    nvim --noplugin <file>
    ```
    觉得每次都要加一条参数非常的麻烦的话可以在当前 shell 的配置文件中引入别名, 以 bash 为例: 
    ```bash
    # $HOME/.bashrc
    alias vi="nvim --noplugin"
    alias vim="nvim --noplugin"
    alias nvim="nvim --noplugin"
    ```

## 一些编写配置的原则

1. 当使用到特殊符号时应当使用已经解耦的预定义符号

    在 lua 的全局命名空间 `_G` 中已经预定义了下面四个符号: 
    - `vim.g.mapleader/_G.Leader`: neovim/vim 自带的可自定义的领头键盘
    - `_G.CoLeader`: 本配置文件中副带的一个可自定义领头键( 前两者可互相转义 )
    - `_G.End`: 键盘映射的结束符号, 当载入的映射过多可能导致冲突时应当使用这个符号来结束映射
    - `_G.Next`: 游标跳转符号, 所有的跳转操作应当使用这个符号

2. 定义键盘映射时应当语义清晰且结构清晰

    - 当映射的片段较为复杂时应当善用 lua 的字符串拼接功能
    - 当映射的代码片段需要跳至当前行的游标之前时, 可以考虑采用 `_G.CoLeader` 作为跳转锚点
    - 当代码片段预期的缩进与 neovim 的缩进不一致时可以善用 norm 模式下的 `0` 和 `<number>|` 命令, 结合制表符 `\t` 来自定义缩进
    - 如果映射需要依赖于新定义的 符号/变量, 应当将这些 符号/变量 存放在 settings/variables.lua 中, 在使用 `local symbol = require('settings.variables').symbol` 的方式来引入

3. 键盘映射机制的一些说明
    
    - utils/map.lua 定义了两个官方 api 的浅层抽象, 应当尽可能的使用这两个函数
        - `map`: 用于定义单个模式下的映射
        - `map_by_modes`: 用于多个模式下的键盘映射
    - 对于编程语言的通用概念, 其快捷键可以通过下面的方式统一注册, 由 luasnip 脚本统一加载并定义为按键映射, 下面再对这种方式支持的按键映射类型进行说明
        - 流程控制类型的映射
            - 分支型语句: 'if', 'if-else', 'if-else_if', 'if-else_if-else', 'switch'/'case'/'match'
                以上类型应当注册在 `settings/variables/branchs.lua` 下.
            - 循环型语句: 'for', 'while', 'do-while', 'loop'
                以上类型应当注册在 `settings/variables/loops.lua` 下.
        - 程序入口
            为每个编程语言定义一个入口函数, 该函数应当注册在 `settings/variables/entry-point.lua` 下.

            ```lua
            --- <language>
            --- entry_point snipets
            
            -- 基本引入
            local luasnip = require('luasnip')
            
            -- 自定义 snippet(Lua 方式)
            local s = luasnip.snippet
            local t = luasnip.text_node
            local i = luasnip.insert_node
            local c = luasnip.choice_node
            -- local d  = luasnip.dynamic_node
            -- local sn = luasnip.snippet_node
            
            --- 模块定义
            local module = {}
            
            --- 程序入口点
            local entry_point = require('settings.variables.entry-points').entry_point
            module[#module+1] = s({
                trig = entry_point,
                wordTrig  = true,
                regTrig   = false,
                -- snippetType = 'autosnippet',
                }, {
                t({'def main() -> None:', ''}),
                t('\t'), i(0),
                t({'', '', 'if __name__ == \'__main__\':', ''}),
                t('\tmain()'),
                })
            
            --- 模块返回
            return module
            ```

        - 函数
            为每个编程语言定义一种函数定义方式, 该函数应当注册在 `settings/variables/functions.lua` 下.
        - 日志
            为每个编程语言定义一种日志打印方式, 该函数应当注册在 `settings/variables/logger.lua` 下.
        - 测试
            为每个编程语言定义一种测试方式, 该函数应当注册在 `settings/variables/test.lua` 下.
        - 打印
            为每个编程语言定义一种打印方式, 该函数应当注册在 `settings/variables/print.lua` 下.
        - 每个文件类型的一个自动执行命令
            为每个文件类型定义一个自动执行命令, 该命令按键注册在 `settings/variables/auto-run.lua` 下
            ```lua
            --- <language>
            --- 用于配置 <language> 语言的快捷键映射
            
            -- 导入自定义的工具函数以及需要的符号
            local map = require('utils.map').map
            local autocmd_key = require('settings.variables.auto-run').autocmd_key
            
            --- 自动编译
            map('n', autocmd_key, function ()
                vim.bo.makeprg = '<compiler> %:p:r.c -o %:p:r && %:p:r'
                vim.cmd('silent write')
                vim.cmd('make')
            end, { desc = '编译并运行 <language> 语言文件' })
            ```
            

    **p.s.** 上面注册的所有按键映射的 key 都可以统一调节, 变量统一存放在 settings/variables/ 中.

## 未来希望增加的

