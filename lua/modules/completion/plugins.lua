local completion = {}
local conf = require('modules.completion.config')

-- A collection of common configurations for Neovim's built-in language server client.
completion['neovim/nvim-lspconfig'] = {
    opt = true,
    event = 'BufRead',
    config = conf.nvim_lsp
}
completion['williamboman/nvim-lsp-installer'] = {
    opt = true,
    after = 'nvim-lspconfig',
}
-- 炫酷的代码重构，悬浮窗显示
completion['tami5/lspsaga.nvim'] = {
    opt = true,
    after = 'nvim-lspconfig',
    config = conf.saga
}
completion["hrsh7th/cmp-buffer"] = {
    opt = true,
    after = 'nvim-cmp'
}
completion["hrsh7th/cmp-nvim-lsp"] = {
    opt = true,
    after = 'nvim-cmp'
}
-- 路径补全
completion["hrsh7th/cmp-path"] = {
    opt = true,
    after = 'nvim-cmp'
}
completion["hrsh7th/cmp-cmdline"] = {
    opt = true,
    after = 'nvim-cmp'
}
-- completion["lukas-reineke/cmp-under-comparator"] = {after = 'nvim-cmp'}
completion['hrsh7th/nvim-cmp'] = {
    event = 'InsertEnter',
    after = 'nvim-lspconfig',
    config = conf.cmp,
    requires = {
		-- { "lukas-reineke/cmp-under-comparator" },
		-- { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
		-- { "hrsh7th/cmp-nvim-lsp", after = "cmp_luasnip" },
		-- { "hrsh7th/cmp-nvim-lua", after = "cmp-nvim-lsp" },
		-- { "andersevenrud/cmp-tmux", after = "cmp-nvim-lua" },
		-- { "f3fora/cmp-spell", after = "cmp-path" },
		-- { "kdheepak/cmp-latex-symbols", after = "cmp-buffer" },
    }
}
-- Show function signature when you type
completion['ray-x/lsp_signature.nvim'] = {opt = true, after = 'nvim-lspconfig'}
completion['tzachar/cmp-tabnine'] = {
    opt = true,
    after = 'nvim-cmp',
    run = './install.sh'
}
-- completion['hrsh7th/vim-vsnip-integ'] = {
    -- opt = true,
    -- after = 'nvim-compe',
    -- requires = {'hrsh7th/vim-vsnip', opt = true, event = 'InsertCharPre'}
-- }
-- completion['rafamadriz/friendly-snippets'] = {opt = true, after = 'nvim-compe'}
-- completion['SirVer/ultisnips'] = {
    -- opt = true,
    -- after = 'nvim-compe',
    -- requires = {'honza/vim-snippets', opt = true}
-- }
-- completion['windwp/nvim-autopairs'] = {
    -- opt = true,
    -- event = 'InsertCharPre',
    -- after = 'nvim-compe',
    -- config = conf.autopairs
-- }

return completion
