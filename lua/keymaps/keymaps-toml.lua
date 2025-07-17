-- - keymaps-toml.lua
-- 这个配置文件主要是记录不同类型的 toml 配置文件中常见的配置项
-- 故, 这里的键盘映射键命名规范与其它配置不同
-- 主要采用 `<leader/coleader>+适用场景(语言/框架...)+动作` 的方式命名

-- begin Rust and Cargo
-- 初始化 Rust 项目的命名空间配置
vim.api.nvim_set_keymap('i', '<leader>rwsinit',
'[workspace]'                                       .. '<CR><Esc>0C\t' ..
    'members = ['                                   .. '<CR>' ..
        ','                                         .. '<CR><Esc>0C\t' ..
    ']' .. '<Esc>k0i\t\t'
, { noremap = true, silent = true })
-- end Rust and Cargo

