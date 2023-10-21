-- enabling options

vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.relativenumber = true

-- key bindings

vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>vim", "<cmd>e $MYVIMRC<cr>") -- open init.lua
vim.keymap.set({'n', 'x'}, 'cp', '"+y') -- copies to sys clipboard [NOT WORKING]
vim.keymap.set({'n', 'x'}, 'cv', '"+p') -- pastes from sys clipboard [NOT WORKING]
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>') -- select all

-- plugin manager

local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

-- plugin setup

lazy.setup({
  ---
  -- List of plugins
  ---
})
