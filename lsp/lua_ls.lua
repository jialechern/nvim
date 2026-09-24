-- lua_ls.lua

local module = {}

module.cmd = { 'lua-language-server' }
module.filetypes = { 'lua' }
module.root_markers = {
    '.luarc.json',
    '.luarc.jsonc',
    '.luacheckrc',
    '.stylua.toml',
    'stylua.toml',
    'selene.toml',
    'selene.yml',
    '.git',
  }

-- 让 lua_ls 认识 Neovim 运行时的类型定义(vim.* 与 _meta 里的 ---@class),
-- 否则标注里的 vim.keymap.set.Opts 之类无法解析; 路径随 nvim 安装位置变化, 只能运行时取
module.settings = {
    Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace = {
            library = { vim.env.VIMRUNTIME .. '/lua' },
            checkThirdParty = false,
        },
    },
}

return module

