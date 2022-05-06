local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
--require('keymap.config')

local plug_map = {
    -- Complete
    -- ["i|<C-e>"] = map_cmd([[compe#close('<C-e>')]]):with_expr():with_silent(),
    -- ["i|<C-f>"] = map_cmd([[compe#scroll({ 'delta': +4 })]]):with_expr()
        -- :with_silent(),
    -- ["i|<C-d>"] = map_cmd([[compe#scroll({ 'delta': -4 })]]):with_expr()
        -- :with_silent(),
    -- ["i|<C-Space>"] = map_cmd([[compe#complete()]]):with_expr():with_silent(),
    -- ["i|<Tab>"] = map_cmd("v:lua.tab_complete()"):with_expr():with_silent(),
    -- ["s|<Tab>"] = map_cmd("v:lua.tab_complete()"):with_expr():with_silent(),
    -- ["i|<S-Tab>"] = map_cmd("v:lua.s_tab_complete()"):with_expr():with_silent(),
    -- ["s|<S-Tab>"] = map_cmd("v:lua.s_tab_complete()"):with_expr():with_silent(),
    -- Packer
    ["n|<leader>ps"] = map_cr("PackerSync"):with_silent():with_noremap()
        :with_nowait(),
    ["n|<leader>pu"] = map_cr("PackerUpdate"):with_silent():with_noremap()
        :with_nowait(),
    ["n|<leader>pi"] = map_cr("PackerInstall"):with_silent():with_noremap()
        :with_nowait(),
    ["n|<leader>pc"] = map_cr("PackerCompile"):with_silent():with_noremap()
        :with_nowait(),
    -- Lsp mapp work when insertenter and lsp start
    ["n|<leader>li"] = map_cr("LspInfo"):with_noremap():with_silent()
        :with_nowait(),
    ["n|<leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent()
        :with_nowait(),
    ["n|g["] = map_cr('Lspsaga diagnostic_jump_next'):with_noremap()
        :with_silent(),
    ["n|g]"] = map_cr('Lspsaga diagnostic_jump_prev'):with_noremap()
        :with_silent(),
    ["n|K"] = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
    ["n|ca"] = map_cr("Lspsaga code_action"):with_noremap()
        :with_silent(),
    ["v|ca"] = map_cu("Lspsaga range_code_action"):with_noremap()
        :with_silent(),
    ["n|<c-]>"] = map_cmd('<cmd>lua vim.lsp.buf.definition()<CR>'):with_noremap()
        :with_silent(),
    ["n|gD"] = map_cmd("<cmd>lua vim.lsp.buf.implementation()<CR>"):with_noremap()
        :with_silent(),
    ["n|gs"] = map_cr('Lspsaga signature_help'):with_noremap():with_silent(),
    ["n|gr"] = map_cr('Lspsaga rename'):with_noremap():with_silent(),
    ["n|gf"] = map_cr('Lspsaga lsp_finder'):with_noremap():with_silent(),
    ["n|go"] = map_cu('Lspsaga open_floaterm'):with_noremap():with_silent(),
    ["t|gc"] = map_cu([[<C-\><C-n>:Lspsaga close_floaterm<CR>]]):with_noremap()
        :with_silent(),
    -- ["n|<Leader>g"] = map_cu("Lspsaga open_floaterm gitui"):with_noremap()
        -- :with_silent(),
    -- Plugin Telescope
    ["n|<Leader>fp"] = map_cu('Telescope project'):with_noremap():with_silent(),
    ["n|<Leader>o"] = map_cu('Telescope oldfiles'):with_noremap()
        :with_silent(),
    ["n|<Leader>ff"] = map_cu('Telescope frecency'):with_noremap():with_silent(),
    ["n|<Leader>l"] = map_cu('Telescope find_files'):with_noremap():with_silent(),
    ["n|<Leader>sc"] = map_cu('DashboardChangeColorscheme'):with_noremap()
        :with_silent(),
    ["n|<Leader>a"] = map_cu('Telescope live_grep'):with_noremap():with_silent(),
    ["n|<Leader>fn"] = map_cu('DashboardNewFile'):with_noremap():with_silent(),
    -- Plugin accelerate-jk
    -- ["n|j"] = map_cmd("v:lua.enhance_jk_move('j')"):with_silent():with_expr(),
    -- ["n|k"] = map_cmd("v:lua.enhance_jk_move('k')"):with_silent():with_expr(),
    -- Plugin EasyAlign
    -- ["n|ga"] = map_cmd("v:lua.enhance_align('nga')"):with_expr(),
    -- ["x|ga"] = map_cmd("v:lua.enhance_align('xga')"):with_expr(),
    -- Plugin ZenMode
    ["n|<leader>z"] = map_cr('ZenMode'):with_noremap():with_silent(),
    -- Plugin SymbolOutline
    ["n|<leader>m"] = map_cr('SymbolsOutline'):with_noremap():with_silent(),
    -- Plugin MarkdownPreview
    ["n|<F12>"] = map_cr('MarkdownPreviewToggle'):with_noremap():with_silent(),
    -- Plugin auto_session
    ["n|<leader>ss"] = map_cu('SaveSession'):with_noremap():with_silent(),
    ["n|<leader>sr"] = map_cu('RestoreSession'):with_noremap():with_silent(),
    ["n|<leader>sd"] = map_cu('DeleteSession'):with_noremap():with_silent(),
    -- Plugin SnipRun
    -- ["v|r"] = map_cr('SnipRun'):with_noremap():with_silent(),
    -- Plugin dap
    ["n|<F6>"] = map_cr("lua require('dap').continue()"):with_noremap()
        :with_silent(),
    ["n|<leader>dr"] = map_cr("lua require('dap').continue()"):with_noremap()
        :with_silent(),
    ["n|<leader>dd"] = map_cr("lua require('dap').disconnect()"):with_noremap()
        :with_silent(),
    ["n|<leader>db"] = map_cr("lua require('dap').toggle_breakpoint()"):with_noremap()
        :with_silent(),
    ["n|<leader>dB"] = map_cr(
        "lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))"):with_noremap()
        :with_silent(),
    ["n|<leader>dbl"] = map_cr("lua require('dap').list_breakpoints()"):with_noremap()
        :with_silent(),
    ["n|<leader>drc"] = map_cr("lua require('dap').run_to_cursor()"):with_noremap()
        :with_silent(),
    ["n|<leader>drl"] = map_cr("lua require('dap').run_last()"):with_noremap()
        :with_silent(),
    ["n|<F9>"] = map_cr("lua require('dap').step_over()"):with_noremap()
        :with_silent(),
    ["n|<leader>dv"] = map_cr("lua require('dap').step_over()"):with_noremap()
        :with_silent(),
    ["n|<F10>"] = map_cr("lua require('dap').step_into()"):with_noremap()
        :with_silent(),
    ["n|<leader>di"] = map_cr("lua require('dap').step_into()"):with_noremap()
        :with_silent(),
    ["n|<F11>"] = map_cr("lua require('dap').step_out()"):with_noremap()
        :with_silent(),
    ["n|<leader>do"] = map_cr("lua require('dap').step_out()"):with_noremap()
        :with_silent(),
    ["n|<leader>dl"] = map_cr("lua require('dap').repl.open()"):with_noremap()
        :with_silent(),
    -- vim commentary: <ctrl-/>
    ["n|<c-_>"] = map_cr("Commentary"):with_noremap()
        :with_silent(),
    ["v|<c-_>"] = map_cr("Commentary"):with_noremap()
        :with_silent(),
    ["x|<c-_>"] = map_cr("Commentary"):with_noremap()
        :with_silent(),
	-- Plugin nvim-tree
	["n|<leader>n"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
	["n|<leader>f"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent(),
	["n|<leader>r"] = map_cr("NvimTreeRefresh"):with_noremap():with_silent(),
};

bind.nvim_load_mapping(plug_map)
