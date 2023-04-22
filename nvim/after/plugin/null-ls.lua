local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.shfmt,
    },
})
vim.cmd('map <Leader>fd :lua vim.lsp.buf.format()<CR>')

