-- lua_ls.lua

local module = {}

require('utils.lsp').install_server('lua-language-server')

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

