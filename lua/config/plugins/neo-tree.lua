return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    config = function()
        require('neo-tree').setup({
            default_component_configs = {
	            icon = {
                    folder_closed = "",
                    folder_open = "",
                    folder_empty = "󰉖",
                    folder_empty_open = "󰷏",
                    selected = "󰐾",
                    use_filtered_colors = true,
                    default = " ",
                    highlight = "NeoTreeFileIcon",
                    provider = function(icon, node, state) end,
                },
            },
            filesystem = {
                filtered_items = {
                    hide_gitignored = false
                },
            },
        })
    end,
    lazy = false, -- neo-tree will lazily load itself
};
