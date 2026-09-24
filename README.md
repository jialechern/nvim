# VimConfig
## 使用说明
- 经典用法: 将仓库克隆到 `~/.config/nvim`
- 使用 NixOS: 将仓库克隆到 `/etc/nixos/modules/nvim`
- 本机(NixOS)流程: 插件与语言服务器都由 home-manager 声明(见 `/etc/nixos/home/shell/nvim.nix`), 维护与验证姿势见 `AGENTS.md`; 下面 "如果不是使用 NixOS" 里的 pacman / Mason / tree-sitter-cli 段落只是通用历史说明, 不是本机步骤。
### 插件依赖的配置(如果不是使用 NixOS)

- 通过以下方式可以自检插件的依赖是否满足

    进入 `nvim` 运行 `:checkhealth` 可以检查所有插件的依赖是否满足.
    也可以通过 `:checkhealth <plugin_name>` 来检查某个插件的依赖. 

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
### lsp 服务器的安装
现在使用的 lsp 服务器有:
- clangd: C/C++ 语言服务器
- lua-language-server: Lua 语言服务器
- marksman: Markdown 语言服务器
- ruff: Python 语言服务器
- rust-analyzer: Rust 语言服务器
- taplo: TOML 语言服务器
- texlab: LaTeX 语言服务器
- tinymist: typst 语言服务器
- typescript-language-server: TypeScript 语言服务器
- nixd: nix 语言服务器
- haskell-language-server: Haskell 语言服务器

#### 可选的安装办法有:
- 通过 home-manager 进行安装(推荐)
- 通过系统的包管理器进行安装
    以 Arch Linux 为例, 可以通过下面的命令安装对应的 LSP Server:
    ```bash
    # 在 Arch Linux 中 clangd 是通过 arduino-language-server 包提供的
    sudo pacman -S arduino-language-server lua-language-server marksman pyright rust-analyzer taplo texlab tinymist typescript-language-server 
    ```
    关于 nixd: 现在 nixd 必须通过 nix 安装, 使用 home-manager 配置文件即可, 运行 `home-manager switch`.
- 通过 Mason.nvim 插件或是通过 `Mason` 命令行软件进行安装
#### 其它依赖
...
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
