" LOAD PLUGIN FIRST
source $HOME/.config/nvim/vim-plug.vim

" LOAD NVIM SETTING
source $HOME/.config/nvim/settings/set.vim
source $HOME/.config/nvim/settings/keybind.vim
source $HOME/.config/nvim/settings/filetype.vim

" LOAD PLUGIN SETTING
source $HOME/.config/nvim/plugins/indentLine.vim
source $HOME/.config/nvim/plugins/vim-gitgutter.vim
source $HOME/.config/nvim/plugins/barbar.vim

" LOAD LUA BASED PLUGIN SETING
lua require('treesitter')
lua require('galaxy_line')
lua require('nvim_tree')
lua require('lsp')
lua require('nvim_compe')
lua require('nvim_telescope')
lua require('nvim_web_devicon')
lua require'colorizer'.setup()

source $HOME/.config/nvim/settings/highlight.vim

if has('nvim-0.5')
  augroup lsp
    au!
    au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
  augroup end
endif
