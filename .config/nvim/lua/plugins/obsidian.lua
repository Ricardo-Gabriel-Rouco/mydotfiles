return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  enabled = function()
    -- Disable Obsidian when running from Oil Simple (to avoid path issues in Zed context)
    return not vim.g.disable_obsidian
  end,
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "apuntes", -- Name of the workspace
        path = "~/Proyectos/apuntes", -- Path to the notes directory
      },
      {
        name = "rol",
        path = "~/Proyectos/rol/",
      },
    },
    completion = {
      cmp = true,
    },
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', 'mini.pick' or 'snacks.pick'.
      name = "snacks.pick",
    },
    -- Optional, define your own callbacks to further customize behavior.
    callbacks = {
      -- Runs anytime you enter the buffer for a note.
      -- NOTE: Breaking change in obsidian.nvim - callback now receives only (note), not (client, note)
      enter_note = function(note)
        if not note then
          return
        end
        -- Setup keymaps for obsidian notes
        vim.keymap.set("n", "gf", function()
          return require("obsidian").util.gf_passthrough()
        end, { buffer = note.bufnr, expr = true, desc = "Obsidian follow link" })

        vim.keymap.set("n", "<leader>ch", function()
          return require("obsidian").util.toggle_checkbox()
        end, { buffer = note.bufnr, desc = "Toggle checkbox" })

        vim.keymap.set("n", "<cr>", function()
          return require("obsidian").util.smart_action()
        end, { buffer = note.bufnr, expr = true, desc = "Obsidian smart action" })
      end,
    },

    -- Settings for templates
    templates = {
      subdir = "templates", -- Subdirectory for templates
      date_format = "%Y-%m-%d-%a", -- Date format for templates
      gtime_format = "%H:%M", -- Time format for templates
      tags = "", -- Default tags for templates
    },

    -- Daily notes
    daily_notes = {
      folder = "daily", -- Folder for daily notes
      date_format = "%Y-%m-%d", -- Filename format
      template = "templates/Daily.md", -- Template to use
      alias_format = "%B %d, %Y", -- Display format in frontmatter
    },
  },
}
