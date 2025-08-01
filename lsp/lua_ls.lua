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

return module

