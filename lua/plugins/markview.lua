local M = {}

local ft_list = {
    'markdown',
    'rmd',
    'quarto',
    'typst',
    'tex',
    'latex',
    'html',
    'yaml',
}

function M.setup()
    local loaded = false

    local function enable_markview()
        if loaded then
            return
        end
        loaded = true

        vim.cmd.packadd('markview.nvim')
        vim.cmd.packadd('nvim-web-devicons')

        -- 视觉基础
        vim.opt.termguicolors = true
        vim.opt.conceallevel = 2
        vim.opt.concealcursor = 'nc'

        require('markview').setup({
            experimental = {
                date_formats = {},
                date_time_formats = {},
                text_filetypes = {},
                read_chunk_size = 1000,
                link_open_alerts = false,
                file_open_command = 'tabnew',
                list_empty_line_tolerance = 3,
            },

            highlight_groups = {},

            preview = {
                enable = true,
                filetypes = ft_list,
                ignore_buftypes = { 'nofile' },
                ignore_previews = {},
                modes = { 'n', 'no', 'c' },
                hybrid_modes = { 'i', 'v' },
                debounce = 50,
                draw_range = { vim.o.lines, vim.o.lines },
                edit_range = { 1, 0 },
                callbacks = {},
                splitview_winopts = {
                    split = 'left',
                },
            },

            renderers = {},

            html = {
                enable = true,
                container_elements = {},
                headings = {},
                void_elements = {},
            },

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

            yaml = {
                enable = true,
                properties = {},
            },
        })

        -- 打开时自动切换到预览
        vim.api.nvim_create_autocmd('FileType', {
            pattern = ft_list,
            callback = function()
                vim.cmd('Markview toggle')

                local run_key = require('settings.variables.run').run_key
                vim.keymap.set('n', run_key, '<CMD>Markview toggle<CR>', { desc = '切换 Markview 预览' })
                vim.keymap.set('i', run_key, '<CMD>Markview HybridToggle<CR>', { desc = '切换 Markview 混合模式' })
                vim.keymap.set('n', '<leader>' .. run_key, '<CMD>Markview splitToggle<CR>', { desc = '切换 Markview 分屏预览' })
            end,
        })
    end

    vim.api.nvim_create_autocmd('FileType', {
        pattern = ft_list,
        callback = enable_markview,
    })
end

return M
