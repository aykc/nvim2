return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim",
  },
  keys = {
    { '<leader>oa', '<cmd>CodeCompanionActions<cr>', mode = 'n', desc = 'CodeCompanion: Actions' },
    { '<leader>oct', '<cmd>CodeCompanionChat Toggle<cr>', mode = 'n', desc = 'CodeCompanion: Toggle Chat' },
    { '<leader>ocq', '<cmd>CodeCompanionChat<cr>', mode = 'n', desc = 'CodeCompanion: Quick Chat' },
    {
      '<leader>occ',
      '<cmd>CodeCompanionChat "Please use the following context... current file: #{buffer}"<cr>',
      mode = 'n',
      desc = 'CodeCompanion: Chat with Buffer Context'
    },
    { '<leader>ocr', '<cmd>CodeCompanionReview<cr>', mode = 'v', desc = 'CodeCompanion: Review' },
  },
  opts = {
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = "DEBUG", -- or "TRACE"
      language = "Russian",
    },
    -- Глобальные настройки для всех HTTP-адаптеров
    adapters = {
      http = {
        -- Прокси для ChatGPT (OpenAI). 
        -- Можно указать строкой или взять из переменной окружения http_proxy.
        -- Формат: [protocol://]host[:port], например "http://127.0.0.1:7890"
        opts = {
          -- allow_insecure = false, -- true, если ваш прокси использует самоподписанный сертификат
          -- proxy = os.getenv("http_proxy") or "http://127.0.0.1:7890", -- укажите свой адрес прокси
        },

        -- Адаптер для DeepSeek (использует встроенный адаптер)
        deepseek = function()
          return require("codecompanion.adapters").extend("deepseek", {
            env = {
              api_key = os.getenv("DEEPSEEK_API_KEY"), -- или "YOUR_DEEPSEEK_API_KEY"
            },
          })
        end,

        geotech = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            formatted_name = "Geotech", -- Отображаемое имя в чате
            env = {
              url = "https://litellm.geotech.user.events", -- 👈 Базовый URL вашего сервера (БЕЗ /v1)
              api_key = os.getenv("GEOTECH_API_KEY"),     -- 👈 Ваш ключ
            },
            -- schema = {
            --   model = {
            --     default = "my-model-name",     -- Модель по умолчанию
            --     choices = { "my-model-name", "another-model" }, -- Список для выбора
            --   },
            -- },
          })
        end,

        -- Адаптер для OpenAI (ChatGPT). Прокси будет применён автоматически из adapters.http.opts.
        -- openai = function()
        --   return require("codecompanion.adapters").extend("openai", {
        --     env = {
        --       api_key = os.getenv("OPENAI_API_KEY"), -- или "YOUR_OPENAI_API_KEY"
        --     },
        --     schema = {
        --       model = {
        --         default = "gpt-4.1", -- укажите нужную модель
        --       },
        --     },
        --   })
        -- end,
      },
    },

    -- Выбор адаптеров для разных режимов взаимодействия
    interactions = {
      chat = {
        adapter = "deepseek", -- или "deepseek" — что нужно по умолчанию
        sessions = {
          enabled = true,
          autosave = true,          -- Включает автоматическое создание сессии
          continuous_save = true,   -- Обновлять сессию после каждого ответа и при закрытии
          save_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "codecompanion", "sessions"),
        },
      },
      inline = {
        adapter = "deepseek",
      },
      cmd = {
        adapter = "deepseek",
      },
    },
    extensions = {
      history = {
        enabled = true,
        opts = {
          -- Эти параметры можно не указывать — они являются значениями по умолчанию,
          -- но полезно знать, что они есть и работают «из коробки»:
          --
          -- keymap = "gh",            -- Открыть историю из буфера чата
          -- save_chat_keymap = "sc",  -- Вручную сохранить текущий чат
          -- auto_save = true,         -- Автоматически сохранять все новые чаты
          -- picker = "telescope",     -- Интерфейс выбора (если установлен)
        },
      },
    },
  },
}
