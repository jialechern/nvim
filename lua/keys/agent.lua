--- agent.lua
--- agent 相关按键的预留命名空间 (功能接入后在此补充 KeySpec)

local agent_leader = '<A-' .. (vim.g.maplocalleader or '\\') .. '>'

---@class Keys.Agent
---@field agent_leader string  -- 命名空间前缀(预留)

---@type Keys.Agent
local module = {
    agent_leader = agent_leader,
}

return module