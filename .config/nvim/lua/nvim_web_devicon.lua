local color = require('xresources')

require'nvim-web-devicons'.setup {
   override = {
      vim = {
         icon = ' ',
         color = color.green,
         name = 'Vim'
      },
      lua = {
         icon = ' ',
         color = color.blue,
         name = 'Lua'
      },
      js = {
         icon = ' ',
         color = color.yellow,
         name = 'Js'
      },
      json = {
         icon = ' ',
         color = color.yellow,
         name = 'Json'
      },
      rust = {
         icon = ' ',
         color = color.red,
         name = 'Rust'
      }
   };
}
