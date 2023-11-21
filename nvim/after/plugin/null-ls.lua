local null_ls = require("null-ls")
local formatting = null_ls.builtins
local diagnostics = null_ls.diagnostics
local completion = null_ls.completion
null_ls.setup({
	sources = {
		formatting.stylua,
		formatting.prettier,
		-- formatting.prettier.with {
		--   extra_filetypes = { "toml" },
		--   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		-- },
		formatting.black,
		formatting.beautysh,
		completion.spell,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
