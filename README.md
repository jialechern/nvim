# VimConfig
## 使用说明
- 经典用法: 将仓库克隆到 `~/.config/nvim`
- 使用 NixOS: 将仓库克隆到 `/etc/nixos/modules/nvim`

### 依赖说明
- markdown-proview 需要执行 `~/.local/share/nvim/lazy/markdown-preview.nvim/app/install.sh` 安装才可以启用;
- LSP 使用 neovim 的内置 LSP 功能. 其中 LSP Server 通过插件 Mason.nvim 管理
    
    - 每种语言所需要的 LSP 服务器以及其服务器的配置文件对应关系都在 `settings.lsp` 中
    - NixOS 的配置中已经包含了所有需要的 LSP 服务器
    - 所需的 LSP 服务器也可以使用包管理器手动安装

### 插件依赖的配置(如果不是使用 NixOS)

- 通过一下方式可以自检插件的依赖是否满足

进入 `nvim` 运行 `:checkhealth` 可以检查所有插件的依赖是否满足.
也可以通过 `:checkhealth <plugin_name>` 来检查某个插件的依赖. 

- 当没有默认的 `lua5.1` 以及 `luarocks` 环境时需要手动安装

lazy.nvim 通过内置的 hererocks（一个在 Neovim "用户目录" 下自动管理 LuaRocks 环境的工具）尝试去检查是否能安装那些声明了 rocks（LuaRocks）依赖的插件. 

```bash
sudo pacman -S lua51 luarocks
```

- 没有默认的 `tree-sitter` 时可以手动安装

nvim-treesitter 的 ":TSInstallFromGrammar" 功能, 可以在没有预编译二进制解析器(parser.so)的情况下, 直接下载 grammar(.js、.json)文件, 然后用 tree-sitter cli 生成对应的 C 解析库.

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

- Neovim 内置了一个 Node.js provider, 用来让某些基于 Node.js 的插件(如 coc.nvim、denops、vim-node-rpc 等)能够在 Neovim 里运行 JavaScript/TypeScript 逻辑. 

要启用这个 provider, 除了系统要有 Node.js（这里你的系统显示 Node.js v23.11.1 已安装, 还需要全局安装一个名为 neovim 的 npm 包, 它负责在 Node 与 Neovim 之间做通信. 如果没有安装, 就会报上面那条警告. 

```bash
# 如果用 npm：
npm install -g neovim

# 如果用 yarn (推荐)：
yarn global add neovim

# 如果用 pnpm：
pnpm install -g neovim
```

- 如果打算在 Neovim 里运行 Ruby 脚本(例如一些用 Ruby 写的插件), 就需要在系统里有可用的 ruby 可执行文件和 RubyGems（gem）. 

```bash
sudo pacman -S ruby
```

- Neovim 支持通过 Perl 写插件或脚本, 需要安装一个名为 Neovim::Ext 的 CPAN 模块, 同时系统里还要有 Perl 可执行文件. 如果这两个条件都不满足, 就会出现上述两条警告. 

绝大多数人并不使用 Perl provider, 所以它也属于可选项, 一般可以直接忽略. 

```bash
sudo pacman -S perl
```
### lsp 服务器的安装
现在使用的 lsp 服务器有:
    - clangd: C/C++ 语言服务器
    - lua-language-server: Lua 语言服务器
    - marksman: Markdown 语言服务器
    - pyright: Python 语言服务器
    - rust-analyzer: Rust 语言服务器
    - taplo: TOML 语言服务器
    - texlab: LaTeX 语言服务器
    - tinymist: typst 语言服务器
    - typescript-language-server: TypeScript 语言服务器
    - nixd: nix 语言服务器

可选的安装办法有:
    - 通过 Mason.nvim 插件进行安装
        进入 `nvim` 运行 `:Mason` 打开 Mason 的界面, 在里面找到对应的 LSP Server, 点击安装即可.
    - 通过系统的包管理器进行安装
        以 Arch Linux 为例, 可以通过下面的命令安装对应的 LSP Server:
        ```bash
        # 在 Arch Linux 中 clangd 是通过 arduino-language-server 包提供的
        sudo pacman -S arduino-language-server lua-language-server marksman pyright rust-analyzer taplo texlab tinymist typescript-language-server
        ```
    - 关于 nixd: 现在 nixd 必须通过 nix 安装, 使用 home-manager 配置文件即可, 运行 `home-manager switch`.

**注意:** 在 lsp 配置中可能会有部分路径问题, 如 rustup 和 cargo 的 bin 目录位于系统的 /usr/bin 路径之前, 则 lsp 会先加载它们的 rust-analyzer, 若想使用包管理器安装的 lsp 服务器, 只需要将 lsp 配置中的 `return { cmd = 'path' ... }` 中的 `path` 替换为对应的服务器路径即可.

#### 其它依赖

## 去除插件依赖

通过 neovim 的自带参数和 shell 的别名功能去除:

如果当前环境无法满足 加载/更新/使用 插件的功能可以考虑使用以下的方式去除插件依赖:
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
