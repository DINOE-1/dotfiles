return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "nord", 
                    component_separators = '|',
                    section_separators = '',
                },
            })
        end,
    },
    
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
	
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                window = {
                    width = 30,
                },
                filesystem = {
                    filtered_items = {
                        visible = true,
                        hide_dotfiles = false,
                        hide_gitignored = false,
                    },
                },
            })
        end,
    },


}
