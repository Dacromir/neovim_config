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
            enable_diagnostics = true,
            filesystem = {
                filtered_items = {
                    hide_gitignored = false
                },
                use_libuv_file_watcher = true
            },
            renderers = {
                directory = {
                    { "indent" },
                    { "icon" },
                    { "current_filter" },
                    {
                        "container",
                        content = {
                            { "name",          zindex = 10 },
                            {
                                "symlink_target",
                                zindex = 10,
                                highlight = "NeoTreeSymbolicLinkTarget",
                            },
                            { "clipboard",     zindex = 10 },
                            { "diagnostics",   errors_only = false, zindex = 20,     align = "right",          hide_when_expanded = true },
                            { "git_status",    zindex = 10,         align = "right", hide_when_expanded = true },
                            { "file_size",     zindex = 10,         align = "right" },
                            { "type",          zindex = 10,         align = "right" },
                            { "last_modified", zindex = 10,         align = "right" },
                            { "created",       zindex = 10,         align = "right" },
                        },
                    },
                },
                file = {
                    { "indent" },
                    { "icon" },
                    {
                        "container",
                        content = {
                            {
                                "name",
                                zindex = 10
                            },
                            {
                                "symlink_target",
                                zindex = 10,
                                highlight = "NeoTreeSymbolicLinkTarget",
                            },
                            { "clipboard",     zindex = 10 },
                            { "bufnr",         zindex = 10 },
                            { "modified",      zindex = 20, align = "right" },
                            { "diagnostics",   zindex = 20, align = "right" },
                            { "git_status",    zindex = 10, align = "right" },
                            { "file_size",     zindex = 10, align = "right" },
                            { "type",          zindex = 10, align = "right" },
                            { "last_modified", zindex = 10, align = "right" },
                            { "created",       zindex = 10, align = "right" },
                        },
                    },
                },
                message = {
                    { "indent", with_markers = false },
                    { "name",   highlight = "NeoTreeMessage" },
                },
                terminal = {
                    { "indent" },
                    { "icon" },
                    { "name" },
                    { "bufnr" }
                }
            },
        })
    end,
    lazy = false, -- neo-tree will lazily load itself
};
