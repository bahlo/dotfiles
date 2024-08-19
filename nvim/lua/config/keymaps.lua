local map = vim.keymap.set

local M = {}

-- Wrap it in a function to prevent requiring this file evaluates
-- global keymaps multiple times.
M.init = function()
    map("n", "<leader><space>", function()
        require('telescope.builtin').find_files()
    end, { silent = true, desc = "Find files" })
    map("n", "<leader>f", function()
        require('telescope.builtin').live_grep()
    end, { silent = true, desc = "Live grep" })
    map("n", "<leader>b", function()
        require('telescope.builtin').buffers()
    end, { silent = true, desc = "Buffers" })

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end

return M
