local M = {}
local keymap = vim.keymap

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
