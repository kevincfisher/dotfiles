vim.cmd('syntax off')
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = "*",
--   callback = function(args)
--     local buf = args.buf
--     local ft = vim.bo[buf].filetype
--     vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--     vim.wo[0][0].foldmethod = 'expr'
--
--     local lang = vim.treesitter.language.get_lang(ft)
--     if not lang then
--       return
--     end
--
--     local ok_add = pcall(vim.treesitter.language.add, lang)
--     if not ok_add then
--       return
--     end
--
--     pcall(vim.treesitter.start, buf, lang)
--   end,
-- })

-- vim.api.nvim_create_autocmd('LspAttach', {
--   group = vim.api.nvim_create_augroup('my.lsp', { clear = true }),
--   callback = function (ev)
--     local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
--     if not client:supports_method('textDocument/withSaveWaitUntil') and client:supports_method('textDocument/formatter') then
--       vim.api.nvim_create_autocmd('BufPreWrite', {
--         group = vim.api.nvim_create_augroup("my.lsp.fmt", { clear = false }),
--         buffer = ev.buf,
--         callback = function()
--           vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
--         end
--       })
--     end
--   end,
-- })

vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('my.lsp.theme', { clear = true }),
  callback = function ()
    local current_time= os.time()
    local hour = tonumber(os.date("%H", current_time))
    local fmt_time = os.date("%I:%M %p", current_time)

    if hour > 0 and hour <= 11 then
      vim.notify('Good morning, it is ' .. fmt_time)
    elseif hour > 11 and hour <=18 then
      vim.notify('Good afternoon, it is ' .. fmt_time)
    else
      vim.notify('Good evening, it is ' .. fmt_time)
    end
  end
})
