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

