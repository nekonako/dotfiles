vim.fn.sign_define("LspDiagnosticsSignError",
   {text = " ", texthl = "LspDiagnosticsError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
   {text = " ", texthl = "LspDiagnosticsWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
   {text = " ", texthl = "LspDiagnosticsInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint",
   {text = " ", texthl = "LspDiagnosticsHint"})

vim.lsp.handlers["textDocument/publishDiagnostics"] =
   vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      signs = true,
      virtual_text = {spacing = 4, prefix = ' '},
      update_in_insert = false -- delay update
   })

-- Handle formatting in a smarter way
-- If the buffer has been edited before formatting has completed, do not try to
-- apply the changes
vim.lsp.handlers['textDocument/formatting'] =
   function(err, _, result, _, bufnr)
      if err ~= nil or result == nil then return end
      -- If the buffer hasn't been modified before the formatting has finished,
      -- update the buffer
      if not vim.api.nvim_buf_get_option(bufnr, 'modified') then
         local view = vim.fn.winsaveview()
         vim.lsp.util.apply_text_edits(result, bufnr)
         vim.fn.winrestview(view)
         if bufnr == vim.api.nvim_get_current_buf() then
            vim.api.nvim_command('noautocmd :update')
            -- Trigger post-formatting autocommand which can be used to refresh gitgutter
            vim.api.nvim_command(
               'silent doautocmd <nomodeline> User FormatterPost')
         end
      end
   end


local lsp_status = require('lsp-status')
lsp_status.register_progress()

lsp_status.config({
   status_symbol = '',
   indicator_errors = 'e',
   indicator_warnings = 'w',
   indicator_info = 'i',
   indicator_hint = 'h',
   indicator_ok = '✔️',
   spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
})

local lspconfig = require'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.clangd.setup{
   on_attach = lsp_status.on_attach,
   capabilities = lsp_status.capabilities,
}

lspconfig.tsserver.setup {
   on_attach = lsp_status.on_attach,
   capabilities = lsp_status.capabilities,
   filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
   root_dir = lspconfig.util
      .root_pattern(".zshrc", "package.json", ".git"),
}

lspconfig.rust_analyzer.setup {
   on_attach = lsp_status.on_attach,
   capabilities = lsp_status.capabilities,
   root_dir = lspconfig.util
      .root_pattern("Cargo.toml", ".git", ".zshrc"),
   settings = {
      rust = {
         unstable_features = true,
         build_on_save = false,
         all_features = true,
      },
   },
}

lspconfig.pyls.setup{}

lspconfig.gopls.setup{
   on_attach = lsp_status.on_attach,
   capabilities = lsp_status.capabilities,
   cmd = { "gopls" },
   filetypes = { "go", "gomod"},
   root_dir = lspconfig.util
      .root_pattern("go.mod", ".git", "hello.go")
}

lspconfig.bashls.setup{
   on_attach = lsp_status.on_attach,
   capabilities = lsp_status.capabilities,
   cmd = { "bash-language-server", "start" },
   cmd_env = {
      GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
   },
   filetypes = { "sh", "bash", "shell" },
}

lspconfig.kotlin_language_server.setup{
   on_attach = lsp_status.on_attach,
   capabilities = lsp_status.capabilities,
   cmd = { "kotlin-language-server" },
   filetypes = { "kotlin", "kt", "kts"},
   root_dir = lspconfig.util
      .root_pattern("settings.gradle.kts", "gradlew")
}

lspconfig.intelephense.setup {
   on_attach = lsp_status.on_attach,
   capabilities = lsp_status.capabilities,
   cmd = { "intelephense", "--stdio" },
   filetypes = { "php" },
   root_dir = lspconfig.util
      .root_pattern("composer.json", ".git"),
   init_options = {
      globalStoragePath = "/home/nako/dev/workspace/intelephense"
   }
}

lspconfig.html.setup {
   on_attach = lsp_status.on_attach,
   capabilities = lsp_status.capabilities,
   cmd = { "html-languageserver", "--stdio" },
   filetypes = { "html", "php"},
   init_options = {
      configurationSection = { "html", "css", "php" },
      embeddedLanguages = {
         css = true,
         javascript = true,
         php = true
      }
   },
   -- root_dir = lspconfig.util
   --      .root_pattern("package.json"),
   settings = {},
}

lspconfig.cssls.setup{
   on_attach = lsp_status.on_attach,
   capabilities = lsp_status.capabilities,
   cmd = { "css-languageserver", "--stdio" },
   filetypes = { "css", "scss", "less" },
   root_dir = lspconfig.util
      .root_pattern("package.json"),
   settings = {
      css = {
         validate = true
      },
      less = {
         validate = true
      },
      scss = {
         validate = true
      }
   }
}

lspconfig.vimls.setup {
   on_attach = lsp_status.on_attach,
   capabilities = lsp_status.capabilities,
   cmd = { "vim-language-server", "--stdio" },
   filetypes = { "vim" },
   init_options = {
      diagnostic = {
         enable = true
      },
      indexes = {
         count = 3,
         gap = 100,
         projectRootPatterns = { "runtime",  "nvim", ".git", "autoload", "plugin", ".zshrc", "init.vim" },
         runtimepath = true
      },
      iskeyword = "@,48-57,_,192-255,-#",
      runtimepath = "",
      suggest = {
         fromRuntimepath = true,
         fromVimruntime = true
      },
      vimruntime = ""
   },
}

lspconfig.vuels.setup{
   on_attach = lsp_status.on_attach,
   capabilities = lsp_status.capabilities,
   cmd = { "vls" },
   filetypes = { "vue" },
   init_options = {
      config = {
         css = {},
         emmet = {},
         html = {
            suggest = {}
         },
         javascript = {
            format = {}
         },
         stylusSupremacy = {},
         typescript = {
            format = {}
         },
         vetur = {
            completion = {
               autoImport = false,
               tagCasing = "kebab",
               useScaffoldSnippets = false
            },
            format = {
               defaultFormatter = {
                  js = "none",
                  ts = "none"
               },
               defaultFormatterOptions = {},
               scriptInitialIndent = false,
               styleInitialIndent = false
            },
            useWorkspaceDependencies = false,
            validation = {
               script = true,
               style = true,
               template = true
            }
         }
      }
   },
   root_dir = lspconfig.util
      .root_pattern("package.json", "vue.config.js")
}

local system_name
if vim.fn.has("mac") == 1 then
   system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
   system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
   system_name = "Windows"
else
   print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = '/home/nako/.local/bin/sumneko_lua'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
   settings = {
      Lua = {
         runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
            -- Setup your lua path
            path = vim.split(package.path, ';'),
         },
         diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
         },
         workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
               [vim.fn.expand('$VIMRUNTIME/lua')] = true,
               [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
         },
      },
   },
}

-- lspconfig.jdtls.setup {
--     on_attach = lsp_status.on_attach,
--     capabilities = lsp_status.capabilities,
--     cmd = { "/usr/lib/jvm/java-11-openjdk/bin/java",
--         "-Declipse.application=org.eclipse.jdt.ls.core.id1",
--         "-Dosgi.bundles.defaultStartLevel=4",
--         "-Declipse.product=org.eclipse.jdt.ls.core.product",
--         "-Dlog.protocol=true",
--         "-Dlog.level=ALL",
--         "-Xms1g",
--         "-Xmx2G",
--         "-jar",
--         "/home/nako/dev/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar",
--         "-configuration",
--         "/home/nako/dev/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/config_linux",
--         "-data",
--         "/home/nako/dev/workspace",
--         "--add-modules=ALL-SYSTEM",
--     },
--     cmd_env = {
--         GRADLE_HOME = "/home/nako/.gradle",
--         JAR = "/home/nako/dev/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/plugins/org.eclipse.equinox.launcher_1.6.0.v20200915-1508.jar"
--     },
--     filetypes = { "java" },
--     init_options = {
--         workspace = "/home/nako/dev/workspace"
--     },
--     root_dir = lspconfig.util.root_pattern(".git", "main.java", ".zshrc")
-- }


-- lspconfig.flow.setup {
--     on_attach = lsp_status.on_attach,
--     capabilities = lsp_status.capabilities,
--     root_dir = lspconfig.util
--         .root_pattern("package.json", ".git/", ".zshrc"),
-- }


--     vim.fn.sign_define("LspDiagnosticsSignError",
--                        {text = "◉", texthl = "LspDiagnosticsError"})
--     vim.fn.sign_define("LspDiagnosticsSignWarning",
--                        {text = "•", texthl = "LspDiagnosticsWarning"})
--     vim.fn.sign_define("LspDiagnosticsSignInformation",
--                        {text = "•", texthl = "LspDiagnosticsInformation"})
--     vim.fn.sign_define("LspDiagnosticsSignHint",
--                        {text = "H", texthl = "LspDiagnosticsHint"})

--     vim.lsp.handlers["textDocument/publishDiagnostics"] =
--         vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--             underline = true,
--             signs = true,
--             virtual_text = {spacing = 4, prefix = ''},
--             -- delay update
--             update_in_insert = false
--         })

--     -- Handle formatting in a smarter way
--     -- If the buffer has been edited before formatting has completed, do not try to
--     -- apply the changes
--     -- vim.lsp.handlers['textDocument/formatting'] =
--     --     function(err, _, result, _, bufnr)
--     --         if err ~= nil or result == nil then return end
--     --         -- If the buffer hasn't been modified before the formatting has finished,
--     --         -- update the buffer
--     --         if not vim.api.nvim_buf_get_option(bufnr, 'modified') then
--     --             local view = vim.fn.winsaveview()
--     --             vim.lsp.util.apply_text_edits(result, bufnr)
--     --             vim.fn.winrestview(view)
--     --             if bufnr == vim.api.nvim_get_current_buf() then
--     --                 vim.api.nvim_command('noautocmd :update')

--     --                 -- Trigger post-formatting autocommand which can be used to refresh
--     --                 -- gitgutter
--     --                 vim.api.nvim_command(
--     --                     'silent doautocmd <nomodeline> User FormatterPost')
--     --             end
--     --         end
--     --     end


--     local lspconfig = require'lspconfig'
--     local lsp_status = require'lsp-status'
--     lsp_status.register_progress()
--     -- client log level
--     vim.lsp.set_log_level('info')

--     local on_attach = function(client, bufnr)
--        require 'completion'
--               local function buf_set_keymap(...)
--             vim.api.nvim_buf_set_keymap(bufnr, ...)
--         end
--         local function buf_set_option(...)
--             vim.api.nvim_buf_set_option(bufnr, ...)
--         end

--         -- omni completion source
--         vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'
--         -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

--         -- Mappings.
--         local opts = {noremap = true, silent = true}
--         buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--         buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--         buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--         buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
--                        opts)
--         buf_set_keymap('n', '<C-k>',
--                        '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--         buf_set_keymap('n', '<space>wa',
--                        '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--         buf_set_keymap('n', '<space>wr',
--                        '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
--                        opts)
--         buf_set_keymap('n', '<space>wl',
--                        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
--                        opts)
--         buf_set_keymap('n', '<space>D',
--                        '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--         buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
--                        opts)
--         buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
--         buf_set_keymap('n', '<space>e',
--                        '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
--                        opts)
--         buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
--                        opts)
--         buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
--                        opts)
--         buf_set_keymap('n', '<space>q',
--                        '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--         vim.o.shortmess = vim.o.shortmess .. "c"

--         -- Set some keybinds conditional on server capabilities
--         if client.resolved_capabilities.document_formatting then
--             buf_set_keymap("n", "<space>f",
--                            "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--         elseif client.resolved_capabilities.document_range_formatting then
--             buf_set_keymap("n", "<space>f",
--                            "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--         end

--         -- Format on save
--         if client.resolved_capabilities.document_formatting then
--             vim.api.nvim_command [[augroup Format]]
--             vim.api.nvim_command [[autocmd! * <buffer>]]
--             vim.api
--                 .nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)]]
--             vim.api.nvim_command [[augroup END]]
--         end

--         -- Set autocommands conditional on server_capabilities
--         if client.resolved_capabilities.document_highlight then
--             require'lspconfig'.util.nvim_multiline_command [[
--         :hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
--         :hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
--         :hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
--         augroup lsp_document_highlight
--           autocmd!
--           autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--           autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--         augroup END
--       ]]
--         end

--         print("LSP attached.")
--     end
--     -- define language servers
--     lspconfig.pyls.setup {
--         -- on_attach = require'completion'.on_attach,
--         cmd = {"pyls", "--log-file", "/tmp/pyls.log", "--verbose"},
--         settings = {
--             pyls = {
--                 configurationSources = {"pycodestyle", "flake8"},
--                 plugins = {pyls_mypy = {enabled = true}}
--             }
--         }
--     }
--     -- lspconfig.vimls.setup {}
--     -- lspconfig.jdtls.setup{}
--     -- lspconfig.jsonls.setup {}
--     lspconfig.tsserver.setup {
--         on_attach = on_attach,
--         root_dir = lspconfig.util
--             .root_pattern("package.json", ".git/", ".zshrc"),
--     }
--         lspconfig.flow.setup {
--         on_attach = on_attach,
--         root_dir = lspconfig.util
--             .root_pattern("package.json", ".git/", ".zshrc"),
--     }
