vim.lsp.protocol.CompletionItemKind =
   {
      "ﮜ [text]", " [method]", " [function]", " [constructor]",
      "ﰠ [field]", " [variable]", " [class]", " [interface]",
      " [module]", " [property]", " [unit]", " [value]",
      " [enum]", " [key]", " [snippet]", " [color]",
      " [file]", " [reference]", " [folder]",
      " [enum member]", " [constant]", " [struct]",
      "⌘ [event]", " [operator]", "⌂ [type]"
   }

require'compe'.setup {
   enabled = true;
   autocomplete = true;
   debug = false;
   min_length = 1;
   preselect = 'enable';
   throttle_time = 80;
   source_timeout = 200;
   incomplete_delay = 400;
   max_abbr_width = 100;
   max_kind_width = 100;
   max_menu_width = 100;
   documentation = true;

   source = {
      path = {menu = '[PATH]', priority = 9},
      treesitter = {menu = '[TS]', priority = 9},
      buffer = {menu = '[BUF]', priority = 8},
      nvim_lsp = {menu = '[LSP]', priority = 10, sort = false},
      nvim_lua = {menu = '[LUA]', priority = 8},
      snippets_nvim = {menu = '[SNP]', priority = 10},
      spell = true,
      calc = true,
      tags = true,
      vsnip = true
   };
}
