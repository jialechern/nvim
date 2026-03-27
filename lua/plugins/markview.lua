-- markview.lua

local M = {}
M[1] = {}
local markview = M[1]

markview[1] = "OXY2DEV/markview.nvim"

-- 不懒加载: 这样进入 markdown/typst/latex 文件时, 渲染层更早就绪
markview.lazy = false

-- 依赖插件
markview.dependencies = {
      -- 负责语法树解析
      "nvim-treesitter/nvim-treesitter",

      -- 可选: 图标支持. 没有它也能用, 但官网那种"完整观感"通常会更好
      "nvim-tree/nvim-web-devicons",
}

-- 支持的文件类型
markview.ft = {
    "markdown",
    "rmd",
    "quarto",
    "typst",
    "tex",
    "latex",
    "html",
    "yaml",
}

-- 具体配置
markview.config = function()
    -- 视觉基础: 这几个通常比"多写很多空配置"更重要
    vim.opt.termguicolors = true
    vim.opt.conceallevel = 2
    vim.opt.concealcursor = "nc"

    require("markview").setup({
        -- 实验性选项: 大多保持默认即可
        experimental = {
            date_formats = {},
            date_time_formats = {},
            text_filetypes = {},
            read_chunk_size = 1000,
            link_open_alerts = false,
            file_open_command = "tabnew",
            list_empty_line_tolerance = 3,
        },

        -- 需要的话可以自定义高亮组; 先留空, 避免干扰默认观感
        highlight_groups = {},

        -- 预览触发方式
        preview = {
            enable = true,

            -- 注意: 这里要包含真正的 filetype
            filetypes = {
                "markdown",
                "rmd",
                "quarto",
                "typst",
                "tex",
                "latex",
                "html",
                "yaml",
            },

            ignore_buftypes = {
                "nofile",
            },

            ignore_previews = {},

            -- 平时在普通模式/命令模式下编辑时都能看到预览效果
            modes = {
                "n",
                "no",
                "c",
            },

            -- 如果想用插入模式的混合预览, 再把 "i" 加进去
            -- 先不加, 通常更接近"纯展示"的观感
            hybrid_modes = {
                "i",
                "v",
            },

            -- 适当降低刷新频率, 避免输入时抖动
            debounce = 50,

            -- 让预览区域足够大, 视觉上更接近官网示例
            draw_range = { vim.o.lines, vim.o.lines },

            -- 编辑范围保持默认感
            edit_range = { 1, 0 },

            callbacks = {},

            -- splitview 的默认布局通常就是向左分屏
            splitview_winopts = {
                split = "left",
            },
        },

        -- 渲染器: 保持默认, 不要手动清空默认能力
        renderers = {},

        -- HTML
        html = {
            enable = true,
            container_elements = {},
            headings = {},
            void_elements = {},
        },

        -- LaTeX / 数学公式
        latex = {
            enable = true,
            blocks = {},
            commands = {},
            escapes = {},
            fonts = {},
            inlines = {},
            parenthesis = {},
            subscripts = {},
            superscripts = {},
            symbols = {},
            texts = {},
        },

        -- Markdown
        markdown = {
            enable = true,
            block_quotes = {},
            code_blocks = {},
            headings = {},
            horizontal_rules = {},
            list_items = {},
            metadata_plus = {},
            metadata_minus = {},
            tables = {},
        },

        -- Markdown 行内元素
        markdown_inline = {
            enable = true,
            block_references = {},
            checkboxes = {},
            emails = {},
            embed_files = {},
            entities = {},
            escapes = {},
            footnotes = {},
            highlights = {},
            hyperlinks = {},
            images = {},
            inline_codes = {},
            internal_links = {},
            uri_autolinks = {},
        },

        -- Typst
        typst = {
            enable = true,
            codes = {},
            escapes = {},
            headings = {},
            labels = {},
            list_items = {},
            math_blocks = {},
            math_spans = {},
            raw_blocks = {},
            raw_spans = {},
            reference_links = {},
            subscripts = {},
            superscript = {},
            symbols = {},
            terms = {},
            url_links = {},
        },

        -- YAML
        yaml = {
            enable = true,
            properties = {},
        },
    })

    -- --- --- --- 自动命令与快捷键 --- --- ---
    vim.api.nvim_create_autocmd("FileType", {
        pattern = {
            "markdown",
            "rmd",
            "quarto",
            "typst",
            "tex",
            "latex",
            "html",
            "yaml",
        },
        callback = function()
            -- 打开时自动切换到预览(可选)
            vim.cmd("Markview toggle")


            -- --- --- --- 快捷键 --- --- ---
            local run_key = require('settings.variables.run').run_key

            vim.keymap.set("n", run_key, "<CMD>Markview toggle<CR>", {
                desc = "切换 Markview 预览",
            })

            -- Insert 模式里切换混合模式
            vim.keymap.set("i", run_key, "<CMD>Markview HybridToggle<CR>", {
                desc = "切换 Markview 混合模式",
            })

            -- 分屏预览
            vim.keymap.set("n", "<leader>" .. run_key, "<CMD>Markview splitToggle<CR>", {
                desc = "切换 Markview 分屏预览",
            })
        end,
    })
end

return M
