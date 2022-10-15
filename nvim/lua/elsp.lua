-- Mappings.
local opts = { noremap=true, silent=true }

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end

local servers = { 'pyright', 'tsserver', 'jdtls', 'clangd' }
local lspc = require('lspconfig')
for _, lsp in pairs(servers) do
	-- Go through each item, and do require(lspconfig).item.setup( { table } )
    lspc[lsp].setup {
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        }
    }
end


lspc.rust_analyzer.setup({
    on_attach=on_attach,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

-- this is for diagnositcs signs on the line number column
-- use this to beautify the plain E W signs to more fun ones
-- !important nerdfonts needs to be setup for this to work in your terminal
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " } 
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl } )
end

local cmp = require("cmp")                                                                                                                                                              
 
cmp.setup({                                                                                                                                                                             
  sources = {                                                                                                                                                                           
    { name = 'nvim_lsp' }                                                                                                                                                               
   },
   mapping = cmp.mapping.preset.insert({
	   ['<Tab>'] = function(fallback)
		   if cmp.visible() then
			   cmp.select_next_item()
		   else
			   fallback()
		   end
	   end,
	   ['<S-Tab>'] = function(fallback)
		   if cmp.visible() then
			   cmp.select_prev_item()
		   else
			   fallback()
		   end
	   end,
	   ['<CR>'] = cmp.mapping.confirm({ select = true }),
	   ['<C-e>'] = cmp.mapping.abort(),
	   ['<Esc>'] = cmp.mapping.close(),
	   ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	   ['<C-f>'] = cmp.mapping.scroll_docs(4),
   }),
})                                                                                                                                                                               
local capabilities = vim.lsp.protocol.make_client_capabilities()                                                                                                                        
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities) 
