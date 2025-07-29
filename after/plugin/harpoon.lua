local harpoon = require("harpoon")
local harpoon_extensions = require("harpoon.extensions")

-- REQUIRED
harpoon:setup({
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = false
  }
})
-- REQUIRED

harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
