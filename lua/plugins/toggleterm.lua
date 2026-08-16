return {
  'akinsho/toggleterm.nvim',
  version = '*',
  lazy = false,

  config = function()
    require('toggleterm').setup({})

    local Terminal = require('toggleterm.terminal').Terminal
    local python_runner = nil
    local function find_python()
      if vim.fn.executable('python3') == 1 then
        return 'python3'
      end
      if vim.fn.executable('python') == 1 then
        return 'python'
      end
      return nil
    end

    local function run_current_python()
      local filepath = vim.fn.expand('%:p')

      if filepath == '' then
        vim.notify('Сначала сохраните файл', vim.log.levels.WARN)
        return
      end

      -- Проверка, что текущий файл похож на Python
      local ext = vim.fn.tolower(vim.fn.expand('%:e'))
      if vim.bo.filetype ~= 'python' and ext ~= 'py' then
        vim.notify('Текущий файл не является Python-файлом', vim.log.levels.WARN)
        return
      end

      -- Сохраняем изменения перед запуском
      vim.cmd('silent! update')

      local python = find_python()

      if not python then
        vim.notify('Не найден python или python3', vim.log.levels.ERROR)
        return
      end

      local cmd = vim.fn.shellescape(python) .. ' ' .. vim.fn.shellescape(filepath)

      -- Закрываем предыдущий Python-терминал, если он был
      if python_runner then
        pcall(function()
          python_runner:shutdown()
        end)
      end

      python_runner = Terminal:new({
        cmd = cmd,
        dir = vim.fn.expand('%:p:h'), -- рабочая папка как у файла
        close_on_exit = false,        -- false: после завершения скрипта терминал остаётся открытым
      })

      python_runner:toggle()
    end

    -- Обычный терминал
    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<cr>', {
      desc = 'Открыть/закрыть терминал',
    })

    -- Запуск текущего Python-файла
    vim.keymap.set('n', '<leader>rp', run_current_python, {
      desc = 'Запустить текущий Python-файл',
    })
  end,
}
