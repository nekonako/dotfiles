
vim.g.completion_enable_snippet = 'snippets.nvim'
vim.g.completion_auto_change_source = 1
vim.g.completion_matching_strategy_list = {'exact', 'substring'} -- {'exact', 'substring', 'fuzzy', 'all'}
vim.g.completion_sorting = 'none'
vim.g.completion_matching_smart_case = 1
vim.g.completion_chain_complete_list =
    {
        default = {
            {complete_items = {'lsp'}}, {complete_items = {'snippet'}},
            {complete_items = {'path'}}, {mode = '<c-n>'}, {mode = 'dict'}
        }
    }
-- vim.g.completion_enable_auto_popup = 1
vim.g.completion_enable_auto_paren = 1
-- vim.g.completion_enable_auto_hover = 1
-- vim.g.completion_customize_lsp_label = {
--     Function = ' [function]',
--     Method = ' [method]',
--     Reference = ' [refrence]',
--     Enum = ' [enum]',
--     Field = 'ﰠ [field]',
--     Keyword = ' [key]',
--     Variable = ' [variable]',
--     Folder = ' [folder]',
--     Snippet = ' [snippet]',
--     Operator = ' [operator]',
--     Module = ' [module]',
--     Text = 'ﮜ [text]',
--     Class = ' [class]',
--     Interface = ' [interface]'
-- }
vim.g.completion_customize_lsp_label = {
  Function      = '',
  Method        = '',
  Variable      = '',
  Constant      = '',
  Struct        = 'פּ',
  Class         = '',
  Interface     = '禍',
  Text          = '',
  Enum          = '',
  EnumMember    = '',
  Module        = '',
  Color         = '',
  Property      = '襁',
  Field         = '綠',
  Unit          = '',
  File          = '',
  Value         = '',
  Event         = '鬒',
  Folder        = '',
  Keyword       = '',
  Snippet       = '',
  Operator      = '洛',
  Reference     = ' ',
  TypeParameter = '',
  Default       = ''
}

vim.g.completion_chain_complete_list =
    {
        default = {
            default = {
                {complete_items = {'lsp', 'snippet'}},
                {complete_items = {'buffer'}}, {mode = '<C-p>'},
                {mode = '<C-n>'}
            },
            comment = {},
            string = {{complete_items = {'path'}, triggered_only = {'/'}}}
        },
        cpp = {
            default = {
                {complete_items = {'ts', 'lsp'}},
                {complete_items = {'buffer'}}, {mode = '<C-p>'},
                {mode = '<C-n>'}
            },
            comment = {},
            string = {{complete_items = {'path'}, triggered_only = {'/'}}}
        },
        python = {
            default = {
                {complete_items = {'ts'}},
                {complete_items = {'lsp', 'snippet'}},
                {complete_items = {'buffer'}}, {mode = '<C-p>'},
                {mode = '<C-n>'}
            },
            comment = {},
            string = {{complete_items = {'path'}, triggered_only = {'/'}}}
        },
        lua = {default = {{complete_items = {'ts'}}}},
        vim = {default = {{complete_items = {'snippet'}}, {mode = 'cmd'}}}
    }

-- Use <Tab> and <S-Tab> to navigate through popup menu
-- vim.api.nvim_buf_set_keymap(0, 'i', '<tab>', "<Plug>(completion_smart_tab)",
--                             {noremap = false, silent = true})
-- vim.api.nvim_buf_set_keymap(0, 'i', '<s-tab>', "<Plug>(completion_smart_s_tab)",
--                             {noremap = false, silent = true})
-- vim.api.nvim_set_keymap('i', '<Tab>',
--     'pumvisible() ? "\\<C-n>" : "\\<Tab>"',
--     {expr = true})
-- vim.api.nvim_set_keymap('i', '<S-Tab>',
--     'pumvisible() ? "\<C-p>" : "\\<Tab>"',
--     {expr = true})
-- -- map <c-space> to manually trigger completion
-- vim.api.nvim_set_keymap('i', '<C-space>',
--     '<Plug>(completion_trigger)',
--     {noremap = false, silent = true})

vim.cmd [[ augroup completion_nvim_autocmd ]]
vim.cmd [[ autocmd! ]]
vim.cmd [[ autocmd BufEnter *         lua require'completion'.on_attach()]]
vim.cmd [[ autocmd BufEnter *         let g:completion_trigger_character = ['.'] ]]
vim.cmd [[ autocmd BufEnter *.c,*.cpp let g:completion_trigger_character = ['.', '::', '->'] ]]
vim.cmd [[ augroup END ]]
