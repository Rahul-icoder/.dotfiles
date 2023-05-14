vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Telescope plugin
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Theme
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    -- Treesitter Plugin
    use(
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    )
    use('nvim-treesitter/playground')

    -- Harpoon Plugin
    use('ThePrimeagen/harpoon')

    -- Undo Tree Plugin
    use('mbbill/undotree')

    -- Auto Tag
    use('windwp/nvim-ts-autotag')

    -- git integration
    use('tpope/vim-fugitive')

    -- git signs
    use {
        'lewis6991/gitsigns.nvim',
    }

    -- colorizer
    use('norcalli/nvim-colorizer.lua')

    -- Auto Pair
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- lua-line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- comment plugin
    use('numToStr/Comment.nvim')
    use('JoosepAlviste/nvim-ts-context-commentstring')

    -- Web Icons
    use('nvim-tree/nvim-web-devicons')

    -- Surround the word , line , character
    use('tpope/vim-surround')
    -- LSP Plugin
    -- use('jose-elias-alvarez/null-ls.nvim')
    -- use('jay-babu/mason-null-ls.nvim')
    use("sbdchd/neoformat")
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }
end)
