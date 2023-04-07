-- CONFIG
APP_NAME = "pokequest"  -- importante, altere-o, é o nome do diretório de configuração e arquivos em appdata
APP_VERSION = 1098       -- versão do cliente para atualizador e login para identificar cliente desatualizado
DEFAULT_LAYOUT = "retro" -- no android é forçado a "mobile", verifique o código abaixo

-- If you don't use updater or other service, set it to updater = ""
Services = {
  website = "http://otclient.ovh", -- currently not used
  updater = "http://otclient.ovh/api/updater.php",
  stats = "",
  crash = "http://otclient.ovh/api/crash.php",
  feedback = "http://otclient.ovh/api/feedback.php",
  status = ""
}

-- Servidores aceitam url de login http, url de login websocket ou ip:port:version
Servers = {
  -- OTClientV8proxy = "http://otclient.ovh/api/login.php?proxy=1",

  -- PlayerPlaying = "127.0.0.1:7171:1098:110:30:93"
  -- LocalTestServ = "127.0.0.1:7564:854"
  LocalTestServ = "127.0.0.1:7171:1098"
}

--Server = "ws://otclient.ovh:3000/"
-- Server = "ws://127.0.0.1:88/"
-- USE_NEW_ENERGAME = true -- usa entergamev2 baseado em websockets em vez de entergame
ALLOW_CUSTOM_SERVERS = false -- se verdadeiro, mostra a opção OUTRA na lista de servidores

g_app.setName("OTCv8")
-- CONFIG END

-- print first terminal message
g_logger.info(os.date("== application started at %b %d %Y %X"))
g_logger.info(g_app.getName() .. ' ' .. g_app.getVersion() .. ' rev ' .. g_app.getBuildRevision() .. ' (' .. g_app.getBuildCommit() .. ') made by ' .. g_app.getAuthor() .. ' built on ' .. g_app.getBuildDate() .. ' for arch ' .. g_app.getBuildArch())

if not g_resources.directoryExists("/data") then
  g_logger.fatal("Data dir doesn't exist.")
end

if not g_resources.directoryExists("/modules") then
  g_logger.fatal("Modules dir doesn't exist.")
end

-- settings
g_configs.loadSettings("/config.otml")

-- set layout
local settings = g_configs.getSettings()
local layout = DEFAULT_LAYOUT
if g_app.isMobile() then
  layout = "mobile"
elseif settings:exists('layout') then
  layout = settings:getValue('layout')
end
g_resources.setLayout(layout)

-- load mods
g_modules.discoverModules()
g_modules.ensureModuleLoaded("corelib")
  
local function loadModules()
  -- libraries modules 0-99
  g_modules.autoLoadModules(99)
  g_modules.ensureModuleLoaded("gamelib")

  -- client modules 100-499
  g_modules.autoLoadModules(499)
  g_modules.ensureModuleLoaded("client")

  -- game modules 500-999
  g_modules.autoLoadModules(999)
  g_modules.ensureModuleLoaded("game_interface")

  -- mods 1000-9999
  g_modules.autoLoadModules(9999)
end

-- report crash
if type(Services.crash) == 'string' and Services.crash:len() > 4 and g_modules.getModule("crash_reporter") then
  g_modules.ensureModuleLoaded("crash_reporter")
end

-- run updater, must use data.zip
if type(Services.updater) == 'string' and Services.updater:len() > 4 
  and g_resources.isLoadedFromArchive() and g_modules.getModule("updater") then
  g_modules.ensureModuleLoaded("updater")
  return Updater.init(loadModules)
end
loadModules()
