-- - nvim-treesitter.lua
return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
            -- 启用语法高亮
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false, -- 禁用传统正则高亮
            },
  
            -- 启用自动缩进（实验性功能）
            indent = {
                enable = true,
            },
  
            -- 启用增量选择
            incremental_selection = {
                enable = true,
                keymaps = {
                init_selection = "gnn",    -- 开始选择
                node_incremental = "grn",  -- 增量增加选择
                scope_incremental = "grc", -- 增量扩大范围
                node_decremental = "grm",  -- 增量减少选择
                },
            },
  
            -- 确保安装的语言解析器
            ensure_installed = {
                "bash", "c", "cpp", "css", "go", "html", "java", 
                "javascript", "json", "lua", "python", "rust", 
                "typescript", "vim", "vimdoc", "yaml"
            },
  
            -- 自动安装缺失的解析器
            auto_install = true,
            })
        end
      }
}
