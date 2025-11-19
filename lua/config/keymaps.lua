local M = {}
local keymap = vim.keymap

local function close_other_buffers()
  local cur_buf = vim.api.nvim_get_current_buf()
  local deleted = 0
  local skipped = 0

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_buf_is_loaded(buf) then
      goto continue
    end

    if buf == cur_buf then
      goto continue
    end

    local bo = vim.bo[buf]
    local name = vim.api.nvim_buf_get_name(buf) == "" and "[No Name]" or
        vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")

    if bo.modified then
      vim.notify("Skipped modified buffer: " .. name, vim.log.levels.WARN)
      skipped = skipped + 1
      goto continue
    end

    local buftype = bo.buftype
    if buftype ~= "" then
      -- Список "защищаемых" buftype. Можно расширить.
      local protected = vim.tbl_contains({
        "terminal", "help", "quickfix", "location", "nofile", "prompt", "popup"
      }, buftype)
      if protected then
        vim.notify(string.format("Skipped special buffer (%s): %s", buftype, name), vim.log.levels.INFO)
        skipped = skipped + 1
        goto continue
      end
    end

    if not bo.buflisted then
      goto continue
    end

    -- ✅ Буфер безопасен для удаления
    local ok, err = pcall(vim.api.nvim_buf_delete, buf, { force = false })
    if ok then
      deleted = deleted + 1
    else
      vim.notify("Failed to delete buffer " .. name .. ": " .. tostring(err), vim.log.levels.ERROR)
      skipped = skipped + 1
    end

    ::continue::
  end

  vim.notify(
    string.format("Buffers closed: %d | Skipped: %d", deleted, skipped),
    deleted > 0 and vim.log.levels.INFO or vim.log.levels.WARN
  )
end
vim.keymap.set("n", "<leader>bdd", close_other_buffers, {
  desc = "Закрыть все открытые буфферы, кроме текущего. (Пропускаем Модифицированые/Спецальные)",
})

-- Общие клавиатурные сокращения
keymap.set("i", "jk", "<Esc>", { desc = "Выход из режима вставки" })
keymap.set("n", "<leader>q", "<cmd>nohlsearch<CR>", { desc = "Отменить подсветку поиска" })
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "Сохранить файл" })

-- Перемещение строк в визуальном режиме
keymap.set("v", "<S-down>", ":m '>+1<cr>gv=gv", { desc = "Переместить выделение вниз" })
keymap.set("v", "<S-up>", ":m '<-1<cr>gv=gv", { desc = "Переместить выделение вверх" })

-- Отступы в визуальном режиме (подобно VS Code)
keymap.set("v", "<tab>", ">gv", { desc = "Увеличить отступ TAB" })
keymap.set("v", "<S-tab>", "<gv", { desc = "Уменьшить отступ TAB" })

-- Работа с системным буфером обмена
keymap.set("v", "<leader>y", '"+y', { desc = "Копировать в системный буфер" })
keymap.set(
  "v",
  "<leader>Y",
  '"+y$',
  { desc = "Копировать до конца строки в системный буфер" }
)
keymap.set("n", "<leader>p", '"+p', { desc = "Вставить из системного буфера" })
keymap.set(
  "n",
  "<leader>P",
  '"+P',
  { desc = "Вставить перед курсором из системного буфера" }
)

-- Буфер и переключение вкладок
keymap.set("n", "<tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Следующая вкладка" })
keymap.set("n", "<S-tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Предыдущая вкладка" })
keymap.set(
  "n",
  "<leader>e",
  "<cmd>NvimTreeFocus<cr>",
  { desc = "Открыть/Закрыть/Выбрать NvimTree" }
)

-- Запуск Python
vim.keymap.set("n", "<leader>rp", function()
  local file = vim.fn.expand("%:p")
  vim.cmd("terminal uv run " .. file)
end, { desc = "Python run" })

-- Telescope
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Поиск файлов" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Поиск по содержимому" })
keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Список открытых буферов" })
keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Поиск по справочным тегам" })
keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Поиск по горячим клавишам" })
keymap.set("n", "<leader>fc", "<cmd>TodoTelescope<cr>", { desc = "Список TODO" })

-- Git
keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Список веток Git" })
keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Список коммитов Git" })
keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Статус Git" })

-- LSP
function M.for_lsp()
  keymap.set("n", "<leader>lq", builtin.lsp_workspace_symbols)
  keymap.set("n", "<leader>ly", builtin.lsp_implementations)
  keymap.set("n", "<leader>lds", builtin.lsp_document_symbols, { desc = "Дерево обектов" })
  keymap.set("n", "<leader>ll", builtin.lsp_references, { desc = "Поиск ссылок (references)" })
  keymap.set("n", "<leader>lg", builtin.lsp_definitions, { desc = "Перейти к определению" })
  keymap.set("n", "<Leader>ls", vim.lsp.buf.signature_help)
  keymap.set("n", "<Leader>lr", vim.lsp.buf.rename)
  keymap.set("n", "<Leader>lh", vim.lsp.buf.hover)
  keymap.set("n", "<Leader>lfd", builtin.diagnostics, { desc = "Диагностика ошибок" })
  keymap.set("n", "<leader>lb", "<C-o>", { desc = "Назад к предыдущему месту" })
  keymap.set("n", "<F3>", vim.lsp.buf.format)
  keymap.set("n", "<F4>", vim.lsp.buf.code_action)
  keymap.set("n", "<Leader>ldd", vim.diagnostic.open_float)
  keymap.set("n", "<leader>tdd", function()
    vim.diagnostic.config({
      virtual_lines = not vim.diagnostic.config().virtual_lines,
      virtual_text = not vim.diagnostic.config().virtual_text,
    })
  end, { desc = "Смена отображение текста ошибки" })
end

return M
