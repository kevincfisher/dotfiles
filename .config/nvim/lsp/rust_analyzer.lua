---@type vim.lsp.Config
return {
  cmd = { "rust_analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", "rust-project.json" },
  settings = {
    ["rust-analyzer"] = {
      inlayHints = {
        chainingHints = { enable = false }
      },
    },
  },
}
