return {
  -- HACK: docs @ https://github.com/folke/snacks.nvim/blob/main/docs
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    -- NOTE: Options
    opts = {

      -- explorer = {
      --   enabled = true,
      --   position = 'right',
      --   layout = {
      --     cycle = false,
      --   },
      -- },
      quickfile = {
        enabled = true,
        exclude = { 'latex' },
      },
      -- HACK: read picker docs @ https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
      picker = {
        enabled = true,
        matchers = {
          frecency = true,
          cwd_bonus = false,
        },
        formatters = {
          file = {
            filename_first = false,
            filename_only = false,
            icon_width = 2,
          },
        },
        layout = {
          -- presets options : "default" , "ivy" , "ivy-split" , "telescope" , "vscode", "select" , "sidebar"
          -- override picker layout in keymaps function as a param below
          preset = 'telescope', -- defaults to this layout unless overidden
          cycle = false,
        },
        layouts = {
          select = {
            preview = false,
            layout = {
              backdrop = false,
              width = 0.6,
              min_width = 80,
              height = 0.4,
              min_height = 10,
              box = 'vertical',
              border = 'rounded',
              title = '{title}',
              title_pos = 'center',
              { win = 'input', height = 1, border = 'bottom' },
              { win = 'list', border = 'none' },
              { win = 'preview', title = '{preview}', width = 0.6, height = 0.4, border = 'top' },
            },
          },
          telescope = {
            reverse = true, -- set to false for search bar to be on top
            layout = {
              box = 'horizontal',
              backdrop = false,
              width = 0.8,
              height = 0.9,
              border = 'none',
              {
                box = 'vertical',
                { win = 'list', title = ' Results ', title_pos = 'center', border = 'rounded' },
                { win = 'input', height = 1, border = 'rounded', title = '{title} {live} {flags}', title_pos = 'center' },
              },
              {
                win = 'preview',
                title = '{preview:Preview}',
                width = 0.50,
                border = 'rounded',
                title_pos = 'center',
              },
            },
          },
          ivy = {
            layout = {
              box = 'vertical',
              backdrop = false,
              width = 0,
              height = 0.4,
              position = 'bottom',
              border = 'top',
              title = ' {title} {live} {flags}',
              title_pos = 'left',
              { win = 'input', height = 1, border = 'bottom' },
              {
                box = 'horizontal',
                { win = 'list', border = 'none' },
                { win = 'preview', title = '{preview}', width = 0.5, border = 'left' },
              },
            },
          },
        },
      },
      image = {
        enabled = true,
        doc = {
          float = false,
          inline = true, -- false if you want show image on cursor hover
          max_width = 50,
          max_height = 30,
          wo = {
            wrap = true,
          },
        },
        convert = {
          notify = true,
        },
        img_dirs = { 'img', 'images', 'assets', 'static', 'public', 'media', 'attachments', 'sethVault', '~/Library', '~/Downloads' },
      },
      dashboard = {
        enabled = true,
        sections = {
          { section = 'header' },
          { section = 'keys', gap = 1, padding = 1 },
          { section = 'startup' },
          {
            section = 'terminal',
            cmd = 'cat ~/.config/nvim/ascii/sasuke.txt',
            random = 10,
            pane = 2,
            indent = 4,
            height = 30,
          },
        },
      },
    },
    -- NOTE: Keymaps
    keys = {
      {
        '<leader>lg',
        function()
          require('snacks').lazygit()
        end,
        desc = 'Lazygit',
      },
      {
        '<leader>gl',
        function()
          require('snacks').lazygit.log()
        end,
        desc = 'Lazygit Logs',
      },
      -- {
      --   '<leader>e',
      --   function()
      --     require('snacks').explorer()
      --   end,
      --   desc = 'Open Snacks Explorer',
      -- },
      {
        '<leader>rN',
        function()
          require('snacks').rename.rename_file()
        end,
        desc = 'Fast Rename Current File',
      },
      {
        '<leader>dB',
        function()
          require('snacks').bufdelete()
        end,
        desc = 'Delete or Close Buffer  (Confirm)',
      },

      -- Snacks Picker
      {
        '<leader>pf',
        function()
          require('snacks').picker.files { hidden = true }
        end,
        desc = 'Find Files (Snacks Picker)',
      },
      {
        '<leader>pc',
        function()
          require('snacks').picker.files { cwd = vim.fn.stdpath 'config' }
        end,
        desc = 'Find Config File',
      },
      {
        '<leader>ps',
        function()
          require('snacks').picker.grep()
        end,
        desc = 'Grep word',
      },
      {
        '<leader>pws',
        function()
          require('snacks').picker.grep_word()
        end,
        desc = 'Search Visual selection or Word',
        mode = { 'n', 'x' },
      },
      {
        '<leader>pk',
        function()
          require('snacks').picker.keymaps { layout = 'ivy' }
        end,
        desc = 'Search Keymaps (Snacks Picker)',
      },

      -- Git Stuff
      {
        '<leader>gbr',
        function()
          require('snacks').picker.git_branches { layout = 'select' }
        end,
        desc = 'Pick and Switch Git Branches',
      },

      -- Other Utils
      {
        '<leader>th',
        function()
          require('snacks').picker.colorschemes { layout = 'ivy' }
        end,
        desc = 'Pick Color Schemes',
      },
      {
        '<leader>vh',
        function()
          require('snacks').picker.help()
        end,
        desc = 'Help Pages',
      },
    },
  },
  -- NOTE: todo comments w/ snacks
  {
    'folke/todo-comments.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('todo-comments').setup()
    end,
    keys = {
      {
        '<leader>pt',
        '<cmd>TodoTelescope<cr>',
        desc = 'Todo',
      },
      {
        '<leader>pT',
        '<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>',
        desc = 'Todo/Fix/Fixme',
      },
    },
  },
}
