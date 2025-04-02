return {
  'nvim-lua/plenary.nvim', --lua functions that many plugins use
  'christoomey/vim-tmux-navigator', -- tmux & split window nav
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
