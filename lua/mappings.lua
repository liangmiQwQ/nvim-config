require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local M = {}

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- 添加 LSP on_attach 映射
function M.on_attach(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
end

return M
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
