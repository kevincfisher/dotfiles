local bin_cache = {}

local function supports_lsp(bin)
  if vim.fn.executable(bin) ~= 1 then
    return false
  end
  local out = vim.system({ bin, "--version" }, { text = true }):wait()
  local version = vim.version.parse(out.stdout or "")
  return out.code == 0 and version ~= nil and version.major >= 7
end

local function find_tsc(root)
  if bin_cache[root] ~= nil then
    return bin_cache[root] or nil
  end

  -- A local install pins the project's intended TypeScript version: respect it
  -- exactly rather than silently substituting a newer global one.
  for _, bin in ipairs({ "tsc", "tsgo" }) do
    local local_bin = vim.fs.joinpath(root, "node_modules/.bin", bin)
    if vim.fn.executable(local_bin) == 1 then
      if supports_lsp(local_bin) then
        bin_cache[root] = local_bin
        return local_bin
      end
      bin_cache[root] = false
      return nil
    end
  end

  -- No local install pinned; fall back to a global tsc/tsgo if it supports --lsp.
  for _, bin in ipairs({ "tsc", "tsgo" }) do
    if supports_lsp(bin) then
      bin_cache[root] = bin
      return bin
    end
  end

  bin_cache[root] = false
  return nil
end

return {
  cmd = function(dispatchers, config)
    local root = config.root_dir or vim.uv.cwd()
    local cmd = find_tsc(root) or "tsc"
    return vim.lsp.rpc.start({ cmd, "--lsp", "--stdio" }, dispatchers)
  end,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = function(bufnr, on_dir)
    local root_markers = { "tsconfig.json", "jsconfig.json", "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "bun.lock", ".git" }
    local root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()

    -- Only attach if a TypeScript 7+ binary (native `--lsp` support) is resolvable here.
    -- Otherwise leave this root unclaimed so vtsls.lua can pick it up as a fallback.
    if not find_tsc(root) then
      return
    end

    on_dir(root)
  end,
  settings = {
    ["js/ts"] = {
      inlayHints = {
        parameterNames = { enabled = "literals", suppressWhenArgumentMatchesName = true },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
      referencesCodeLens = { enabled = true, showOnAllFunctions = true },
      implementationsCodeLens = { enabled = true, showOnInterfaceMethods = true, showOnAllClassMethods = true },
    },
  },
}
