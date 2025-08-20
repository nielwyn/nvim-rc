require("trouble").setup {
  icons = {
    indent = {
      middle = " ",
      last = " ",
      top = " ",
      ws = "│  ",
    },
  },
  modes = {
    preview_float = {
      mode = "diagnostics",
      preview = {
        type = "float",
        relative = "editor",
        border = "rounded",
        title = "Preview",
        title_pos = "center",
        position = "auto",
        size = { width = 0.3, height = 0.3 },
        zindex = 200,
      },
      diagnostics = {
        groups = {
          { "filename", format = "{file_icon} {basename:Title} {count}" },
        },
      },
    },
    diagnostics_buffer = {
      mode = "diagnostics",
      filter = { buf = 0 }, -- Only current buffer
    },
    filter = {
      severity = { vim.diagnostic.severity.ERROR },
    },
  },

  -- Lowered refresh/update intervals for less overhead
  throttle = {
    refresh = 100, -- Increased from 50 to 100ms
    update = 50,   -- Increased from 10 to 50ms
  },

  auto_close = true,
  auto_open = false,
  auto_preview = false, -- Turn off auto-preview for large projects (can toggle via keymap)
  auto_fold = false,
  auto_jump = false,

  max_items = 100,

  refresh = {
    auto = true,
    delay = 100, -- Increased from 50 to 100ms for less churn
  },

  -- Optimize folding
  fold_open = "v",
  fold_closed = ">",
  indent_lines = false, -- Disable for better performance
}

-- Diagnostic config for better performance
vim.diagnostic.config {
  virtual_text = {
    prefix = "●",
    source = "if_many",
    spacing = 2, -- Add spacing for better redraw performance
  },
  signs = false,
  underline = true,
  update_in_insert = false, -- Don't update diagnostics in insert mode
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
  },
}
