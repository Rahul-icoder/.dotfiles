require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "go", "javascript", "typescript", "python", "lua", "vim", "query" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    autopairs = {
        enable = true
    },
    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    context_commentstring = {
        enable = true,
    },


    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
