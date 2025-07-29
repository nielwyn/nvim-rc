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

-- Debounce Trouble refresh to avoid rapid consecutive calls
local trouble_refresh_timer
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    if require("trouble").is_open() then
      if trouble_refresh_timer then
        trouble_refresh_timer:stop()
        trouble_refresh_timer:close()
      end
      trouble_refresh_timer = vim.loop.new_timer()
      trouble_refresh_timer:start(80, 0, vim.schedule_wrap(function()
        require("trouble").refresh()
      end))
    end
  end,
})
