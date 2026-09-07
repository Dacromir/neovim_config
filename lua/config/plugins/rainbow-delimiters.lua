return {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
        require('rainbow-delimiters.setup').setup {
            highlight = {
                'RainbowDelimiterYellow',
                'RainbowDelimiterPurple',
                'RainbowDelimiterBlue',
            },
        }
    end,
};
