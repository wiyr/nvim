local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
    -- Vim map
    ["n|<F3>"] = map_cr('set hls!'):with_noremap():with_silent(),
    ["n|<C-x>k"] = map_cr('bdelete'):with_noremap():with_silent(),
    ["n|<C-s>"] = map_cu('write'):with_noremap(),
    ["n|Y"] = map_cmd('y$'),
    ["n|D"] = map_cmd('d$'),
    ["n|n"] = map_cmd('nzzzv'):with_noremap(),
    ["n|N"] = map_cmd('Nzzzv'):with_noremap(),
    ["n|J"] = map_cmd('mzJ`z'):with_noremap(),
    ["n|<C-h>"] = map_cmd('<C-w>h'):with_noremap(),
    ["n|<C-l>"] = map_cmd('<C-w>l'):with_noremap(),
    ["n|<C-j>"] = map_cmd('<C-w>j'):with_noremap(),
    ["n|<C-k>"] = map_cmd('<C-w>k'):with_noremap(),
    ["n|<leader>t"] = map_cr(':tabnew'),
    ["n|<leader>w"] = map_cr(':tabclose'),
    ["n|<leader><tab>"] = map_cr(':tabnext'),
    ["n|<leader><s-tab>"] = map_cr(':tabprevious'),
    ["n|<leader>v"] = map_cr('e ~/.config/nvim/init.vim'),
    ["n|<leader>p"] = map_cr(":r ~/.vbuf"),
    -- ["n|<leader>o"] = map_cr("setlocal spell! spelllang=en_us"),
    ["n|j"] = map_cmd("gj"):with_noremap(),
    ["n|k"] = map_cmd("gk"):with_noremap(),
    ["n|;"] = map_cmd(":"):with_noremap(),
    ["n|0"] = map_cmd("^"):with_noremap(),
    -- Insert
    ["i|<C-u>"] = map_cmd('<C-G>u<C-U>'):with_noremap(),
    ["i|<C-b>"] = map_cmd('<Left>'):with_noremap(),
    ["i|<C-a>"] = map_cmd('<ESC>^i'):with_noremap(),
    ["i|<C-s>"] = map_cmd('<Esc>:w<CR>'),
    ["i|<C-q>"] = map_cmd('<Esc>:wq<CR>'),
    ["i|jk"] = map_cmd('<Esc>'),
    -- command line
    ["c|<C-b>"] = map_cmd('<Left>'):with_noremap(),
    ["c|<C-f>"] = map_cmd('<Right>'):with_noremap(),
    ["c|<C-a>"] = map_cmd('<Home>'):with_noremap(),
    ["c|<C-e>"] = map_cmd('<End>'):with_noremap(),
    ["c|<C-d>"] = map_cmd('<Del>'):with_noremap(),
    ["c|<C-h>"] = map_cmd('<BS>'):with_noremap(),
    ["c|<C-t>"] = map_cmd([[<C-R>=expand("%:p:h") . "/" <CR>]]):with_noremap(),
    ["c|w!!"] = map_cmd("execute 'silent! write !sudo tee % >/dev/null' <bar> edit!"),
    ["c|cd."] = map_cmd("lcd %:p:h"),
    -- Visual
    ["v|J"] = map_cmd(":m '>+1<cr>gv=gv"),
    ["v|K"] = map_cmd(":m '<-2<cr>gv=gv"),
    ["v|<"] = map_cmd("<gv"),
    ["v|>"] = map_cmd(">gv"),
    ["v|<leader>y"] = map_cr(":w! ~/.vbuf"),
}

bind.nvim_load_mapping(def_map)
