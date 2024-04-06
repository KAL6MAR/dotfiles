local keymap = vim.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'kj', '<ESC>')

keymap.set('n', 'x', '"_x')

keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

keymap.set('n', 'dw', 'vb"_d')

keymap.set('n', '<C-a>', 'gg<S-v>G')

keymap.set('n', 'te', ':tabedit<Return>', { silent = true })
keymap.set('n', 'sv', ':split<Return><C-w>W', { silent = true })
keymap.set('n', 'ss', ':vsplit<Return><C-w>W', { silent = true })

keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sl', '<C-w>l')

keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')


keymap.set('n', '<leader>j', ":m .+1<CR>==")
keymap.set('n', '<leader>k', ":m .-2<CR>==")
keymap.set('v', '<leader>j', ":m '>+1<CR>gv=gv")
keymap.set('v', '<leader>k', ":m '<-2<CR>gv=gv")
