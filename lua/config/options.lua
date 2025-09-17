local opt = vim.opt

-- Глобальные переменные
vim.g.mapleader = " "          -- Основной leader key
vim.g.maplocalleader = " "     -- Локальный leader key
vim.g.loaded_netrw = 1         -- Отключить плагин netrw (файловый менеджер)
vim.g.loaded_netrwPlugin = 1   -- Отключить плагин netrwPlugin
vim.g.loaded_perl_provider = 0 -- Отключить Perl-провайдер (ускорение запуска)
vim.g.loaded_ruby_provider = 0 -- Отключить Ruby-провайдер (ускорение запуска)
vim.g.loaded_node_provider = 0 -- Отключить Node.js провайдер (ускорение запуска)

-- Интерфейс и отображение
opt.laststatus = 2                      -- Показывать строку статуса всегда (1 - никогда, 2 - всегда)
opt.termguicolors = true                -- Включить 24-битные цвета в терминале (True color)
opt.showcmd = true                      -- Показывать текущую вводимую команду внизу
opt.signcolumn = "yes"                  -- Всегда показывать колонку знаков (для git, ошибок и пр.)
opt.cursorline = true                   -- Подсвечивать строку с курсором
opt.wrap = true                         -- Переносить длинные строки по словам
opt.wildmenu = true                     -- Улучшенное автодополнение команд в командной строке
opt.list = true                         -- Показывать невидимые символы, заданные в listchars
opt.listchars = "tab:»·,trail:·,nbsp:·" -- Отображение символов для табов, пробелов в конце строки и неразрывных пробелов
opt.colorcolumn = "130"                 -- Вертикальная линия на 130-й колонке (рекомендуемая максимальная длина строки)
opt.foldcolumn = "2"                    -- Ширина колонки для отображения фолдов (свертываний)
opt.showtabline = 1                     -- Показывать строку с табами только если открыто несколько окон (0-никогда, 1-при>1, 2 - всегда)
opt.scrolloff = 7                       -- Минимальное число строк вокруг курсора при прокрутке (отступ)

-- Работа с мышью
opt.mouse = "a" -- Включить поддержку мыши во всех режимах

-- Работа с файлами и буфером
opt.swapfile = false -- Не создавать swap файлы (временные файлы для восстановления)
opt.autoread = true  -- Автоматически перечитывать файл, если он изменён вне Neovim
opt.confirm = true   -- Спрашивать подтверждение при закрытии изменённого файла без сохранения

-- Резервные копии и обновления
opt.backup = false      -- Отключить создание backup файлов
opt.writebackup = false -- Отключить создание backup файлов при записи
opt.updatetime = 700    -- Время в мс для событий CursorHold и других (негативно влияет на автосохранение, lint и пр.)

-- Нумерация строк
opt.number = true -- Включить отображение абсолютных номеров строк
-- opt.relativenumber = true     -- Относительные номера строк (закомментировано)

-- Настройки табов и отступов
opt.shiftwidth = 2     -- Размер сдвига для автоотступов (2 пробела)
opt.tabstop = 2        -- Количество пробелов на один таб (2 пробела)
opt.expandtab = true   -- Преобразовывать табы в пробелы
opt.smartindent = true -- Включить умный автоотступ (основанный на структуре кода)

-- Поиск
opt.ignorecase = true -- Игнорировать регистр при поиске
opt.smartcase = true  -- Учитывать регистр если в поиске есть заглавные буквы (закомментировано)
opt.hlsearch = true   -- Подсвечивать все найденные совпадения
opt.incsearch = true  -- Подсвечивать совпадение при вводе поискового запроса

-- Подсветка ошибок Lsp в линию
vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  virtual_lines = false,
  -- signs = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  float = {
    source = true,
    header = "Diagnostics:",
    prefix = " ",
    border = "single",
    max_height = 10,
    max_width = 130,
    close_events = { "CursorMoved", "BufLeave", "WinLeave" },
  }
})
vim.lsp.set_log_level("error")
