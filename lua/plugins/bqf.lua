return {
    {
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
        dependencies = {
            {
                'junegunn/fzf',
                -- dir = '~/.fzf',
                build = function()
                    vim.fn['fzf#install']()
                end
            }
        }
    }
}
