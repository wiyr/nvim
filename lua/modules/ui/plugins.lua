local ui = {}
local conf = require('modules.ui.config')

-- ui界面特殊图标, 依赖 nerd fonts
-- 有些插件会覆盖此插件的icons table
ui['kyazdani42/nvim-web-devicons'] = {opt = false}

-- vim启动界面, 搭配telescope等可以实现快速打开文件
ui['glepnir/dashboard-nvim'] = {opt = true, event = "BufWinEnter"}
-- git 左侧显示修改情况，每行显示作者, require some colortheme
ui['lewis6991/gitsigns.nvim'] = {
    opt = true,
    event = {'BufRead', 'BufNewFile'},
    config = conf.gitsigns,
    requires = {'nvim-lua/plenary.nvim', opt = true}
}
ui['Th3Whit3Wolf/one-nvim'] = {}
-- 代码缩进对齐线
ui['lukas-reineke/indent-blankline.nvim'] = {
    opt = true,
    event = 'BufRead',
    config = conf.indent_blankline
}
-- 底下状态栏显示
-- ui['glepnir/galaxyline.nvim'] = {
  -- branch = 'main',
  -- config = conf.galaxyline,
  -- requires = 'kyazdani42/nvim-web-devicons'
-- }
-- 底下状态栏显示
ui['nvim-lualine/lualine.nvim'] = {
    opt = true,
    config = conf.lualine,
	after = "lualine-lsp-progress",
}
-- vim支持专注模式
ui['folke/zen-mode.nvim'] = {
    opt = true,
    cmd = 'ZenMode',
    config = conf.zen_mode
}
-- color theme
ui['ray-x/aurora'] = {
    opt = true
}
-- bufferline
ui["akinsho/bufferline.nvim"] = {
	opt = true,
	tag = "*",
	event = "BufRead",
	config = conf.nvim_bufferline,
  requires = 'kyazdani42/nvim-web-devicons',
}
--  显示鼠标当前是那个类/functional内
ui["SmiteshP/nvim-gps"] = {
	opt = true,
	after = "nvim-treesitter",
	config = conf.nvim_gps,
}

ui["arkav/lualine-lsp-progress"] = { opt = true, after = "nvim-gps" }
return ui
