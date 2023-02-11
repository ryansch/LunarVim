local M = {}
M.config = function()
  lvim.builtin.lualine = {
    active = true,
    style = "lvim",
    options = {
      icons_enabled = nil,
      component_separators = nil,
      section_separators = nil,
      theme = nil,
      disabled_filetypes = { statusline = { "alpha" } },
      globalstatus = true,
    },
    sections = {
      lualine_a = nil,
      lualine_b = nil,
      lualine_c = nil,
      lualine_x = nil,
      lualine_y = nil,
      lualine_z = nil,
    },
    inactive_sections = {
      lualine_a = nil,
      lualine_b = nil,
      lualine_c = nil,
      lualine_x = nil,
      lualine_y = nil,
      lualine_z = nil,
    },
    tabline = nil,
    extensions = nil,
  }
end

M.setup = function()
  if #vim.api.nvim_list_uis() == 0 then
    local Log = require "lvim.core.log"
    Log:debug "headless mode detected, skipping running setup for lualine"
    return
  end

  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  require("lvim.core.builtins.lualine.styles").update()

  lualine.setup(lvim.builtin.lualine)

  return lualine
end

return M