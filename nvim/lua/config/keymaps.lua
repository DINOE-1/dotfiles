local map = vim.keymap

map.set("n", "<leader>sv", "<C-w>v")
map.set("n", "<leader>sh", "<C-w>s")

map.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")

map.set("n", "<S-L>", ":bnext<CR>")
map.set("n", "<S-H>", ":bprevious<CR>")
map.set("n", "<leader>x", ":bdelete<CR>")
