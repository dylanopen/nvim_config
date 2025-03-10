local lz = require("lsp-zero")
local luasnip = require('luasnip')

local lsp_attach = function(client, bufnr)
    local opts = {buffer = bufnr}

    vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gc", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gf", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
end

lz.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
})


local lc = require("lspconfig")
local util = require("lspconfig/util")
local configs = require("lspconfig.configs")

lc.clangd.setup({})
lc.zls.setup({})
lc.dartls.setup({})
lc.marksman.setup({})
lc.asm_lsp.setup({})
lc.digestif.setup({})
lc.pyright.setup({})
lc.glslls.setup({})
lc.html.setup({})
lc.quick_lint_js.setup({})
lc.cssls.setup({})
lc.asm_lsp.setup({})
lc.java_language_server.setup({})

--configs.wgsl_analyzer = {
--    default_config = {
--	cmd = { vim.fn.expand("$HOME") .. "/.cargo/bin/wgsl_analyzer" },
--	filetypes = { "wgsl" },
--	root_dir = lc.util.root_pattern("../"),
--	settings = {},
--    },
--}
-- lc.wgsl_analyzer.setup({})
--lc.ltex.setup({})

lc.rust_analyzer.setup({
    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end,
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

local cmp = require('cmp')

cmp.setup({
    sources = {
	{name = 'nvim_lsp'},
    },
    snippet = {
	expand = function(args)
	    luasnip.lsp_expand(args.body)
	end,
    },
    mapping = cmp.mapping.preset.insert({
	["<M-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
	["<M-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
	["<M-;>"] = cmp.mapping.confirm({ select = true }),
	["<C-j>"] = cmp.mapping.scroll_docs(4),
	["<C-k>"] = cmp.mapping.scroll_docs(-4),

	['<Tab>'] = cmp.mapping(function(fallback)
	    if cmp.visible() then
		cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
	    elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	    else
		fallback()
	    end
	end, { 'i', 's' }),

	['<S-Tab>'] = cmp.mapping(function(fallback)
	    if cmp.visible() then
		cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
	    elseif luasnip.jumpable(-1) then
		luasnip.jump(-1)
	    else
		fallback()
	    end
	end, { 'i', 's' }),

    }),
})

