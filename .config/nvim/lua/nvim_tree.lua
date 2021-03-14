vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
vim.g.nvim_tree_auto_open = 1 -- 0 by default, opens the tree when typing `nvim $DIR` or `nvim`
vim.g.nvim_tree_auto_close = 0 -- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_follow = 1 -- 0 by default, this option allows the cursor to be updated when entering a buffer
vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 0 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_width = 30 -- 30 by default
vim.g.nvim_tree_quit_on_open = 0 -- 0 by default, closes the tree when you open a file
vim.g.nvim_tree_hide_dotfiles = 1 -- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_tab_open = 0 -- 0 by default, will open the tree when entering a new tab and the tree was previously open
vim.g.nvim_tree_allow_resize = 1 -- 0 by default, will not resize the tree when opening a file
vim.g.nvim_tree_disable_keybindings = 0
--  modify some of the key mappings
vim.g.nvim_tree_bindings = {
   edit = {'<CR>', 'o', 'l'},
   edit_vsplit = {'<C-v>', '|'},
   edit_split = {'<C-x>', '-'},
   edit_tab = '<C-t>',
   close_node = {'<S-CR>', 'h'},
   toggle_ignored = '!',
   toggle_dotfiles = '.',
   refresh = 'R',
   preview = '<Tab>',
   cd = '<C-]>',
   create = 'a',
   remove = 'd',
   rename = 'r',
   cut = 'dd',
   copy = 'yy',
   paste = 'p',
   prev_git_item = '[c',
   next_git_item = ']c',
   dir_up = '-',
   close = 'q'
}

vim.g.nvim_tree_icons = {
   default = ' ',
   symlink = ' ',
   git = {
      unstaged = "",
      staged = " ",
      unmerged = "",
      renamed = " ",
      untracked = " "
   },
   folder = {default = "  ", open = "  "}
}

-- vim.cmd([[
-- hi NvimTreeFolderIcon guifg = #9CDBDF
-- hi NvimTreeFolderName guifg = #CCA8C9
-- hi NvimTreeIndentMarker guifg = #DEE7AA
-- ]])
