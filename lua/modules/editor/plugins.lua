local editor = {}
local conf = require('modules.editor.config')

-- editor['junegunn/vim-easy-align'] = {opt = true, cmd = 'EasyAlign'}
editor['itchyny/vim-cursorword'] = {
    opt = true,
    event = {'BufReadPre', 'BufNewFile'},
    -- config = conf.vim_cursorwod
}
-- editor["terrortylor/nvim-comment"] = {
	-- opt = false,
    -- config = conf.nvim_comment,
-- }
editor['tpope/vim-commentary'] = {
    opt = false,
    config = conf.vim_commentary,
}

-- 显示单文件代码整体架构
editor['simrat39/symbols-outline.nvim'] = {
    opt = true,
    cmd = {'SymbolsOutline', 'SymbolsOulineOpen'},
    config = conf.symbols_outline
}
-- 根据不同语言解析代码, 提供接口, 比如可以用于显示准确的高亮
editor['nvim-treesitter/nvim-treesitter'] = {
    opt = true,
    run = ':TSUpdate',
    event = 'BufRead',
    after = 'telescope.nvim',
    config = conf.nvim_treesitter
}
-- -- 基于treesitter 的vim textobjects
-- editor['nvim-treesitter/nvim-treesitter-textobjects'] = {
    -- opt = true,
    -- after = 'nvim-treesitter'
-- }
-- 看超长代码很有用
editor['romgrk/nvim-treesitter-context'] = {
    opt = true,
    after = 'nvim-treesitter',
    config = conf.treesitter_context
}
-- 基于treesitter的高亮, 括号高亮难看
-- editor['p00f/nvim-ts-rainbow'] = {
    -- opt = true,
    -- after = 'nvim-treesitter',
    -- event = 'BufRead'
-- }
-- editor['sbdchd/neoformat'] = {opt = true, cmd = 'Neoformat'}
-- editor['rhysd/accelerated-jk'] = {opt = true}
-- editor['hrsh7th/vim-eft'] = {opt = true}
-- 高亮查询
editor['romainl/vim-cool'] = {
    opt = true,
    event = {'CursorMoved', 'InsertEnter'}
}
--很卡
-- editor['karb94/neoscroll.nvim'] = {
    -- opt = true,
    -- event = "WinScrolled",
    -- config = conf.neoscroll
-- }
-- 目前感受不到
-- editor['norcalli/nvim-colorizer.lua'] = {
    -- opt = true,
    -- event = 'BufRead',
    -- config = conf.nvim_colorizer
-- }
editor['rmagatti/auto-session'] = {
    opt = true,
    cmd = {'SaveSession', 'RestoreSession', 'DeleteSession'},
    config = conf.auto_session
}
-- -- 可视化代码数据
-- editor['rcarriga/nvim-dap-ui'] = {
    -- opt = false,
    -- config = conf.dapui,
    -- requires = {
        -- {'mfussenegger/nvim-dap', config = conf.dap}, {
            -- 'Pocco81/DAPInstall.nvim',
            -- opt = true,
            -- cmd = {'DIInstall', 'DIUninstall', 'DIList'},
            -- config = conf.dapinstall
        -- }
    -- }
-- }

-- Git 命令
editor["tpope/vim-fugitive"] = { opt = true, cmd = {"Git", "G"} }

editor["kyazdani42/nvim-tree.lua"] = {
	opt = true,
	cmd = { "NvimTreeToggle" },
    config = conf.nvim_tree,
}

editor['justinmk/vim-dirvish'] = {
    opt = false,
}

editor['vim-scripts/a.vim'] = {
    opt = false
}
return editor
