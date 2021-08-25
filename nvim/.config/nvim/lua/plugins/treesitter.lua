local M = {}

M.config = function()
    local ts_config = require("nvim-treesitter.configs")

    ts_config.setup {
        ensure_installed = {
            "javascript",
            "html",
            "css",
            "bash",
            "zsh",
            "lua",
            "json",
            "python"
            -- "rust",
            -- "go"
        },
        highlight = {
            enable = true,
            use_languagetree = true
        }
    }
end

return M
