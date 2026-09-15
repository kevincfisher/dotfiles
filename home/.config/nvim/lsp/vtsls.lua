local ROOT_MARKERS = { "tsconfig.json", "jsconfig.json", "package.json", ".git" }

-- Mirrors lsp/tsc.lua's detection: if this root has a TypeScript 7+ binary
-- (native `--lsp` support), tsc.lua will claim it and vtsls should stand down.
local function supports_lsp(bin)
	if vim.fn.executable(bin) ~= 1 then
		return false
	end
	local out = vim.system({ bin, "--version" }, { text = true }):wait()
	local version = vim.version.parse(out.stdout or "")
	return out.code == 0 and version ~= nil and version.major >= 7
end

local function tsc_available(root)
	-- A local install pins the project's intended TypeScript version: if it's
	-- present but too old, tsc.lua won't fall through to a global one, so vtsls
	-- must not defer either.
	for _, bin in ipairs({ "tsc", "tsgo" }) do
		local local_bin = vim.fs.joinpath(root, "node_modules/.bin", bin)
		if vim.fn.executable(local_bin) == 1 then
			return supports_lsp(local_bin)
		end
	end

	for _, bin in ipairs({ "tsc", "tsgo" }) do
		if supports_lsp(bin) then
			return true
		end
	end

	return false
end

local function get_vtsls_cmd()
	local bin = vim.fn.exepath("vtsls")
	if bin ~= "" then
		return { bin, "--stdio" }
	end
	-- nvm fallback: walk common nvm node versions to find vtsls
	local nvm_dir = os.getenv("NVM_DIR") or (os.getenv("HOME") .. "/.nvm")
	local handle = io.popen('ls "' .. nvm_dir .. '/versions/node" 2>/dev/null | sort -rV | head -1')
	if handle then
		local latest = handle:read("*l")
		handle:close()
		if latest then
			local candidate = nvm_dir .. "/versions/node/" .. latest .. "/bin/vtsls"
			if vim.fn.filereadable(candidate) == 1 then
				return { candidate, "--stdio" }
			end
		end
	end
	return { "vtsls", "--stdio" }
end

return {
	cmd = get_vtsls_cmd(),
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local filetype = vim.bo[bufnr].filetype

		local valid_filetypes = {
			javascript = true,
			javascriptreact = true,
			typescript = true,
			typescriptreact = true,
		}

		if not valid_filetypes[filetype] then
			on_dir(nil)
			return
		end

		local workspace_root = vim.fs.dirname(vim.fs.find(ROOT_MARKERS, { path = fname, upward = true })[1])
			or vim.fn.getcwd()

		-- Fallback only: let tsc.lua handle this root if it can.
		if tsc_available(workspace_root) then
			on_dir(nil)
			return
		end

		on_dir(workspace_root)
	end,
	-- Required so that on_dir(nil) above (deferring to tsc) actually stops the
	-- client from starting, instead of falling back to a rootless single-file client.
	workspace_required = true,
	settings = {
		complete_function_calls = true,
		vtsls = {
			enableMoveToFileCodeAction = true,
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
		typescript = {
			updateImportsOnFileMove = { enabled = "always" },
			suggest = {
				completeFunctionCalls = true,
			},
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = false},
        propertyDeclarationTypes = { enabled = false },
        variableTypes = { enabled = false }
      }
		},
	},
}
