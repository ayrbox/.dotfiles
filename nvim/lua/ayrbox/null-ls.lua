
local status, conform = pcall(require,  "conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- You can customize some of the format options for the filetype (:help conform.format)
    rust = { "rustfmt", lsp_format = "fallback" },
    -- Conform will run the first available formatter
    javascript = { "prettierd", lsp_format = "fallback" },
    typescript = { "prettierd", lsp_format = "fallback" },
    json = { "prettierd", lsp_format = "fallback" },
  }, 
})


-- local status, null_ls = pcall(require, "null-ls")
-- if (not status) then return end
--
-- null_ls.setup({
--   sources = {
--     null_ls.builtins.diagnostics.eslint_d.with({
--       diagnostics_format = '[eslint] #{m}\n(#{c})'
--     }),
--     null_ls.builtins.diagnostics.fish
--   }
-- })
--
--
-- local status, prettier = pcall(require, "prettier")
-- if (not status) then return end
--
-- prettier.setup {
--   bin = 'prettierd',
--   filetypes = {
--     "css",
--     "javascript",
--     "javascriptreact",
--     "typescript",
--     "typescriptreact",
--     "json",
--     "scss",
--     "less"
--   }
-- }
--
