vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    vim.opt_local.list = false -- Desativa caracteres especiais
    vim.opt_local.tabstop = 4 -- Tabs ocupam 4 espaços VISUALMENTE
    vim.opt_local.shiftwidth = 4 -- Indentação com 4 espaços
    vim.opt_local.expandtab = true -- Tabs reais (não converte para espaços)
  end,
})
