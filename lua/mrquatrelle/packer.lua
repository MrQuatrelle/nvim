return require("packer").startup(function(use)
    use {
        "wbthomason/packer.nvim",
    }
    use {
        "folke/tokyonight.nvim",
    }
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    }
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        }
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use {
        "nvim-treesitter/nvim-treesitter-context",
    }
    use {
        "theprimeagen/harpoon",
        requires = {
            "nvim-lua/plenary.nvim"
        },
    }
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    }
    use {
        "folke/trouble.nvim",
    }
    use {
        "mrcjkb/rustaceanvim",
    }
    use {
        "mfussenegger/nvim-jdtls",
    }
    use {
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons", opt = true
        }
    }
    use {
        "folke/todo-comments.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim",
        },
    }
    use {
        "danymat/neogen",
    }
    use {
        "andweeb/presence.nvim",
    }
    use {
        "m4xshen/smartcolumn.nvim",
    }
    use {
        "mbbill/undotree",
    }
    use {
        "Pocco81/auto-save.nvim",
    }
    use {
        "windwp/nvim-autopairs",
    }
    use {
        "folke/zen-mode.nvim"
    }
    use {
        "mistricky/codesnap.nvim",
        run = "make"
    }
    use {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }
    use {
        "donRaphaco/neotex",
    }
end)
