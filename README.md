# VimConfig
## 使用说明
需要注意等是，使用之前：

- 需要设置环境变量 `NVIMCONFIGP` 为 neovim 的配置文件所在; 注: 模块化逻辑已重构, 已经不需要这个环境变量了;
- markdown-proview 需要执行 `install.sh` 安装才可以启用;
- 在安装 YouCompleteMe 之前需要安装相应的依赖
`
python-pynvim npm nodejs go gcc cmake jdk&jvm
` 
安装依赖完成后, 使用 `python install.py` 安装.
## `Lazy.nvim` 的配置
进入 `nvim` 运行 `:checkhealth`
- 当没有默认的 `lua5.1` 以及 `luarocks` 环境时需要手动安装
lazy.nvim 通过内置的 hererocks（一个在 Neovim “用户目录” 下自动管理 LuaRocks 环境的工具）尝试去检查是否能安装那些声明了 rocks（LuaRocks）依赖的插件。
```bash
sudo pacman -S lua51 luarocks
```
- 没有默认的 `tree-sitter` 时可以手动安装
nvim-treesitter 的 “:TSInstallFromGrammar” 功能，可以让你在没有预编译二进制解析器（parser.so）的情况下，直接下载 grammar（.js、.json）文件，然后用 tree-sitter cli 生成对应的 C 解析库。
```bash
sudo pacman -S tree-sitter-cli
```
- 一些操作可能需要依赖系统提供的剪切板, 可以单独下载
在 Neovim 中，如果你想使用 "+y、"+p 或者 "*y、"*p 这类访问系统剪贴板的命令，就必须要有一个外部程序来做桥接，否则这些寄存器都会失效，只在内部寄存器里工作。
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
### 使用无插件依赖的 `git` 分支

分支 `no_plugins` 中的内容是无插件依赖的配置文件. 

### 自行去除
若使用时不希望依赖于插件需要注释以下代码: 

- `CONFIG_ROOT/init.lua`

```lua
-- begin 指定插件位置，不存在则clone到本地
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- end 指定插件位置，不存在则clone到本地



require("lazy").setup('plugins')
```

- `CONFIG_ROOT/init/auto-compile.lua`

```lua
    elseif extension == 'md' then
        vim.cmd('silent MarkdownPreview')
    elseif extension == 'tex' then
        vim.cmd('silent write')
        vim.cmd('silent !latexmk')
```

- `CONFIG_ROOT/lua/settings.lua`

```lua
-- 配置代码提示和代码高亮
vim.cmd('source $NVIMCONFIGP/lua/settings/settings-code-hint-by-color.lua')
```

