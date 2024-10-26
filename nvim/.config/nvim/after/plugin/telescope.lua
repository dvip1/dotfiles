local telescope = require('telescope')

telescope.setup({
    defaults = {
        follow = true,  -- Follow symbolic links
        hidden = true,  -- Show hidden files
    },
    pickers = {
        find_files = {
            follow = true,
            hidden = true
        }
    }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({search = vim.fn.input("Grep > ")})
end, { desc = 'Telescope grep string' })
