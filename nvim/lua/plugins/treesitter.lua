return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        run = ":TSUpdate",
        config = function()
            require 'nvim-treesitter.install'.compilers = { "gcc" }
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "javascript", "html" },
                highlight = { enable = true },
                indent = { enable = true },

                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                },
            }
        end,
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
    },
}
