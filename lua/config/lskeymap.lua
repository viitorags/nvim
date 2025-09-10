local opts = { noremap = true, silent = true }

-- Definir função de keymap
local keymap = vim.keymap.set

-- Mapeamento para abrir o LiveServer
keymap('n', '<Space>ls', ':lua Live_server_toggle()<CR>', opts)

local live_server_pid = nil -- Armazena o processo do Live Server

function Live_server_toggle()
  local project_root = vim.fn.getcwd()
  local current_file = vim.fn.expand '%:p'

  if not current_file:find(project_root, 1, true) then
    print 'O arquivo atual não está dentro do diretório do projeto!'
    return
  end

  local relative_path = current_file:sub(#project_root + 2)

  -- Se já existir um servidor rodando, mata ele antes de iniciar outro
  if live_server_pid then
    vim.fn.jobstop(live_server_pid) -- Mata o processo anterior
    live_server_pid = nil
    print 'Live Server parado.'
    return
  end

  -- Inicia o Live Server como um job controlado
  live_server_pid = vim.fn.jobstart(string.format('npx live-server "%s" --port=5500 --no-browser', project_root), {
    detach = true,
    on_exit = function()
      live_server_pid = nil
    end,
  })

  if live_server_pid <= 0 then
    print 'Erro ao iniciar o Live Server!'
    return
  end

  print 'Live Server iniciado!'

  -- Abre o arquivo no navegador
  local open_cmd
  if vim.fn.has 'unix' == 1 then
    open_cmd = string.format('xdg-open http://127.0.0.1:5500/%s', relative_path)
  elseif vim.fn.has 'mac' == 1 then
    open_cmd = string.format('open http://127.0.0.1:5500/%s', relative_path)
  elseif vim.fn.has 'win32' == 1 then
    open_cmd = string.format('start http://127.0.0.1:5500/%s', relative_path)
  else
    print 'Sistema operacional não suportado!'
    return
  end

  -- Aguarda um pouco antes de abrir o navegador
  vim.defer_fn(function()
    vim.fn.jobstart(open_cmd, { detach = true })
  end, 1000)
end
