local editor = {}
local conf = require('modules.editor.config')

editor['junegunn/vim-easy-align'] = {opt = true, cmd = 'EasyAlign'}
editor['itchyny/vim-cursorword'] = {
    opt = true,
    event = {'BufReadPre', 'BufNewFile'},
    config = conf.vim_cursorwod
}
--[[
   [editor['terrortylor/nvim-comment'] = {
   [    opt = false,
   [    config = function() require('nvim_comment').setup() end
   [}
   ]]
-- 显示单文件代码整体架构
editor['simrat39/symbols-outline.nvim'] = {
    opt = true,
    cmd = {'SymbolsOutline', 'SymbolsOulineOpen'},
    config = conf.symbols_outline
}
-- 根据不同语言解析代码, 提供接口
editor['nvim-treesitter/nvim-treesitter'] = {
    opt = true,
    run = ':TSUpdate',
    event = 'BufRead',
    after = 'telescope.nvim',
    config = conf.nvim_treesitter
}
-- 基于treesitter 的vim textobjects
editor['nvim-treesitter/nvim-treesitter-textobjects'] = {
    opt = true,
    after = 'nvim-treesitter'
}
-- 看超长代码很有用
editor['romgrk/nvim-treesitter-context'] = {
    opt = true,
    after = 'nvim-treesitter'
}
-- 基于treesitter的高亮
editor['p00f/nvim-ts-rainbow'] = {
    opt = true,
    after = 'nvim-treesitter',
    event = 'BufRead'
}
editor['sbdchd/neoformat'] = {opt = true, cmd = 'Neoformat'}
editor['rhysd/accelerated-jk'] = {opt = true}
-- editor['hrsh7th/vim-eft'] = {opt = true}
-- 高亮查询
editor['romainl/vim-cool'] = {
    opt = true,
    event = {'CursorMoved', 'InsertEnter'}
}
editor['karb94/neoscroll.nvim'] = {
    opt = true,
    event = "WinScrolled",
    config = conf.neoscroll
}
editor['vimlab/split-term.vim'] = {opt = true, cmd = {'Term', 'VTerm'}}
editor['norcalli/nvim-colorizer.lua'] = {
    opt = true,
    event = 'BufRead',
    config = conf.nvim_colorizer
}
editor['rmagatti/auto-session'] = {
    opt = true,
    cmd = {'SaveSession', 'RestoreSession', 'DeleteSession'},
    config = conf.auto_session
}
-- 可视化代码数据
editor['rcarriga/nvim-dap-ui'] = {
    opt = false,
    config = conf.dapui,
    requires = {
        {'mfussenegger/nvim-dap', config = conf.dap}, {
            'Pocco81/DAPInstall.nvim',
            opt = true,
            cmd = {'DIInstall', 'DIUninstall', 'DIList'},
            config = conf.dapinstall
        }
    }
}

return editor
