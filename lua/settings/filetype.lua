-- filetype

vim.filetype.add({
  extension = {
    tex = 'tex',
    py  = 'python',
    rs  = 'rust',
    mk  = 'make',
    c   = 'c',
    cpp = 'cpp',
    h   = 'c',
    js = 'javascript',
    ts = 'typescript',
    fish = 'fish',
    toml = 'toml',
    hs = 'haskell',
    typ = 'typst',
    conf = 'conf',
    cfg = 'conf',
    -- scm / guile 用带点子类型: guile_ls 只在 scheme.guile 上启动(通用的 scheme 设置仍会加载)
    scm = 'scheme.guile',
    guile = 'scheme.guile',
  },
})

