return {
    { "folke/which-key.nvim" },
    { "folke/todo-comments.nvim", opts = {} },

    { -- This helps with php/html for indentation
        'captbaritone/better-indent-support-for-php-with-html',
    },

    { -- This helps with ssh tunneling and copying to clipboard
        'ojroques/vim-oscyank',
    },

    { -- Git plugin
        'tpope/vim-fugitive',
    },

    { -- Show historical versions of the file locally
        'mbbill/undotree',
    },

    { -- Show CSS Colors
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },
    {
        "aurum77/live-server.nvim",
        run = function()
            require "live_server.util".install()
        end,
        cmd = { "LiveServer", "LiveServerStart", "LiveServerStop" },
    },
    {
        'mbbill/undotree',
    },
}
