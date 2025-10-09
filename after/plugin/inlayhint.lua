vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

local function set_inlay_hint_highlight()
  local function_hl = vim.api.nvim_get_hl(0, { name = 'Function', link = false })
  local cursorline_hl = vim.api.nvim_get_hl(0, { name = 'CursorLine', link = false })

  vim.api.nvim_set_hl(0, 'LspInlayHint', {
    fg = function_hl.fg and string.format('#%06x', function_hl.fg) or nil,
    bg = cursorline_hl.bg and string.format('#%06x', cursorline_hl.bg) or nil,
    italic = true,
  })
end

set_inlay_hint_highlight()

vim.api.nvim_create_autocmd('ColorScheme', {
  callback = set_inlay_hint_highlight,
})
