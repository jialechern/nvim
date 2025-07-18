# VimConfig
## 使用说明
需要注意的是，使用之前：

> 需要设置环境变量 `NVIMCONFIGP` 为 neovim 的配置文件所在; 注: 模块化逻辑已重构, 已经不需要这个环境变量了;

### 插件说明
- markdown-proview 需要执行 `install.sh` 安装才可以启用;
- 在安装 YouCompleteMe 之前需要安装相应的依赖(现已迁移到 `Coc` 插件, 但依赖依然需要安装)
```bash
python-pynvim npm nodejs go gcc cmake jdk&jvm
```
安装依赖完成后, 使用 `python install.py` 安装.

### 插件依赖的配置

- 通过一下方式可以自检插件的依赖是否满足

进入 `nvim` 运行 `:checkhealth` 可以检查所有插件的依赖是否满足.
也可以通过 `:checkhealth <plugin_name>` 来检查某个插件的依赖。

- 当没有默认的 `lua5.1` 以及 `luarocks` 环境时需要手动安装

lazy.nvim 通过内置的 hererocks（一个在 Neovim “用户目录” 下自动管理 LuaRocks 环境的工具）尝试去检查是否能安装那些声明了 rocks（LuaRocks）依赖的插件。

```bash
sudo pacman -S lua51 luarocks
```

- 没有默认的 `tree-sitter` 时可以手动安装

nvim-treesitter 的 “:TSInstallFromGrammar” 功能，可以让你在没有预编译二进制解析器（parser.so）的情况下，直接下载 grammar（.js、.json）文件，然后用 tree-sitter cli 生成对应的 C 解析库.

```bash
sudo pacman -S tree-sitter-cli
```

- 一些操作可能需要依赖系统提供的剪切板, 可以单独下载

在 Neovim 中，如果你想使用 "+y、"+p 或者 "*y、"*p 这类访问系统剪贴板的命令，就必须要有一个外部程序来做桥接，否则这些寄存器都会失效，只在内部寄存器里工作.

```bash
# Wayland
sudo pacman -S wl-clipboard
# X11
sudo pacman -S xclip
# 或者
sudo pacman -S xsel
```

- Neovim 内置了一个 Node.js provider，用来让某些基于 Node.js 的插件（如 coc.nvim、denops、vim-node-rpc 等）能够在 Neovim 里运行 JavaScript/TypeScript 逻辑。

要启用这个 provider，除了系统要有 Node.js（这里你的系统显示 Node.js v23.11.1 已安装），还需要全局安装一个名为 neovim 的 npm 包，它负责在 Node 与 Neovim 之间做通信。如果没有安装，就会报上面那条警告。

```bash
# 如果你用 npm：
npm install -g neovim

# 如果你用 yarn (推荐)：
yarn global add neovim

# 如果你用 pnpm：
pnpm install -g neovim
```

- 如果你打算在 Neovim 里运行 Ruby 脚本（例如一些用 Ruby 写的插件），就需要在系统里有可用的 ruby 可执行文件和 RubyGems（gem）。

```bash
sudo pacman -S ruby
```

- Neovim 支持通过 Perl 写插件或脚本，需要安装一个名为 Neovim::Ext 的 CPAN 模块，同时系统里还要有 Perl 可执行文件。如果这两个条件都不满足，就会出现上述两条警告。

绝大多数人并不使用 Perl provider，所以它也属于可选项，一般可以直接忽略。

```bash
sudo pacman -S perl
```

## 去除插件依赖

1. 使用配置文件自带的配置变量去除

    只要将 lua/settings/settings-variables.lua 中的变量 `LoadPlugins` 设置为 `false` 即可去除所有插件的加载.

2. 通过 neovim 的自带参数和 shell 的别名功能去除

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
    - `vim.g.mapleader`: neovim/vim 自带的可自定义的领头键盘
    - `_G.CoLeader`: 本配置文件中副带的一个可自定义领头键( 前两者可互相转义 )
    - `_G.End`: 键盘映射的结束符号, 当载入的映射过多可能导致冲突时应当使用这个符号来结束映射
    - `_G.NextSymbol`: 游标跳转符号
    - `_G.Next`: 基于 `_G.NextSymbol` 重新包装的游标跳转符号, 所有的跳转操作应当使用这个符号

2. 定义键盘映射时应当语义清晰且结构清晰

    - 当映射的片段较为复杂时应当善用 lua 的字符串拼接功能
    - 当映射的代码片段需要跳至当前行的游标之前时, 可以考虑采用 `_G.CoLeader` 作为跳转锚点
    - 当代码片段预期的缩进与 neovim 的缩进不一致时可以善用 norm 模式下的 `0` 和 `<number>|` 命令, 结合制表符 `\t` 来自定义缩进

## 未来希望增加的

1. 将不同源代码的(行/块/文档)注释功能从原有的依赖于 命令表达式(字符串) 变更到依赖于回调函数
2. 将获取源代码(行/块/文档)注释的函数从全局函数更改为局部函数

