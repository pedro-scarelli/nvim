vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  pattern = 'cs',
  callback = function(args)
    vim.lsp.codelens.refresh()
    vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
      buffer = args.buf,
      callback = vim.lsp.codelens.refresh,
    })
  end,
})
