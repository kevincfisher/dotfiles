local ROOT_MARKERS = { "tsconfig.json", "jsconfig.json", "package.json", ".git" }

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
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		local filetype = vim.bo[bufnr].filetype

		local valid_filetypes = {
			javacript = true,
			javascriptreact = true,
			["javascript.jsx"] = true,
			typescript = true,
			typescriptreact = true,
			["typescript.tsx"] = true,
		}

		if not valid_filetypes[filetype] then
			on_dir(nil)
			return
		end

		local workspace_root = vim.fs.dirname(vim.fs.find(ROOT_MARKERS, { path = fname, upward = true })[1])
		on_dir(workspace_root or vim.fn.getcwd())
	end,
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
