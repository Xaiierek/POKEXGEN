CharacterList = { }



-- private variables
local charactersWindow
local loadBox
local characterList
local characterListPanel
local errorBox
local waitingWindow
--local autoReconnectButton
local updateWaitEvent
local resendWaitEvent
local loginEvent
outfitBox = nil
--local autoReconnectEvent
--local lastLogout = 0

-- private functions
local function tryLogin(charInfo, tries)
  tries = tries or 1

  if tries > 50 then
    return
  end

  if g_game.isOnline() then
    if tries == 1 then
      g_game.safeLogout()
    end
    loginEvent = scheduleEvent(function() tryLogin(charInfo, tries+1) end, 100)
    return
  end

  CharacterList.hide()
  g_game.loginWorld(G.account, G.password, charInfo.worldName, charInfo.worldHost, charInfo.worldPort, charInfo.characterName, G.authenticatorToken, G.sessionKey)
 -- g_logger.info("Login to " .. charInfo.worldHost .. ":" .. charInfo.worldPort)
  loadBox = displayCancelBox(tr('Please wait'), tr('Connecting to game server...'))

  connect(loadBox, { onCancel = function()
                                  loadBox = nil
                                  g_game.cancelLogin()
                                  CharacterList.show()
                                end })

  -- save last used character
  g_settings.set('last-used-character', charInfo.characterName)
  g_settings.set('last-used-world', charInfo.worldName)
end

local function updateWait(timeStart, timeEnd)
  if waitingWindow then
    local time = g_clock.seconds()
    if time <= timeEnd then
      local percent = ((time - timeStart) / (timeEnd - timeStart)) * 100
      local timeStr = string.format("%.0f", timeEnd - time)

      local progressBar = waitingWindow:getChildById('progressBar')
      progressBar:setPercent(percent)

      local label = waitingWindow:getChildById('timeLabel')
      label:setText(tr('Trying to reconnect in %s seconds.', timeStr))

      updateWaitEvent = scheduleEvent(function() updateWait(timeStart, timeEnd) end, 1000 * progressBar:getPercentPixels() / 100 * (timeEnd - timeStart))
      return true
    end
  end

  if updateWaitEvent then
    updateWaitEvent:cancel()
    updateWaitEvent = nil
  end
end

local function resendWait()
  if waitingWindow then
    waitingWindow:destroy()
    waitingWindow = nil

    if updateWaitEvent then
      updateWaitEvent:cancel()
      updateWaitEvent = nil
    end

    if charactersWindow then
      local selected = characterList:getFocusedChild()
      if selected then
        local charInfo = { worldHost = selected.worldHost,
                           worldPort = selected.worldPort,
                           worldName = selected.worldName,
						   Vocation = selected.vocation,
                           characterName = selected.characterName }
        tryLogin(charInfo)
      end
    end
  end
end

local function onLoginWait(message, time)
  CharacterList.destroyLoadBox()

  waitingWindow = g_ui.displayUI('waitinglist')

  local label = waitingWindow:getChildById('infoLabel')
  label:setText(message)

  updateWaitEvent = scheduleEvent(function() updateWait(g_clock.seconds(), g_clock.seconds() + time) end, 0)
  resendWaitEvent = scheduleEvent(resendWait, time * 1000)
end

function onGameLoginError(message)
  CharacterList.destroyLoadBox()
  errorBox = displayErrorBox(tr("Login Error"), message)
  errorBox.onOk = function()
    errorBox = nil
    CharacterList.showAgain()
  end
  scheduleAutoReconnect()
end

function onGameLoginToken(unknown)
  CharacterList.destroyLoadBox()
  -- TODO: make it possible to enter a new token here / prompt token
  errorBox = displayErrorBox(tr("Two-Factor Authentification"), 'A new authentification token is required.\nPlease login again.')
  errorBox.onOk = function()
    errorBox = nil
    EnterGame.show()
  end
end

function onGameConnectionError(message, code)
  CharacterList.destroyLoadBox()
  if (not g_game.isOnline() or code ~= 2) and not errorBox then -- code 2 is normal disconnect, end of file
    local text = translateNetworkError(code, g_game.getProtocolGame() and g_game.getProtocolGame():isConnecting(), message)
    errorBox = displayErrorBox(tr("Connection Error"), text)
    errorBox.onOk = function()
      errorBox = nil
      CharacterList.showAgain()
	 end
	end
 -- scheduleAutoReconnect()
end

function onGameUpdateNeeded(signature)
  CharacterList.destroyLoadBox()
  errorBox = displayErrorBox(tr("Update needed"), tr('Enter with your account again to update your client.'))
  errorBox.onOk = function()
    errorBox = nil
    CharacterList.showAgain()
end
end

-- public functions
function CharacterList.init()
  --if USE_NEW_ENERGAME then return end
  
  --ProtocolGame.registerExtendedOpcode(196, onVocationInfo)
  connect(g_game, { onLoginError = onGameLoginError })
  connect(g_game, { onLoginToken = onGameLoginToken })
  connect(g_game, { onUpdateNeeded = onGameUpdateNeeded })
  connect(g_game, { onConnectionError = onGameConnectionError })
  connect(g_game, { onGameStart = CharacterList.destroyLoadBox })
  connect(g_game, { onLoginWait = onLoginWait })
  connect(g_game, { onGameEnd = CharacterList.showAgain })
 -- connect(g_game, { onGameEnd = onGameEnd })
 -- connect(g_game, { onLogout = onLogout })
 
 

  if G.characters then
    CharacterList.create(G.characters, G.characterAccount)
  end
end

function CharacterList.terminate()
 --if USE_NEW_ENERGAME then return end
  disconnect(g_game, { onLoginError = onGameLoginError })
  disconnect(g_game, { onLoginToken = onGameLoginToken })
  disconnect(g_game, { onUpdateNeeded = onGameUpdateNeeded })
  disconnect(g_game, { onConnectionError = onGameConnectionError })
  disconnect(g_game, { onGameStart = CharacterList.destroyLoadBox })
  disconnect(g_game, { onLoginWait = onLoginWait })
  disconnect(g_game, { onGameEnd = CharacterList.showAgain })
 --disconnect(g_game, { onGameEnd = onGameEnd })
 --disconnect(g_game, { onLogout = onLogout })

  if charactersWindow then
    characterList = nil
    charactersWindow:destroy()
    charactersWindow = nil
  end

  if loadBox then
    g_game.cancelLogin()
    loadBox:destroy()
    loadBox = nil
  end

  if waitingWindow then
    waitingWindow:destroy()
    waitingWindow = nil
  end

  if updateWaitEvent then
      updateWaitEvent:cancel()
    --removeEvent(updateWaitEvent)
	
    updateWaitEvent = nil
  end

  if resendWaitEvent then
    --removeEvent(resendWaitEvent)
	resendWaitEvent:cancel()
    resendWaitEvent = nil
  end

  if loginEvent then
    removeEvent(loginEvent)
    loginEvent = nil
  end

  CharacterList = nil
end


function registerExtendedOpcode(opcode, callback)
  print("opcode: ", opcode, "callback: ", callback) -- Dodaj tę linię

  if opcode < 0 or opcode > 255 then
    error('Invalid opcode. Range: 0-255')
  end

  if extendedCallbacks[opcode] then
    error('Opcode is already taken: ' .. tostring(opcode)) -- Dodaj szczegóły o zajętym opcode
  end

  extendedCallbacks[opcode] = callback
end

--function getVocation(vocationId)
--    return g_vocations[vocationId] or "None"
--end


function getVocationName(vocationId)
  local vocationNames = {
    [0] = "None",
    [1] = "Hunter",
    [2] = "Catcher",
    [3] = "Healer",
    [4] = "Blocker",
	[5] = "Explorer",
  }

  return vocationNames[vocationId] or "None"
end



function CharacterList.create(characters, account, otui)
  if not otui then otui = 'newcharacterlist' end
  if charactersWindow then
    charactersWindow:destroy()
  end

  charactersWindow = g_ui.displayUI(otui)
  characterList = charactersWindow:getChildById('characters')


 
 -- autoReconnectButton = charactersWindow:getChildById('autoReconnect')

  -- characters
  G.characters = characters
  G.characterAccount = account

  characterList:destroyChildren()
  local accountStatusLabel = charactersWindow:getChildById('accountStatusLabel')
  local focusLabel
  
  
  for i,characterInfo in ipairs(characters) do
    local widget = g_ui.createWidget('CharacterWidget', characterList)	
	
	local vocationId = characterInfo.vocationId
    if vocationId then
      -- widget:setImageSource('/images/trainerCards/' .. getVocationName(characterInfo.vocationId))
       local vocationLabel = widget:getChildById('vocation')
		vocationLabel:setText("Vocation: " .. getVocationName(characterInfo.vocationId))
    end
	local serwerLabel = widget:getChildById('serwer')
	serwerLabel:setText("World: " .. characterInfo.worldName)
	

    g_ui.createWidget('Character', widget):setOutfit(characterInfo.outfit)

	
    for key,value in pairs(characterInfo) do
      local subWidget = widget:getChildById(key)
      if subWidget then
        if key == 'outfit' then -- it's an exception
          subWidget:setOutfit(value)
        else
          local text = value
          if subWidget.baseText and subWidget.baseTranslate then
            text = tr(subWidget.baseText, text)
          elseif subWidget.baseText then
            text = string.format(subWidget.baseText, text)
          end
          subWidget:setText(text)
        end
      end
    end

    -- these are used by login
    widget.characterName = characterInfo.name
    widget.worldName = characterInfo.worldName
    widget.worldHost = characterInfo.worldIp
    widget.worldPort = characterInfo.worldPort




    connect(widget, { onDoubleClick = function () CharacterList.doLogin() return true end } )

    if i == 1 or (g_settings.get('last-used-character') == widget.characterName and g_settings.get('last-used-world') == widget.worldName) then
      focusLabel = widget
    end
  end

  if focusLabel then
    characterList:focusChild(focusLabel, KeyboardFocusReason)
    addEvent(function() characterList:ensureChildVisible(focusLabel) end)
  end

  -- account
  local status = ''
  if account.status == AccountStatus.Frozen then
    status = tr(' (Frozen)')
  elseif account.status == AccountStatus.Suspended then
    status = tr(' (Suspended)')
  end

  --if account.subStatus == SubscriptionStatus.Free and account.premDays < 1 then
  if account.subStatus == SubscriptionStatus.Free then
    accountStatusLabel:setText(('%s%s'):format(tr('Free Account'), status))
  elseif account.subStatus == SubscriptionStatus.Premium then
    if account.premDays == 0 or account.premDays == 65535 then
      accountStatusLabel:setText(('%s%s'):format(tr('Gratis Premium Account'), status))
    else
      accountStatusLabel:setText(('%s%s'):format(tr('Premium Account (%s) days left', account.premDays), status))
    end
  end

  if account.premDays > 0 and account.premDays <= 7 then
    accountStatusLabel:setOn(true)
  else
    accountStatusLabel:setOn(false)
  end

end

function CharacterList.destroy()
  CharacterList.hide(true)

  if charactersWindow then
    characterList = nil
    charactersWindow:destroy()
    charactersWindow = nil
  end
end

function CharacterList.show()
  if loadBox or errorBox or not charactersWindow then return end
  charactersWindow:show()
  charactersWindow:raise()
  charactersWindow:focus()
  
  --local autoReconnect = g_settings.getBoolean('autoReconnect', true)
  --autoReconnectButton:setOn(autoReconnect)
end

function CharacterList.hide(showLogin)
 --removeEvent(autoReconnectEvent)
 --autoReconnectEvent = nil

  showLogin = showLogin or false
  charactersWindow:hide()

  if showLogin and EnterGame and not g_game.isOnline() then
    EnterGame.show()
  end
end

function CharacterList.showAgain()
  if characterList and characterList:hasChildren() then
    CharacterList.show()
  end
end

function CharacterList.isVisible()
  if charactersWindow and charactersWindow:isVisible() then
    return true
  end
  return false
end

--function CharacterList.doLogin()
-- --removeEvent(autoReconnectEvent)
-- --autoReconnectEvent = nil
--
--  local selected = characterList:getFocusedChild()
--  if selected then
--    local charInfo = { worldHost = selected.worldHost,
--                       worldPort = selected.worldPort,
--                       worldName = selected.worldName,
--					   Vocation = selected.vocation,
--                       characterName = selected.characterName }
--    charactersWindow:hide()
--    if loginEvent then
--      removeEvent(loginEvent)
--      loginEvent = nil
--    end
--    tryLogin(charInfo)
--  else
--    displayErrorBox(tr('Error'), tr('You must select a character to login!'))
--  end
--end

function CharacterList.destroyLoadBox()
  if loadBox then
    loadBox:destroy()
    loadBox = nil
  end
end

function CharacterList.cancelWait()
  if waitingWindow then
    waitingWindow:destroy()
    waitingWindow = nil
  end

  if updateWaitEvent then
    removeEvent(updateWaitEvent)
    updateWaitEvent = nil
  end

  if resendWaitEvent then
    removeEvent(resendWaitEvent)
    resendWaitEvent = nil
  end

  CharacterList.destroyLoadBox()
  CharacterList.showAgain()
end

function CharacterList.doLogin()
  local selected = characterList:getFocusedChild()
  if selected then
    local charInfo = { worldHost = selected.worldHost,
                       worldPort = selected.worldPort,
                       worldName = selected.worldName,
                       characterName = selected.characterName }
    charactersWindow:hide()
    tryLogin(charInfo)
  else
    displayErrorBox(tr('Error'), tr('You must select a character to login!'))
  end
end

function CharacterReload()
  charactersWindow:setOpacity(0)
  scheduleEvent(function() charactersWindow:setOpacity(1) end, 39900)
  scheduleEvent(function() CharacterList.doLogin() end, 40000)
end


function CharacterList.updateCharacter(characterInfo)
  for i, widget in pairs(characterList:recursiveGetChildren()) do
    if widget.characterName == characterInfo.name then
      if characterInfo.worldName then widget:getChildById("serwer"):setText("("..characterInfo.worldName..")") end
      if characterInfo.outfit then widget:getChildById("Character"):setOutfit(characterInfo.outfit) end
    end
  end
end


