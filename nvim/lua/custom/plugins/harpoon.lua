return {
  {
    'ThePrimeagen/harpoon',
    -- CRITICAL: Use the 'harpoon2' branch for the latest version
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },

    -- Configuration runs once when the plugin is loaded (usually by the first keypress)
    config = function()
      -- Harpoon's setup is required
      require('harpoon'):setup {
        -- Optional: Global settings, you can leave this empty or remove the table entirely
        -- if you want the defaults.
        settings = {
          -- Sets the harpoon file upon every change, recommended to keep as true
          save_on_change = true,
          -- Saves the marks when the quick menu is toggled
          save_on_toggle = true,
        },
      }
    end,

    -- Keybindings (Lazy-loaded)
    keys = {
      -- 1. Add/Append the current file to the harpoon list
      {
        '<A-a>',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Harpoon: Add File',
      },

      -- 2. Toggle the quick menu (pop-up window)
      {
        '<A-m>',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon: Toggle Quick Menu',
      },

      --- 3. Direct Navigation to the first 4 files
      -- The harpoon list is 1-indexed.
      {
        '<A-1>',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'Harpoon: Jump to File 1',
      },
      {
        '<A-2>',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'Harpoon: Jump to File 2',
      },
      {
        '<A-3>',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'Harpoon: Jump to File 3',
      },
      {
        '<A-4>',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'Harpoon: Jump to File 4',
      },
      {
        '<A-5>',
        function()
          require('harpoon'):list():select(5)
        end,
        desc = 'Harpoon: Jump to File 5',
      },
      {
        '<A-6>',
        function()
          require('harpoon'):list():select(6)
        end,
        desc = 'Harpoon: Jump to File 6',
      },
      {
        '<A-7>',
        function()
          require('harpoon'):list():select(7)
        end,
        desc = 'Harpoon: Jump to File 7',
      },
      {
        '<A-8>',
        function()
          require('harpoon'):list():select(8)
        end,
        desc = 'Harpoon: Jump to File 8',
      },
    },
  },
}
